Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602DB62E512
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 20:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovkJG-0002ey-12; Thu, 17 Nov 2022 14:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovkJE-0002aH-3U
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 14:12:24 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovkJC-00012t-0L
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 14:12:23 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-369426664f9so28041687b3.12
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 11:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0pgX3cCJhuBnabOubGseMWW6vchW4TCs1JSFdIOawY=;
 b=JAfrCFANPmOlmsWej1xZquvczB3Gv52oBLB2jaqH+hhSWizY/TjXQS1RLROu7JUG23
 HKdH+grv7sToQUMpXvH7lnxbSOEQfL8qSUYxbdcARHLC1XL0I3mh2l4OlrG5IfV043B4
 BGMPY4naN9lgBdu+do1l/9/SkjKyrg8RCb8feF0KSvqSAyRzx0hwCqwx7Kgdg1WkaFqZ
 Mki4kQnCAhzTfPwHt7ziPVHqKVSVIPcQQSFy9h8vPDcatWoJ+7ygauOBdALiz7+w7hML
 NpH8ycDF5wESouw+ZIRdmBAvhvTlJMoAaExykwTAa+kwnpu89Ybiqabs7jX8J5tGq+Dt
 6GGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0pgX3cCJhuBnabOubGseMWW6vchW4TCs1JSFdIOawY=;
 b=t2cODiaFJ5xzzeapX5LqRHYAJjeIL8m3eG0k2nDA6OfkgpKLLJMPnKuisazZs2eQhp
 PpZUpeC2ptOLKH+S0mDTdkneJDyAHiXDhEsE9oWZnI4z2kK7Bj1xGvIO9FWz19uPUa4q
 rV1K5E8j2akVtYpezUBcuTncbxzy9FKmqYgGFRGv7IfFiU8+noHeIH058B/CGik6gcEt
 Gv+yyczh4B1I9Y9Ry8MQlGIHLRrTo3jixoeo4l6rbwGVKpmIhMnUPH5usRT9LvyW8lQt
 dXAm7RMaVG7aKblu2EYbZh88gRgERJ9wfYkEwfHNj6B9zHC9PkyGrBK/awT1EYQrhgxa
 mSTw==
X-Gm-Message-State: ANoB5pnQ1jgG2YazILfPm13XXWnLVN9lvUr6jNrA+dCKp3LJtu6OS9bK
 UOWv+V64RFGG77Be0H/i1sBbbs5Kdjc7HrFDkow=
X-Google-Smtp-Source: AA0mqf7bJTWv01JZcLUWk0BkL2gOKfhFP4SmNkNjBeDVmgH9f5XXFBvNbRRyyep5ULAYpsT3fQ1JjurRukCge4mNnSk=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr3451199ywb.296.1668712340926; Thu, 17
 Nov 2022 11:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
In-Reply-To: <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 14:12:07 -0500
Message-ID: <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi Sam,
Please send a git repo URL so Thomas can fetch the commit without
email/file size limitations.

> diff --git a/_posts/2022-11-17-zoned-emulation.md b/_posts/2022-11-17-zon=
ed-emulation.md
> new file mode 100644
> index 0000000..69ce4d7
> --- /dev/null
> +++ b/_posts/2022-11-17-zoned-emulation.md
> @@ -0,0 +1,45 @@
> +---
> +layout: post
> +title:  "Introduction to Zoned Storage Emulation"
> +date:   2022-11-17
> +author: Sam Li
> +categories: [storage, gsoc, outreachy, internships]
> +---
> +
> +## Zoned block devices
> +
> +Aimed for at-scale data infrastructures,

I don't know what at-scale data infrastructure is. Is it something
readers can relate to? Otherwise there's a risk that readers will
decide this doesn't apply to them and stop reading.

> zoned block devices (ZBDs) divide the LBA space into block regions called=
 zones that are larger than the LBA size.

LBA is not defined and also not used again after this sentence.
Readers will be familiar with disks but may not know what an LBA is.
Since the concept isn't used again I suggest dropping it:

  zoned block devices (ZBDs) are divided into regions called zones
that can only be written sequentially.

> By only allowing sequential writes, it can reduce write amplification in =
SSDs,

This sounds more natural:

  By only allowing sequential writes, SSD write amplification can be reduce=
d

It might also be nice to provide a little bit of extra context:

  ... reduced by eliminating the need for a <a
href=3D"https://en.wikipedia.org/wiki/Flash_translation_layer">Flash
Translation Layer</a>

> and potentially lead to higher throughput and increased capacity. Providi=
ng new storage software stack,

