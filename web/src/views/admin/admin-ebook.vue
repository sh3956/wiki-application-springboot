<template>
  <a-layout>
    <a-layout-content
        :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
    >
      <a-table
          :columns="columns"
          :row-key="record => record.id"
          :data-source="ebooks"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
      >
        <template #cover="{ text: cover }">
          <img v-if="cover" :src="cover" alt="avatar" />
        </template>
        <template v-slot:action="{ text, record }">
          <a-space size="small">
            <a-button type="primary">
              Edit
            </a-button>
            <a-button type="danger">
              Delete
            </a-button>
          </a-space>
        </template>
      </a-table>
    </a-layout-content>
  </a-layout>
</template>

<script lang="ts">
import { defineComponent, onMounted, ref } from 'vue';
import axios from 'axios';

export default defineComponent({
  name: 'AdminEbook',
  setup() {
    const ebooks = ref();
    const pagination = ref({
      current: 1,
      pageSize: 2,
      total: 0
    });
    const loading = ref(false);

    const columns = [
      {
        title: 'cover',
        dataIndex: 'cover',
        slots: { customRender: 'cover' }
      },
      {
        title: 'name',
        dataIndex: 'name'
      },
      {
        title: 'category1Id',
        key: 'category1Id',
        dataIndex: 'category1Id'
      },
      {
        title: 'category2Id',
        dataIndex: 'category2Id'
      },
      {
        title: 'doc_count',
        dataIndex: 'docCount'
      },
      {
        title: 'view_count',
        dataIndex: 'viewCount'
      },
      {
        title: 'vote_count',
        dataIndex: 'voteCount'
      },
      {
        title: 'Action',
        key: 'action',
        slots: { customRender: 'action' }
      }
    ];

    /**
     * query data
     **/
    const handleQuery = (params: any) => {
      loading.value = true;
      axios.get("/ebook/list", params).then((response) => {
        loading.value = false;
        const data = response.data;
        ebooks.value = data.content;

        // 重置分页按钮
        pagination.value.current = params.page;
      });
    };

    /**
     * 表格点击页码时触发
     */
    const handleTableChange = (pagination: any) => {
      console.log("Subpage parameters：" + pagination);
      handleQuery({
        page: pagination.current,
        size: pagination.pageSize
      });
    };

    onMounted(() => {
      handleQuery({});
    });

    return {
      ebooks,
      pagination,
      columns,
      loading,
      handleTableChange
    }
  }
});
</script>

<style scoped>
img {
  width: 50px;
  height: 50px;
}
</style>
