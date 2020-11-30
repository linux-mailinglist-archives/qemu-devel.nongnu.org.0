Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA632C8A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:58:13 +0100 (CET)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmVA-0002wr-Qw
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjmTT-000208-LL
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjmTR-0005NG-Rf
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606755384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fB0iM0+QwDFw03OGzjyVFx3c5heeuEDBI7BQ7NX5Pww=;
 b=fnjNTjtZknfZ2JwxKZ/GBZFc2OntfFBE29P4Y459/5N5wqEu4GJJ4ZvIa5agjMrWTfrcWy
 C+E3D21Ur3lLIKuyj7hH1a2LDTKcs7aquDy1Xxyd6+NxNyp8WOqbfENsGYCp5/A/PYsW8I
 0u7XNURXtD5cLPcf7d3e5qkKP5dSajg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Wg0giNjMMK6SBV71pUYffA-1; Mon, 30 Nov 2020 11:56:21 -0500
X-MC-Unique: Wg0giNjMMK6SBV71pUYffA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1290985818D
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 16:56:20 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3AE76086F;
 Mon, 30 Nov 2020 16:56:15 +0000 (UTC)
Date: Mon, 30 Nov 2020 16:56:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 0/4] [RfC] fix tracing for modules
Message-ID: <20201130165614.GB474479@stefanha-x1.localdomain>
References: <20201124160255.28111-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201124160255.28111-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 05:02:51PM +0100, Gerd Hoffmann wrote:
> First version that actually works.  Only qxl covered for this RfC, other
> modules will follow once the basics are hashed out.
>=20
> More context:
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D1898700
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D1869642
>=20
> take care,
>   Gerd
>=20
> Gerd Hoffmann (4):
>   meson: add trace_events_config[]
>   meson: move up hw subdir (specifically before trace subdir)
>   meson: add module_trace & module_trace_src
>   meson: move qxl trace events to separate file

Awesome, thank you for working on this!

I noticed an issue with simpletrace: the trace file does not contain
qxl_* TRACE_RECORD_TYPE_MAPPING records when ./configure
--enable-modules is used. This happens because st_write_event_mapping()
is called before the qxl module calls trace_event_register_group().

(The mapping records describe the integer ID to string name mapping used
in a simpletrace file.)

You can check this using "grep -a qxl_ trace-$LAST_QEMU_PID" after
running qemu --device qxl built with ./configure --enable-modules
--enable-trace-backend=3Dsimple.

Remove --enable-modules and the file will contain the qxl_ trace events.

This means the trace file is broken because the simpletrace records
cannot be mapped to a trace event name.

One way to solve this is by modifying trace_event_register_group() to
call into trace/simple.c (maybe with a TraceEventIter initialized to
iterate over the newly registered trace events group?).

Alternatively, simpletrace.c might be able to emit
TRACE_RECORD_TYPE_MAPPING on demand instead of ahead of time.

Stefan

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/FJC4ACgkQnKSrs4Gr
c8htYwf/ew+0uOP25u6IwMvJ6SSfM6Px1+Yw8VqPe0nzSF0LGqt6rZdFOVL/xuE2
9RDBnyZmYzMj0+pnjDT10nAbNRzV9tbEMzqi5xzZ2W9RaDBBjkLw7kCsK7vGa8UC
/uTeJTeprEvmMo1IEmgwVXjPJQtGUTNhWpRN6dHk9+bUFa4yzOHFqGg3QQfwTiLe
76sA6XBzt1GQ+QkW0R5wWQHxdtDk+23mjgUP4iYMVx1D0W2YHoFo7HKeySkVJUI5
CfLT+ZhwIXOBznYU5cVxfLlWmIv1/EuLF8gXcDdD5PhcERvC/QHI7X4Se7uGg8I9
GtATnSrHkRuUYqsi+q3qNSTjsDtfFw==
=jSOM
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--


