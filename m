Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFEB3497A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:09:20 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTTz-0006rn-63
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTQV-0004uC-GA
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTQH-000631-60
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616691926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pr6ScMD5Uho2EjmKBNMJrzGhpeOQZbFzCFM12JXgnVg=;
 b=bupCn+KM8OMiBGqyS6LwZvXl1z8S0ZWO4WB/DnFM1SM9BeaiqvE3RjeMYB5o4kGnWtaRlc
 Fys7MqJ20aOOmaeUVx4VHAjcaKA8dFnRr7JA+KdRUMxVf15uAXj8aHjnc9GLmhbjlQWqqA
 03LIFkSb/4ajfZEXwcBLzz3NIntNvCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-v84jkj9mME-KX_XUicTqhQ-1; Thu, 25 Mar 2021 13:05:21 -0400
X-MC-Unique: v84jkj9mME-KX_XUicTqhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r65-20020a1c2b440000b029010f4ee06223so1226904wmr.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pr6ScMD5Uho2EjmKBNMJrzGhpeOQZbFzCFM12JXgnVg=;
 b=FsLJDfZXvzRC+x3FN2wOoeFCHWk2yRZUPW8ThSaIT8GMpip6TYXqZ0ZSepolQDg/iO
 Z6AjXKzLYFC9hWfRweZH18qkerUsR7hxdOBGwaJe0HP9wGOPmZwLX6Dj7e5iRXy50vC6
 qupRCCJjrIJiY+KaIONf3W/vDfr/WVUd5XZ81v2QVLNLMrzFbKaQdZ7hT5w1KIP2GsTm
 csCf2wAjKm9OdAHYTSPLPFVVGoXVMHVqsIMtx5pyTXHC6G06E1s8pMVyuQJMpsG+8d1u
 Vb1gaP/cF2g+zdD2UaCKSDpluQq7a7EtZQCXXNv1aE/IHnJoVxzrDZzM4bwY0IYB3WEf
 MeBg==
X-Gm-Message-State: AOAM531J6B3y+G7aGkYK1aHRpLXvrrmmzNZj2aS4tMbHTZolNvvzLkWC
 agKpA5e7Ak8vlNS0NnqJHcRLyy7JBWW7ptIR55FOn4YshgG7qI3dUkiCrFWVuAqOKilLZtyxIgy
 La9RFB6nVp0Vt9iQ=
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr9040299wmc.3.1616691920046; 
 Thu, 25 Mar 2021 10:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweyLkBTdzYJ2Mi22tQJo7Seho1ulELh1mVvHwjeEvBupAlraXIcyi+2fSav/rs+a8VM0VQlg==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr9040275wmc.3.1616691919783; 
 Thu, 25 Mar 2021 10:05:19 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id l15sm7321476wme.43.2021.03.25.10.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:05:19 -0700 (PDT)
Date: Thu, 25 Mar 2021 13:05:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210325130429-mutt-send-email-mst@kernel.org>
References: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-1-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> a serious slow down may be observed on setups with a big enough number
> of vCPUs.
> 
> Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads):
> 
> 1		0m20.922s	0m21.346s
> 2		0m21.230s	0m20.350s
> 4		0m21.761s	0m20.997s
> 8		0m22.770s	0m20.051s
> 16		0m22.038s	0m19.994s
> 32		0m22.928s	0m20.803s
> 64		0m26.583s	0m22.953s
> 128		0m41.273s	0m32.333s
> 256		2m4.727s 	1m16.924s
> 384		6m5.563s 	3m26.186s
> 
> Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> the ioeventfds:
> 
>  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
>   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
>   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> =>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd_before
> =>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_ioeventfds
>   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> 
> address_space_update_ioeventfds() is called when committing an MR
> transaction, i.e. for each ioeventfd with the current code base,
> and it internally loops on all ioventfds:
> 
> static void address_space_update_ioeventfds(AddressSpace *as)
> {
> [...]
>     FOR_EACH_FLAT_RANGE(fr, view) {
>         for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
> 
> This means that the setup of ioeventfds for these devices has
> quadratic time complexity.
> 
> This series introduce generic APIs to allow batch creation and deletion
> of ioeventfds, and converts virtio-blk and virtio-scsi to use them. This
> greatly improves the numbers:
> 
> 1		0m21.271s	0m22.076s
> 2		0m20.912s	0m19.716s
> 4		0m20.508s	0m19.310s
> 8		0m21.374s	0m20.273s
> 16		0m21.559s	0m21.374s
> 32		0m22.532s	0m21.271s
> 64		0m26.550s	0m22.007s
> 128		0m29.115s	0m27.446s
> 256		0m44.752s	0m41.004s
> 384		1m2.884s	0m58.023s
> 
> The series deliberately spans over multiple subsystems for easier
> review and experimenting. It also does some preliminary fixes on
> the way. It is thus posted as an RFC for now, but if the general
> idea is acceptable, I guess a non-RFC could be posted and maybe
> extend the feature to some other devices that might suffer from
> similar scaling issues, e.g. vhost-scsi-pci, vhost-user-scsi-pci
> and vhost-user-blk-pci, even if I haven't checked.
> 
> This should fix https://bugzilla.redhat.com/show_bug.cgi?id=1927108
> which reported the issue for virtio-scsi-pci.


Series looks ok from a quick look ...

this is a regression isn't it?
So I guess we'll need that in 6.0 or revert the # of vqs
change for now ...

> Greg Kurz (8):
>   memory: Allow eventfd add/del without starting a transaction
>   virtio: Introduce virtio_bus_set_host_notifiers()
>   virtio: Add API to batch set host notifiers
>   virtio-pci: Batch add/del ioeventfds in a single MR transaction
>   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
>   virtio-blk: Use virtio_bus_set_host_notifiers()
>   virtio-scsi: Set host notifiers and callbacks separately
>   virtio-scsi: Use virtio_bus_set_host_notifiers()
> 
>  hw/virtio/virtio-pci.h          |  1 +
>  include/exec/memory.h           | 48 ++++++++++++++++------
>  include/hw/virtio/virtio-bus.h  |  7 ++++
>  hw/block/dataplane/virtio-blk.c | 26 +++++-------
>  hw/scsi/virtio-scsi-dataplane.c | 68 ++++++++++++++++++--------------
>  hw/virtio/virtio-bus.c          | 70 +++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-pci.c          | 53 +++++++++++++++++--------
>  softmmu/memory.c                | 42 ++++++++++++--------
>  8 files changed, 225 insertions(+), 90 deletions(-)
> 
> -- 
> 2.26.3
> 


