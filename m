Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B049DDCE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:22:40 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0zH-0001S4-EL
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02y-0005Jy-TV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD02s-0004w1-Q5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643271685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f0d5TT4uUT8dCw/V3JjIfaIDXSWpFm8PhF23wlY6d/k=;
 b=Otryu1wFf35+jAIoQavhzvO9W1lPqmRegIfDmRYt+Zp87xFxMUSot5QRObaO2OKDI7WoVJ
 13VpRgYB9C2rfY397orCGEp9GsJUBetj0pCVu9fMxeSvsShq83ndD6hD8arGrinZtdj5xN
 +NGAvhR+oWx3VvDR4JDs3S2B5nbZ/24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-tqJrMPdgO42iiefIhytNXA-1; Thu, 27 Jan 2022 03:21:19 -0500
X-MC-Unique: tqJrMPdgO42iiefIhytNXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3810651098;
 Thu, 27 Jan 2022 08:21:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A742B110F6A;
 Thu, 27 Jan 2022 08:21:17 +0000 (UTC)
Date: Thu, 27 Jan 2022 08:21:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 0/7] trace qmp commands
Message-ID: <YfJV/MRD/eEIP7S8@stefanha-x1.localdomain>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vdBUU1TzG+Z2Rpy/"
Content-Disposition: inline
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vdBUU1TzG+Z2Rpy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 05:11:23PM +0100, Vladimir Sementsov-Ogievskiy wrot=
e:
> This series aims to add trace points for each qmp command with help of
> qapi code generator.
>=20
> v6:
> 01-04,07: add Stefan's r-b
> 01: - subject changed
>     - rename:
>        gen_trace_events --> gen_tracing
>        _gen_trace_events --> _gen_tracing
>        _gent() --> _gen_trace_events()
>     - a bit more compact code for gent initializing
> 03: - rename:
>        gen_trace_events --> gen_tracing
>        _gen_trace_events --> _gen_tracing
> 04: fix --add-trace-events -> --gen-trace in commit message
> 05: - drop extra two sentences
>     - reword
>     - add example .trace-events file
> 06: reword
> 07: rename option to --suppress-tracing
>=20
> Vladimir Sementsov-Ogievskiy (7):
>   qapi/gen: Add FOO.trace-events output module
>   qapi/commands: refactor error handling code
>   qapi/commands: Optionally generate trace for QMP commands
>   meson: generate trace events for qmp commands
>   docs/qapi-code-gen: update to cover trace events code generation
>   meson: document, why we don't generate trace events for tests/ and
>     qga/
>   qapi: generate trace events by default
>=20
>  docs/devel/qapi-code-gen.rst |  25 ++++++++-
>  meson.build                  |   3 ++
>  qapi/meson.build             |   7 +++
>  qga/meson.build              |  10 +++-
>  scripts/qapi/commands.py     | 101 ++++++++++++++++++++++++++++++-----
>  scripts/qapi/gen.py          |  31 +++++++++--
>  scripts/qapi/main.py         |  14 +++--
>  tests/meson.build            |  10 +++-
>  trace/meson.build            |  11 ++--
>  9 files changed, 185 insertions(+), 27 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vdBUU1TzG+Z2Rpy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyVfwACgkQnKSrs4Gr
c8hDVQgAmY6VMZrYVf7qf6XnBlAvhPr/sD4v9Ok7M0Wl8HOkVgotlpZ5odOCcXng
EoNVdM/wgZonFt7wtIbo3Q1FSo2lzr1NgWSN8QsOEen9w0vxeX3zexNlQDGE3vPd
Y8j4G0BO06b9nk8NjKavNSifQ6I1uInQoBRW/e5b8taUaYReaZXWNi/nwZ5OZ9Ph
fyw+q0jcDu5hhnYxD1WvKb9yfVLP1UYoNlDsULqww4RKD4lBSrq+JeXHntsd/2w6
H4546Qa4sdyV8799yhPZfVHbMxepaheGLtlsNCv/F4KBzKtDhqGFu06Q6NyOdcie
tKXUFFNCURqQ3EqLuyFUNvZJX3a1SQ==
=fTms
-----END PGP SIGNATURE-----

--vdBUU1TzG+Z2Rpy/--


