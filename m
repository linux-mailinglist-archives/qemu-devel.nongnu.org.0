Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8435F9979
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:12:49 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmy0-00007X-Kl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohmvN-00063z-QP; Mon, 10 Oct 2022 03:10:05 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohmvL-0006Hj-Kv; Mon, 10 Oct 2022 03:10:05 -0400
Received: by mail-ua1-x92c.google.com with SMTP id e22so3622502uar.5;
 Mon, 10 Oct 2022 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8P2nZF10XB339wFuH0DIm0TRVCixcGozylTmW0hHxHI=;
 b=KIR4sGo5rYf0LttyA1KLnWvJYFq5vDQWJX8wGeoLB59P0Wf258OXlYRWzN5qxyk01j
 8STs/iPPQar0n2BUHi/vvgK9bjFgaqm/FJpQ7lgYdhHNmNG/AvSiQFo3zDP2Q3tPRz9R
 DgmVdc2EzJHe7NgzwibXEGkRcZIjLFP+reLNtdp4JK1N6rDbul6Zo9gFPb0XnYY/TksE
 GNdc8FEgn8qhh56fUSFdudw/fVGODjEQ6HeHL5SwHK8U0UOSgnI919fUGN9Dxw8y3sxO
 OswGyvaX/wlNJFNdC22zErejEuQHYys1ZuePJE4XnvlXU7IZSrecd/bSxKbt2JP8EOb6
 GrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8P2nZF10XB339wFuH0DIm0TRVCixcGozylTmW0hHxHI=;
 b=EDZZTSTN86bd4h/LonLYborF8CMypq+2uCuqeHoi6bL9dtYKGyRd2/7y8WYdstoZC2
 s4HBe+FsX6Pje2V2nrsroBBLCWWtLUoz+azGEhCRFG8yKqa9JIymRCeFHQdotLsPeIN2
 t8U+lQv34IN1GxUrYX3jAtBDA7OPFa6dHS6p+VkYJTz2wjMkdKdnQ3NcvnF7ABZivc1N
 0ZoHYjPmpYU1zNDyOYGAs7hITvtt+fMs6/7suBHci82mqDhFu2FTfXXiuVxIQHdH6EQp
 VnSaCx/noDj8RsM8RR8cYoda1SbMqOIqrNExh8eOX+vcvCr7VQl+ydKgT1fWpaNSmFjJ
 fHmA==
X-Gm-Message-State: ACrzQf2FsvnNrulqvAn1Sup6YatvJW/SwW4p9DchDSY6Q/3J97Ki7ky4
 g6IJTwFb9VSEo/0zDci2D175IH9oSR95WK0QXXY=
X-Google-Smtp-Source: AMsMyM7Sif/coctam+0IfBcJVD2l6a0HH5eEh2GbL+bDdqw8MsvDZvM379Gs2yWErLq7YCecxCBUCWKof2Mi0DkDZhs=
X-Received: by 2002:a9f:35a9:0:b0:3df:a108:f5fd with SMTP id
 t38-20020a9f35a9000000b003dfa108f5fdmr5504548uad.4.1665385801431; Mon, 10 Oct
 2022 00:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221010022116.41942-1-faithilikerun@gmail.com>
 <20221010022116.41942-8-faithilikerun@gmail.com>
 <976d2b9d-1059-7256-5d5d-0a127293d88a@suse.de>
