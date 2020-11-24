Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F02C242F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:32:44 +0100 (CET)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWYs-0006ms-Uo
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khWXb-0006LH-Sx
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khWXY-0000xw-7l
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606217478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fuAIS5EENRAnB/UVOQFpcm5R0KC10CTTO5b/s6/ENw=;
 b=JtfFEbG3bNYE0Jh/BHJYcYRLYZ4xLLedK4S8/PrcAc80/96bkJVNVr/ZL/p2P/OSq3lx3b
 ZpMXFOX2KGvc2XsFh55ZkXCjmpST1rSPpnLDB+3644hIDp4VaFP5/4gw0vPKOSPd9x1djz
 Y5doXxFf92cwpBUAu8k1shdesPkBcmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-SDWSTuodOiqYmtzb39gE4Q-1; Tue, 24 Nov 2020 06:31:16 -0500
X-MC-Unique: SDWSTuodOiqYmtzb39gE4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ABD0805BE0
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 11:31:15 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E248100239A;
 Tue, 24 Nov 2020 11:31:07 +0000 (UTC)
Date: Tue, 24 Nov 2020 11:31:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/2] libvhost-user: replace qemu/bswap.h with glibc
 endian.h
Message-ID: <20201124113104.GD3366@work-vm>
References: <20201118080902.30033-1-marcandre.lureau@redhat.com>
 <20201118080902.30033-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118080902.30033-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  contrib/libvhost-user/libvhost-user.c | 77 ++++++++++++++-------------
