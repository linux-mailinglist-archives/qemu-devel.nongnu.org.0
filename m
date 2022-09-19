Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAD35BD584
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 22:06:29 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaN2B-000661-DI
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 16:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaMvy-0002ap-2v
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 16:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaMvt-00038U-WE
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663617592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHF28lT+DWfhsp873W3x63w80f0BoLNFJtaCJf1ebWo=;
 b=Cgtybl4BRkyHMTtv1dsvuc8dT11whr0hSfW4/GU7/BR88m8HFYWKS7fJ+T6olR1rUE7i8Z
 lwNOSs5hFnXcPXPwsUKyHqdW37+TveQbgWbB+F4lPSCY5u0ldSVeAX8+xagioP/+6Tp2g7
 fOFw5Zf2PS7KOYC/MJ3YcYW7bSnz6Xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-XLg8shlePsiqlSMQejOcqA-1; Mon, 19 Sep 2022 15:59:48 -0400
X-MC-Unique: XLg8shlePsiqlSMQejOcqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2ED185A78B;
 Mon, 19 Sep 2022 19:59:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E55C15995;
 Mon, 19 Sep 2022 19:59:46 +0000 (UTC)
Date: Mon, 19 Sep 2022 15:59:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com
Subject: Re: [PATCH 1/2] include: import virtio_blk headers from linux with
 zoned device support
Message-ID: <YyjKLVKZq4oQHs+F@fedora>
References: <20220910065057.35017-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A4FlZ/20flqzoRtU"
Content-Disposition: inline
In-Reply-To: <20220910065057.35017-1-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--A4FlZ/20flqzoRtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2022 at 02:50:56PM +0800, Sam Li wrote:
> Add file from Dmitry's "virtio-blk:add support for zoned block devices"
> linux patch using scripts/update-linux-headers.sh. There is a link for
> more information: https://github.com/dmitry-fomichev/virtblk-zbd

Hi Sam,
Linux headers are imported into QEMU using
scripts/update-linux-headers.sh. Did you import the header using this
script?

If yes, please mention it in the commit description. If not, please do
so in the next revision.

Thanks,
Stefan

