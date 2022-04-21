Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A01509F5A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:10:47 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVe2-0004dH-T0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVFx-0001F7-LX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhVFp-00089R-BJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650541544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYWch796phBOT9NSD7NbYAqgC/kRbg3xY3yiZDaFzR0=;
 b=XJl914w7AwWFhlx2KVosvNEDOjpu8IpJk1Ytt71II5ax0WyuqzeQrPNqnX22g4fzsvO9ne
 iuCc39NSDcK/4jjf/49nj04PWFR9B3KmDHYmTBnzQDnXF3IDDmIvIYZc5yDPRpHBZw/hoR
 D1+ovixIX/M/k66xIQ27fXh/l5ilE1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-68eA_yCcM7mlbb4g7ahfog-1; Thu, 21 Apr 2022 07:45:42 -0400
X-MC-Unique: 68eA_yCcM7mlbb4g7ahfog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D7311C0E0E1;
 Thu, 21 Apr 2022 11:45:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA8B4465167;
 Thu, 21 Apr 2022 11:45:41 +0000 (UTC)
Date: Thu, 21 Apr 2022 13:45:31 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Natalia Kuzmina <natalia.kuzmina@openvz.org>
Subject: Re: [PATCH 2/3] iotests: 314 test on duplicated clusters (parallels
 format)
Message-ID: <YmFD2zrVKRriVAhB@stefanha-x1.localdomain>
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
 <20220418110430.319911-3-natalia.kuzmina@openvz.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aQnjS+3Tn8WAreCi"
Content-Disposition: inline
In-Reply-To: <20220418110430.319911-3-natalia.kuzmina@openvz.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aQnjS+3Tn8WAreCi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2022 at 02:04:29PM +0300, Natalia Kuzmina wrote:
> Reading from duplicated offset and from original offset returns
> the same data. After repairing changing either of these
> blocks of data does not affect another one.
>=20
> Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
> ---
>  tests/qemu-iotests/314                        |  88 ++++++++++++++++++
>  tests/qemu-iotests/314.out                    |  36 +++++++
>  .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
>  3 files changed, 124 insertions(+)
>  create mode 100755 tests/qemu-iotests/314
>  create mode 100644 tests/qemu-iotests/314.out
>  create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicat=
ed-cluster.bz2

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aQnjS+3Tn8WAreCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhQ9sACgkQnKSrs4Gr
c8jAYAgAnNIhBazj1ZcvO1eqrtpZcOEMU0L1LXrXhkndRc9VxSAP3IGxgwQUala2
RIYJAhKlbARw6LZ2PwKJg1Ad4cdEOUo5+tml5vlaZ0xc1/wpOBj5R/rGDOuQrCiq
zSMNWWDv1wxHgWFPNcjFQIUakD7vDCDsqmdmShncs9SzofSAdY9gwa6+oTGvc/fK
Lx3aYJNxomBZLxLHclynO7aOO3Oa8wm2Pur25VANYRWx59ABbbn6ww1lC02NId4m
J2kWkgKkExKMhXrDaLj2EX3mnP3WMDSpq3ulglgEbiEJxeHf8NYrFiLREE/uMGiS
Ka6ooJmvvnc84rKGWvffOZnJq3s/Bw==
=X38E
-----END PGP SIGNATURE-----

--aQnjS+3Tn8WAreCi--


