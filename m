Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10C2A0739
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 14:58:20 +0100 (CET)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYUv5-0003SQ-B7
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kYUuD-0002xC-GD
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kYUuB-0005U6-Bf
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604066240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nFYSLspB0Siqd6lQ4wifFjhwrix1QK/8ynG1RojzmJg=;
 b=gAhv39HZizfHSriXOiPsf1LzW7tA8eygfm1dZddViKB7fdJ+DXnkvIw8wC9otnN1tlBGo/
 7DmK5OLcA/g1MuTs4RcfCC86A0vsrbwm1TFQzEnbcL1JUZEBPhQXBeOhTtavxLJVJgSFxN
 SxZ1VPAS89Hzf7JXys2psuGD69m3JAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-IrVZSDHqNwCD0gQxdhKXBA-1; Fri, 30 Oct 2020 09:57:18 -0400
X-MC-Unique: IrVZSDHqNwCD0gQxdhKXBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B2191019624;
 Fri, 30 Oct 2020 13:57:17 +0000 (UTC)
Received: from localhost (ovpn-113-41.ams2.redhat.com [10.36.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 098FD5D9D5;
 Fri, 30 Oct 2020 13:57:11 +0000 (UTC)
Date: Fri, 30 Oct 2020 13:57:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v2 24/25] block/nvme: Fix nvme_submit_command()
 on big-endian host
Message-ID: <20201030135710.GA330921@stefanha-x1.localdomain>
References: <20201029093306.1063879-1-philmd@redhat.com>
 <20201029093306.1063879-25-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201029093306.1063879-25-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 10:33:05AM +0100, Philippe Mathieu-Daud=E9 wrote:
> The Completion Queue Command Identifier is a 16-bit value,
> so nvme_submit_command() is unlikely to work on big-endian
> hosts, as the relevant bits are truncated.
> Fix by using the correct byte-swap function.
>=20
> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> Reported-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+cG7YACgkQnKSrs4Gr
c8iK4wf+Ih2QltOmFOseEJWdFe/+wb0X2uLcL5i88cHbpk9hO40DXiGb9gYOX6iH
JsmG4jQXLSAqubh4toGMRSf507kYhC9A46iFohXxKGuphbApne3PDk7Y846Ru5Qd
Actz7aLioyw0jQRkuBZ3ux1fCuM2qCIlOBQoiPAKe10VCARJkOTBTpcjKOoQBZV+
hHq9HNB3N59zi30IbmSPSq2pXrFzd/12dbrMnoc4pvp9WNfRy6vHwtVkhrqd8MJo
3H28CHg7qHWwnta3MIzj3tJyVhNaGG5+U0pgDbjFzqb0JngXB71gljCr21kPPSyS
EWN6X0GXuJ/FILd4M5b6kIYejZFCaA==
=dBrm
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--


