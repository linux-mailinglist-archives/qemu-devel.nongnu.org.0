Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101475A6701
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 17:11:58 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT2u6-0005AW-RL
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 11:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oT2nr-0002Rj-Oe; Tue, 30 Aug 2022 11:05:27 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oT2np-0005Jv-NE; Tue, 30 Aug 2022 11:05:23 -0400
Received: by mail-vk1-xa29.google.com with SMTP id g185so5369603vkb.13;
 Tue, 30 Aug 2022 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Kvs3abaUvqXRIrgEryHXsmU+am2+rRRVdubWx6DmSFo=;
 b=PufMqvVIFLnfGhYyDZ4N5gEy65PlOLYBC+sbGUs6Amk2SnnvmleKXNfOto3iZyJtWD
 6e5SDomt+ufX1JpB0jHr+SCJHJuGWNl91oGNr/4jpz0l8ca1gHeCAz2wOsn/uoLlx5r+
 Z1Y4fUux00Y4iR/D4g8Nn8Iitv0wb2NlS6seadbuXSXel3rCbTuauvaJBHj0iRFk4Vmq
 kZ522xX07OIm21jRhJYRVVgWrVv1mpks+wgQzUVqpj3vS3ul021qsn4NNvp2Istf0+Q6
 xbhGRkDJjCIIoKuRHhVnDsf/HjzNdABbxdyYkRd8Z5470o0w6m1vJ8BtygBKPJRPd1Jb
 Q2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Kvs3abaUvqXRIrgEryHXsmU+am2+rRRVdubWx6DmSFo=;
 b=J4auUtQ4LIfAJBgxfnWKUtn5CytzTwihQvDFYnNLqO0YZLeiCMSdHEToeWCyb4GIVp
 Ooz8jMG/ChGPrK2NKuw7zjlFN0DBjb2PxnDvozDG45ToUKcvByI5kArE24RxFirUOvuL
 fI0hVRRhEXnZoEBrX18pZKaM5SI1i/RHjS7PUgV8IPtj86gDs6cMozHprBodjxRKxmwx
 LSJuSKI5XR45vvR6ss9md1BRJ1+V9fm6WmAZ10GLlNHSsYo/gIhinF9BpfThD8v1UCSR
 i0TviCSrKlF4ZGDYdR3KQ5VexLfXa+QMLGgYW7NTBp3h9MsXs0yQPZoKqg+hTH8InBuS
 SI3w==
X-Gm-Message-State: ACgBeo1ee0veOdsN5Rl/VRq5PZXd/z+UAwEpd34q7U9cw/elzCb6Hgq7
 DsimLIvX5t9sfGsRY5zlauZAFR6BtjNzU7Ec7Vk=
X-Google-Smtp-Source: AA6agR6gDhZ8K6GNGysFXMwQufakQTigKCYLKClzrayOR9CZi1dgZDBApyX+jpTHBvIzNw1Ob1i7c3DohDzwBvrCWUE=
X-Received: by 2002:a05:6122:901:b0:393:d6c1:d3bc with SMTP id
 j1-20020a056122090100b00393d6c1d3bcmr4604562vka.15.1661871920009; Tue, 30 Aug
 2022 08:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
In-Reply-To: <87h71ugczz.fsf@pond.sub.org>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 30 Aug 2022 23:05:31 +0800
Message-ID: <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Sam Li <faithilikerun@gmail.com> writes:
>
> > By adding zone management operations in BlockDriver, storage controller
> > emulation can use the new block layer APIs including Report Zone and
> > four zone management operations (open, close, finish, reset).
> >
> > Add zoned storage commands of the device: zone_report(zrp), zone_open(z=
o),
> > zone_close(zc), zone_reset(zrs), zone_finish(zf).
> >
> > For example, to test zone_report, use following command:
> > $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D/=
dev/nullb0
> > -c "zrp offset nr_zones"
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
>
> [...]
>
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 0a8b4b426e..e3efba6db7 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
>
> [...]
>
> > @@ -3752,6 +4025,54 @@ static BlockDriver bdrv_host_device =3D {
> >  #endif
> >  };
> >
> > +#if defined(CONFIG_BLKZONED)
> > +static BlockDriver bdrv_zoned_host_device =3D {
> > +        .format_name =3D "zoned_host_device",
>
> Indentation should be 4, not 8.
>
> > +        .protocol_name =3D "zoned_host_device",
> > +        .instance_size =3D sizeof(BDRVRawState),
> > +        .bdrv_needs_filename =3D true,
> > +        .bdrv_probe_device  =3D hdev_probe_device,
> > +        .bdrv_file_open     =3D hdev_open,
> > +        .bdrv_close         =3D raw_close,
> > +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
> > +        .bdrv_reopen_commit  =3D raw_reopen_commit,
> > +        .bdrv_reopen_abort   =3D raw_reopen_abort,
> > +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> > +        .create_opts         =3D &bdrv_create_opts_simple,
> > +        .mutable_opts        =3D mutable_opts,
> > +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> > +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> > +
> > +        .bdrv_co_preadv         =3D raw_co_preadv,
> > +        .bdrv_co_pwritev        =3D raw_co_pwritev,
> > +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> > +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > +        .bdrv_refresh_limits =3D raw_refresh_limits,
> > +        .bdrv_io_plug =3D raw_aio_plug,
> > +        .bdrv_io_unplug =3D raw_aio_unplug,
> > +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > +
> > +        .bdrv_co_truncate       =3D raw_co_truncate,
> > +        .bdrv_getlength =3D raw_getlength,
> > +        .bdrv_get_info =3D raw_get_info,
> > +        .bdrv_get_allocated_file_size
> > +                            =3D raw_get_allocated_file_size,
> > +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> > +        .bdrv_check_perm =3D raw_check_perm,
> > +        .bdrv_set_perm   =3D raw_set_perm,
> > +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
> > +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> > +        .bdrv_probe_geometry =3D hdev_probe_geometry,
> > +        .bdrv_co_ioctl =3D hdev_co_ioctl,
> > +
> > +        /* zone management operations */
> > +        .bdrv_co_zone_report =3D raw_co_zone_report,
> > +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +};
>
> Differences to bdrv_host_device:
>
> * .bdrv_parse_filename is not set
>
> * .bdrv_co_ioctl is not set
>
> * .bdrv_co_zone_report and .bdrv_co_zone_mgmt are set

