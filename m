Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC91278759
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 14:37:28 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLmyd-00006n-7N
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 08:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kLmmZ-000728-KR
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kLmmU-00069n-Nd
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:24:59 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601036693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSojn1WCt6lljvXmvEmRe2REkOPKuq+9Wc9HY5oFY8A=;
 b=On0t8IaCzR0niYeGhV+xAMcQb34ozu0cu4jEMlvoU9+ej2Oh0x4ucEBq2JT+BsIf1NoOcn
 hZUPuRN+xslHvq8aeXEV7NxXnwj4zZioEDvGfSl81pbE7yicGWO2bkDMMEPMWsxRok/tnV
 TolJ+3dDxf+UySMWEy7ijoSUP46o5y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-BB2JYwrePc-rj9_qyYYczg-1; Fri, 25 Sep 2020 08:24:49 -0400
X-MC-Unique: BB2JYwrePc-rj9_qyYYczg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED5EA1084D8D
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 12:24:48 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F4B45D9DC;
 Fri, 25 Sep 2020 12:24:40 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] vhost-vdpa: add trace-events
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200925091055.186023-1-lvivier@redhat.com>
 <20200925091055.186023-3-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <97e190ff-2d6c-862f-78f4-1353e9c09c54@redhat.com>
Date: Fri, 25 Sep 2020 20:24:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925091055.186023-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/25 下午5:10, Laurent Vivier wrote:
> Add trace functions in vhost-vdpa.c.
>
> All traces from this file can be enabled with '-trace vhost_vdpa*'.
>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
>   hw/virtio/trace-events | 31 ++++++++++++++
>   hw/virtio/vhost-vdpa.c | 92 +++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 118 insertions(+), 5 deletions(-)
>
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 845200bf109d..cf1e59de302a 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -22,6 +22,37 @@ vhost_user_postcopy_waker(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
>   vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
>   vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
>   
> +# vhost-vdpa.c
> +vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
> +vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
> +vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
> +vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
> +vhost_vdpa_init(void *dev, void *vdpa) "dev: %p vdpa: %p"
> +vhost_vdpa_cleanup(void *dev, void *vdpa) "dev: %p vdpa: %p"
> +vhost_vdpa_memslots_limit(void *dev, int ret) "dev: %p = 0x%x"
> +vhost_vdpa_set_mem_table(void *dev, uint32_t nregions, uint32_t padding) "dev: %p nregions: %"PRIu32" padding: 0x%"PRIx32
> +vhost_vdpa_dump_regions(void *dev, int i, uint64_t guest_phys_addr, uint64_t memory_size, uint64_t userspace_addr, uint64_t flags_padding) "dev: %p %d: guest_phys_addr: 0x%"PRIx64" memory_size: 0x%"PRIx64" userspace_addr: 0x%"PRIx64" flags_padding: 0x%"PRIx64
> +vhost_vdpa_set_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> +vhost_vdpa_get_device_id(void *dev, uint32_t device_id) "dev: %p device_id %"PRIu32
> +vhost_vdpa_reset_device(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
> +vhost_vdpa_get_vq_index(void *dev, int idx, int vq_idx) "dev: %p idx: %d vq idx: %d"
> +vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> +vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> +vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
> +vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
> +vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
> +vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
> +vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
> +vhost_vdpa_set_vring_num(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
> +vhost_vdpa_set_vring_base(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
> +vhost_vdpa_get_vring_base(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
> +vhost_vdpa_set_vring_kick(void *dev, unsigned int index, int fd) "dev: %p index: %u fd: %d"
> +vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index: %u fd: %d"
> +vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> +vhost_vdpa_set_owner(void *dev) "dev: %p"
> +vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
>   virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned int idx) "vq %p elem %p len %u idx %u"
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4580f3efd8a2..c43e12551546 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -20,6 +20,8 @@
>   #include "hw/virtio/vhost-vdpa.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
> +#include "trace.h"
> +#include "qemu-common.h"
>   
>   static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
>   {
> @@ -48,6 +50,9 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>       msg.iotlb.perm = readonly ? VHOST_ACCESS_RO : VHOST_ACCESS_RW;
>       msg.iotlb.type = VHOST_IOTLB_UPDATE;
>   
> +   trace_vhost_vdpa_dma_map(v, fd, msg.type, msg.iotlb.iova, msg.iotlb.size,
> +                            msg.iotlb.uaddr, msg.iotlb.perm, msg.iotlb.type);
> +
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>               fd, errno, strerror(errno));
> @@ -69,6 +74,9 @@ static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
>       msg.iotlb.size = size;
>       msg.iotlb.type = VHOST_IOTLB_INVALIDATE;
>   
> +    trace_vhost_vdpa_dma_unmap(v, fd, msg.type, msg.iotlb.iova,
> +                               msg.iotlb.size, msg.iotlb.type);
> +
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>               fd, errno, strerror(errno));
> @@ -114,6 +122,9 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>               section->offset_within_region +
>               (iova - section->offset_within_address_space);
>   
> +    trace_vhost_vdpa_listener_region_add(v, iova, int128_get64(llend),
> +                                         vaddr, section->readonly);
> +
>       llsize = int128_sub(llend, int128_make64(iova));
>   
>       ret = vhost_vdpa_dma_map(v, iova, int128_get64(llsize),
> @@ -170,6 +181,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>       llend = int128_add(llend, section->size);
>       llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
>   
> +    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
> +
>       if (int128_ge(int128_make64(iova), llend)) {
>           return;
>       }
> @@ -210,6 +223,7 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>   {
>       uint8_t s;
>   
> +    trace_vhost_vdpa_add_status(dev, status);
>       if (vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s)) {
>           return;
>       }
> @@ -224,6 +238,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque)
>       struct vhost_vdpa *v;
>       uint64_t features;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> +    trace_vhost_vdpa_init(dev, opaque);
>   
>       v = opaque;
>       dev->opaque =  opaque ;
> @@ -243,6 +258,7 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       struct vhost_vdpa *v;
>       assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       v = dev->opaque;
> +    trace_vhost_vdpa_cleanup(dev, v);
>       memory_listener_unregister(&v->listener);
>   
>       dev->opaque = NULL;
> @@ -251,13 +267,25 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>   
>   static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
>   {
> +    trace_vhost_vdpa_memslots_limit(dev, INT_MAX);
>       return INT_MAX;
>   }
>   
>   static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>                                       struct vhost_memory *mem)
>   {
> -
> +    trace_vhost_vdpa_set_mem_table(dev, mem->nregions, mem->padding);
> +    if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_MEM_TABLE) &&
> +        trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_REGIONS)) {
> +        int i;
> +        for (i = 0; i < mem->nregions; i++) {
> +            trace_vhost_vdpa_dump_regions(dev, i,
> +                                          mem->regions[i].guest_phys_addr,
> +                                          mem->regions[i].memory_size,
> +                                          mem->regions[i].userspace_addr,
> +                                          mem->regions[i].flags_padding);
> +        }
> +    }
>       if (mem->padding) {
>           return -1;
>       }
> @@ -269,6 +297,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>                                      uint64_t features)
>   {
>       int ret;
> +    trace_vhost_vdpa_set_features(dev, features);
>       ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>       uint8_t status = 0;
>       if (ret) {
> @@ -283,26 +312,34 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>   int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>                                      uint32_t *device_id)
>   {
> -    return vhost_vdpa_call(dev, VHOST_VDPA_GET_DEVICE_ID, device_id);
> +    int ret;
> +    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_DEVICE_ID, device_id);
> +    trace_vhost_vdpa_get_device_id(dev, *device_id);
> +    return ret;
>   }
>   
>   static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>   {
> +    int ret;
>       uint8_t status = 0;
>   
> -    return vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> +    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> +    trace_vhost_vdpa_reset_device(dev, status);
> +    return ret;
>   }
>   
>   static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>   {
>       assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);
>   
> +    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
>       return idx - dev->vq_index;
>   }
>   
>   static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>   {
>       int i;
> +    trace_vhost_vdpa_set_vring_ready(dev);
>       for (i = 0; i < dev->nvqs; ++i) {
>           struct vhost_vring_state state = {
>               .index = dev->vq_index + i,
> @@ -313,6 +350,19 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>       return 0;
>   }
>   
> +static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t *config,
> +                                   uint32_t config_len)
> +{
> +    int b, len;
> +    char line[QEMU_HEXDUMP_LINE_LEN];
> +
> +    for (b = 0; b < config_len; b += 16) {
> +        len = config_len - b;
> +        qemu_hexdump_line(line, b, config, len, false);
> +        trace_vhost_vdpa_dump_config(dev, line);
> +    }
> +}
> +
>   static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
>                                      uint32_t offset, uint32_t size,
>                                      uint32_t flags)
> @@ -320,6 +370,7 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
>       struct vhost_vdpa_config *config;
>       int ret;
>       unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
> +    trace_vhost_vdpa_set_config(dev, offset, size, flags);
>       config = g_malloc(size + config_size);
>       if (config == NULL) {
>           return -1;
> @@ -327,6 +378,10 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
>       config->off = offset;
>       config->len = size;
>       memcpy(config->buf, data, size);
> +    if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_CONFIG) &&
> +        trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
> +        vhost_vdpa_dump_config(dev, data, size);
> +    }
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG, config);
>       g_free(config);
>       return ret;
> @@ -339,6 +394,7 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>       int ret;
>   
> +    trace_vhost_vdpa_get_config(dev, config, config_len);
>       v_config = g_malloc(config_len + config_size);
>       if (v_config == NULL) {
>           return -1;
> @@ -348,12 +404,17 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
>       memcpy(config, v_config->buf, config_len);
>       g_free(v_config);
> +    if (trace_event_get_state_backends(TRACE_VHOST_VDPA_GET_CONFIG) &&
> +        trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_CONFIG)) {
> +        vhost_vdpa_dump_config(dev, config, config_len);
> +    }
>       return ret;
>    }
>   
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> +    trace_vhost_vdpa_dev_start(dev, started);
>       if (started) {
>           uint8_t status = 0;
>           memory_listener_register(&v->listener, &address_space_memory);
> @@ -375,53 +436,72 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>                                        struct vhost_log *log)
>   {
> +    trace_vhost_vdpa_set_log_base(dev, base, log->size, log->refcnt, log->fd,
> +                                  log->log);
>       return vhost_vdpa_call(dev, VHOST_SET_LOG_BASE, &base);
>   }
>   
>   static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
>                                          struct vhost_vring_addr *addr)
>   {
> +    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
> +                                    addr->desc_user_addr, addr->used_user_addr,
> +                                    addr->avail_user_addr,
> +                                    addr->log_guest_addr);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
>   }
>   
>   static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
>                                         struct vhost_vring_state *ring)
>   {
> +    trace_vhost_vdpa_set_vring_num(dev, ring->index, ring->num);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_NUM, ring);
>   }
>   
>   static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
> +    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
>   }
>   
>   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
> -    return vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
> +    int ret;
> +
> +    ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
> +    trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
> +    return ret;
>   }
>   
>   static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
>                                          struct vhost_vring_file *file)
>   {
> +    trace_vhost_vdpa_set_vring_kick(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_KICK, file);
>   }
>   
>   static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>                                          struct vhost_vring_file *file)
>   {
> +    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>   }
>   
>   static int vhost_vdpa_get_features(struct vhost_dev *dev,
>                                        uint64_t *features)
>   {
> -    return vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> +    int ret;
> +
> +    ret = vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> +    trace_vhost_vdpa_get_features(dev, *features);
> +    return ret;
>   }
>   
>   static int vhost_vdpa_set_owner(struct vhost_dev *dev)
>   {
> +    trace_vhost_vdpa_set_owner(dev);
>       return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
>   }
>   
> @@ -432,6 +512,8 @@ static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
>       addr->desc_user_addr = (uint64_t)(unsigned long)vq->desc_phys;
>       addr->avail_user_addr = (uint64_t)(unsigned long)vq->avail_phys;
>       addr->used_user_addr = (uint64_t)(unsigned long)vq->used_phys;
> +    trace_vhost_vdpa_vq_get_addr(dev, vq, addr->desc_user_addr,
> +                                 addr->avail_user_addr, addr->used_user_addr);
>       return 0;
>   }
>   


