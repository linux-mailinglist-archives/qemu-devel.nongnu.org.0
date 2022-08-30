Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3C5A674B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 17:24:44 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT36Y-0003uS-Qr
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 11:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oT30v-0000E5-TL; Tue, 30 Aug 2022 11:18:53 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:41785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oT30u-0007SY-CK; Tue, 30 Aug 2022 11:18:53 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id k2so11801325vsk.8;
 Tue, 30 Aug 2022 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=LUG4rL4bIcSiU0bkykcXV8CaqlavRaeQbZ28aYUWypo=;
 b=FZanKKMq4SG/0J9no98wGyoQkNSPrWt70W76z5JRTh6A7N5+5Az/1YkuKhD3MJPpYU
 nwfKiLU8Xj4OjgaD3sgi2detsQvqGSt4WClpmCXQjovSWJQepKXuscILBjL8mXLI8cSY
 0hPqMCazE+v8ICSHLpk5X3MkOuHdxmOiVvFT3IdYzmPlzxTOgdHRLiTcnvFmWAajqDsc
 X5sbgGahZYX8xysSMbUYl7Tg89IHfo8e9SxY/secZpuKQGfkiyWNFxaMasjBkTS5hOoa
 lWxfbGCKTWGSoUu/xoLID8ur15KrYVfLRiWFyeS2sl6DyVk9ATmcEnpcrYorOQmK8nUY
 52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=LUG4rL4bIcSiU0bkykcXV8CaqlavRaeQbZ28aYUWypo=;
 b=s36/T+lsnUUTeAFqVHIszEITv8bh/Gz/TtC92mQFUJatHEpNgqi3L3aOgb955voLPF
 KSEyuBC7sPRzFbFrNbvqYSP2bMtYwGfpcTtEVzwaZul8niNRr3YJgqyzEc6AnZ/EpQxN
 RDssylDT46FeQUv+knv0HJsx+8xKVkrULgrY6G6A/HTJqNBPw6yEraIinRulioSVx9Ez
 tjcT7U//iqJ0dCZ1gUyJF15loWDbC0ZnZ0ZyUcDETo4zs4s7HJaaf6WA7TtrcKLSERnp
 AumlxHbv2TLsIZWyvj8fEnJAAHtoSYBzmQInnwwfJkju1s56fAWFEgu058R5/DICinlB
 Indw==
X-Gm-Message-State: ACgBeo1mUmP5JwgqgPQOUG22pHf8PU+vvUoQsKI9GsZbu2F8iWmR4zY1
 nk3LMFsTtk5lz1saXdkZfXR9vEZURVEZqX8R04w=
X-Google-Smtp-Source: AA6agR6PWsun4k0RdgnZ1aNlCnZvegt8VsSXDBrmNKY1g5NfsO7LrncUiteBxubUyBM+VD4D8hevgC3uHQcq2JPX+dM=
X-Received: by 2002:a67:e207:0:b0:390:f3f6:a2fc with SMTP id
 g7-20020a67e207000000b00390f3f6a2fcmr2096046vsa.42.1661872730953; Tue, 30 Aug
 2022 08:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
 <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
 <8735ddg44k.fsf@pond.sub.org>
In-Reply-To: <8735ddg44k.fsf@pond.sub.org>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 30 Aug 2022 23:19:03 +0800
Message-ID: <CAAAx-8+Oh_qf_g_pOP9fZg3oMOKYvriJw1whPfvMMqHR7-h=rQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe2b.google.com
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
=97=A5=E5=91=A8=E4=BA=8C 23:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Sam Li <faithilikerun@gmail.com> writes:
>
> > Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=883=
0=E6=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Sam Li <faithilikerun@gmail.com> writes:
> >>
> >> > By adding zone management operations in BlockDriver, storage control=
ler
> >> > emulation can use the new block layer APIs including Report Zone and
> >> > four zone management operations (open, close, finish, reset).
> >> >
> >> > Add zoned storage commands of the device: zone_report(zrp), zone_ope=
n(zo),
> >> > zone_close(zc), zone_reset(zrs), zone_finish(zf).
> >> >
> >> > For example, to test zone_report, use following command:
> >> > $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=
=3D/dev/nullb0
> >> > -c "zrp offset nr_zones"
> >> >
> >> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> >> > Reviewed-by: Hannes Reinecke <hare@suse.de>
>
> [...]
>
> >> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> >> > index 2173e7734a..c6bbb7a037 100644
> >> > --- a/qapi/block-core.json
> >> > +++ b/qapi/block-core.json
> >> > @@ -2942,6 +2942,7 @@
> >> >  # @compress: Since 5.0
> >> >  # @copy-before-write: Since 6.2
> >> >  # @snapshot-access: Since 7.0
> >> > +# @zoned_host_device: Since 7.2
> >> >  #
> >> >  # Since: 2.9
> >> >  ##
> >> > @@ -2955,7 +2956,8 @@
> >> >              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'p=
arallels',
> >> >              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw',=
 'rbd',
> >> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> >> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat=
' ] }
> >> > +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat=
',
> >> > +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' =
} ] }
> >>
> >> QAPI naming conventions ask for 'zoned-host-device'.  We may choose to
> >> ignore them to stay closer to existing 'host_device'.
> >
> > I am not sure why should ignore zoned_host_device. Can you be more spec=
ific?
>
> "them" =3D QAPI naming conventions.  Clear now?

Ok, I thought "them" means 'zoned_host_device'.

>
> [...]
>

