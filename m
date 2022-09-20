Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE75BD8D2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 02:37:38 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaRGb-0006dN-Et
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 20:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oaRF1-0004oE-8L; Mon, 19 Sep 2022 20:35:59 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oaREz-0005lU-84; Mon, 19 Sep 2022 20:35:58 -0400
Received: by mail-vs1-xe34.google.com with SMTP id o123so1409659vsc.3;
 Mon, 19 Sep 2022 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=lzxP1zIvynt+fFHL2L4x/3Uxw5Z/m9NOiKyn9w7E6/Q=;
 b=Gr8cELSoYCmID1EjfJUNkpjsXxRTrGW0d8HJ1nipHKGua9KNbB7jPaOwgxinMpg6Wm
 vMVwi5GelA1vvHAWTIgA97Kz8MPANWyJpdQ5NcWoRUBsSVnTcnRBIzPYeT/cZ/NzMbIh
 yvkgJ5OEz31AKZg1Xg53/bWwwAXNzLndnnmQaJyxvsAP7S2ADCcHHautPxEFu7OdXn5C
 hTfWcgRkD3SpVb8KK3gBSl0HXcJ/qNC3PFJyyVId3TwZxIhdd8VgvdjxUD0ZEpKMnHGh
 omFy82dpXVnATVwHVr4lD3Mzy/blHXVwPsQLe36yGgYVTmb+wEfik8SW3aPtJFVxCgwY
 MfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lzxP1zIvynt+fFHL2L4x/3Uxw5Z/m9NOiKyn9w7E6/Q=;
 b=hRrnxOykRgtzlcvvRK0GEqjPwqytxGyuw9TGb5kweN6hqN1JqF9y6L0+qRydae3an9
 S1o0BWiyGZZfln0nl7PXzlgXZq/Mtzf4ZzMMoD16vp+NTI2wNSNBSnnHMNUtRyX9tUQc
 wCwP2CG6bLHUdWk24OaEhyyHyDTDMSVSkC6z1mjPDi0F8BfXb1SPeECPg1z7E5zioB8m
 0M8fE544oe7qF0wmtw1gofkZLozHd3X/+G6hAlVPnXD5dCUsaRBX3OJN2SqLAiGQRdAP
 tJ5G5C5lQOT1fhhgsOyDZnxeA0RqI6CmHZEbjPWpzpLTagNJ79vPWfM0z0A6amBcSJAe
 1Bag==
X-Gm-Message-State: ACrzQf27MQoWDcj0YAlTBGXSnCMGOJisEcDv4PbOzmcaVjPr70NFKHPC
 PVmu8/q8+wckTjnaaoB92uw7fja+9CYG46J6LIRBBa/eVIA=
X-Google-Smtp-Source: AMsMyM78eaUk5grrIEamzRnyXlpm87WXsLaAeFB/TYMQWcuevgaM5Bm2hiAt2Aj9N0TdZweEqwgzvAgPeK0/bUOZpe8=
X-Received: by 2002:a05:6102:3c9d:b0:398:7d74:157e with SMTP id
 c29-20020a0561023c9d00b003987d74157emr6869709vsv.71.1663634155722; Mon, 19
 Sep 2022 17:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220910065057.35017-1-faithilikerun@gmail.com>
 <YyjKLVKZq4oQHs+F@fedora>
In-Reply-To: <YyjKLVKZq4oQHs+F@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 20 Sep 2022 08:36:08 +0800
Message-ID: <CAAAx-8KE9FjzVuebQF2TTGK3z=+nozoPkFU_KUZ3QBU5hxV-MQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] include: import virtio_blk headers from linux with
 zoned device support
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe34.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=BA=8C 03:59=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Sep 10, 2022 at 02:50:56PM +0800, Sam Li wrote:
> > Add file from Dmitry's "virtio-blk:add support for zoned block devices"
> > linux patch using scripts/update-linux-headers.sh. There is a link for
> > more information: https://github.com/dmitry-fomichev/virtblk-zbd
>
> Hi Sam,
> Linux headers are imported into QEMU using
> scripts/update-linux-headers.sh. Did you import the header using this
> script?
>
> If yes, please mention it in the commit description. If not, please do
> so in the next revision.

Yes, I'll change the commit description to "include: update virtio-blk
header from Linux 5.19-rc2+".

