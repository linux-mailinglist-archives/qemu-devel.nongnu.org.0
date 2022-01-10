Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9063489D73
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:25:11 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xTq-0008OT-CD
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xRL-0005BY-26
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:22:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6xRI-0008Gz-H4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641831751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OI2xyR9DL8qMKlVu1PJSrkySo3/jcvrlmGKDm0tvNKo=;
 b=hFtONgcw0oR5p13aaMLSW+x6T9t8F90ueuxHL/Je9Vhwc56tu56okHrBBQArO7i1QUBz+e
 Tk5C8tEbaaAWmAmqLRnVthQD4xK/RcqtmcBxK+U3Zecc4xLKIlxIpqEJrGRH35ZVNu3fuv
 QyNUS5yIpcaSgAHr+jZOBequP6cxKEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-pmWMAotSN_ifIquxB3cQFg-1; Mon, 10 Jan 2022 11:22:29 -0500
X-MC-Unique: pmWMAotSN_ifIquxB3cQFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2ACC2F27;
 Mon, 10 Jan 2022 16:22:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B849A10640E1;
 Mon, 10 Jan 2022 16:22:08 +0000 (UTC)
Date: Mon, 10 Jan 2022 16:22:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/4] scripts/qapi/commands: gen_commands(): add
 add_trace_points argument
Message-ID: <YdxdLLNc/Av889nH@stefanha-x1.localdomain>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211223110756.699148-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dANXllgNTRyx5zDS"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, michael.roth@amd.com,
 philmd@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dANXllgNTRyx5zDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 12:07:54PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> Add possibility to generate trace points for each qmp command.
>=20
> We should generate both trace points and trace-events file, for further
> trace point code generation.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/commands.py | 84 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 73 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 21001bbd6b..9691c11f96 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -53,7 +53,8 @@ def gen_command_decl(name: str,
>  def gen_call(name: str,
>               arg_type: Optional[QAPISchemaObjectType],
>               boxed: bool,
> -             ret_type: Optional[QAPISchemaType]) -> str:
> +             ret_type: Optional[QAPISchemaType],
> +             add_trace_points: bool) -> str:

Please use the term "trace events" instead of "trace points". That's the
term that docs/devel/tracing.rst uses.

> @@ -122,10 +167,14 @@ def gen_marshal_decl(name: str) -> str:
>                   proto=3Dbuild_marshal_proto(name))
> =20
> =20
> +def gen_trace(name: str) -> str:
> +    return f'qmp_{c_name(name)}(const char *tag, const char *json) "%s%s=
"\n'

This trace event is emitted in 3 different ways:
1. For arguments before calling a QMP command.
2. For the error message when the QMP command fails.
3. For the return value when a QMP command succeeds.

This makes parsing the trace akward because you get two events in
succession for a single call and they both have the same name.

Please generate 2 trace events:
1. qmp_enter_<name> <args>
2. qmp_exit_<name> <ret> <succeeded>

(That's similar to how the syscalls Linux kernel trace events work.)

Scripts processing the trace can easily differentiate between enter
(args) and exit (return value) events without parsing or keeping state
to count the second event.

Thanks,
Stefan

--dANXllgNTRyx5zDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcXSwACgkQnKSrs4Gr
c8ifnQf8CRTLT2FftzRqstFQA2X/+H4c3W5mw29BRy4dOb0QvEr3a7sJDlA/0B6P
yeRHIKuDyBkbxO8eXms2UithSK/Zom4cq4Vipvv0aK6Fkx0ccwCg8W3Sr6hZsVNz
QyA/kp9HAjmTPxcNXrsrw6LIby1RoaQIluuVQAYjwzhGqK0IZYvTQmQYG5OW6rtR
Ujos77SaZvUmWWA+ToVinAjA5pn1YHCc6FIN9PD4gqynHiYT7GmB/fyhUmuRPQZa
nyjbvtUCQGFPmAsrfDlZgmgsRpVsNsgsYCzITZDIaGeTL37SIGkcsY5eD4IAGoVk
6gp/N6xvINAZ1co5bkRH4gUyh9MQSw==
=YsrD
-----END PGP SIGNATURE-----

--dANXllgNTRyx5zDS--


