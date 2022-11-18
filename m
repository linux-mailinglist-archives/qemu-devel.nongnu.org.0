Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F7F62EA62
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 01:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovpK1-0001ic-RQ; Thu, 17 Nov 2022 19:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ovpJX-0001fh-Q9
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 19:33:23 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ovpJV-000293-Gd
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 19:33:03 -0500
Received: by mail-ua1-x92c.google.com with SMTP id y24so996533uaq.3
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvJp+oKLjVQQYSDQ6yFWAZWraVSKN55mbCI3dSinkIw=;
 b=N6faYeAmBHwqNIieAHDcQSPQeBY9RnZuAMlC1THqu8t87HZZ1Mr1RGCjryLNfEbaQf
 EIU2saSzE1s7T0C1KbARg3/HuzJSTF6ox3Cfr7E7m+CQGY+x5MpAoWtfxcyRxqYuWQtv
 s7QQl9ONDWAIwx1I34HRV3Ca6q6/oi9DTSdhuB3V3b053SrmrQkIuZruiNdg/+Gjhvyf
 WtLAGlXx4vH15fL0+xFx3FHxNuZY0KRxaGuPvkxL9lKuXBL1BGSyh6c5zDZ7mqpMM/RR
 9Vt+d/P/9b0kqCgEJCZ5fXQ3Un0WM7SRDGKZumhuuWGbj84hGfUOWQKH7SwdfTCyhK1W
 FzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvJp+oKLjVQQYSDQ6yFWAZWraVSKN55mbCI3dSinkIw=;
 b=JX2LpQS8BYtoX+VzSKDmuG4XMrJWHttTgifesfy65ADUPKxB7Ru9lKmIaX2WH2STfk
 wFz4dF7/naxSKkcSefgksRuwX9wd7AbG+zP0FIhdkO7IutuIlmHxHZ+//ohIUCbAh4dv
 dL+4sA98WWHW/TdIcL0lmAbiOiMEFqCyvgxH2JE70GLVWNhLnN6+LC63cRvFITORbhTK
 PbtJJTXGa3Ftzno7+AoUPIqtpBklHpdBwJxh+lJ7zXh/SLuVKd3NytF+bp8qvaZ75upY
 JViV7Sm9N64licf9GxOzGO5TrymJvRjToKD+7ZkN8H6aFGaQ7dMEGcAQ6Gxji7qFDHdw
 YZ/g==
X-Gm-Message-State: ANoB5pmaenwraFz+orLQXKV2SllbOVQf7fMh89Bbmm1Lfnz/Dqd5z34p
 bbfnfNjWhBwjOYb0a+TjMtybMZ2L+02o5ofS5ko=
X-Google-Smtp-Source: AA0mqf5krzl4tjqR0afquj+ARdoszUlikKiqqb4hupC6qq7Hk+umAIEd3X/H9/iTRI3RHYZhZluvH2hxk+G3ptAYCnM=
X-Received: by 2002:ab0:5657:0:b0:3d2:b:713f with SMTP id
 z23-20020ab05657000000b003d2000b713fmr2721273uaa.116.1668731579714; 
 Thu, 17 Nov 2022 16:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20221117064444.20648-1-faithilikerun@gmail.com>
 <CAAAx-8JHmxe=9GuoZ+T1yqtLrrzk+-6_HL5EJ6LBJ+twOKp8sA@mail.gmail.com>
 <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
In-Reply-To: <CAJSP0QX3j9SbKW7tL6_vc9Ru518qWEG=288gkd+ArkHF05Vgsg@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 18 Nov 2022 08:33:10 +0800
Message-ID: <CAAAx-8+bTxcWEbP2Q+pGOpxNAZFera31Js3wYUZt=nwqpJbG2w@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about zoned storage emulation
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=faithilikerun@gmail.com; helo=mail-ua1-x92c.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=8818=E6=
=97=A5=E5=91=A8=E4=BA=94 03:12=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Sam,
> Please send a git repo URL so Thomas can fetch the commit without
> email/file size limitations.

I'll push it to the zbd branch after fixing the bellowing.
https://github.com/sgzerolc/qemu-web/zbd

>
> > diff --git a/_posts/2022-11-17-zoned-emulation.md b/_posts/2022-11-17-z=
oned-emulation.md
> > new file mode 100644
> > index 0000000..69ce4d7
> > --- /dev/null
> > +++ b/_posts/2022-11-17-zoned-emulation.md
> > @@ -0,0 +1,45 @@
> > +---
> > +layout: post
> > +title:  "Introduction to Zoned Storage Emulation"
> > +date:   2022-11-17
> > +author: Sam Li
> > +categories: [storage, gsoc, outreachy, internships]
> > +---
> > +
> > +## Zoned block devices
> > +
> > +Aimed for at-scale data infrastructures,
>
> I don't know what at-scale data infrastructure is. Is it something
> readers can relate to? Otherwise there's a risk that readers will
> decide this doesn't apply to them and stop reading.

Yes, I'll remove it.