>
> Thanks,
> Stefan
>
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  include/standard-headers/linux/virtio_blk.h | 109 ++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >
> > diff --git a/include/standard-headers/linux/virtio_blk.h b/include/stan=
dard-headers/linux/virtio_blk.h
> > index 2dcc90826a..490bd21c76 100644
> > --- a/include/standard-headers/linux/virtio_blk.h
> > +++ b/include/standard-headers/linux/virtio_blk.h
> > @@ -40,6 +40,7 @@
> >  #define VIRTIO_BLK_F_MQ              12      /* support more than one =
vq */
> >  #define VIRTIO_BLK_F_DISCARD 13      /* DISCARD is supported */
> >  #define VIRTIO_BLK_F_WRITE_ZEROES    14      /* WRITE ZEROES is suppor=
ted */
> > +#define VIRTIO_BLK_F_ZONED           17      /* Zoned block device */
> >
> >  /* Legacy feature bits */
> >  #ifndef VIRTIO_BLK_NO_LEGACY
> > @@ -119,6 +120,20 @@ struct virtio_blk_config {
> >       uint8_t write_zeroes_may_unmap;
> >
> >       uint8_t unused1[3];
> > +
> > +     /* Secure erase fields that are defined in the virtio spec */
> > +     uint8_t sec_erase[12];
> > +
> > +     /* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
> > +     struct virtio_blk_zoned_characteristics {
> > +             __virtio32 zone_sectors;
> > +             __virtio32 max_open_zones;
> > +             __virtio32 max_active_zones;
> > +             __virtio32 max_append_sectors;
> > +             __virtio32 write_granularity;
> > +             uint8_t model;
> > +             uint8_t unused2[3];
> > +     } zoned;
> >  } QEMU_PACKED;
> >
> >  /*
> > @@ -153,6 +168,27 @@ struct virtio_blk_config {
> >  /* Write zeroes command */
> >  #define VIRTIO_BLK_T_WRITE_ZEROES    13
> >
> > +/* Zone append command */
> > +#define VIRTIO_BLK_T_ZONE_APPEND    15
> > +
> > +/* Report zones command */
> > +#define VIRTIO_BLK_T_ZONE_REPORT    16
> > +
> > +/* Open zone command */
> > +#define VIRTIO_BLK_T_ZONE_OPEN      18
> > +
> > +/* Close zone command */
> > +#define VIRTIO_BLK_T_ZONE_CLOSE     20
> > +
> > +/* Finish zone command */
> > +#define VIRTIO_BLK_T_ZONE_FINISH    22
> > +
> > +/* Reset zone command */
> > +#define VIRTIO_BLK_T_ZONE_RESET     24
> > +
> > +/* Reset All zones command */
> > +#define VIRTIO_BLK_T_ZONE_RESET_ALL 26
> > +
> >  #ifndef VIRTIO_BLK_NO_LEGACY
> >  /* Barrier before this op. */
> >  #define VIRTIO_BLK_T_BARRIER 0x80000000
> > @@ -172,6 +208,72 @@ struct virtio_blk_outhdr {
> >       __virtio64 sector;
> >  };
> >
> > +/*
> > + * Supported zoned device models.
> > + */
> > +
> > +/* Regular block device */
> > +#define VIRTIO_BLK_Z_NONE      0
> > +/* Host-managed zoned device */
> > +#define VIRTIO_BLK_Z_HM        1
> > +/* Host-aware zoned device */
> > +#define VIRTIO_BLK_Z_HA        2
> > +
> > +/*
> > + * Zone descriptor. A part of VIRTIO_BLK_T_ZONE_REPORT command reply.
> > + */
> > +struct virtio_blk_zone_descriptor {
> > +     /* Zone capacity */
> > +     __virtio64 z_cap;
> > +     /* The starting sector of the zone */
> > +     __virtio64 z_start;
> > +     /* Zone write pointer position in sectors */
> > +     __virtio64 z_wp;
> > +     /* Zone type */
> > +     uint8_t z_type;
> > +     /* Zone state */
> > +     uint8_t z_state;
> > +     uint8_t reserved[38];
> > +};
> > +
> > +struct virtio_blk_zone_report {
> > +     __virtio64 nr_zones;
> > +     uint8_t reserved[56];
> > +     struct virtio_blk_zone_descriptor zones[];
> > +};
> > +
> > +/*
> > + * Supported zone types.
> > + */
> > +
> > +/* Conventional zone */
> > +#define VIRTIO_BLK_ZT_CONV         1
> > +/* Sequential Write Required zone */
> > +#define VIRTIO_BLK_ZT_SWR          2
> > +/* Sequential Write Preferred zone */
> > +#define VIRTIO_BLK_ZT_SWP          3
> > +
> > +/*
> > + * Zone states that are available for zones of all types.
> > + */
> > +
> > +/* Not a write pointer (conventional zones only) */
> > +#define VIRTIO_BLK_ZS_NOT_WP       0
> > +/* Empty */
> > +#define VIRTIO_BLK_ZS_EMPTY        1
> > +/* Implicitly Open */
> > +#define VIRTIO_BLK_ZS_IOPEN        2
> > +/* Explicitly Open */
> > +#define VIRTIO_BLK_ZS_EOPEN        3
> > +/* Closed */
> > +#define VIRTIO_BLK_ZS_CLOSED       4
> > +/* Read-Only */
> > +#define VIRTIO_BLK_ZS_RDONLY       13
> > +/* Full */
> > +#define VIRTIO_BLK_ZS_FULL         14
> > +/* Offline */
> > +#define VIRTIO_BLK_ZS_OFFLINE      15
> > +
> >  /* Unmap this range (only valid for write zeroes command) */
> >  #define VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP   0x00000001
> >
> > @@ -198,4 +300,11 @@ struct virtio_scsi_inhdr {
> >  #define VIRTIO_BLK_S_OK              0
> >  #define VIRTIO_BLK_S_IOERR   1
> >  #define VIRTIO_BLK_S_UNSUPP  2
> > +
> > +/* Error codes that are specific to zoned block devices */
> > +#define VIRTIO_BLK_S_ZONE_INVALID_CMD     3
> > +#define VIRTIO_BLK_S_ZONE_UNALIGNED_WP    4
> > +#define VIRTIO_BLK_S_ZONE_OPEN_RESOURCE   5
> > +#define VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE 6
> > +
> >  #endif /* _LINUX_VIRTIO_BLK_H */
> > --
> > 2.37.3
> >

