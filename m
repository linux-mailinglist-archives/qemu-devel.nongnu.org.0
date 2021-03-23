Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CDD345FC6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:37:15 +0100 (CET)
Received: from localhost ([::1]:49578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhDe-0000Rz-Eu
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhCi-0008RA-F0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lOhCf-0003Fp-8m
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616506571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YjO4COss4cvQqDtWnEDYSyWI1eduWqh/BYKaekyV/Cw=;
 b=PZj7QT8GvWtgqKkZdEmM6C22k4yRgZ3itlJsyUzqyvOA6Lb1lNcwNKP6NDzVvHjCwI/StR
 0OkiAdOhfK8EWs/GZljcnvFLbVOz6zCQ5D+N72fhnx2qxJj7Cme8dXVoHSlOb5xPhMXFzW
 KwIrL1bMJLRKlQkSnUr0fkTe/EiAsgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-CxiVBQW6O8yhP8OOhYe_QQ-1; Tue, 23 Mar 2021 09:36:08 -0400
X-MC-Unique: CxiVBQW6O8yhP8OOhYe_QQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A7487504E;
 Tue, 23 Mar 2021 13:36:07 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F8FB10841A9;
 Tue, 23 Mar 2021 13:36:05 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:36:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yuri Gribov <tetra2005@gmail.com>
Subject: Re: [PATCH] [NFC] Mark locally used symbols as static.
Message-ID: <YFnuxJG8yzjAWcyW@stefanha-x1.localdomain>
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tZ2DNpC32Zgg5Evi"
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
Cc: Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tZ2DNpC32Zgg5Evi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 10:55:42PM +0300, Yuri Gribov wrote:
> diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.p=
y
> index c390c18..7e89ba3 100644
> --- a/scripts/tracetool/format/c.py
> +++ b/scripts/tracetool/format/c.py
> @@ -49,7 +49,7 @@ def generate(events, backend, group):
>              sstate =3D "TRACE_%s_ENABLED" % e.name.upper(),
>              dstate =3D e.api(e.QEMU_DSTATE))
>=20
> -    out('TraceEvent *%(group)s_trace_events[] =3D {',
> +    out('static TraceEvent *%(group)s_trace_events[] =3D {',
>          group =3D group.lower())
>=20
>      for e in events:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tZ2DNpC32Zgg5Evi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ7sQACgkQnKSrs4Gr
c8hcDAf+NWPrQPS8Tv50j8XlcK5xWSVWC5qlq1t7TTPyuuDLHS0GbIVZYsWNXhhh
U8bdwfMNyEZtEX7h18kTkjPgBOrHtYye42xTftAGxmj3Wxyy3q3GFhWRaBkDhn+u
1ahxkW/FY/XQpxKVqHksddyblmPwGexaVLgJRMgmJR6sp/QYpDIVN5yhetQR7x1e
WqUGTXhncmNO2IPDKzVFY8WxBN7+QX/xdUV4sCQDVfeLHUKruIk77HeAjpK1N+2K
09V7fRo9miYeFAUsTrOFLC+BZh4mMqqpunG54H0CqjPkfJwbfj5pU3pqD/MR9sOa
n68ZXFsiHMrYWH30nxhgrsrXQYlALQ==
=WfFu
-----END PGP SIGNATURE-----

--tZ2DNpC32Zgg5Evi--