>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  include/standard-headers/linux/virtio_blk.h | 109 ++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>=20
> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standa=
rd-headers/linux/virtio_blk.h
> index 2dcc90826a..490bd21c76 100644
> --- a/include/standard-headers/linux/virtio_blk.h
> +++ b/include/standard-headers/linux/virtio_blk.h
> @@ -40,6 +40,7 @@
>  #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
>  #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
>  #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
> +#define VIRTIO_BLK_F_ZONED		17	/* Zoned block device */
> =20
>  /* Legacy feature bits */
>  #ifndef VIRTIO_BLK_NO_LEGACY
> @@ -119,6 +120,20 @@ struct virtio_blk_config {
>  	uint8_t write_zeroes_may_unmap;
> =20
>  	uint8_t unused1[3];
> +
> +	/* Secure erase fields that are defined in the virtio spec */
> +	uint8_t sec_erase[12];
> +
> +	/* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
> +	struct virtio_blk_zoned_characteristics {
> +		__virtio32 zone_sectors;
> +		__virtio32 max_open_zones;
> +		__virtio32 max_active_zones;
> +		__virtio32 max_append_sectors;
> +		__virtio32 write_granularity;
> +		uint8_t model;
> +		uint8_t unused2[3];
> +	} zoned;
>  } QEMU_PACKED;
> =20
>  /*
> @@ -153,6 +168,27 @@ struct virtio_blk_config {
>  /* Write zeroes command */
>  #define VIRTIO_BLK_T_WRITE_ZEROES	13
> =20
> +/* Zone append command */
> +#define VIRTIO_BLK_T_ZONE_APPEND    15
> +
> +/* Report zones command */
> +#define VIRTIO_BLK_T_ZONE_REPORT    16
> +
> +/* Open zone command */
> +#define VIRTIO_BLK_T_ZONE_OPEN      18
> +
> +/* Close zone command */
> +#define VIRTIO_BLK_T_ZONE_CLOSE     20
> +
> +/* Finish zone command */
> +#define VIRTIO_BLK_T_ZONE_FINISH    22
> +
> +/* Reset zone command */
> +#define VIRTIO_BLK_T_ZONE_RESET     24
> +
> +/* Reset All zones command */
> +#define VIRTIO_BLK_T_ZONE_RESET_ALL 26
> +
>  #ifndef VIRTIO_BLK_NO_LEGACY
>  /* Barrier before this op. */
>  #define VIRTIO_BLK_T_BARRIER	0x80000000
> @@ -172,6 +208,72 @@ struct virtio_blk_outhdr {
>  	__virtio64 sector;
>  };
> =20
> +/*
> + * Supported zoned device models.
> + */
> +
> +/* Regular block device */
> +#define VIRTIO_BLK_Z_NONE      0
> +/* Host-managed zoned device */
> +#define VIRTIO_BLK_Z_HM        1
> +/* Host-aware zoned device */
> +#define VIRTIO_BLK_Z_HA        2
> +
> +/*
> + * Zone descriptor. A part of VIRTIO_BLK_T_ZONE_REPORT command reply.
> + */
> +struct virtio_blk_zone_descriptor {
> +	/* Zone capacity */
> +	__virtio64 z_cap;
> +	/* The starting sector of the zone */
> +	__virtio64 z_start;
> +	/* Zone write pointer position in sectors */
> +	__virtio64 z_wp;
> +	/* Zone type */
> +	uint8_t z_type;
> +	/* Zone state */
> +	uint8_t z_state;
> +	uint8_t reserved[38];
> +};
> +
> +struct virtio_blk_zone_report {
> +	__virtio64 nr_zones;
> +	uint8_t reserved[56];
> +	struct virtio_blk_zone_descriptor zones[];
> +};
> +
> +/*
> + * Supported zone types.
> + */
> +
> +/* Conventional zone */
> +#define VIRTIO_BLK_ZT_CONV         1
> +/* Sequential Write Required zone */
> +#define VIRTIO_BLK_ZT_SWR          2
> +/* Sequential Write Preferred zone */
> +#define VIRTIO_BLK_ZT_SWP          3
> +
> +/*
> + * Zone states that are available for zones of all types.
> + */
> +
> +/* Not a write pointer (conventional zones only) */
> +#define VIRTIO_BLK_ZS_NOT_WP       0
> +/* Empty */
> +#define VIRTIO_BLK_ZS_EMPTY        1
> +/* Implicitly Open */
> +#define VIRTIO_BLK_ZS_IOPEN        2
> +/* Explicitly Open */
> +#define VIRTIO_BLK_ZS_EOPEN        3
> +/* Closed */
> +#define VIRTIO_BLK_ZS_CLOSED       4
> +/* Read-Only */
> +#define VIRTIO_BLK_ZS_RDONLY       13
> +/* Full */
> +#define VIRTIO_BLK_ZS_FULL         14
> +/* Offline */
> +#define VIRTIO_BLK_ZS_OFFLINE      15
> +
>  /* Unmap this range (only valid for write zeroes command) */
>  #define VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP	0x00000001
> =20
> @@ -198,4 +300,11 @@ struct virtio_scsi_inhdr {
>  #define VIRTIO_BLK_S_OK		0
>  #define VIRTIO_BLK_S_IOERR	1
>  #define VIRTIO_BLK_S_UNSUPP	2
> +
> +/* Error codes that are specific to zoned block devices */
> +#define VIRTIO_BLK_S_ZONE_INVALID_CMD     3
> +#define VIRTIO_BLK_S_ZONE_UNALIGNED_WP    4
> +#define VIRTIO_BLK_S_ZONE_OPEN_RESOURCE   5
> +#define VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE 6
> +
>  #endif /* _LINUX_VIRTIO_BLK_H */
> --=20
> 2.37.3
>=20

--A4FlZ/20flqzoRtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMoyi0ACgkQnKSrs4Gr
c8jnjAf/RV7hVw7GS7u3uAY5A9vauBOJDPzfb3SO5o7axXCW9bcq8009PptGMai+
+Y5ivWXRIwvDuj1tZhqo9d/TfZ9W2G7dfnXi++UpdnuP403AcWijwu+5sA+DBskd
byeoAInpH6JS7jPCX77DZs+YtbWKvRNpUQtCpmqyvwynno8DLLUoz95hwk3tHmgk
Z91xufisb4RSESYlTFKWtl//P39fMBrGqrpvNgQut1a0sgR2AtVEl+roNPZJM/FA
rKCogtVsIIs9SPjMQ4cB0qF/x/r5RbhA9OlvW1WlEYlP4s50G5y5rCa/5jcJ+tX7
NpzA/r21i8o3EZmwkG7JIZJ2NYp7MA==
=phNl
-----END PGP SIGNATURE-----

--A4FlZ/20flqzoRtU--