s/Providing new/Providing a new/

> zoned storage concept is standardized as ZBC(SCSI standard), ZAC(ATA stan=
dard), ZNS(NVMe).

Small tweaks:

  zoned storage concepts are standardized in ZBC (SCSI standard), ZAC
(ATA standard), ZNS (NVMe).

There is a space before opening parentheses: hello (world) instead of
hello(world). Please check the rest of the article for more instances
of this.

It would be nice to include links but I didn't find good pages for
ZBC/ZAC/ZNS aside from the full standards that they are part of.

This intro section would be a good place to link to https://zonedstorage.io=
/!

> Meanwhile, the virtio protocol for block devices(virtio-blk) should also =
be aware of ZBDs instead of taking them as regular block devices. It should=
 be able to pass such devices through to the guest. An overview of necessar=
y work is as follows:
> +
> +1. Virtio protocol: [extend virtio-blk protocol with main zoned storage =
concept](https://lwn.net/Articles/914377/), Dmitry Fomichev
> +2. Linux: [implement the virtio specification extensions](https://www.sp=
inics.net/lists/linux-block/msg91944.html), Dmitry Fomichev
> +3. QEMU: add zoned emulation support to virtio-blk, Sam Li, [Outreachy 2=
022 project](https://wiki.qemu.org/Internships/ProjectIdeas/VirtIOBlkZonedB=
lockDevices)

You could split the QEMU work into 2 points if you like:
3. QEMU: add zoned storage APIs to the block layer, Sam Li
4. QEMU: implement zoned storage support in virtio-blk emulation, Sam Li

> +
> +<img src=3D"/screenshots/zbd.png" alt=3D"zbd" style=3D"zoom:50%;" />
> +
> +## Zoned emulation
> +
> +Currently, QEMU can support zoned devices by virtio-scsi or PCI device p=
assthrough. It needs to specify the device type it is talking to. While sto=
rage controller emulation uses block layer APIs instead of directly accessi=
ng disk images. Extending virtio-blk emulation avoids code duplication and =
simplify the support by hiding the device types under a unified zoned stora=
ge interface, simplifying VM deployment for different type of zoned devices=
.

Another advantages that come to mind:
1. virtio-blk can be implemented in hardware. If those devices wish to
follow the zoned storage model then the virtio-blk specification needs
to natively support zoned storage.
2. Individual NVMe namespaces or anything that is a zoned Linux block
device can be exposed to the guest without passing through a full
device.

> +
> +For zoned storage emulation, zoned storage APIs support three zoned mode=
ls(conventional, host-managed, host-aware) , four zone management commands(=
Report Zone, Open Zone, Close Zone, Finish Zone), and Append Zone.  QEMU bl=
ock storage

Maybe:
s/QEMU block storage/The QEMU block layer/

> has a BlockDriverState graph that propagates device information inside bl=
ock layer. A root pointer at BlockBackend points to the graph. There are th=
ree type of block driver nodes: filter node, format node, protocol node. Fi=
le-posix driver is the lowest level within the graph where zoned storage AP=
Is reside.

Is it possible to remove "A root pointer at BlockBackend points to the
graph. There are three type of block driver nodes: filter node, format
node, protocol node." so there are fewer new concepts? I didn't see
further use of BlockBackend or filter/format nodes in the text.

> +
> +<img src=3D"/screenshots/storage_overview.png" alt=3D"storage_overview" =
style=3D"zoom: 50%;" />
> +
> +After receiving the block driver states, Virtio-blk emulation recognizes=
 zoned devices and sends the zoned feature bit to guest. Then the guest can=
 see the zoned device in the host. When the guest executes zoned operations=
, virtio-blk driver issues corresponding requests that will be captured by =
virito-blk

s/virito/virtio/

> device inside QEMU. Afterwards, virtio-blk device sends the requests to f=
ile-posix driver which will perform zoned operations.
> +
> +Unlike zone management operations, Linux doesn't have a user API

The Linux userspace API (<linux/blkzoned.h>) hasn't been mentioned
before. Maybe the previous paragraph should explain that file-posix
performs zoned operations using <linux/blkzoned.h> ioctls? Then this
sentence will be easier to understand.

> to issue zone append requests to zoned devices from user space. With the =
help of write pointer emulation tracking locations of write pointer of each=
 zone, QEMU block layer performs append writes by modifying regular writes.=
 Write pointer locks guarantee the execution of requests. Upon failure it m=
ust not update the write pointer location which is only got updated when th=
e request is successfully finished.
> +
> +Problems can always be sovled

s/sovled/solved/

Thanks,
Stefan

