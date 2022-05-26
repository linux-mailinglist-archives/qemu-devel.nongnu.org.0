Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F4534C8F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:34:12 +0200 (CEST)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9si-0002Ro-2s
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9NV-0002Vy-8A
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9NQ-0006yT-5X
 for qemu-devel@nongnu.org; Thu, 26 May 2022 05:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OlfKhKxDa0LPP9IquJEHgIxy2MgceTbW+NUiwfWT3Bc=;
 b=LrZLVnTkWxfwtQisBnuxSoQyhjdhshOCsdd5s+IRoIgnLnYvqPOuMNxtc3PE29o8USmvEY
 mE6ZOlM4OjPD6Mocl5Fz0kkuNM3VlM5RB0nbMRmOC2Q8oXpBsoDS7j9hUP+N/4FNxFjEEW
 qs9C/vtxH2Wk51e928XEJibPkyjoQIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-AQrI75uHP4eoOg32kn4Hjg-1; Thu, 26 May 2022 05:01:47 -0400
X-MC-Unique: AQrI75uHP4eoOg32kn4Hjg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 648D43810D3D;
 Thu, 26 May 2022 09:01:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED225400F36;
 Thu, 26 May 2022 09:01:46 +0000 (UTC)
Date: Thu, 26 May 2022 10:01:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>
Subject: Re: [PATCH v3 10/10] block/qcow2: Use bdrv_pwrite_sync() in
 qcow2_mark_dirty()
Message-ID: <Yo9B+eVze1zogP5A@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-11-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9XqiHZ8381gj7+xb"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-11-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--9XqiHZ8381gj7+xb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:40PM +0100, Alberto Faria wrote:
> Use bdrv_pwrite_sync() instead of calling bdrv_pwrite() and bdrv_flush()
> separately.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/qcow2.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9XqiHZ8381gj7+xb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPQfkACgkQnKSrs4Gr
c8jw/gf9G84yDRCxJ1G07itQQheiWZcmnJUEewHmMIxtFnrEg5bQxQx+Y5haJ0OX
yLLnrrrM0Pe5aes8e57D68q4GMgRwmex1ZFIeB31JDgg2TF9G7Q0skAcS0cvTHHL
jE/l15kWV9ej9xxED8bSNnezgbbzqV0ltNUlZsFxhRfI1S+Wuz3tNp7ui/c9Oyl7
IF9l0HLHj8iJifzx01OYrGzDD6BF2R6LpOQ9wLEG+vm0vCr6fMkosEzTndDtKlG3
BFkTRmlBQCTYxrBDEPZuQ9vtp4g0niD7wAiRqN6p6U/JGz5XxgwYpLANHOVHyhc7
Q1Xt1SijJU8X1BR7uIiLhNPQZwoOxw==
=5/as
-----END PGP SIGNATURE-----

--9XqiHZ8381gj7+xb--


