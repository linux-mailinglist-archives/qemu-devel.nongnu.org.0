Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46320B170
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 14:36:44 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jonb1-0006L9-MG
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 08:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jonWW-0002LK-F7
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:32:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jonWU-0005kG-20
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593174721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s67lcN+4wxs+t6ikrBJs43qGW+BTZVmBv54GSLslqbo=;
 b=HthnpFYDJlWMyRkTuPHsW+pjiuFS84dmVKiOfw7UupuRxfEBEGA/onFG2GrQ/uXLSVARK/
 3I6d3EaplSWG3SYMEuRQ9ThRKkMPaIL7tIoFBvRoydawU8beoBCb7mtx9RbwDoG0145iZ4
 Cr+ANoTCbblFuvqWgfXSbJuygWZw9Ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-_9rC2urtMyK2lduirgSlXg-1; Fri, 26 Jun 2020 08:31:59 -0400
X-MC-Unique: _9rC2urtMyK2lduirgSlXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8BC804012;
 Fri, 26 Jun 2020 12:31:58 +0000 (UTC)
Received: from localhost (ovpn-114-181.ams2.redhat.com [10.36.114.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6F7211CC34;
 Fri, 26 Jun 2020 12:31:57 +0000 (UTC)
Date: Fri, 26 Jun 2020 13:31:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 11/17] block/nvme: Simplify nvme_create_queue_pair()
 arguments
Message-ID: <20200626123156.GR281902@stefanha-x1.localdomain>
References: <20200625184838.28172-1-philmd@redhat.com>
 <20200625184838.28172-12-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200625184838.28172-12-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nQUlLD2FJeKEtFpv"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nQUlLD2FJeKEtFpv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 08:48:32PM +0200, Philippe Mathieu-Daud=E9 wrote:
> nvme_create_queue_pair() doesn't require BlockDriverState anymore.
> Replace it by BDRVNVMeState to simplify.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  block/nvme.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--nQUlLD2FJeKEtFpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl716rwACgkQnKSrs4Gr
c8ihWgf9GVVxlKyxeE+QquIusKp5qfwlVXI7UujJs6kNSRMMx56FXpbyVDUzWJho
s1gIKFsUZLFlQd73mMJxOSAj+w7Bt3fIl+1nYem6aM+7+3RxJwrdcB6HarJq3Hjj
K3cP4qPkcD/t12SNS7/VZfmeFNb2wqipuKnpWFShwZc9J0qrK2X7bZCZKr2tFT6n
G9TwuRHUG8LlRYAE5ZQv1N5SefL6vnQK/XGeHB8LZ68DAUvMJE+wBnCgyA9ij4YK
ONsg+OLCMktnLJp1gkCY508cjbBLumlzLLqLo0atg4Zz/TpaIk0L+qBn6+cvvQSg
kO/vs4444CeH7+83wWQe81WQyIHxsA==
=YOEm
-----END PGP SIGNATURE-----

--nQUlLD2FJeKEtFpv--


