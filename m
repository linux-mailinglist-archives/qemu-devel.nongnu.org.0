Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E72B8F66
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:52:17 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgbw-0002NH-KF
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgai-0001vX-5S
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfgaf-0000yV-8G
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605779455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQilAEmqzvtqlnhqls6/12eoPTaS72pEdBvxJjJCXIE=;
 b=ErIkLup/wd0W5Oj0ygPB4Iz3TiAeITOLl36fm0Ii9wjXxXMDypHevyBz7RItmqhhJAbSmG
 /Cm6n8+mUabFjpgZ5mlexcCgC2OvBeRmvyCxJHURVPoXbGWU9jLpDr4VcY3U0m4E9tKvGc
 gHP9BFqSnghqeH8xCFa1HNWnZbtIZyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-0kW0n0z5PEi_D7IXdIOnNw-1; Thu, 19 Nov 2020 04:50:51 -0500
X-MC-Unique: 0kW0n0z5PEi_D7IXdIOnNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED5E800D62
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:50:50 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 648225D6AB;
 Thu, 19 Nov 2020 09:50:47 +0000 (UTC)
Date: Thu, 19 Nov 2020 09:50:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/4] meson: add trace_events_config[]
Message-ID: <20201119095046.GD701869@stefanha-x1.localdomain>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119084448.24397-2-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 09:44:45AM +0100, Gerd Hoffmann wrote:
> It's an array of dicts, where each dict holds the configuration for one
> trace-events file.  For now just fill it from trace_events_subdirs.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build       |  1 +
>  trace/meson.build | 21 ++++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2P/YACgkQnKSrs4Gr
c8hdkQf/VAKh6wQySmcVdnT6i7SWRfgqUR+7zUF1qZRP2aC9H/s3JHddskgsDBlu
cVRp51ysnc/yMM3kTahTYG0fmP3LapdO2UMNUfTWfG/BYyF53Em7IPdGHhK7aHCj
ICO2UtAiBS4UGBBLint56GRs7xCMAORzpUMsJ1/IaK3+p5z66C5jjbwJwn91+gYk
vBKumCEpSJwHa77LoGYO5ALjGq51FnE9An80F8ECoE+ju1ds1GrzzlXrp7WFTQ/8
k2A9Ek5+kRuHNxwRoY3smHkJL8QErKOYEvyGopR8VcWLSgeWM4wRTuYMNeW/j0U4
KbxfD1kF1korZQqkjRRCBmHOwvKonw==
=fX48
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--