>
> > zoned block devices (ZBDs) divide the LBA space into block regions call=
ed zones that are larger than the LBA size.
>
> LBA is not defined and also not used again after this sentence.
> Readers will be familiar with disks but may not know what an LBA is.
> Since the concept isn't used again I suggest dropping it:
>
>   zoned block devices (ZBDs) are divided into regions called zones
> that can only be written sequentially.
>
> > By only allowing sequential writes, it can reduce write amplification i=
n SSDs,
>
> This sounds more natural:
>
>   By only allowing sequential writes, SSD write amplification can be redu=
ced
>
> It might also be nice to provide a little bit of extra context:
>
>   ... reduced by eliminating the need for a <a
> href=3D"https://en.wikipedia.org/wiki/Flash_translation_layer">Flash
> Translation Layer</a>
>
> > and potentially lead to higher throughput and increased capacity. Provi=
ding new storage software stack,
>
> s/Providing new/Providing a new/
>
> > zoned storage concept is standardized as ZBC(SCSI standard), ZAC(ATA st=
andard), ZNS(NVMe).
>
> Small tweaks:
>
>   zoned storage concepts are standardized in ZBC (SCSI standard), ZAC
> (ATA standard), ZNS (NVMe).
>
> There is a space before opening parentheses: hello (world) instead of
> hello(world). Please check the rest of the article for more instances
> of this.
>
> It would be nice to include links but I didn't find good pages for
> ZBC/ZAC/ZNS aside from the full standards that they are part of.
>
> This intro section would be a good place to link to https://zonedstorage.=
io/!

Good idea! Zoned storage site also has a brief introduction to those standa=
rds.
https://zonedstorage.io/docs/introduction/smr#governing-standards
https://zonedstorage.io/docs/introduction/zns

>
> > Meanwhile, the virtio protocol for block devices(virtio-blk) should als=
o be aware of ZBDs instead of taking them as regular block devices. It shou=
ld be able to pass such devices through to the guest. An overview of necess=
ary work is as follows:
> > +
> > +1. Virtio protocol: [extend virtio-blk protocol with main zoned storag=
e concept](https://lwn.net/Articles/914377/), Dmitry Fomichev
> > +2. Linux: [implement the virtio specification extensions](https://www.=
spinics.net/lists/linux-block/msg91944.html), Dmitry Fomichev
> > +3. QEMU: add zoned emulation support to virtio-blk, Sam Li, [Outreachy=
 2022 project](https://wiki.qemu.org/Internships/ProjectIdeas/VirtIOBlkZone=
dBlockDevices)
>
> You could split the QEMU work into 2 points if you like:
> 3. QEMU: add zoned storage APIs to the block layer, Sam Li
> 4. QEMU: implement zoned storage support in virtio-blk emulation, Sam Li
>
> > +
> > +<img src=3D"/screenshots/zbd.png" alt=3D"zbd" style=3D"zoom:50%;" />
> > +
> > +## Zoned emulation
> > +
> > +Currently, QEMU can support zoned devices by virtio-scsi or PCI device=
 passthrough. It needs to specify the device type it is talking to. While s=
torage controller emulation uses block layer APIs instead of directly acces=
sing disk images. Extending virtio-blk emulation avoids code duplication an=
d simplify the support by hiding the device types under a unified zoned sto=
rage interface, simplifying VM deployment for different type of zoned devic=
es.
>
> Another advantages that come to mind:
> 1. virtio-blk can be implemented in hardware. If those devices wish to
> follow the zoned storage model then the virtio-blk specification needs
> to natively support zoned storage.
> 2. Individual NVMe namespaces or anything that is a zoned Linux block
> device can be exposed to the guest without passing through a full
> device.

Thanks!

>
> > +
> > +For zoned storage emulation, zoned storage APIs support three zoned mo=
dels(conventional, host-managed, host-aware) , four zone management command=
s(Report Zone, Open Zone, Close Zone, Finish Zone), and Append Zone.  QEMU =
block storage
>
> Maybe:
> s/QEMU block storage/The QEMU block layer/
>
> > has a BlockDriverState graph that propagates device information inside =
block layer. A root pointer at BlockBackend points to the graph. There are =
three type of block driver nodes: filter node, format node, protocol node. =
File-posix driver is the lowest level within the graph where zoned storage =
APIs reside.
>
> Is it possible to remove "A root pointer at BlockBackend points to the
> graph. There are three type of block driver nodes: filter node, format
> node, protocol node." so there are fewer new concepts? I didn't see
> further use of BlockBackend or filter/format nodes in the text.

Yes, it can be removed.

>
> > +
> > +<img src=3D"/screenshots/storage_overview.png" alt=3D"storage_overview=
" style=3D"zoom: 50%;" />
> > +
> > +After receiving the block driver states, Virtio-blk emulation recogniz=
es zoned devices and sends the zoned feature bit to guest. Then the guest c=
an see the zoned device in the host. When the guest executes zoned operatio=
ns, virtio-blk driver issues corresponding requests that will be captured b=
y virito-blk
>
> s/virito/virtio/
>
> > device inside QEMU. Afterwards, virtio-blk device sends the requests to=
 file-posix driver which will perform zoned operations.
> > +
> > +Unlike zone management operations, Linux doesn't have a user API
>
> The Linux userspace API (<linux/blkzoned.h>) hasn't been mentioned
> before. Maybe the previous paragraph should explain that file-posix
> performs zoned operations using <linux/blkzoned.h> ioctls? Then this
> sentence will be easier to understand.
>
> > to issue zone append requests to zoned devices from user space. With th=
e help of write pointer emulation tracking locations of write pointer of ea=
ch zone, QEMU block layer performs append writes by modifying regular write=
s. Write pointer locks guarantee the execution of requests. Upon failure it=
 must not update the write pointer location which is only got updated when =
the request is successfully finished.
> > +
> > +Problems can always be sovled
>
> s/sovled/solved/

Thanks for your comments,
Sam

