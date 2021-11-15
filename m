Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C701F4506EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:30:37 +0100 (CET)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd0G-0001Fa-Cp
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmcxL-0005hA-W0
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmcxG-00040N-Sa
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636986450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rwa8RTuNXfPJhYPxP4VjbDxqNnSNcMgVJ3DU/uKxQIQ=;
 b=CP81Ql/S0lrUwliBnTmLorMMLPpX8oufSLGSCV+m7UEpl4YpqaAw6BtSCKYftmWJOIKvqw
 quTOvGtPCOR7h6KroVM3Zh5Q/8oVYKv7WRomkcnCfobKoXvUVoM+CsSLEbSa3FgFOmifsK
 o+t5wPnr72BBGua75hF71vsU7yxzBPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-oY8h1UqgMZCVJeSvzR9uxw-1; Mon, 15 Nov 2021 09:27:27 -0500
X-MC-Unique: oY8h1UqgMZCVJeSvzR9uxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73BA802C8F;
 Mon, 15 Nov 2021 14:27:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6630860C9F;
 Mon, 15 Nov 2021 14:26:34 +0000 (UTC)
Date: Mon, 15 Nov 2021 14:26:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: yadong.qi@intel.com
Subject: Re: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Message-ID: <YZJuGbB7/5tqowm7@stefanha-x1.localdomain>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211115045200.3567293-3-yadong.qi@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tNOXy7wigMN5r1jR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org, mst@redhat.com,
 luhai.chen@intel.com, qemu-devel@nongnu.org, kai.z.wang@intel.com,
 hreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tNOXy7wigMN5r1jR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 12:52:00PM +0800, yadong.qi@intel.com wrote:

The Linux block layer shares the DISCARD queue limits with SECDISCARD.
That's different from BLKZEROOUT (QEMU's WRITE_ZEROES). This is a Linux
implementation detail but I guess virtio-blk can share the DISCARD
limits with SECDISCARD too...

> @@ -622,6 +628,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *=
req, MultiReqBuffer *mrb)
>      unsigned out_num =3D req->elem.out_num;
>      VirtIOBlock *s =3D req->dev;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    bool is_secdiscard =3D false;
> =20
>      if (req->elem.out_num < 1 || req->elem.in_num < 1) {
>          virtio_error(vdev, "virtio-blk missing headers");
> @@ -722,6 +729,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq *=
req, MultiReqBuffer *mrb)
>       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch stat=
ement,
>       * so we must mask it for these requests, then we will check if it i=
s set.
>       */
> +    case VIRTIO_BLK_T_SECDISCARD & ~VIRTIO_BLK_T_OUT:
> +        is_secdiscard =3D true;
> +        __attribute__((fallthrough));

The DISCARD case doesn't use __attribute__((fallthrough)) so this is
inconsistent. QEMU doesn't use __attribute__((fallthrough)) so I suggest
dropping this.

> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standa=
rd-headers/linux/virtio_blk.h
> index 2dcc90826a..c55a07840c 100644
> --- a/include/standard-headers/linux/virtio_blk.h
> +++ b/include/standard-headers/linux/virtio_blk.h
> @@ -40,6 +40,7 @@
>  #define VIRTIO_BLK_F_MQ=09=0912=09/* support more than one vq */
>  #define VIRTIO_BLK_F_DISCARD=0913=09/* DISCARD is supported */
>  #define VIRTIO_BLK_F_WRITE_ZEROES=0914=09/* WRITE ZEROES is supported */
> +#define VIRTIO_BLK_F_SECDISCARD=0915=09/* WRITE ZEROES is supported */

The comment is copy-pasted from WRITE_ZEROES.

--tNOXy7wigMN5r1jR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGSbhkACgkQnKSrs4Gr
c8ixrAf/WONPrhKN3A0VEYvN3iGsmKehCF40AjVUi1GLUhjSrwlUF4wV9E7em+WD
En6l9StBl+gx/yPyy2+ePdDHCkffiP7tUl0Y5hH7MTxerDO1rHKssltJ6JKHJ+nI
zhCs5AnDkyJfZYaMgTKxDAnVVHg6ZbstwOJeidv+bfsCDlebBqZVwtXeFAboT3a6
MPqfMKbFC6ZjIDWefa+puatulHgaEsQTQ6QXtyL/fMeKQGwOCk0xFmyszjpW9/Ph
PvrA32xa6ajKJzaK4mV4jMiDs3G5rtatwZ9zMfkua15rjpxrcIAITLfFp9P2W22A
SwhmfIiUJViKITfR7+FWCmYMPjZGiA==
=umom
-----END PGP SIGNATURE-----

--tNOXy7wigMN5r1jR--