In-Reply-To: <976d2b9d-1059-7256-5d5d-0a127293d88a@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 10 Oct 2022 15:10:17 +0800
Message-ID: <CAAAx-8JAp9ESyiiKcT0VMRqjDzzs3MVaT+_9vHjHp=qv4XT9DA@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] docs/zoned-storage: add zoned device documentation
To: Hannes Reinecke <hare@suse.de>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hannes Reinecke <hare@suse.de> =E4=BA=8E2022=E5=B9=B410=E6=9C=8810=E6=97=A5=
=E5=91=A8=E4=B8=80 14:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/10/22 04:21, Sam Li wrote:
> > Add the documentation about the zoned device support to virtio-blk
> > emulation.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   docs/devel/zoned-storage.rst           | 40 +++++++++++++++++++++++++=
+
> >   docs/system/qemu-block-drivers.rst.inc |  6 ++++
> >   2 files changed, 46 insertions(+)
> >   create mode 100644 docs/devel/zoned-storage.rst
> >
> > diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rs=
t
> > new file mode 100644
> > index 0000000000..deaa4ce99b
> > --- /dev/null
> > +++ b/docs/devel/zoned-storage.rst
> > @@ -0,0 +1,40 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +zoned-storage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Zoned Block Devices (ZBDs) devide the LBA space into block regions cal=
led zones
>
> divide
>
> > +that are larger than the LBA size. They can only allow sequential writ=
es, which
> > +can reduce write amplification in SSDs, and potentially lead to higher
> > +throughput and increased capacity. More details about ZBDs can be foun=
d at:
> > +
> > +https://zonedstorage.io/docs/introduction/zoned-storage
> > +
> > +1. Block layer APIs for zoned storage
> > +-------------------------------------
> > +QEMU block layer has three zoned storage model:
> > +- BLK_Z_HM: This model only allows sequential writes access. It suppor=
ts a set
> > +of ZBD-specific I/O request that used by the host to manage device zon=
es.
>
> Maybe:
> This model only allow for sequential write access to zones. It supports
> ZBD-specific I/O requests to manage device zones.
>
> > +- BLK_Z_HA: It deals with both sequential writes and random writes acc=
ess.
>
> Maybe better:
> This model allows sequential and random writes to zones. It supports
> ZBD-specific I/O requests to manage device zones.
>
> > +- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated=
 as
> > +non-zoned devices.
>
> Maybe:
> This is the default model with no zones support; it includes both
> regular and drive-managed ZBD devices. ZBD-specific I/O requests are not
> supported.

Thanks!

>
> > +
> > +The block device information resides inside BlockDriverState. QEMU use=
s
> > +BlockLimits struct(BlockDriverState::bl) that is continuously accessed=
 by the
> > +block layer while processing I/O requests. A BlockBackend has a root p=
ointer to
> > +a BlockDriverState graph(for example, raw format on top of file-posix)=
. The
> > +zoned storage information can be propagated from the leaf BlockDriverS=
tate all
> > +the way up to the BlockBackend. If the zoned storage model in file-pos=
ix is
> > +set to BLK_Z_HM, then block drivers will declare support for zoned hos=
t device.
> > +
> > +The block layer APIs support commands needed for zoned storage devices=
,
> > +including report zones, four zone operations, and zone append.
> > +
> > +2. Emulating zoned storage controllers
> > +--------------------------------------
> > +When the BlockBackend's BlockLimits model reports a zoned storage devi=
ce, users
> > +like the virtio-blk emulation or the qemu-io-cmds.c utility can use bl=
ock layer
> > +APIs for zoned storage emulation or testing.
> > +
> > +For example, to test zone_report on a null_blk device using qemu-io is=
:
> > +$ path/to/qemu-io --image-opts -n driver=3Dzoned_host_device,filename=
=3D/dev/nullb0
> > +-c "zrp offset nr_zones"
> > diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-=
block-drivers.rst.inc
> > index dfe5d2293d..0b97227fd9 100644
> > --- a/docs/system/qemu-block-drivers.rst.inc
> > +++ b/docs/system/qemu-block-drivers.rst.inc
> > @@ -430,6 +430,12 @@ Hard disks
> >     you may corrupt your host data (use the ``-snapshot`` command
> >     line option or modify the device permissions accordingly).
> >
> > +Zoned block devices
> > +  Zoned block devices can be passed through to the guest if the emulat=
ed storage
> > +  controller supports zoned storage. Use ``--blockdev zoned_host_devic=
e,
> > +  node-name=3Ddrive0,filename=3D/dev/nullb0`` to pass through ``/dev/n=
ullb0``
> > +  as ``drive0``.
> > +
> >   Windows
> >   ^^^^^^^
> >
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                Kernel Storage Architect
> hare@suse.de                              +49 911 74053 688
> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andre=
w
> Myers, Andrew McDonald, Martje Boudien Moerman
>