>  1 file changed, 40 insertions(+), 37 deletions(-)
> 
> diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> index 5c73ffdd6b..1c1cfbf1e7 100644
> --- a/contrib/libvhost-user/libvhost-user.c
> +++ b/contrib/libvhost-user/libvhost-user.c
> @@ -26,6 +26,7 @@
>  #include <sys/socket.h>
>  #include <sys/eventfd.h>
>  #include <sys/mman.h>
> +#include <endian.h>
>  #include "qemu/compiler.h"
>  
>  #if defined(__linux__)
> @@ -42,7 +43,6 @@
>  
>  #include "qemu/atomic.h"
>  #include "qemu/osdep.h"
> -#include "qemu/bswap.h"
>  #include "qemu/memfd.h"
>  
>  #include "libvhost-user.h"
> @@ -1081,7 +1081,7 @@ vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
>          return false;
>      }
>  
> -    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
> +    vq->used_idx = le16toh(vq->vring.used->idx);
>  
>      if (vq->last_avail_idx != vq->used_idx) {
>          bool resume = dev->iface->queue_is_processed_in_order &&
> @@ -1198,7 +1198,7 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
>          return 0;
>      }
>  
> -    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
> +    vq->used_idx = le16toh(vq->vring.used->idx);
>      vq->resubmit_num = 0;
>      vq->resubmit_list = NULL;
>      vq->counter = 0;
> @@ -2031,13 +2031,13 @@ vu_queue_started(const VuDev *dev, const VuVirtq *vq)
>  static inline uint16_t
>  vring_avail_flags(VuVirtq *vq)
>  {
> -    return lduw_le_p(&vq->vring.avail->flags);
> +    return le16toh(vq->vring.avail->flags);
>  }
>  
>  static inline uint16_t
>  vring_avail_idx(VuVirtq *vq)
>  {
> -    vq->shadow_avail_idx = lduw_le_p(&vq->vring.avail->idx);
> +    vq->shadow_avail_idx = le16toh(vq->vring.avail->idx);
>  
>      return vq->shadow_avail_idx;
>  }
> @@ -2045,7 +2045,7 @@ vring_avail_idx(VuVirtq *vq)
>  static inline uint16_t
>  vring_avail_ring(VuVirtq *vq, int i)
>  {
> -    return lduw_le_p(&vq->vring.avail->ring[i]);
> +    return le16toh(vq->vring.avail->ring[i]);
>  }
>  
>  static inline uint16_t
> @@ -2133,12 +2133,12 @@ virtqueue_read_next_desc(VuDev *dev, struct vring_desc *desc,
>                           int i, unsigned int max, unsigned int *next)
>  {
>      /* If this descriptor says it doesn't chain, we're done. */
> -    if (!(lduw_le_p(&desc[i].flags) & VRING_DESC_F_NEXT)) {
> +    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
>          return VIRTQUEUE_READ_DESC_DONE;
>      }
>  
>      /* Check they're not leading us off end of descriptors. */
> -    *next = lduw_le_p(&desc[i].next);
> +    *next = le16toh(desc[i].next);
>      /* Make sure compiler knows to grab that: we don't want it changing! */
>      smp_wmb();
>  
> @@ -2181,8 +2181,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
>          }
>          desc = vq->vring.desc;
>  
> -        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
> -            if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
> +        if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
> +            if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
>                  vu_panic(dev, "Invalid size for indirect buffer table");
>                  goto err;
>              }
> @@ -2195,8 +2195,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
>  
>              /* loop over the indirect descriptor table */
>              indirect = 1;
> -            desc_addr = ldq_le_p(&desc[i].addr);
> -            desc_len = ldl_le_p(&desc[i].len);
> +            desc_addr = le64toh(desc[i].addr);
> +            desc_len = le32toh(desc[i].len);
>              max = desc_len / sizeof(struct vring_desc);
>              read_len = desc_len;
>              desc = vu_gpa_to_va(dev, &read_len, desc_addr);
> @@ -2223,10 +2223,10 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
>                  goto err;
>              }
>  
> -            if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
> -                in_total += ldl_le_p(&desc[i].len);
> +            if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
> +                in_total += le32toh(desc[i].len);
>              } else {
> -                out_total += ldl_le_p(&desc[i].len);
> +                out_total += le32toh(desc[i].len);
>              }
>              if (in_total >= max_in_bytes && out_total >= max_out_bytes) {
>                  goto done;
> @@ -2377,7 +2377,7 @@ vring_used_flags_set_bit(VuVirtq *vq, int mask)
>  
>      flags = (uint16_t *)((char*)vq->vring.used +
>                           offsetof(struct vring_used, flags));
> -    stw_le_p(flags, lduw_le_p(flags) | mask);
> +    *flags = htole16(le16toh(*flags) | mask);
>  }
>  
>  static inline void
> @@ -2387,17 +2387,20 @@ vring_used_flags_unset_bit(VuVirtq *vq, int mask)
>  
>      flags = (uint16_t *)((char*)vq->vring.used +
>                           offsetof(struct vring_used, flags));
> -    stw_le_p(flags, lduw_le_p(flags) & ~mask);
> +    *flags = htole16(le16toh(*flags) & ~mask);
>  }
>  
>  static inline void
>  vring_set_avail_event(VuVirtq *vq, uint16_t val)
>  {
> +    uint16_t *avail;
> +
>      if (!vq->notification) {
>          return;
>      }
>  
> -    stw_le_p(&vq->vring.used->ring[vq->vring.num], val);
> +    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
> +    *avail = htole16(val);
>  }
>  
>  void
> @@ -2487,15 +2490,15 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
>      struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
>      int rc;
>  
> -    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
> -        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
> +    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
> +        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
>              vu_panic(dev, "Invalid size for indirect buffer table");
>              return NULL;
>          }
>  
>          /* loop over the indirect descriptor table */
> -        desc_addr = ldq_le_p(&desc[i].addr);
> -        desc_len = ldl_le_p(&desc[i].len);
> +        desc_addr = le64toh(desc[i].addr);
> +        desc_len = le32toh(desc[i].len);
>          max = desc_len / sizeof(struct vring_desc);
>          read_len = desc_len;
>          desc = vu_gpa_to_va(dev, &read_len, desc_addr);
> @@ -2517,11 +2520,11 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
>  
>      /* Collect all the descriptors */
>      do {
> -        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
> +        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
>              if (!virtqueue_map_desc(dev, &in_num, iov + out_num,
>                                 VIRTQUEUE_MAX_SIZE - out_num, true,
> -                               ldq_le_p(&desc[i].addr),
> -                               ldl_le_p(&desc[i].len))) {
> +                               le64toh(desc[i].addr),
> +                               le32toh(desc[i].len))) {
>                  return NULL;
>              }
>          } else {
> @@ -2531,8 +2534,8 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
>              }
>              if (!virtqueue_map_desc(dev, &out_num, iov,
>                                 VIRTQUEUE_MAX_SIZE, false,
> -                               ldq_le_p(&desc[i].addr),
> -                               ldl_le_p(&desc[i].len))) {
> +                               le64toh(desc[i].addr),
> +                               le32toh(desc[i].len))) {
>                  return NULL;
>              }
>          }
> @@ -2731,15 +2734,15 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
>      max = vq->vring.num;
>      i = elem->index;
>  
> -    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
> -        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
> +    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
> +        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
>              vu_panic(dev, "Invalid size for indirect buffer table");
>              return;
>          }
>  
>          /* loop over the indirect descriptor table */
> -        desc_addr = ldq_le_p(&desc[i].addr);
> -        desc_len = ldl_le_p(&desc[i].len);
> +        desc_addr = le64toh(desc[i].addr);
> +        desc_len = le32toh(desc[i].len);
>          max = desc_len / sizeof(struct vring_desc);
>          read_len = desc_len;
>          desc = vu_gpa_to_va(dev, &read_len, desc_addr);
> @@ -2765,9 +2768,9 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
>              return;
>          }
>  
> -        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
> -            min = MIN(ldl_le_p(&desc[i].len), len);
> -            vu_log_write(dev, ldq_le_p(&desc[i].addr), min);
> +        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
> +            min = MIN(le32toh(desc[i].len), len);
> +            vu_log_write(dev, le64toh(desc[i].addr), min);
>              len -= min;
>          }
>  
> @@ -2792,15 +2795,15 @@ vu_queue_fill(VuDev *dev, VuVirtq *vq,
>  
>      idx = (idx + vq->used_idx) % vq->vring.num;
>  
> -    stl_le_p(&uelem.id, elem->index);
> -    stl_le_p(&uelem.len, len);
> +    uelem.id = htole32(elem->index);
> +    uelem.len = htole32(len);
>      vring_used_write(dev, vq, &uelem, idx);
>  }
>  
>  static inline
>  void vring_used_idx_set(VuDev *dev, VuVirtq *vq, uint16_t val)
>  {
> -    stw_le_p(&vq->vring.used->idx, val);
> +    vq->vring.used->idx = htole16(val);
>      vu_log_write(dev,
>                   vq->vring.log_guest_addr + offsetof(struct vring_used, idx),
>                   sizeof(vq->vring.used->idx));
> -- 
> 2.29.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


