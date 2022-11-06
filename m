Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1861E059
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 06:23:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orY6t-0003Bz-HH; Sun, 06 Nov 2022 01:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orY6m-0003Ac-Ok
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 01:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orY6k-0007Hi-LH
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 01:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667712129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6iM5Q6TknzkhQHbj4lvt0UHWv+wtzP58kprhWQTAoA=;
 b=DcYe4G1KGrEcfUhVazdxzDezA/vjmXvgPlxzajpTo8CZMNufIdvkv+NW2lgGPBmrKI3ICb
 6G6kuXaxC3BrzePdd9beAJ0PjY4wwGwPTAyu1o5YLfIvKPzbTzDfnpXxTuQ1sImfTMKW7b
 a+HOKsTxHlxCxCxmJcThpgdcJbXzh9U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-gOX5z7i5PuuBoQHZRXy_Vg-1; Sun, 06 Nov 2022 01:22:08 -0400
X-MC-Unique: gOX5z7i5PuuBoQHZRXy_Vg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s11-20020adfbc0b000000b0023659af24a8so1980007wrg.14
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 22:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6iM5Q6TknzkhQHbj4lvt0UHWv+wtzP58kprhWQTAoA=;
 b=YsLpS9rNqCv1uDTURP/02wHKtMbLxbRuu5RjXHJ8/82FwcklIEaHJNeBm1P/fiLPVu
 1o+kLDVZhnOwaUO9dRwF2WNr4vflfpURRHFgct5cnM11dkwcTcB3eYEw4f+vyzU7eC8/
 8J1qDEPAYuXaguBMHuwnBGh6VU/q9WUUAcXTgXm+GbDDdp+ueyM0+fyuYpYAaYs8ITtQ
 ehDGozUl0Ba8nKRY0JRb//kZrMeZtORMvGjTnopRBO9NHqOqoxLlQ+3+nS14vW3eCv/7
 0F22bToCluIm7AUMjk5s24ba+u+MKfZcfrX7wjQmrqOwdfjnuoMXRVJuGubQLpB7skEC
 i1Vw==
X-Gm-Message-State: ACrzQf3YokEieLdJW88OwraT7ZgEbWhOb7OAaHjU8CydjvNa4oloSv60
 8RtIF6IrgkC4I/+M5/UZ4lbihxXDQhIAQsW+0tH2hcqvNDWAPvZsANG3Bi57rZ6C7KM7y2NM/DP
 lrs6b27eN23gFRAk=
X-Received: by 2002:adf:c601:0:b0:230:7cfa:b3fe with SMTP id
 n1-20020adfc601000000b002307cfab3femr27491807wrg.344.1667712127081; 
 Sat, 05 Nov 2022 22:22:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65fIJP/FQHK6wT+0WF0nOvHmGhRCHymYT7R5HCC6YGfmk/OeJ12Mn+qzOIvLU/s+v339gLrw==
X-Received: by 2002:adf:c601:0:b0:230:7cfa:b3fe with SMTP id
 n1-20020adfc601000000b002307cfab3femr27491796wrg.344.1667712126771; 
 Sat, 05 Nov 2022 22:22:06 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003cf4eac8e80sm5235566wmb.23.2022.11.05.22.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 22:22:05 -0700 (PDT)
Date: Sun, 6 Nov 2022 01:22:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 xiehong@huawei.com
Subject: Re: [PATCH v7 resend 0/4] add generic vDPA device support
Message-ID: <20221106011943-mutt-send-email-mst@kernel.org>
References: <20221105083629.1058-1-longpeng2@huawei.com>
 <20221105103601-mutt-send-email-mst@kernel.org>
 <5387e1e7-b741-b6a1-f091-f15d5f136e38@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5387e1e7-b741-b6a1-f091-f15d5f136e38@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 06, 2022 at 08:17:07AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> 在 2022/11/6 0:43, Michael S. Tsirkin 写道:
> > On Sat, Nov 05, 2022 at 04:36:25PM +0800, Longpeng(Mike) wrote:
> > > From: Longpeng <longpeng2@huawei.com>
> > > 
> > > Hi guys,
> > > 
> > > With the generic vDPA device, QEMU won't need to touch the device
> > > types any more, such like vfio.
> > 
> > With this kind of passthrough migration is completely MIA right?
> > Better add a blocker...
> 
> Oh, I missed the "vdpa-dev: mark the device as unmigratable" since v4 and
> I'll add it in the next version.
> 
> We'll support passthrough migration in the next step. We have already
> written a demo that can migrate between some offloading cards.

