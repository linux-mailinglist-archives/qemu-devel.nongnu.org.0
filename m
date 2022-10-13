Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD65FE365
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:38:39 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4yT-0000X0-FR
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4pi-0007JG-LU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oj4pg-0001UY-Vk
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665692972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q19aUdfmJ0Mr3CWP4MiV2sMDDqODipY9I9GrK9VYev0=;
 b=P1sOHNCjod4pfB5gXV0cjA13ze5VVRwf0tchUm6A7suKK3kCLxV4N5znaffh4Le7rSevyb
 vCjNib3Ln3NY2mzCqMy7IKeX8+JcJ5ckUajXO/GouyjFOi0UvRb58hqtHE8Q2JJgH7h4Sr
 lMcdTv0bkUh6lvppxWUm+gMaFmCqTlM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-lnMb4LCpNTCevK4ycBXQpg-1; Thu, 13 Oct 2022 16:29:29 -0400
X-MC-Unique: lnMb4LCpNTCevK4ycBXQpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC7091C0BC66;
 Thu, 13 Oct 2022 20:29:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A84239D7C;
 Thu, 13 Oct 2022 20:29:27 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:29:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 0/7] Win32 patches
Message-ID: <Y0h1JoIQspY9AHhe@fedora>
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AmmotMImupSI2Vaa"
Content-Disposition: inline
In-Reply-To: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


--AmmotMImupSI2Vaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--AmmotMImupSI2Vaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNIdSYACgkQnKSrs4Gr
c8gAswf/S4DVA6FvyPRs+31tleAzRjdkJoQcszdHR2kEjAnwRkMAqTZBbyyQ/B2P
pSl4zPG7BCm43RLggWxj/q8YqqqhPOdtk/6IXquVtRVFgoBwH2xfG+ejPUVxqk/k
xIyeZbICehcNDGD3yxBj84Wy1xIsMPU6880jgCXbMf9VQZh90VwgpolR7XKdpd4Q
/EN+qi+u7yhaKooELRFavIrt3gp5xOQ4Fv3qmF5PLFkANN74XL+PXu+BU1zzzjp2
hl/MV3KaBsOh+X1U5x44A9nXs1E5qGU4UEZznSTGrJEq0qewKbNfW1Wm73V+rUdc
GBwFRDhqjUdE4G/cDuhfEG5iCbBXdA==
=cfMH
-----END PGP SIGNATURE-----

--AmmotMImupSI2Vaa--


