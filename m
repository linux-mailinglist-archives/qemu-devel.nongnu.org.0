Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A628F30A5CB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:53:33 +0100 (CET)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Wpo-0001QF-Nr
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6Wni-0008Uc-SH
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6Wnf-0007tQ-Hr
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612176676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1cnxPh65takdReC+Wp6hBCdheovFAlQ2wrSjL/srZNs=;
 b=QFBeBN389BcA6G6GfaB6pu5OQwJHu15xmp+Z5ILn4Lq35ndvrplTKDg4LpTsicIvX+YtmM
 gphnIBg8HLQd01HI3a86gRPd85Tj6/ue3jB37kiVAbT0+8Fh+m0nV0Cf0u4LGMB+dlShk4
 bDb/OehRDbYOBYwc10KVx/zI/IWm7Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-rln2MYlmNoyI3OAbmuASuQ-1; Mon, 01 Feb 2021 05:51:14 -0500
X-MC-Unique: rln2MYlmNoyI3OAbmuASuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3199124D;
 Mon,  1 Feb 2021 10:51:13 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE05B2C169;
 Mon,  1 Feb 2021 10:51:12 +0000 (UTC)
Date: Mon, 1 Feb 2021 10:51:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] simpletrace: build() missing 2 required positional
 arguments
Message-ID: <20210201105111.GA159493@stefanha-x1.localdomain>
References: <20210131173415.3392-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20210131173415.3392-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2021 at 06:34:15PM +0100, Volker R=FCmelin wrote:
> Commit 4e66c9ef64 "tracetool: add input filename and line number to
> Event" forgot to add a line number and a filename argument at one
> build method call site.
>=20
> Traceback (most recent call last):
>   File "./scripts/simpletrace.py", line 261, in <module>
>     run(Formatter())
>   File "./scripts/simpletrace.py", line 236, in run
>     process(events, sys.argv[2], analyzer, read_header=3Dread_header)
>   File "./scripts/simpletrace.py", line 177, in process
>     dropped_event =3D
>       Event.build("Dropped_Event(uint64_t num_events_dropped)")
> TypeError: build() missing 2 required positional arguments:
>   'lineno' and 'filename'
>=20
> Add the missing arguments.
>=20
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> ---
>  scripts/simpletrace.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAX3R8ACgkQnKSrs4Gr
c8hOZAgAhoQtU1RkOIKcd6WKwqYTnxzpnFGw7eM1fbbUEhuGumhtQQ3SJ+e/A6U1
mljwRoaiaVAUf1lNHnMXrY14gcrdm/e2ixPlLpEuC24ROEoHuMgrEIshBojsBXC0
pYIJkPGfmjx/pYG1rDuyHKCne8aYCzD89XwLqgMBIKapBqyxfZsiuALzt429Wd0d
aZZpgwBcwFk12nBFE9pbVVmBQ7VGopILH3YYMnbGTVLakJCpL3WeOsRS/LJTicy+
RfXQHA9HrvFz5LasPSN1r7T//pl09hYOkYxY2q41ZnrplbJri94lKH37eBl9BERw
FAJv5njKe7nTFYMmg+Q4EVrB1d3/Tg==
=NwDx
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--


