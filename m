Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA3367401
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 22:09:57 +0200 (CEST)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZJAa-0005DA-2i
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 16:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lZJ8j-0004if-Sy
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lZJ8h-0006qE-6G
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 16:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619035678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjYq3xsoWsSPBvRc/fdJ0BACnAPdn3gLwxY8RSONUyk=;
 b=dhZaFlc1YCEDdKzbUN3jyYMWaYDzCoaf70xzLrl+IxxDM0x3nQt5RVllmgE7Ztbdcxzhml
 x2moA8syFGmzCUOZrEtjk4V3ejmKRfDwCBmCJL6IzJNKiQTmm4Zn7PbF6ymlUhc35FplL+
 vBis/REmUZ3bjB47hmbu5T8LRPLYGXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-k1G3mo4-NCG30rzV_71bIg-1; Wed, 21 Apr 2021 16:07:54 -0400
X-MC-Unique: k1G3mo4-NCG30rzV_71bIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DFAD1020C23
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 20:07:53 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-206.rdu2.redhat.com [10.10.114.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 450336085A;
 Wed, 21 Apr 2021 20:07:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D36D7220BCF; Wed, 21 Apr 2021 16:07:46 -0400 (EDT)
Date: Wed, 21 Apr 2021 16:07:46 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 17/25] DAX/unmap: virtiofsd: Add
 VHOST_USER_SLAVE_FS_IO
Message-ID: <20210421200746.GH1579961@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
 <20210414155137.46522-18-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210414155137.46522-18-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 14, 2021 at 04:51:29PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new slave command 'VHOST_USER_SLAVE_FS_IO' for a
> client to ask qemu to perform a read/write from an fd directly
> to GPA.

Hi David,

Today I came across process_vm_readv() and process_vm_writev().

https://man7.org/linux/man-pages/man2/process_vm_readv.2.html

I am wondering if we can use these to read from/write to qemu address
space (DAX window, which virtiofsd does not have access to).

So for the case of reading from DAX window into an fd, we probably
will have to first read from qemu DAX window to virtiofsd local memory
and then do a writev(fd).

Don't know if this approach is faster/slower as compared to sending
a vhost-user message to qemu.

Thanks
Vivek


> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/interop/vhost-user.rst               | 16 ++++
>  hw/virtio/trace-events                    |  6 ++
>  hw/virtio/vhost-user-fs.c                 | 95 +++++++++++++++++++++++
>  hw/virtio/vhost-user.c                    |  4 +
>  include/hw/virtio/vhost-user-fs.h         |  2 +
>  subprojects/libvhost-user/libvhost-user.h |  1 +
>  6 files changed, 124 insertions(+)
> 
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 09aee3565d..2fa62ea451 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -1453,6 +1453,22 @@ Slave message types
>    multiple chunks can be unmapped in one command.
>    A reply is generated indicating whether unmapping succeeded.
>  
> +``VHOST_USER_SLAVE_FS_IO``
> +  :id: 9
> +  :equivalent ioctl: N/A
> +  :slave payload: ``struct VhostUserFSSlaveMsg``
> +  :master payload: N/A
> +
> +  Requests that IO be performed directly from an fd, passed in ancillary
> +  data, to guest memory on behalf of the daemon; this is normally for a
> +  case where a memory region isn't visible to the daemon. slave payload
> +  has flags which determine the direction of IO operation.
> +
> +  The ``VHOST_USER_FS_FLAG_MAP_R`` flag must be set in the ``flags`` field to
> +  read from the file into RAM.
> +  The ``VHOST_USER_FS_FLAG_MAP_W`` flag must be set in the ``flags`` field to
> +  write to the file from RAM.
> +
>  .. _reply_ack:
>  
>  VHOST_USER_PROTOCOL_F_REPLY_ACK
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index c62727f879..20557a078e 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -53,6 +53,12 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
>  vhost_vdpa_set_owner(void *dev) "dev: %p"
>  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
>  
> +# vhost-user-fs.c
> +
> +vhost_user_fs_slave_io_loop(const char *name, uint64_t owr, int is_ram, int is_romd, size_t size) "region %s with internal offset 0x%"PRIx64 " ram=%d romd=%d mrs.size=%zd"
> +vhost_user_fs_slave_io_loop_res(ssize_t transferred) "%zd"
> +vhost_user_fs_slave_io_exit(int res, size_t done) "res: %d done: %zd"
> +
>  # virtio.c
>  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
>  virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned int idx) "vq %p elem %p len %u idx %u"
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 963f694435..5511838f29 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -23,6 +23,8 @@
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
>  
>  static const int user_feature_bits[] = {
>      VIRTIO_F_VERSION_1,
> @@ -220,6 +222,99 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
>      return (uint64_t)res;
>  }
>  
> +uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
> +                                VhostUserFSSlaveMsg *sm, int fd)
> +{
> +    VHostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
> +                          TYPE_VHOST_USER_FS);
> +    if (!fs) {
> +        error_report("%s: Bad fs ptr", __func__);
> +        return (uint64_t)-1;
> +    }
> +    if (!check_slave_message_entries(sm, message_size)) {
> +        return (uint64_t)-1;
> +    }
> +
> +    unsigned int i;
> +    int res = 0;
> +    size_t done = 0;
> +
> +    if (fd < 0) {
> +        error_report("Bad fd for map");
> +        return (uint64_t)-1;
> +    }
> +
> +    for (i = 0; i < sm->count && !res; i++) {
> +        VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
> +        if (e->len == 0) {
> +            continue;
> +        }
> +
> +        size_t len = e->len;
> +        uint64_t fd_offset = e->fd_offset;
> +        hwaddr gpa = e->c_offset;
> +
> +        while (len && !res) {
> +            hwaddr xlat, xlat_len;
> +            bool is_write = e->flags & VHOST_USER_FS_FLAG_MAP_W;
> +            MemoryRegion *mr = address_space_translate(dev->vdev->dma_as, gpa,
> +                                                       &xlat, &xlat_len,
> +                                                       is_write,
> +                                                       MEMTXATTRS_UNSPECIFIED);
> +            if (!mr || !xlat_len) {
> +                error_report("No guest region found for 0x%" HWADDR_PRIx, gpa);
> +                res = -EFAULT;
> +                break;
> +            }
> +
> +            trace_vhost_user_fs_slave_io_loop(mr->name,
> +                                          (uint64_t)xlat,
> +                                          memory_region_is_ram(mr),
> +                                          memory_region_is_romd(mr),
> +                                          (size_t)xlat_len);
> +
> +            void *hostptr = qemu_map_ram_ptr(mr->ram_block,
> +                                             xlat);
> +            ssize_t transferred;
> +            if (e->flags & VHOST_USER_FS_FLAG_MAP_R) {
> +                /* Read from file into RAM */
> +                if (mr->readonly) {
> +                    res = -EFAULT;
> +                    break;
> +                }
> +                transferred = pread(fd, hostptr, xlat_len, fd_offset);
> +            } else if (e->flags & VHOST_USER_FS_FLAG_MAP_W) {
> +                /* Write into file from RAM */
> +                transferred = pwrite(fd, hostptr, xlat_len, fd_offset);
> +            } else {
> +                transferred = EINVAL;
> +            }
> +
> +            trace_vhost_user_fs_slave_io_loop_res(transferred);
> +            if (transferred < 0) {
> +                res = -errno;
> +                break;
> +            }
> +            if (!transferred) {
> +                /* EOF */
> +                break;
> +            }
> +
> +            done += transferred;
> +            fd_offset += transferred;
> +            gpa += transferred;
> +            len -= transferred;
> +        }
> +    }
> +    close(fd);
> +
> +    trace_vhost_user_fs_slave_io_exit(res, done);
> +    if (res < 0) {
> +        return (uint64_t)res;
> +    }
> +    return (uint64_t)done;
> +}
> +
>  static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserFS *fs = VHOST_USER_FS(vdev);
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ad9170f8dc..b9699586ae 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -138,6 +138,7 @@ typedef enum VhostUserSlaveRequest {
>      VHOST_USER_SLAVE_VRING_ERR = 5,
>      VHOST_USER_SLAVE_FS_MAP = 6,
>      VHOST_USER_SLAVE_FS_UNMAP = 7,
> +    VHOST_USER_SLAVE_FS_IO = 8,
>      VHOST_USER_SLAVE_MAX
>  }  VhostUserSlaveRequest;
>  
> @@ -1562,6 +1563,9 @@ static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
>      case VHOST_USER_SLAVE_FS_UNMAP:
>          ret = vhost_user_fs_slave_unmap(dev, hdr.size, &payload.fs);
>          break;
> +    case VHOST_USER_SLAVE_FS_IO:
> +        ret = vhost_user_fs_slave_io(dev, hdr.size, &payload.fs, fd[0]);
> +        break;
>  #endif
>      default:
>          error_report("Received unexpected msg type: %d.", hdr.request);
> diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
> index 0766f17548..2931164e23 100644
> --- a/include/hw/virtio/vhost-user-fs.h
> +++ b/include/hw/virtio/vhost-user-fs.h
> @@ -78,5 +78,7 @@ uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
>                                   VhostUserFSSlaveMsg *sm, int fd);
>  uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
>                                     VhostUserFSSlaveMsg *sm);
> +uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
> +                                VhostUserFSSlaveMsg *sm, int fd);
>  
>  #endif /* _QEMU_VHOST_USER_FS_H */
> diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
> index a98c5f5c11..42b0833c4b 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -121,6 +121,7 @@ typedef enum VhostUserSlaveRequest {
>      VHOST_USER_SLAVE_VRING_ERR = 5,
>      VHOST_USER_SLAVE_FS_MAP = 6,
>      VHOST_USER_SLAVE_FS_UNMAP = 7,
> +    VHOST_USER_SLAVE_FS_IO = 8,
>      VHOST_USER_SLAVE_MAX
>  }  VhostUserSlaveRequest;
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


