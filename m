Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF016ADD1A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVJM-0000Zf-K1; Tue, 07 Mar 2023 06:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVJK-0000ZJ-P2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pZVJJ-0003fe-2w
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678187808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+m76V7Eza0bJwih1S3nqOoxvrm/b3bVD2v3sGmjMAo=;
 b=FkbOnbO68LYlOtfSUYviLM3jYdSVSIoSH97AfXIvcTYAXP9FrfKa8ORuJdTXihqTLyNnui
 te6YAJ6hGpwbxhMYLlvSfofc1tvmWPrSIQatpqhohowc4bmurPu18dHcSbTdD8OozZjZ4A
 4W9GRt5Gbry43Kc7U0vYAmVHKrZT/K0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-Yx1-8k5-P06FV3aqmq2e-g-1; Tue, 07 Mar 2023 06:16:47 -0500
X-MC-Unique: Yx1-8k5-P06FV3aqmq2e-g-1
Received: by mail-ed1-f70.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so18616418edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+m76V7Eza0bJwih1S3nqOoxvrm/b3bVD2v3sGmjMAo=;
 b=paQCCQHP3nLzdUb8t6IJ6v//rYRjaKkfhd0zezN1xCIFJUWvPy5XcDjt1VlV6h0mQb
 b0MGEAtyExFxLssXVrSomqsedOHuAxe0Ov0sALSwNS7MnM56wNp5pyyFc4tYWyxmOA8D
 5XggQjvHptZ7+WA1pQq5EdsY1r25cYVp3qLj0/J7zToaBTNYbBCt0o2w/tbXfxq9Wl8E
 QUR6fOvQZ2FzFfW9Ui6jAHO6kxqC4tqRzmnfGHWbk4umBXDmXHbzMPfUmd1enqUEma+o
 Yvi2F4dex0JJ/LRpGDBsBZldlNCnLMvUjMdlVOa1Z4p5LjtxO8HTQbvewgR8WtZOzq0a
 t3JQ==
X-Gm-Message-State: AO0yUKXPi0b7rkmInExEX196ad2zOC42DtkfQ6Bcqa7ISA3mTmXEbAfT
 GMrTW5V4PbCXkt8q0O57nJJ7Ia4PvzBQDvVSMumMuC54C8tY5LVQ6nlmbXU/6F3X9gE7dpPvQ32
 6pX1taLRy5IKadkGfJGGcGFc=
X-Received: by 2002:a17:907:6d12:b0:8b1:3131:76e9 with SMTP id
 sa18-20020a1709076d1200b008b1313176e9mr18784905ejc.46.1678187805452; 
 Tue, 07 Mar 2023 03:16:45 -0800 (PST)
X-Google-Smtp-Source: AK7set88rZ/JVADRU2jRa9Ryf78Y3qPiWBK6ixfHMok7u3PVwUDwkVULCPxf5qyNl4jXvaWsAngLfg==
X-Received: by 2002:a17:907:6d12:b0:8b1:3131:76e9 with SMTP id
 sa18-20020a1709076d1200b008b1313176e9mr18784890ejc.46.1678187805198; 
 Tue, 07 Mar 2023 03:16:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o22-20020a509b16000000b004c4eed3fe20sm6577432edi.5.2023.03.07.03.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:16:44 -0800 (PST)
Date: Tue, 7 Mar 2023 12:16:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v1 2/2] vhost: Remove vhost_backend_can_merge() callback
Message-ID: <20230307121644.755438a3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230307112548.062b068d@imammedo.users.ipa.redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-3-david@redhat.com>
 <20230307112548.062b068d@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 11:25:48 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Thu, 16 Feb 2023 12:47:52 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
