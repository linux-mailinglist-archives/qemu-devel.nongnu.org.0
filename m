Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC9420EC6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:26:49 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNzU-0001KT-Cb
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNxA-0008KO-As
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXNx7-0006ij-DQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633353860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3+5r6lL1DThpiE/0unUlhNG9Iwr1aoCeG3/ICa3Hbc=;
 b=PvzwtlQv6/FyzRaQuHIaqGTou9gFnvq/Zeo1/UmFYbW9XQlE5yT+Sg6i9Bm2xxxFSuE82K
 qC2+b4CvRsn3hSZ8rIuFGZleyCp/IhnshY7FnVbQuZrrMsFQyRUX48N6p+P+D16uXGfkS1
 rhP21zC6nz9ZOBQgsVda2m4eBJ8XyAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-LVWpEJT6Nb2rtMd3h7ezSQ-1; Mon, 04 Oct 2021 09:22:47 -0400
X-MC-Unique: LVWpEJT6Nb2rtMd3h7ezSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FD5C8145FB;
 Mon,  4 Oct 2021 13:22:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E57710016FE;
 Mon,  4 Oct 2021 13:22:21 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:22:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 05/13] virtiofsd: Add a helper to stop all queues
Message-ID: <YVsADXfyANPqIEdW@stefanha-x1.localdomain>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-6-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q5PM/KdjM1ckKFE1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Q5PM/KdjM1ckKFE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:29AM -0400, Vivek Goyal wrote:
> Use a helper to stop all the queues. Later in the patch series I am
> planning to use this helper at one more place later in the patch series.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Q5PM/KdjM1ckKFE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFbAAwACgkQnKSrs4Gr
c8jh/gf+J4GZi71MvpMOjRz2royZlqrVlVTykmdREtsI/04vfklgGNTBuVyDMKZZ
qaVDd9pu+NypAWA9rTANFx8G+EkmwU8ayJWnd6qQQUm6oaMjX24P2Lde1HSveFkL
Ek1qOjSqScJgiAOW8py2yFXW1tD2D/DyUbTkORJbYvnoM7MbZAFMQnT1QTfS3iGN
0cHyOB9Gp4W+EyF8d/ygASTg0SXANX1sHrl1VpEG/5uIGLHI4TyAIezjhr26APof
W5+tnkb07+ejWQldek0dAhzj6Oa7vrzow2Oj8pEOmEA2ajLlYf0GXvsYO3dlNesG
K601IbJn6zmfNY3RCaT4uLkKEFp6kg==
=OIYs
-----END PGP SIGNATURE-----

--Q5PM/KdjM1ckKFE1--


