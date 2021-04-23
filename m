Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6208369073
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:35:43 +0200 (CEST)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZt9y-0007kc-PD
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZt6O-0005Nr-G3
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZt6M-000466-G9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619173916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c42npFIxKn8t9GgJa7U5c4cCsLDuyBpKDiO9Y9uB8YE=;
 b=DFqptNQgZ7H/Qv+ubViFdU0QlBh+yu2Ai5LBUC0ls7FoSoe5ag8vFNJ/lFwIPJm74eF2WN
 uG+ItDlVsoU3Kaw5Wx5ONsnNAL2kgnDFcY5WVQIQkEOjXhpQQL3MsdNqwp1oQYPvvIdT39
 f70wZaP4uUO6i86r3WB6GPMQhVHY0Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-4JSBGYj9Pa2qfDaBon31CA-1; Fri, 23 Apr 2021 06:31:52 -0400
X-MC-Unique: 4JSBGYj9Pa2qfDaBon31CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BBC6802B5B;
 Fri, 23 Apr 2021 10:31:51 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.195.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2865C5AE;
 Fri, 23 Apr 2021 10:31:49 +0000 (UTC)
Date: Fri, 23 Apr 2021 12:31:47 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: firmware selection for SEV-ES
Message-ID: <YIKiE+USYmCjQeSR@antique-laptop>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
 <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
 <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=phrdina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ryD2sl1k6rg/HaPI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=phrdina@redhat.com;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ryD2sl1k6rg/HaPI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 10:16:24AM +0200, Michal Privoznik wrote:
> On 4/22/21 4:13 PM, Laszlo Ersek wrote:
> > On 04/21/21 13:51, Pavel Hrdina wrote:
> > > On Wed, Apr 21, 2021 at 11:54:24AM +0200, Laszlo Ersek wrote:
> > > > Hi Brijesh, Tom,
> > > >=20
> > > > in QEMU's "docs/interop/firmware.json", the @FirmwareFeature enumer=
ation
> > > > has a constant called @amd-sev. We should introduce an @amd-sev-es
> > > > constant as well, minimally for the following reason:
> > > >=20
> > > > AMD document #56421 ("SEV-ES Guest-Hypervisor Communication Block
> > > > Standardization") revision 1.40 says in "4.6 System Management Mode
> > > > (SMM)" that "SMM will not be supported in this version of the
> > > > specification". This is reflected in OVMF, so an OVMF binary that's
> > > > supposed to run in a SEV-ES guest must be built without "-D
> > > > SMM_REQUIRE". (As a consequence, such a binary should be built also
> > > > without "-D SECURE_BOOT_ENABLE".)
> > > >=20
> > > > At the level of "docs/interop/firmware.json", this means that manag=
ement
> > > > applications should be enabled to look for the @amd-sev-es feature =
(and
> > > > it also means, for OS distributors, that any firmware descriptor
> > > > exposing @amd-sev-es will currently have to lack all three of:
> > > > @requires-smm, @secure-boot, @enrolled-keys).
> > > >=20
> > > > I have three questions:
> > > >=20
> > > >=20
> > > > (1) According to
> > > > <https://libvirt.org/formatdomain.html#launch-security>, SEV-ES is
> > > > explicitly requested in the domain XML via setting bit#2 in the "po=
licy"
> > > > element.
> > > >=20
> > > > Can this setting be used by libvirt to look for such a firmware
> > > > descriptor that exposes @amd-sev-es?
> > >=20
> > > Hi Laszlo and all,
> > >=20
> > > Currently we use only <launchSecurity type=3D'sev'> when selecting
> > > firmware to make sure that it supports @amd-sev. Since we already hav=
e a
> > > place in the VM XML where users can configure amd-sev-as we can use t=
hat
> > > information when selecting correct firmware that should be used for t=
he
> > > VM.
> >=20
> > Thanks!
> >=20
> > Should we file a libvirtd Feature Request (where?) for recognizing the
> > @amd-sev-es feature flag?
>=20
> Yes, we should. We can use RedHat bugzilla for that. Laszlo - do you want=
 to
> do it yourself or shall I help you with that?

This BZ looks like it's already tracking support for amd-sev-es [1].

Pavel.

[1] <https://bugzilla.redhat.com/show_bug.cgi?id=3D1895035>

--ryD2sl1k6rg/HaPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAmCCohMACgkQUi1kczAH
4YwawhAA1hvvGC108DtUbc93B4Qq8k66SKxx5RnK9xf1btj4KUl5B9NF3pLDcQFY
/Vruts6WQQkOomcwUHzBArwQWXHN8ANsOnz1qw6FS6xXXeFb6J/CAmlYIAvY3G7F
Vr7rQuk1p6M/af6/yXp2ccUjoJCmF4H120PAmFZiyvAAvYhw8TKv6B0/5pb/RzuS
8GDq7T1k5AWvtR2dyQ0coQljAocnmW8fgtTpGIE1VBHPZ0vIBk/gvrY6YVbi9Gtk
WkgsrDMft1h8LljDBYoLS+oV0xB0fZLIcGVM5QJj0G32aoEIForDXqLwv+q2y6M9
Lc5eVubdeeOk8DOAc4fi2xqXRVXp2LsH3AAa5tlkUwsfBfqjXc4A2Euu48Nh5v9h
EPTmviM1aKa7pVPH7M/d+3lq/zu2QQGO+/Zp9migL0MmRDsNNhiwTu0+9CtJ4HfT
jRsyaNZVHWeiQc2t6gHaQ4MIoUzM8myAuzkPcPwcdImv8QNHCMEl2B2xr8c4ppNi
ekYPwmg0xw/hPAgElxQ++c0iRZEcMbQwiPOjlf7aSfb5f/3CrVP2UTRniqBJWDE1
Z61VMv3ttRRXdNNxAKWzpCf7cFtmwo19qhQR6kks/JxWESYc7x61Vwzkf/Drq4he
tYTztBOQPsc/88g4Hp/YlyQ1TSwn8OlXEh77IGa8DXKi3ndchpA=
=HQM5
-----END PGP SIGNATURE-----

--ryD2sl1k6rg/HaPI--


