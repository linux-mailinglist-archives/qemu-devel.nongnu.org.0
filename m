Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16E4724D4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:39:04 +0100 (CET)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhnT-0000nf-J5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mwhjD-0004yq-Tc
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:34:40 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mwhjB-0003K2-8W
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:34:39 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JCGYK3Jdwzdj5c;
 Mon, 13 Dec 2021 17:34:13 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 17:34:30 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 17:34:29 +0800
Subject: Re: [PATCH v3 03/23] multifd: Rename used field to num
To: Juan Quintela <quintela@redhat.com>, <qemu-devel@nongnu.org>
CC: Leonardo Bras <leobras@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Xiexiangyou
 <xiexiangyou@huawei.com>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-4-quintela@redhat.com>
Message-ID: <85f4bf3b-9259-7f19-8717-0297251ee6b2@huawei.com>
Date: Mon, 13 Dec 2021 17:34:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-4-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhengchuan@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Zheng Chuan <zhengchuan@huawei.com>
From:  Zheng Chuan via <qemu-devel@nongnu.org>

Hi, Juan,

Sorry, forget to send to qemu-devel, resend it.

On 2021/11/24 18:05, Juan Quintela wrote:
> We will need to split it later in zero_num (number of zero pages) and
> normal_num (number of normal pages).  This name is better.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 +-
>  migration/multifd.c | 38 +++++++++++++++++++-------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 15c50ca0b2..86820dd028 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -55,7 +55,7 @@ typedef struct {
>  
>  typedef struct {
>      /* number of used pages */
> -    uint32_t used;
> +    uint32_t num;
>      /* number of allocated pages */
>      uint32_t allocated;
>      /* global number of generated multifd packets */
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 8125d0015c..8ea86d81dc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -252,7 +252,7 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
>  
>  static void multifd_pages_clear(MultiFDPages_t *pages)
>  {
> -    pages->used = 0;
> +    pages->num = 0;
>      pages->allocated = 0;
>      pages->packet_num = 0;
>      pages->block = NULL;
> @@ -270,7 +270,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->pages_used = cpu_to_be32(p->pages->used);
> +    packet->pages_used = cpu_to_be32(p->pages->num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
>  
> @@ -278,7 +278,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>      }
>  
> -    for (i = 0; i < p->pages->used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          /* there are architectures where ram_addr_t is 32 bit */
>          uint64_t temp = p->pages->offset[i];
>  
> @@ -332,18 +332,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          p->pages = multifd_pages_init(packet->pages_alloc);
>      }
>  
> -    p->pages->used = be32_to_cpu(packet->pages_used);
> -    if (p->pages->used > packet->pages_alloc) {
> +    p->pages->num = be32_to_cpu(packet->pages_used);
> +    if (p->pages->num > packet->pages_alloc) {
>          error_setg(errp, "multifd: received packet "
>                     "with %d pages and expected maximum pages are %d",
> -                   p->pages->used, packet->pages_alloc) ;
> +                   p->pages->num, packet->pages_alloc) ;
>          return -1;
>      }
>  
>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>      p->packet_num = be64_to_cpu(packet->packet_num);
>  
> -    if (p->pages->used == 0) {
> +    if (p->pages->num == 0) {
>          return 0;
>      }
>  
> @@ -356,7 +356,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> -    for (i = 0; i < p->pages->used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
>          if (offset > (block->used_length - page_size)) {
> @@ -443,13 +443,13 @@ static int multifd_send_pages(QEMUFile *f)
>          }
>          qemu_mutex_unlock(&p->mutex);
>      }
> -    assert(!p->pages->used);
> +    assert(!p->pages->num);
>      assert(!p->pages->block);
>  
>      p->packet_num = multifd_send_state->packet_num++;
>      multifd_send_state->pages = p->pages;
>      p->pages = pages;
> -    transferred = ((uint64_t) pages->used) * qemu_target_page_size()
> +    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
>                  + p->packet_len;
The size of zero page should not regard as the whole pagesize.
I think the transferred should be updated after you introduce zero_num in following patches, such as:
+    transferred = ((uint64_t) p->normal_num) * qemu_target_page_size()
+               + ((uint64_t) p->zero_num) * sizeof(uint64_t);
Otherwise, migration time will get worse if we have low bandwidth limit parameter.

I tested it with bandwidth limit of 100MB/s and it works fine:)

>      qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes += transferred;
> @@ -469,12 +469,12 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
>      }
>  
>      if (pages->block == block) {
> -        pages->offset[pages->used] = offset;
> -        pages->iov[pages->used].iov_base = block->host + offset;
> -        pages->iov[pages->used].iov_len = qemu_target_page_size();
> -        pages->used++;
> +        pages->offset[pages->num] = offset;
> +        pages->iov[pages->num].iov_base = block->host + offset;
> +        pages->iov[pages->num].iov_len = qemu_target_page_size();
> +        pages->num++;
>  
> -        if (pages->used < pages->allocated) {
> +        if (pages->num < pages->allocated) {
>              return 1;
>          }
>      }
> @@ -586,7 +586,7 @@ void multifd_send_sync_main(QEMUFile *f)
>      if (!migrate_use_multifd()) {
>          return;
>      }
> -    if (multifd_send_state->pages->used) {
> +    if (multifd_send_state->pages->num) {
>          if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
>              return;
> @@ -649,7 +649,7 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->pending_job) {
> -            uint32_t used = p->pages->used;
> +            uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              flags = p->flags;
>  
> @@ -665,7 +665,7 @@ static void *multifd_send_thread(void *opaque)
>              p->flags = 0;
>              p->num_packets++;
>              p->num_pages += used;
> -            p->pages->used = 0;
> +            p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> @@ -1091,7 +1091,7 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
>  
> -        used = p->pages->used;
> +        used = p->pages->num;
>          flags = p->flags;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
> 

-- 
Regards.
Chuan

