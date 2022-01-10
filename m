Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB4488EAE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:39:28 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6kal-0007b0-Gt
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6kZG-0006u3-TC
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:37:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6kZA-0006Vt-7U
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641782266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+qbLWnst4Opl2q92xeKM5fQHMoCoX1e54Omt6B61F8=;
 b=HkqlF0R9JKRRKZTXKrgq0HzNmvrh3BTYSUA/CBUCClmp111AIa2A8sSX6On2uSBvf5AQx0
 W8Ryg1s5AsdbFsJxSI3SonPSCKJRLTbkp/R7j4ZNcZgG/wDSKNI6om3+kEFIMdBRPjVv53
 nO85Me1914m2zGoUkHTX7W9/uTfudTI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-TEj75bysP-CGHoeGeEO9rg-1; Sun, 09 Jan 2022 21:37:43 -0500
X-MC-Unique: TEj75bysP-CGHoeGeEO9rg-1
Received: by mail-lf1-f71.google.com with SMTP id
 d25-20020a194f19000000b0042b469bd916so2593886lfb.21
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 18:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+qbLWnst4Opl2q92xeKM5fQHMoCoX1e54Omt6B61F8=;
 b=wahkvR4sqFxB+FI6tVHzjnVSSv+1mt+8qn08ZSAZiZ2/QBivCt2ElO/jRqGR6taxVe
 XEAMFjR4hORsFjyBZhOmcJ5cVWl4ckQ4W4hWvYcfpCEeg/ilBMWn3irRfuLqkW55TDg8
 rp2JDmXBYjVsvEDGtUFKc9m4s6oF1XOyhdNVSKcuXjNSs8uXQrR/xcrYQ8AZ1uFbivgy
 yWgASUu8DKSim72EvOuRRGU5xSKZnjZJpCYH/dOxHS/n3gQMdWPAoRa46qXNkNeBZeW4
 8+hgf8kOY+o9CaazUbOHYtjHxktFTb1FRgSKTTqqM8skfPNtt0haeMJkZYSRKfc/QEUV
 +2AA==
X-Gm-Message-State: AOAM533VwtfNxkWaFnKhoDWN7Q9GjJRvekggVZFPoeT9cy73jeLqghNr
 eFu+TOG1vTe/BfFwqncoDWSMqAk6rCtvwb4HIQGixVTVTqgYMzaw3oTTtrOVYgQ3JDKyTBRuGkd
 PwbWM+izCHw/WpL/hlRwzyRrBAIqH9CI=
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr8934256ljm.420.1641782262221; 
 Sun, 09 Jan 2022 18:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqL8wISn9dFQa9i+uMzzzO6Mv4cgtt9xPl0PFK+2HNpmPZ8YBS72aFY/H7hW7FsgoW6r1Hwxr2rguAm/uG0uk=
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr8934241ljm.420.1641782261947; 
 Sun, 09 Jan 2022 18:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20211104164827.21911-1-lulu@redhat.com>
 <20220109125240-mutt-send-email-mst@kernel.org>
 <CACLfguUTTpt7Fct3S7O92OXO=RvuDDRRpga8NMweR2cX-n6ctg@mail.gmail.com>