> > Checking whether the memory regions are equal is sufficient: if they are
> > equal, then most certainly the contained fd is equal.  
> sounds reasonable to me.
> 
> > 
> > The whole vhost-user memslot handling is suboptimal and overly
> > complicated. We shouldn't have to lookup a RAM memory regions we got
> > notified about in vhost_user_get_mr_data() using a host pointer. But that  
> 
> While on janitor duty can you fixup following?
> 
> vhost_user_get_mr_data() -> memory_region_from_host -> 
>  -> qemu_ram_block_from_host()  
> for qemu_ram_block_from_host doc comment seems to out of
> sync (ram_addr not longer exists)
> 
> > requires a bigger rework -- especially an alternative vhost_set_mem_table()
> > backend call that simply consumes MemoryRegionSections.  
> 
> just skimming through  usage of vhost_user_get_mr_data() it looks like
> we are first collecting MemoryRegionSection-s into tmp_sections
> then we do vhost_commit we convert then into vhost_memory_region list
> and the we are trying hard to convert addresses from the later
> to back to MemoryRegions we've lost during tmp_sections conversion
> all over the place.
> 
> To me it looks like we should drop conversion to vhost_dev::mem
> and replace its usage with vhost_dev::mem_sections directly
> to get rid of data duplication and back and forth addr<->mr conversion.
> 
> > For now, let's just drop vhost_backend_can_merge().
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>  
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> > ---
> >  hw/virtio/vhost-user.c            | 14 --------------
> >  hw/virtio/vhost-vdpa.c            |  1 -
> >  hw/virtio/vhost.c                 |  6 +-----
> >  include/hw/virtio/vhost-backend.h |  4 ----
> >  4 files changed, 1 insertion(+), 24 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index e68daa35d4..4bfaf559a7 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -2195,19 +2195,6 @@ static int vhost_user_migration_done(struct vhost_dev *dev, char* mac_addr)
> >      return -ENOTSUP;
> >  }
> >  
> > -static bool vhost_user_can_merge(struct vhost_dev *dev,
> > -                                 uint64_t start1, uint64_t size1,
> > -                                 uint64_t start2, uint64_t size2)
> > -{
> > -    ram_addr_t offset;
> > -    int mfd, rfd;
> > -
> > -    (void)vhost_user_get_mr_data(start1, &offset, &mfd);
> > -    (void)vhost_user_get_mr_data(start2, &offset, &rfd);
> > -
> > -    return mfd == rfd;
> > -}
> > -
> >  static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
> >  {
> >      VhostUserMsg msg;
> > @@ -2704,7 +2691,6 @@ const VhostOps user_ops = {
> >          .vhost_set_vring_enable = vhost_user_set_vring_enable,
> >          .vhost_requires_shm_log = vhost_user_requires_shm_log,
> >          .vhost_migration_done = vhost_user_migration_done,
> > -        .vhost_backend_can_merge = vhost_user_can_merge,
> >          .vhost_net_set_mtu = vhost_user_net_set_mtu,
> >          .vhost_set_iotlb_callback = vhost_user_set_iotlb_callback,
> >          .vhost_send_device_iotlb_msg = vhost_user_send_device_iotlb_msg,
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 542e003101..9ab7bc8718 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1317,7 +1317,6 @@ const VhostOps vdpa_ops = {
> >          .vhost_set_config = vhost_vdpa_set_config,
> >          .vhost_requires_shm_log = NULL,
> >          .vhost_migration_done = NULL,
> > -        .vhost_backend_can_merge = NULL,
> >          .vhost_net_set_mtu = NULL,
> >          .vhost_set_iotlb_callback = NULL,
> >          .vhost_send_device_iotlb_msg = NULL,
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index b7fb960fa9..9d8662aa98 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -733,11 +733,7 @@ static void vhost_region_add_section(struct vhost_dev *dev,
> >              size_t offset = mrs_gpa - prev_gpa_start;
> >  
> >              if (prev_host_start + offset == mrs_host &&
> > -                section->mr == prev_sec->mr &&
> > -                (!dev->vhost_ops->vhost_backend_can_merge ||
> > -                 dev->vhost_ops->vhost_backend_can_merge(dev,

another question, can it relly happen, i.e. having 2 abut memory sections
with the same memory region, is yes then when/why?


> > -                    mrs_host, mrs_size,
> > -                    prev_host_start, prev_size))) {
> > +                section->mr == prev_sec->mr) {
> >                  uint64_t max_end = MAX(prev_host_end, mrs_host + mrs_size);
> >                  need_add = false;
> >                  prev_sec->offset_within_address_space =
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> > index c5ab49051e..abf1601ba2 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -86,9 +86,6 @@ typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> >  typedef bool (*vhost_requires_shm_log_op)(struct vhost_dev *dev);
> >  typedef int (*vhost_migration_done_op)(struct vhost_dev *dev,
> >                                         char *mac_addr);
> > -typedef bool (*vhost_backend_can_merge_op)(struct vhost_dev *dev,
> > -                                           uint64_t start1, uint64_t size1,
> > -                                           uint64_t start2, uint64_t size2);
> >  typedef int (*vhost_vsock_set_guest_cid_op)(struct vhost_dev *dev,
> >                                              uint64_t guest_cid);
> >  typedef int (*vhost_vsock_set_running_op)(struct vhost_dev *dev, int start);
> > @@ -160,7 +157,6 @@ typedef struct VhostOps {
> >      vhost_set_vring_enable_op vhost_set_vring_enable;
> >      vhost_requires_shm_log_op vhost_requires_shm_log;
> >      vhost_migration_done_op vhost_migration_done;
> > -    vhost_backend_can_merge_op vhost_backend_can_merge;
> >      vhost_vsock_set_guest_cid_op vhost_vsock_set_guest_cid;
> >      vhost_vsock_set_running_op vhost_vsock_set_running;
> >      vhost_set_iotlb_callback_op vhost_set_iotlb_callback;  
> 