Hmm ok. Backend disconnect can't work though, can it? State
is by necessity lost when backend crashes.

> > And given this is there an advantage over VFIO?
> 
> I think the answer is the same as "why we need vDPA" if we compare it with
> VFIO.

The answer is mostly because you can migrate and support backend
disconnect, no?

> > 
> > > We can use the generic vDPA device as follow:
> > >    -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
> > >    Or
> > >    -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
> > >    vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
> > 
> > > Changes v6 -> v7:
> > >      (v6: https://mail.gnu.org/archive/html/qemu-devel/2022-05/msg02821.html)
> > >      - rebase. [Jason]
> > >      - add documentation . [Stefan]
> > > 
> > > Changes v5 -> v6:
> > >    Patch 2:
> > >      - Turn to the original approach in the RFC to initialize the
> > >        virtio_pci_id_info array. [Michael]
> > > 	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
> > >    Patch 3:
> > >      - Fix logical error of exception handler around the post_init.
> > >        [Stefano]
> > >      - Fix some coding style warnings. [Stefano]
> > >    Patch 4:
> > >      - Fix some coding style warnings. [Stefano]
> > > 
> > > Changes v4 -> v5:
> > >    Patch 3:
> > >      - remove vhostfd [Jason]
> > >      - support virtio-mmio [Jason]
> > > 
> > > Changes v3 -> v4:
> > >    v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
> > >    - reorganize the series [Stefano]
> > >    - fix some typos [Stefano]
> > >    - fix logical error in vhost_vdpa_device_realize [Stefano]
> > > 
> > > Changes v2 -> v3
> > >    Patch 4 & 5:
> > >      - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
> > >      - s/VQS_NUM/VQS_COUNT  [Stefano]
> > >      - check both vdpa_dev_fd and vdpa_dev [Stefano]
> > >    Patch 6:
> > >      - move all steps into vhost_vdpa_device_unrealize. [Stefano]
> > > 
> > > Changes RFC -> v2
> > >    Patch 1:
> > >      - rename 'pdev_id' to 'trans_devid'  [Michael]
> > >      - only use transitional device id for the devices
> > >        listed in the spec  [Michael]
> > >      - use macros to make the id_info table clearer  [Longpeng]
> > >      - add some modern devices in the id_info table  [Longpeng]
> > >    Patch 2:
> > >      - remove the GET_VECTORS_NUM command  [Jason]
> > >    Patch 4:
> > >      - expose vdpa_dev_fd as a QOM preperty  [Stefan]
> > >      - introduce vhost_vdpa_device_get_u32 as a common
> > >        function to make the code clearer  [Stefan]
> > >      - fix the misleading description of 'dc->desc'  [Stefano]
> > >    Patch 5:
> > >      - check returned number of virtqueues  [Stefan]
> > >    Patch 6:
> > >      - init s->num_queues  [Stefano]
> > >      - free s->dev.vqs  [Stefano]
> > > 
> > > 
> > > Longpeng (Mike) (4):
> > >    virtio: get class_id and pci device id by the virtio id
> > >    vdpa: add vdpa-dev support
> > >    vdpa: add vdpa-dev-pci support
> > >    docs: Add generic vhost-vdpa device documentation
> > > 
> > >   docs/system/devices/vhost-vdpa-device.rst |  43 +++
> > >   hw/virtio/Kconfig                         |   5 +
> > >   hw/virtio/meson.build                     |   2 +
> > >   hw/virtio/vdpa-dev-pci.c                  | 102 ++++++
> > >   hw/virtio/vdpa-dev.c                      | 377 ++++++++++++++++++++++
> > >   hw/virtio/virtio-pci.c                    |  88 +++++
> > >   include/hw/virtio/vdpa-dev.h              |  43 +++
> > >   include/hw/virtio/virtio-pci.h            |   5 +
> > >   8 files changed, 665 insertions(+)
> > >   create mode 100644 docs/system/devices/vhost-vdpa-device.rst
> > >   create mode 100644 hw/virtio/vdpa-dev-pci.c
> > >   create mode 100644 hw/virtio/vdpa-dev.c
> > >   create mode 100644 include/hw/virtio/vdpa-dev.h
> > > 
> > > -- 
> > > 2.23.0
> > 
> > .


