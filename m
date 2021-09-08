Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C540382E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:48:48 +0200 (CEST)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv8H-0004nE-R4
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuVa-0006G2-11
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuVV-000687-Gc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631095720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k5F295WXLlrKd/qLig77SJqg7eePDGZTwyn14wH24fA=;
 b=Kdbd3Uynjg1Tcdr6nVfQVmfwkBQKqB3fT3C+1LffBGNFGggruHEXUXEowcZr+yS4VP3J4l
 WnZBNkVbLRGI0o/gx2xfvEOcXiHH8j/yHPR2WvsCe29hu8Tht5KNktS0rVYciV2krSbhTg
 2nyG47nbpQPGufqH3R8jW5wy88bBaZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-SPoTKrP6Nxy_pSvAec0U2Q-1; Wed, 08 Sep 2021 06:08:39 -0400
X-MC-Unique: SPoTKrP6Nxy_pSvAec0U2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A02D18D6A25;
 Wed,  8 Sep 2021 10:08:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20BDE1972E;
 Wed,  8 Sep 2021 10:08:33 +0000 (UTC)
Date: Wed, 8 Sep 2021 11:08:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 00/11] vfio-user server in QEMU
Message-ID: <YTiLocBXniFqW/gl@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jVu+3eSNhyMQQLXY"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jVu+3eSNhyMQQLXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:19PM -0400, Jagannathan Raman wrote:
> Hi,
>=20
> This series depends on the following series from
> Elena Ufimtseva <elena.ufimtseva@oracle.com>:
> [PATCH RFC v2 00/16] vfio-user implementation

Please send future revisions as separate email threads. Tools have
trouble separating your series from the one you replied to.

You can use "Based-on" to let CI know that Elena's series needs to be
applied first:

Based-on: <cover.1629131628.git.elena.ufimtseva@oracle.com>

--jVu+3eSNhyMQQLXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4i6AACgkQnKSrs4Gr
c8hVCgf/RIu0VCoElcXGsE0lba5+cvcPevYlg5aWLuZOye8GHBEKvHVxiKhAGhG4
ErR9t2CARZ2ftg04L8iiy/3b6BhuWctbAgI/XPy+Dr8ueJdNo+R+JUmAjpt+ztjL
eOW/HgfKPfS65Ok6sDkN975MJoMKdfJ9L7MvNPAsZup79s9egtpfk+sQom2CA9qC
BQfr3nxj0JfY1UbBWb2seoTwMl1UZO0q7JR6yDp9usEw9SXXnSsYVjRLdNIlsenJ
kkXW5cvazvxicsXj9a0EPq0PS79NLdgxmCaWdfjU+svF31CmJBBFiGaQxK9Pe2oJ
OI954Lr9UYwMbPeT9kBXaLTjCdSlag==
=/9QX
-----END PGP SIGNATURE-----

--jVu+3eSNhyMQQLXY--


