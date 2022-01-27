Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22C49E569
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:05:03 +0100 (CET)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6Kc-00047f-GC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nD5gz-00009i-U7
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nD5gv-0003Wh-VS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=57iklwuX+1KbJoKmEbFlgYDa1PqWZ1yNzvBUE5OxOCg=;
 b=J1Je/jD/PjHSypeB4mm8MFB6EmLXBeuSxa7gxvlE0XWZ4AgN4/9p2lvUXtRhllUMTBc62j
 AbZEJTcksqYHa6gOUF5o6od/6xwj1bikckrRmNj1QnUDY/PtGPlpIihMZQGGewsntdmIX8
 V1bAV5JxpDc2GxR9xFaowogKGdUhNfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-xSLevoe-PVaHXXQ6FOgRTg-1; Thu, 27 Jan 2022 09:22:06 -0500
X-MC-Unique: xSLevoe-PVaHXXQ6FOgRTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB052101F006;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Received: from localhost (unknown [10.40.194.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443AC70388;
 Thu, 27 Jan 2022 14:22:05 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:22:03 +0100
From: Victor Toso <victortoso@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] schemas: add missing vim modeline
Message-ID: <20220127142203.rkhiazgfmfpa6liu@tapioca>
References: <20211220145624.52801-1-victortoso@redhat.com>
 <87lez1bfhr.fsf@linaro.org> <87h79pp9va.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dnl5ri2slwspqcos"
Content-Disposition: inline
In-Reply-To: <87h79pp9va.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: Eric Blake <eblake@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dnl5ri2slwspqcos
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 02:48:57PM +0100, Markus Armbruster wrote:
> Alex Benn=E9e <alex.bennee@linaro.org> writes:
>=20
> > Victor Toso <victortoso@redhat.com> writes:
> >
> >> Similar to f7160f3218 "schemas: Add vim modeline"
> >>
> >> Signed-off-by: Victor Toso <victortoso@redhat.com>
> >> ---
> >>  qapi/audio.json  | 1 +
> >>  qapi/compat.json | 1 +
> >>  qapi/replay.json | 1 +
> >>  qapi/trace.json  | 1 +
> >>  4 files changed, 4 insertions(+)
> >>
> >> diff --git a/qapi/audio.json b/qapi/audio.json
> >> index 9cba0df8a4..fe3b506ec3 100644
> >> --- a/qapi/audio.json
> >> +++ b/qapi/audio.json
> >> @@ -1,4 +1,5 @@
> >>  # -*- mode: python -*-
> >> +# vim: filetype=3Dpython
> >
> > I realise we have Emacs mode annotations here as well and I'm not going
> > to start a holy war but I thought we used .editorconfig to avoid messing
> > directly with the individual files. So something like:
> >
> >   [*.json]
> >   indent_style =3D space
> >   emacs_mode =3D python
> >   vim_filetype =3D python
> >
> > should also do the job.
>=20
> Most schema files have lines for both Emacs and vim.  Some have only the
> former, and this patch adds the latter to them.  Seems fair to me.
>=20
> Perhaps we could get rid of them all instead.  As far as I can tell,
> .editorconfig doesn't work for stock Emacs out of the box, though.

I think the same is true for vim. You need to enable a plugin for
it. Similar to other IDEs.

If we have a formal way to suggest that developers install
editorconfig plugin for their IDE it would be better than
maintaining such annotations.

Cheers,
Victor

--dnl5ri2slwspqcos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEIG07NS9WbzsOZXLpl9kSPeN6SE8FAmHyqosACgkQl9kSPeN6
SE8m6RAAswTd84DI2bgv9CUsn/0E1q1+7cocmtN+mkTEyB2fgCMsDhspDq3mAywK
UXwKI4hDe1PaPEcds5oyi7IZga+HPicdEuObb5fkMlyAcnyHqSatJitqcXkRyQYp
2KTQqEcbIaFNxpD545Up+5Jq1pTrBnSd2MnGm57VBPBwH7KzzJCfZLarJ25uQ6rp
TJc7vScoyJQFI4yVG6XXkH7XQrQA3EpA1rrNM2YKNpBZ8l0DW/UkIa8pTOE1fy1s
Ld1ciCthRkH4IdAWOt8In6BkyeyilnofDMFY+76wts2o7J3pm1qdCxV1viaghRe/
X4Df+iI2bFn2HlAEnc3n2Rel/7Vx7gTjtOmN6quNbF9H3XT6JQiR5evSj0xyQ16a
lpXydwxHJ0hzSvYCqMaMEzDfrppG2lZbvZA/JnlUkDiBsuyoSyuush0XIYvgCnPy
ReHJBfRjD6ay7ZzZ2cT/o2io/mT83zOBh9rw55mownj/dVwT0LG3FL6rxJ8xkFbU
kOVw4AqAmtkM9+fqQBTXSEyd4um0MUy9ovQCSkmsqaCINpKZxMwC+rJuMz+cRPUw
DwFloQ8WRDvg1gr5U9aw8v4dAoaIkZRcOuO01o7g2+uSPtIzz7uos/PfvD6XtfWT
32iv7djA+Qi5mLTK2jEGTMC1wxPLTyHoJ3xSR8D1gUXdJZqRZNE=
=cLp4
-----END PGP SIGNATURE-----

--dnl5ri2slwspqcos--


