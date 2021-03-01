Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B6327BCE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:18:44 +0100 (CET)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfdT-0008RM-SS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfbd-0007aw-4i
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGfbb-0007hw-OS
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614593806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wokf7EaNWxJ+kr9LQymBRaxqTolxVr3yWPDrupH2VZk=;
 b=OCWuVcEOMglyUJiP7BgvOJRFxx3ulRUxLx/9CXq+s7KEy8Gj7wH1ccFDGedY2Fp7JrWooC
 hSXRm82otzfegiBZ/p1jcqkfo6NPbDrxnE+ZqpKnhZhkvgD7JrElOf7mfTrZEz50YlPG/j
 0MICtFaPm3KV8zf2hshrm8TPheQKsXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-sOq-lrY4POmpOqwzddZUHQ-1; Mon, 01 Mar 2021 05:16:43 -0500
X-MC-Unique: sOq-lrY4POmpOqwzddZUHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55881868405;
 Mon,  1 Mar 2021 10:16:42 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85D12261A3;
 Mon,  1 Mar 2021 10:16:39 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:16:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] docs: vhost-user: clean up request/reply description
Message-ID: <YDy/BuYqv70zR07o@stefanha-x1.localdomain>
References: <20210226143413.188046-1-pbonzini@redhat.com>
 <20210226143413.188046-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210226143413.188046-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c8tLaK+RW5GDUwPF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, jag.raman@oracle.com, qemu-devel@nongnu.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--c8tLaK+RW5GDUwPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 09:34:11AM -0500, Paolo Bonzini wrote:
> It is not necessary to mention which side is sending/receiving
> each payload; it is more interesting to say which is the request
> and which is the reply.  This also matches what vhost-user-gpu.rst
> already does.
>=20
> While at it, ensure that all messages list both the request and
> the reply payload.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 163 +++++++++++++++++++++---------------
>  1 file changed, 95 insertions(+), 68 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--c8tLaK+RW5GDUwPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA8vwYACgkQnKSrs4Gr
c8g5AQf/Q/zRhgyoMgYCjJz0q0lcZ71Bv5tZnl54OdVh8k+anRQqnxbKnAYIJsWK
ORhZ4415U95qoUCiXG5nRJDDpwnDoQSdf+gFpsu8XUgC2XNBUr+qkf6kDq+Q1udc
CNT5n01tW50vbxzR2QwZwUeBZHoUf3jcb6seyjoNKuCnIHtvre6Xbg1hM01pBQA6
k3roMWOrhnOxiD0EQYlxqdHVJ6In98iae8u4UUmMDEeqBYzBg8C1H1eh+9qml0to
YFJj8PcEnbKh4Sj06TOFiTvcFnIBnxGVauoviK6uH3sUIhGlROL+UnpheBmrwCC/
XUHmVol65mgyAGP3zzq9htMeiEN9Ig==
=4ubl
-----END PGP SIGNATURE-----

--c8tLaK+RW5GDUwPF--


