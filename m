Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7030F20A194
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:09:23 +0200 (CEST)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTVC-0007Gi-38
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1joTTn-0006YG-Pb
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:07:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22402
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1joTTl-0002N5-K8
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593097672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UoL2P6wdd+yRUwXd9TlGwiFFIJov2kXfetHDX+4PTVM=;
 b=BpDvTjHMvbnYUisXY1DeyTT+/sQO/X88q/QT+SIOaCwdB+gEZG2gZK1jQWWj2OfA3TekZt
 GGBVcG9KkImlra77t0N+BCNpHoEF0WpCrY1n/qia4wHpIULX/XPKWdiY/D4LSfjMkMpGAJ
 Nz7HqHNZ0xgH8qyXHqia5YbEIt/HQz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-Xk3f0pY4P2C3tT2v7sW1EQ-1; Thu, 25 Jun 2020 11:07:50 -0400
X-MC-Unique: Xk3f0pY4P2C3tT2v7sW1EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 206E218FF690;
 Thu, 25 Jun 2020 15:07:39 +0000 (UTC)
Received: from [10.36.115.58] (ovpn-115-58.ams2.redhat.com [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69D745C661;
 Thu, 25 Jun 2020 15:07:33 +0000 (UTC)
Subject: Re: [PATCH v1 05/10] vhost-backend: export the vhost backend helper
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, cohuck@redhat.com, jasowang@redhat.com
References: <20200622153756.19189-1-lulu@redhat.com>
 <20200622153756.19189-6-lulu@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
 D+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <3efd6790-a5eb-c165-06cd-3de708380b15@redhat.com>
Date: Thu, 25 Jun 2020 17:07:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622153756.19189-6-lulu@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lvivier@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mhabets@solarflare.com, qemu-devel@nongnu.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, maxime.coquelin@redhat.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 kevin.tian@intel.com, parav@mellanox.com, vmireyno@marvell.com,
 cunming.liang@intel.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 aadam@redhat.com, rdunlap@infradead.org, hanand@xilinx.com,
 lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2020 17:37, Cindy Lu wrote:
> export the helper then we can reuse them in other backend
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/virtio/vhost-backend.c         | 18 +++++++++---------
>  include/hw/virtio/vhost-backend.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 

This looks weird to export all these functions whereas they are all
already exported by the vhost_ops structure.

So if vhost-vdpa is not a subset of vhost-kernel and if these functions
will diverge from vhost-backend.c definition in the future, perhaps it
is wise to already copy their definitions right now in vhost-vdpa.c
rather than exporting them now and to have to copy them in the future in
vhost-vdpa.c to modify them.

It will also simplify the definition of vhost_kernel_call().

Thanks,
Laurent

> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 48905383f8..660e9e8588 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -89,7 +89,7 @@ static int vhost_kernel_scsi_get_abi_version(struct vhost_dev *dev, int *version
>      return vhost_kernel_call(dev, VHOST_SCSI_GET_ABI_VERSION, version);
>  }
>  
> -static int vhost_kernel_set_log_base(struct vhost_dev *dev, uint64_t base,
> +int vhost_kernel_set_log_base(struct vhost_dev *dev, uint64_t base,
>                                       struct vhost_log *log)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_LOG_BASE, &base);
> @@ -101,7 +101,7 @@ static int vhost_kernel_set_mem_table(struct vhost_dev *dev,
>      return vhost_kernel_call(dev, VHOST_SET_MEM_TABLE, mem);
>  }
>  
> -static int vhost_kernel_set_vring_addr(struct vhost_dev *dev,
> +int vhost_kernel_set_vring_addr(struct vhost_dev *dev,
>                                         struct vhost_vring_addr *addr)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_VRING_ADDR, addr);
> @@ -113,31 +113,31 @@ static int vhost_kernel_set_vring_endian(struct vhost_dev *dev,
>      return vhost_kernel_call(dev, VHOST_SET_VRING_ENDIAN, ring);
>  }
>  
> -static int vhost_kernel_set_vring_num(struct vhost_dev *dev,
> +int vhost_kernel_set_vring_num(struct vhost_dev *dev,
>                                        struct vhost_vring_state *ring)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_VRING_NUM, ring);
>  }
>  
> -static int vhost_kernel_set_vring_base(struct vhost_dev *dev,
> +int vhost_kernel_set_vring_base(struct vhost_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_VRING_BASE, ring);
>  }
>  
> -static int vhost_kernel_get_vring_base(struct vhost_dev *dev,
> +int vhost_kernel_get_vring_base(struct vhost_dev *dev,
>                                         struct vhost_vring_state *ring)
>  {
>      return vhost_kernel_call(dev, VHOST_GET_VRING_BASE, ring);
>  }
>  
> -static int vhost_kernel_set_vring_kick(struct vhost_dev *dev,
> +int vhost_kernel_set_vring_kick(struct vhost_dev *dev,
>                                         struct vhost_vring_file *file)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_VRING_KICK, file);
>  }
>  
> -static int vhost_kernel_set_vring_call(struct vhost_dev *dev,
> +int vhost_kernel_set_vring_call(struct vhost_dev *dev,
>                                         struct vhost_vring_file *file)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_VRING_CALL, file);
> @@ -155,13 +155,13 @@ static int vhost_kernel_set_features(struct vhost_dev *dev,
>      return vhost_kernel_call(dev, VHOST_SET_FEATURES, &features);
>  }
>  
> -static int vhost_kernel_get_features(struct vhost_dev *dev,
> +int vhost_kernel_get_features(struct vhost_dev *dev,
>                                       uint64_t *features)
>  {
>      return vhost_kernel_call(dev, VHOST_GET_FEATURES, features);
>  }
>  
> -static int vhost_kernel_set_owner(struct vhost_dev *dev)
> +int vhost_kernel_set_owner(struct vhost_dev *dev)
>  {
>      return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
>  }
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 6f6670783f..300b59c172 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -172,4 +172,32 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
>  
>  int vhost_user_gpu_set_socket(struct vhost_dev *dev, int fd);
>  
> +
> +int vhost_kernel_set_log_base(struct vhost_dev *dev, uint64_t base,
> +                                     struct vhost_log *log);
> +
> +int vhost_kernel_set_vring_addr(struct vhost_dev *dev,
> +                                       struct vhost_vring_addr *addr);
> +
> +int vhost_kernel_set_vring_num(struct vhost_dev *dev,
> +                                      struct vhost_vring_state *ring);
> +
> +int vhost_kernel_set_vring_base(struct vhost_dev *dev,
> +                                       struct vhost_vring_state *ring);
> +
> +int vhost_kernel_get_vring_base(struct vhost_dev *dev,
> +                                       struct vhost_vring_state *ring);
> +
> +int vhost_kernel_set_vring_kick(struct vhost_dev *dev,
> +                                       struct vhost_vring_file *file);
> +
> +int vhost_kernel_set_vring_call(struct vhost_dev *dev,
> +                                       struct vhost_vring_file *file);
> +
> +int vhost_kernel_set_owner(struct vhost_dev *dev);
> +
> +int vhost_kernel_get_features(struct vhost_dev *dev,
> +                                     uint64_t *features);
> +
> +
>  #endif /* VHOST_BACKEND_H */
> 


