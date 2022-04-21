Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FC509D83
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:24:15 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTyw-0005y9-8Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTwC-0004wo-CN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:21:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nhTw8-0000oM-D3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650536479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4fxkMixDYAZkJnphc4zI4Dz/H8+2+LGM9uzwiRcFu4A=;
 b=UCn27GhWxR677kFNinpL1AxvrnJsezbu046tuoRJd2pIBykCCputajlF22nz+5oddd+xDA
 AkOd4q988OPDkM3clhqK0QZjl/LqEOCJPfnC9Ml4J0CC45WFcpD33ifa+G7CtgpTZjkn+a
 0eZ5shMeJ13nO2Q3cWZbWx3gXXq1xhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-3qAT3FK1Mdqa6s6k--M6kg-1; Thu, 21 Apr 2022 06:21:17 -0400
X-MC-Unique: 3qAT3FK1Mdqa6s6k--M6kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41789802803;
 Thu, 21 Apr 2022 10:21:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8373141DED5;
 Thu, 21 Apr 2022 10:21:16 +0000 (UTC)
Date: Thu, 21 Apr 2022 12:21:15 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 01/26] block: remove incorrect coroutine_fn annotations
Message-ID: <YmEwGzrKYvWqdKlu@stefanha-x1.localdomain>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-2-pbonzini@redhat.com>
 <20220419175006.q52jsc3yqodmqlj7@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g3Bp01R3UGATOzbY"
Content-Disposition: inline
In-Reply-To: <20220419175006.q52jsc3yqodmqlj7@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g3Bp01R3UGATOzbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 12:57:54PM -0500, Eric Blake wrote:
> On Fri, Apr 15, 2022 at 03:18:35PM +0200, Paolo Bonzini wrote:
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Might be nice to document in the commit message why the annotation was
> incorrect, so someone stumbling across this commit in a bisect but
> otherwise unfamiliar with the rules of when to annotate doesn't get
> lost.  If I understand right, the argument is more-or-less:
>=20
> This function defers to the generated blk_do_pwritev_part, which is
> safe to call outside coroutine context.
>=20
> But although the commit message is weak, the change itself appears
> correct from what I have observed with the annotation in other places.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>

Yes, please! I'm also wondering how to review a patch like this because
I can only infer the meaning and audit the code myself to check my guess.

Stefan

--g3Bp01R3UGATOzbY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJhMBsACgkQnKSrs4Gr
c8guagf+LWdpB0CRjx3B/g0pK8VuQRLwrJEVFMiaHVEngjpPZeg0scPNrwaneHeK
luphU55CRFPiLQH5bJE9g3JyNU0QDIDketZo0tc26u/Vbvr1iPDyUQHsI1sSKNVm
AfaN3Ug16NljLskeAmWU3yYiH+5DGKFaQkh5FuekAILyq+xQ5IpE/5jzVvVZ4WNK
KKDdJlPoa2hwWCsYTbgwy6T3/zQj9qX31oYnZRotPVvjqPzEk+40ra+3wFdY30LS
YsVPj0bjP1AcP2DcC68SBfK7deqNrldZ3ee98yk86xIY2hDsdwfKI7cJSjSskLRj
T6UVuQmTg9fEUlzYP48OUcSXw8gX/w==
=M1m8
-----END PGP SIGNATURE-----

--g3Bp01R3UGATOzbY--


