Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F6513233
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:13:55 +0200 (CEST)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk25q-0002ML-31
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk1Tc-0005FC-SC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk1Ta-0008BL-9B
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651142060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QnlYNSOghmteG9rJbjgSQgBJAjzmho1xQx7aV2wfA30=;
 b=g2eZOPJFN8kf2vaRsCoPn2YlYRMRBK/QmOkCDD6cKhnqgiOkGX6uk976eoWdgjXvXpjmOs
 Ulgc2S1il0wG6dSxMQI7hV+FsW9aaeZBrzeWcY7JpcnB7tuyMePnZ1/8WpNloe3VySRGIH
 oAV77kBGIdkTWd4IgkYFugjApQH9Up4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-Nr4-OQQBMYWvRgETYA-yyg-1; Thu, 28 Apr 2022 06:34:16 -0400
X-MC-Unique: Nr4-OQQBMYWvRgETYA-yyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DBC1801E67;
 Thu, 28 Apr 2022 10:34:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1ED440D2971;
 Thu, 28 Apr 2022 10:34:15 +0000 (UTC)
Date: Thu, 28 Apr 2022 11:34:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <Ymptphd9lpctkTj/@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P6glbUe+jgpcMxfk"
Content-Disposition: inline
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--P6glbUe+jgpcMxfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito wrote:
> Next step is the most complex one: figure where to put the rdlocks.

I got a little lost at this step but will hopefully understand more when
reading the patches. Earlier it said there is a counter for readers, so
it seems trivial to make it a recursive lock. I don't understand why you
want to avoid a recursive locking - the complications you described stem
=66rom the fact that you want to avoid recursive locks?

Secondly, can you describe the role of the lock? The text mentions the
old AioContext lock that is being replaced but doesn't define this new
lock in its own right. Is the idea to make ->parents and ->children list
accesses thread-safe and all loops "safe" so they don't break when a BDS
is removed?

Stefan

--P6glbUe+jgpcMxfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqbaYACgkQnKSrs4Gr
c8i0owf+PbH/PsJ4hwoC5VQ+EL6FkZeZJ5Hndam8iOOQcbECIxkhew5y9tIRfPKu
oDVmGt8k502+URInjVXJVNSeRZoH+sGDmYl2zF8r7iz+FGHdQDcwbV8cfim+38gP
p0WZA7aTpPLzV0DFNxV/RhLRPArAW6k4MEz19eUNEJiOF80jsQMhysOi1XK5MwYU
AeTmP+UD4YcA5YfdSMKFCjzTOzsxjtxg+7BTn6kFTyyY5yCdpDvxnkCl0SY3Kh3L
m8L5AIzBeS8p/oPJYEsHh+tKqO7Z34HyWxTmvJFBhjLgvIon2Eh67ZFSS/fB0GfT
xk+P4uw48ErzgOmBsXZ2vRO4LmtdmQ==
=LPqW
-----END PGP SIGNATURE-----

--P6glbUe+jgpcMxfk--


