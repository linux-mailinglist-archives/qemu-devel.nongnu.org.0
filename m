Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D531C0B6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:36:58 +0100 (CET)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhnt-0002tM-BB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBhlE-0002Ds-QU
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBhlB-0001rz-Ts
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613410447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+GLvO7x1tNchLvPvRNg3/4sfnMW8c6QhPEVl4+FaMVQ=;
 b=K2BVlqLPLliZfz3pRJn7Xvb8tiOqPbgCcliP7MT+iSn5H7fUH67CdOG/Q9jjXkcbO/AMow
 jvnQUGzdH6GYw3CSwJ65VWTWvL3J03LSZCWisv+WVA/UH5Q2imJcxRhj4TZqthsDjZ+FAj
 cKeT/WLcWpNydnM/4slR6ttL3/HywgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ns1oN4fLMTC_46Ou6bjTSw-1; Mon, 15 Feb 2021 12:34:04 -0500
X-MC-Unique: ns1oN4fLMTC_46Ou6bjTSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E2CA6D4E6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 17:34:03 +0000 (UTC)
Received: from localhost (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36F65C241;
 Mon, 15 Feb 2021 17:34:02 +0000 (UTC)
Date: Mon, 15 Feb 2021 17:34:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] trace: fix "-trace file=...."
Message-ID: <20210215173401.GE87159@stefanha-x1.localdomain>
References: <20210209145759.141231-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209145759.141231-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 03:57:57PM +0100, Paolo Bonzini wrote:
> This series contains two fixes for "-trace file=3D...".  The first applie=
s
> to all backends, while the second only applies to the log backend.
>=20
> Paolo Bonzini (2):
>   trace: fix "-trace file=3D..."
>   trace: skip qemu_set_log_filename if no "-D" option was passed
>=20
>  softmmu/vl.c    |  4 +++-
>  trace/control.c | 13 +++++++------
>  2 files changed, 10 insertions(+), 7 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAqsIkACgkQnKSrs4Gr
c8ibGggAhzTKcLAq1oPC+3BmAy7V6CYlnX4zidXKeXcEGC4DPDP8ppybkHBxMNq6
nm8f4QRuxgFJAi2QpI8bRKoGSOV48EkiVBGfhL3L4FoxHPP959vMgx84oQHAJYbq
M/EqSeasfdcqgtZobVM3j0EVnXtfT74AC9bWjJXfOm32KTY6ZFhOiXeUXF18Gke6
+kAZQWjf4NmeytXSe8dNPaNES2HmWJBZXIaLDarPfo7KTzzORTmKQoyEt28B4GB/
cYJUqR67StXsDIzQW78MmltHCg9kXk2OSZ7lw12kT58lIiWFzjut/wJtifOLCHqE
VAvZl+VDHLoGh8eyPgD699pdnMFk/Q==
=VNxR
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--