In-Reply-To: <CACLfguUTTpt7Fct3S7O92OXO=RvuDDRRpga8NMweR2cX-n6ctg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Jan 2022 10:37:31 +0800
Message-ID: <CACGkMEtt5WQoMJkt_oOtTsMhKfxKyKrDUjvH0v=uqVpS9+E7AQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Gilbert <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 9:37 AM Cindy Lu <lulu@redhat.com> wrote:
>
>
>
>
> On Mon, Jan 10, 2022 at 1:56 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
>> > these patches add the support for configure interrupt
>> >
>> > These codes are all tested in vp-vdpa (support configure interrupt)
>> > vdpa_sim (not support configure interrupt), virtio tap device
>> >
>> > test in virtio-pci bus and virtio-mmio bus
>> >
>> > Change in v2:
>> > Add support for virtio-mmio bus
>> > active the notifier while the backend support configure interrupt
>> > misc fixes from v1
>> >
>> > Change in v3
>> > fix the coding style problems
>> >
>> > Change in v4
>> > misc fixes from v3
>> > merge the set_config_notifier to set_guest_notifier
>> > when vdpa start, check the feature by VIRTIO_NET_F_STATUS
>> >
>> > Change in v5
>> > misc fixes from v4
>> > split the code to introduce configure interrupt type and the callback function
>> > will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
>> > only active while using vhost-vdpa driver
>> >
>> > Change in v6
>> > misc fixes from v5
>> > decouple vq from interrupt setting and misc process
>> > fix the bug in virtio_net_handle_rx
>> > use -1 as the queue number to identify if the interrupt is configure interrupt
>> >
>> > Change in v7
>> > misc fixes from v6
>> > decouple vq from interrupt setting and misc process
>> > decouple vq from vector use/release process
>> > decouple vq from set notifier fd handler process
>> > move config_notifier and masked_config_notifier to VirtIODevice
>> > fix the bug in virtio_net_handle_rx, add more information
>> > add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt
>> >
>> > Change in v8
>> > misc fixes from v7
>> > decouple vq from interrupt setting and misc process
>> > decouple vq from vector use/release process
>> > decouple vq from set notifier fd handler process
>> > move the vhost configure interrupt to vhost_net
>> >
>> > Change in v9
>> > misc fixes from v8
>> > address the comments from v8
>> >
>> > Change in v10
>> > fix the hang issue in qtest
>> > address the comments from v9
>> >
>> > Cindy Lu (10):
>> >   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
>> >   virtio-pci: decouple notifier from interrupt process
>> >   virtio-pci: decouple the single vector from the interrupt process
>> >   vhost: introduce new VhostOps vhost_set_config_call
>> >   vhost-vdpa: add support for config interrupt
>> >   virtio: add support for configure interrupt
>> >   vhost: add support for configure interrupt
>> >   virtio-net: add support for configure interrupt
>> >   virtio-mmio: add support for configure interrupt
>> >   virtio-pci: add support for configure interrupt
>> >
>> >  hw/display/vhost-user-gpu.c       |   6 +
>> >  hw/net/vhost_net.c                |   9 +
>> >  hw/net/virtio-net.c               |  10 +-
>> >  hw/virtio/trace-events            |   1 +
>> >  hw/virtio/vhost-user-fs.c         |   6 +
>> >  hw/virtio/vhost-vdpa.c            |   7 +
>> >  hw/virtio/vhost-vsock-common.c    |   6 +
>> >  hw/virtio/vhost.c                 |  76 +++++++++
>> >  hw/virtio/virtio-crypto.c         |   6 +
>> >  hw/virtio/virtio-mmio.c           |  27 +++
>> >  hw/virtio/virtio-pci.c            | 269 +++++++++++++++++++++---------
>> >  hw/virtio/virtio-pci.h            |   4 +-
>> >  hw/virtio/virtio.c                |  29 ++++
>> >  include/hw/virtio/vhost-backend.h |   3 +
>> >  include/hw/virtio/vhost.h         |   4 +
>> >  include/hw/virtio/virtio.h        |   7 +
>> >  include/net/vhost_net.h           |   2 +
>> >  17 files changed, 389 insertions(+), 83 deletions(-)
>>
>> So I just realized something. The spec says:
>>
>> The device MUST set the Device Configuration Interrupt bit
>> in \field{ISR status} before sending a device configuration
>> change notification to the driver.
>>
>> and I don't see how these patches achieve this: it requires
>> that config interrupts go through userspace.
>>
>> Revert, and think more about it? Or did I miss something?
>>
>  Thanks, Micheal, I'm ok to revert these patchs and there are also several bugs  I need to fix.
> I will post a new version soon

Please test with vectors=0 for the new version to make it work as expected.

Thanks

>>
>>
>> > --
>> > 2.21.3
>>


