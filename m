Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AB68BCB7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0T4-00044m-CG; Mon, 06 Feb 2023 07:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pP0Sj-0003kc-5K; Mon, 06 Feb 2023 07:19:11 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pP0Sg-00060y-Qb; Mon, 06 Feb 2023 07:19:08 -0500
Received: by mail-ej1-x636.google.com with SMTP id hx15so33522010ejc.11;
 Mon, 06 Feb 2023 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nfs1bWv6nKsq9XPyCiuHuCWbmX0Of/aXat1tJyra/3U=;
 b=gwPnMB8VxQYpQ/ERmnLAxtIOlwobcSRpeGxjnd6S2fQUBU3Z5+Tr4R3sB2a1L4a/JX
 hlka0UdIkvcaeJkp56T4lfpcD7+J6HIR0+AfhKZTG6Nl379XqA2Kc58fVLEmWPBxQ4ns
 1EbdDxWCN0T8MVupaAwvbHVvGzvc9noI3szWdl4hE9OPPiNjHgVuf4iQXOJtK4/8U2Tn
 PeRx2/FSC2BaWD1xeUT6n2wtKmk+gJEeI+1OVXIrU6t5As1ZTUT68uh31/+pO3N03edD
 oF9sodbCRm9qOdRr4uUtR0Wj+PRXcHSc9sun0vHKaoX5a/xrxrFU4Irbw+0dqYO2Vnsj
 CfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nfs1bWv6nKsq9XPyCiuHuCWbmX0Of/aXat1tJyra/3U=;
 b=xNXh/OBzDlxTup988MOW/+YWnmhPipkI5+btXCfO4bpxGHYBLVrHZFFmwBEay9tiUm
 oSZDBKKBr2DBbbG0IX6B9qttJIJNiFKumdrtYZgvy+duQl4Q4uxxH3g5VgzazBpBJ7yR
 v8I+g0R2nax98/v2ZOKnwjt1J4uVySBeDRrZNKfTxFZpuTGO9fPSgEJL+CPzrRnmX9RV
 Eybbqs2lDG+a2RWbQwyHIpigr2wPHcIejONj8pugwewU+Ww1PCTwGTDHQ3FJlGSwxZRg
 HFXpE/sqeFHRBZco8tBkG6ZloMyJy/TC0t1J2fciUVRy4H3rJ9rOnQYN0VGzdo+z9P/u
 bUcA==
X-Gm-Message-State: AO0yUKXdB9kad9NzoCoFBHhCDmIjkTJ4kAYo+e35+5vdCCRXGG/6A7DZ
 csOBT62D1gNW5NEAqJ56Mah/QghCfJ428wss0io=
X-Google-Smtp-Source: AK7set/lAx7ZDbnWihoYdybxYx2F9bl+7BO2868xeQfzJIIl7oiDKMJZWXVayEKSTXP7oyww7DmBXivNyxIWzWUk2J8=
X-Received: by 2002:a17:906:cd02:b0:8a5:cae4:51f1 with SMTP id
 oz2-20020a170906cd0200b008a5cae451f1mr602938ejb.195.1675685943974; Mon, 06
 Feb 2023 04:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-9-faithilikerun@gmail.com>
 <CAJSP0QW2C1d+069mTdOsXkT81VFEcqTcepCw98BSDUMt6Xp86Q@mail.gmail.com>
In-Reply-To: <CAJSP0QW2C1d+069mTdOsXkT81VFEcqTcepCw98BSDUMt6Xp86Q@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 6 Feb 2023 20:18:37 +0800
Message-ID: <CAAAx-8LqyMbYBC4HPK9iYJs75z6zQOFBiGLuxiAR8=fzZ_7x8w@mail.gmail.com>
Subject: Re: [PATCH v15 8/8] docs/zoned-storage: add zoned device documentation
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, damien.lemoal@opensource.wdc.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=faithilikerun@gmail.com; helo=mail-ej1-x636.google.com
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

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=B8=80 20:16=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 29 Jan 2023 at 05:31, Sam Li <faithilikerun@gmail.com> wrote:
> >
> > Add the documentation about the zoned device support to virtio-blk
> > emulation.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  docs/devel/zoned-storage.rst           | 43 ++++++++++++++++++++++++++
> >  docs/system/qemu-block-drivers.rst.inc |  6 ++++
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 docs/devel/zoned-storage.rst
>
> This patch uses the old "zoned_host_device" BlockDriver name. Please
> update it to "host_device".
>
> It's probably a good idea to search the patches for zoned_host_device
> to find any other places that need to be updated. That can be done
> with git log -p master.. | grep zoned_host_device.

Sorry for missing that. Will do.

>
> > diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rs=
t
> > new file mode 100644
> > index 0000000000..03e52efe2e
> > --- /dev/null
> > +++ b/docs/devel/zoned-storage.rst
> > @@ -0,0 +1,43 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +zoned-storage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Zoned Block Devices (ZBDs) divide the LBA space into block regions cal=
led zones
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
> > +QEMU block layer supports three zoned storage models:
> > +- BLK_Z_HM: The host-managed zoned model only allows sequential writes=
 access
> > +to zones. It supports ZBD-specific I/O commands that can be used by a =
host to
> > +manage the zones of a device.
> > +- BLK_Z_HA: The host-aware zoned model allows random write operations =
in
> > +zones, making it backward compatible with regular block devices.
> > +- BLK_Z_NONE: The non-zoned model has no zones support. It includes bo=
th
> > +regular and drive-managed ZBD devices. ZBD-specific I/O commands are n=
ot
> > +supported.
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
> >    you may corrupt your host data (use the ``-snapshot`` command
> >    line option or modify the device permissions accordingly).
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
> >  Windows
> >  ^^^^^^^
> >
> > --
> > 2.38.1
> >
> >

