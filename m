Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7831C0C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:39:45 +0100 (CET)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBhqa-0003vD-Kv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBhoE-0003Ne-2z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBhoC-0002DR-Ie
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613410635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yX/S3L63gJIvkBWTgj+tsHYwPiuoC6WbLvfdHROwrk=;
 b=Sv8sOn72T7x+6NAkWNzykPrv7Mv+ZUshf8AhpJjiLT0ebKD1H2047GbIfaRA6Fj2MZyYX/
 UfD2I4h42ZLfVFmoQOLGZnyETXHRq+6rZ7e50iI91h/PhzTzDBuGPVnThWymXwQzA2MZAB
 sfwyro6M03QVb5sX5kVnPm18ejL/xXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-dXnie-9OMKeGU88-6xIeEQ-1; Mon, 15 Feb 2021 12:37:11 -0500
X-MC-Unique: dXnie-9OMKeGU88-6xIeEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B7A51005501;
 Mon, 15 Feb 2021 17:37:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A715B697;
 Mon, 15 Feb 2021 17:37:01 +0000 (UTC)
Date: Mon, 15 Feb 2021 12:37:00 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 13/22] tests/acceptance/virtiofs_submounts.py: add
 missing accel tag
Message-ID: <20210215173700.GA72984@localhost.localdomain>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-14-crosa@redhat.com>
 <b80bb329-8de1-7fd4-98cc-c2bd327c5725@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b80bb329-8de1-7fd4-98cc-c2bd327c5725@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 12:28:22PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/3/21 6:23 PM, Cleber Rosa wrote:
> > Which is useful to select tests that depend/use a particular feature.
>=20
> Is that a question?
>

No, it's not a question.

I meant: "add a tag which is useful to select tests...".  I guess this
statement followed a similar previous broken approach of mine, reusing
the commit title to give it meaning.

I'll try to keep avoid that in the future, thanks for asking about it.

> Why keep this last in your series?
>

No reason... it doesn't impact any pre or post patches in the series
AFAICT.

Cheers,
- Cleber.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAqsTkACgkQZX6NM6Xy
CfOGhg//Z1z96GFihettfBBcFtEYiNrsbOtDFh9ygmlFtkA2WJsI4IG9PaAQCz8o
4nrfKitQyoxgIGCjvgpN84iUAXV4xhAEgi5cj395QHXaxctbOwGZfYVR6PDuW2Qe
kwb4sb1TV8lNgoaiWvZHnYpRhXR0H4mZyYiIai4MKuApY0BdmY66mrSXNnV9NvlF
GqxObgr1NRQ2KA6TZFXu5UTJnJeAeyteWpnU140KLagpraeHz15866rZ6JVp0MLu
H66JS+kLx3aNRrGssO1usFgvgWWoB94Ib6dpkTxLP8YCmULI9gmq9T5PEXEsv0qL
rQKGg8zY4p67H4PaFCUmps2W0XS3adEizPXCW9huEQ7FupCwGMSMcYfnRv7lfPtQ
ldsEHlU+WdFkykvmLQG6XGFik1zODHmo8BgjX/sPABC4Fy2EviJMCPyWh9+desSY
si+/8eQU+XXqBNrVMdiogfLR6qhgVE0jsXcRKjc3YTV1TURt75WEbdB192oFy6pc
5/EeHUq26f/0ppFwU4cwzHRyhSunJXJMCAG3eQQFdET220L7cRsLT60ZhNuuZOn7
93C+nqeCnzkQL4M57NT3txPR/r5jq8zuJzf9ZM8uEE6IG3U4AR3DZjfDDdFtS3QS
HzgYL3BfuNZ/amCp4xnaGFbUXBP9TazuL+2f7Yv+zrZQ9Qrjnfc=
=TE6m
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--


