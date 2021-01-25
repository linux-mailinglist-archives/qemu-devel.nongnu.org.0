Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB613027B4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:24:11 +0100 (CET)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44ew-0000CM-Dw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l44c7-0006TR-IC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l44bz-0007Jp-Uj
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gNsfG01EAU5YQhWkENIPOjk2nDFobkizWSfSC/S2ZUE=;
 b=AsVXj4su/huFN/gakKoBv905S9qhkVDjf0v2sDJtyZiYtSEvvB01dyEj7ktoCBwPrS3etO
 5SoiyINcF8H8N4tqkZn8HVu7zCQX9K5cQ2wvGdZOky+wEH0ZhDf6iEPLyaN3ijWAi0icmV
 C+9ilaCsYWrKFjNjIUUsrRVIGYCj44Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-ngP-GM7nOaKcshMsxGO8EQ-1; Mon, 25 Jan 2021 11:20:59 -0500
X-MC-Unique: ngP-GM7nOaKcshMsxGO8EQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A4458145E3;
 Mon, 25 Jan 2021 16:20:58 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2781042AA3;
 Mon, 25 Jan 2021 16:20:38 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:20:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] trace: add meson custom_target() depend_files for
 tracetool
Message-ID: <20210125162037.GB228223@stefanha-x1.localdomain>
References: <20210125110958.214017-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125110958.214017-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 11:09:58AM +0000, Stefan Hajnoczi wrote:
> Re-generate tracetool output when the tracetool source code changes. Use
> the same approach as qapi_gen_depends and introduce a tracetool_depends
> files list so meson is aware of the dependencies.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  meson.build       | 28 +++++++++++++++++++++++++++-
>  trace/meson.build | 21 ++++++++++++++-------
>  2 files changed, 41 insertions(+), 8 deletions(-)

(Additional comments welcome, I can drop this patch from my queue
changes are requested.)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAO79UACgkQnKSrs4Gr
c8i4UQf/d27uSp5XC+e2PBJs/kcLOLtjflVJicUgDHVdqBq/NrOy2cc+CMvpzLyy
uVxs2w/JnMhR1ekOsgXc7NS5X3raKG4LvdLfcGNA4Nh/5ccYZWUkscslgfN5W0us
H3q0+UckGawqTleevQxibr+ntVDeC5yuPnYOyAkCCb3mBCXb5xwY0GcTJHriOZYx
HibNCq6kzAA0sOmdcJOPBblHo8rFJkchdCxFIgFJJS8cW925AezRQEov9/E3x6w1
JobrVdIDjzBGWa8iqjfPp+F4iuAywN/7uKlFaBhb9qXT5RXeBOoFQXwmy4Yelajs
rGgFmyxjE5jb0St0CZG0uKp8TTR9RA==
=rWli
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--