As Stefan mentioned, zoned_host_device is a new driver that doesn't
work with string filenames. .bdrv_parse_filename() helps legacy
drivers strip the optional protocol prefix off the filename and no use
here. Therefore it can be dropped.

.bdrv_co_ioctl is set actually.

Zoned_host_device is basically host_device + zone operations. It
serves for a simple purpose: if the host device is zoned, register
zoned_host_device driver; else, register host_device.

>
> Notably common is .bdrv_file_open =3D hdev_open.  What happens when you
> try to create a zoned_host_device where the @filename argument is not in
> fact a zoned device?

If the device is a regular block device, QEMU will still open the
device. For instance, I use a loopback device to test zone_report in
qemu-io. It returns ENOTTY which indicates Inappropriate ioctl for the
device. Meanwhile, if using a regular block device when emulation a
zoned device on a guest os, the best case is that the guest can boot
but has no emulated block device. In some cases, QEMU just terminates
because the block device has not met the alignment requirements.

>
> Do we really need a separate, but almost identical BlockDriver?  Could
> the existing one provide zoned functionality exactly when the underlying
> host device does?

I did use the existing one host device to add zoned commands at first.
But then, we decided to change that and use a separate BlockDriver.
Though the existing one can provide zoned functionality, a new
BlockDriver makes it clear when mixing block drivers, adding more
configurations/constraints, etc. For example, zoned devices must
enforce direct I/O instead of using page cache to ensure the order of
writes. It would be good to print a message for users when using
zoned_host_device without setting direct I/O.

However, it's still a simple version I was thinking about and can be
improved/changed afterward. Using host_device only is possible I think
but needs more carefully thinking.

Maybe Damien and Stefan can talk more about this?

>
> Forgive me if these are ignorant questions, or have been discussed
> before.

Always a pleasure.

>
> > +#endif
> > +
> >  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_ke=
rnel__)
> >  static void cdrom_parse_filename(const char *filename, QDict *options,
> >                                   Error **errp)
> > @@ -4012,6 +4333,9 @@ static void bdrv_file_init(void)
> >      bdrv_register(&bdrv_file);
> >  #if defined(HAVE_HOST_BLOCK_DEVICE)
> >      bdrv_register(&bdrv_host_device);
> > +#if defined(CONFIG_BLKZONED)
> > +    bdrv_register(&bdrv_zoned_host_device);
> > +#endif
> >  #ifdef __linux__
> >      bdrv_register(&bdrv_host_cdrom);
> >  #endif
>
> [...]
>
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 2173e7734a..c6bbb7a037 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -2942,6 +2942,7 @@
> >  # @compress: Since 5.0
> >  # @copy-before-write: Since 6.2
> >  # @snapshot-access: Since 7.0
> > +# @zoned_host_device: Since 7.2
> >  #
> >  # Since: 2.9
> >  ##
> > @@ -2955,7 +2956,8 @@
> >              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'para=
llels',
> >              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'r=
bd',
> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ]=
 }
> > +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> > +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ]=
 }
>
> QAPI naming conventions ask for 'zoned-host-device'.  We may choose to
> ignore them to stay closer to existing 'host_device'.

I am not sure why should ignore zoned_host_device. Can you be more specific=
?

>
> >
> >  ##
> >  # @BlockdevOptionsFile:
> > @@ -4329,7 +4331,9 @@
> >        'vhdx':       'BlockdevOptionsGenericFormat',
> >        'vmdk':       'BlockdevOptionsGenericCOWFormat',
> >        'vpc':        'BlockdevOptionsGenericFormat',
> > -      'vvfat':      'BlockdevOptionsVVFAT'
> > +      'vvfat':      'BlockdevOptionsVVFAT',
> > +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> > +                             'if': 'CONFIG_BLKZONED' }
> >    } }
> >
> >  ##
>
> [...]
>

