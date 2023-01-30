Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63DF6814B5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:19:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVvR-00036A-NI; Mon, 30 Jan 2023 10:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMVv1-00033i-VN; Mon, 30 Jan 2023 10:18:06 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMVv0-0004ug-31; Mon, 30 Jan 2023 10:18:03 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-4fd37a1551cso163318477b3.13; 
 Mon, 30 Jan 2023 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kIxotb/J5s6JfDyLxjQ7B4P7EgodUafXL7vop5xhkZI=;
 b=m3gMpP/wDJveORnF7Q4DqnbIsfFzxtX+ALxiQb/Lt1oRZOCP9yGNVmu6+8BlaeZlKT
 r/u5B26sUpfNCuJwBrHimUFahMlNeWM1egC5mN17ajXhNXQGNjejjK2gWdSAn5K4MTPj
 iG1V+V76Ha40k+p1KNlT2GYGIZfAyLVVpGGUHdAKNP8Z4N3wfqA0urdJpYuTBD1BHTlq
 jHLWs0/RI8MiLBQPw2WKkeI+5oWipCUUUKT20afhAdrQkzGcx9/gW3ca69b6DTT5uZTk
 RSIKP05j+mPU4Ptm4sl/m0iJPAkzhClSMSsGyAdCWhAV5uKfT9wc55hMtcqaZyVti9w9
 0XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIxotb/J5s6JfDyLxjQ7B4P7EgodUafXL7vop5xhkZI=;
 b=ypl57ObmhBJDzq69RiPOIQENTzOU0sMqDS+EEsWb7GzlATh0vDyv815hDH5HimBGTE
 TmYFIRCgfYt3H5p7jPdNwUjYigslhi2RmyxL4IC5RKL7NHeQz5DXRGqMuIXoL/wWTGSn
 Nsw+ms2e0Ok3QzfA2h7xQ8g2f3LVnjaqUE9N6fs7u8TCt7MbScTVFB158Q1zMQzdTa/o
 ShAJZ8U5IDpRSwH81rjfQEUi0TPR3sSkNncvBPs37IXPcetukIp4HvNTk7s1BmOmCgMQ
 CxS8uOfKrwVC4YlwbFYuKTMwTpd0jg8wcUHPD5/o/zZDHWYc2gJLSeDoz1wah1SyPjoW
 FdmQ==
X-Gm-Message-State: AO0yUKXJItX+lJXOjjtcNO/5MFAcPKO1Vc05/RU6i/EQj8nLF8Lmj480
 8z368SlbiEtSk0E3GHzJev1gjVbJu2tAcVReFNc=
X-Google-Smtp-Source: AK7set99pBO4VeP+NUrQQA1CXRGgi7HdlcTHV4lJogB5Xz6SUCnkiipPHjDx11cxC2rxkciTEVXs7SPQClGSwqEi+Mc=
X-Received: by 2002:a81:4882:0:b0:50e:79ff:776e with SMTP id
 v124-20020a814882000000b0050e79ff776emr1411889ywa.206.1675091880282; Mon, 30
 Jan 2023 07:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20230129103951.86063-1-faithilikerun@gmail.com>
 <20230129103951.86063-3-faithilikerun@gmail.com> <Y9e48KYxf2TLHmP4@redhat.com>
In-Reply-To: <Y9e48KYxf2TLHmP4@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 30 Jan 2023 10:17:48 -0500
Message-ID: <CAJSP0QUOQge9V2jM+ibhNgt-c-sjWw5RjFeO2isfw6Gxo3gEwQ@mail.gmail.com>
Subject: Re: [RFC v6 2/4] virtio-blk: add zoned storage emulation for zoned
 devices
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 dmitry.fomichev@wdc.com, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com, 
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, 
 hare@suse.de, Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
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

On Mon, 30 Jan 2023 at 07:33, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Sun, Jan 29, 2023 at 06:39:49PM +0800, Sam Li wrote:
> > This patch extends virtio-blk emulation to handle zoned device commands
> > by calling the new block layer APIs to perform zoned device I/O on
> > behalf of the guest. It supports Report Zone, four zone oparations (ope=
n,
> > close, finish, reset), and Append Zone.
> >
> > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > support zoned block devices. Regular block devices(conventional zones)
> > will not be set.
> >
> > The guest os can use blktests, fio to test those commands on zoned devi=
ces.
> > Furthermore, using zonefs to test zone append write is also supported.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  hw/block/virtio-blk-common.c |   2 +
> >  hw/block/virtio-blk.c        | 394 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 396 insertions(+)
> >
>
> > @@ -949,6 +1311,30 @@ static void virtio_blk_update_config(VirtIODevice=
 *vdev, uint8_t *config)
> >          blkcfg.write_zeroes_may_unmap =3D 1;
> >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> >      }
> > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > +        switch (bs->bl.zoned) {
> > +        case BLK_Z_HM:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > +            break;
> > +        case BLK_Z_HA:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +
> > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > +                     bs->bl.zone_size / 512);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > +                     bs->bl.max_active_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > +                     bs->bl.max_open_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > +                     bs->bl.max_append_sectors);
>
> So these are all ABI sensitive frontend device settings, but they are
> not exposed as tunables on the virtio-blk device, instead they are
> implicitly set from the backend.
>
> We have done this kind of thing before in QEMU, but several times it
> has bitten QEMU maintainers/users, as having a backend affect the
> frontend ABI is not to typical. It wouldn't be immediately obvious
> when starting QEMU on a target host that the live migration would
> be breaking ABI if the target host wasn't using a zoned device with
> exact same settings.
>
> This also limits mgmt flexibility across live migration, if the
> mgmt app wants/needs to change the storage backend. eg maybe they
> need to evacuate the host for an emergency, but don't have spare
> hosts with same kind of storage. It might be desirable to migrate
> and switch to a plain block device or raw/qcow2 file, rather than
> let the VM die.
>
> Can we make these virtio setting be explicitly controlled on the
> virtio-blk device.  If not specified explicitly they could be
> auto-populated from the backend for ease of use, but if specified
> then simply validate the backend is a match. libvirt would then
> make sure these are always explicitly set on the frontend.

I think this is a good idea, especially if we streamline the
file-posix.c driver by merging --blockdev zoned_host_device into
--blockdev host_device. It won't be obvious from the command-line
whether this is a zoned or non-zoned device. There should be a
--device virtio-blk-pci,drive=3Ddrive0,zoned=3Don option that fails when
drive0 isn't zoned. It should probably be on/off/auto where auto is
the default and doesn't check anything, on requires a zoned device,
and off requires a non-zoned device. That will prevent accidental
migration between zoned/non-zoned devices.

I want to point out that virtio-blk doesn't have checks for the disk
size or other details, so what you're suggesting for zone_sectors, etc
is stricter than what QEMU does today. Since the virtio-blk parameters
you're proposing are optional, I think it doesn't hurt though.

Stefan

