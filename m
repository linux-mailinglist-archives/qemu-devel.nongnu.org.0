Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C04B366A2D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:53:16 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZBPv-0005Hb-E2
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZBOc-0004q8-GK
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZBOZ-0005ts-Al
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619005908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dYMF84ONmkG43EcwAu+P2DyP98WOifV4Ksc7EQ9aQk=;
 b=CZlIh1EvKyJO7tdIkGxPjLS3fEa5ev9hvos9/FJMsMikTGy8Eoy5vE3MjM5qafjKlOL5dg
 InTf+bECAoj0A/5jVx3zMMs9PIQl/9pYbIkXm9e5kd62czfTbGvZlcPW6axPrCqzLICyya
 TpBXA3bDz+1nfw6wQ172RzTWDXvYFEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-7xyDnHhZOyy_zGtVE7oDVQ-1; Wed, 21 Apr 2021 07:51:37 -0400
X-MC-Unique: 7xyDnHhZOyy_zGtVE7oDVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 079E81006C81;
 Wed, 21 Apr 2021 11:51:36 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.195.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50B005C1B4;
 Wed, 21 Apr 2021 11:51:34 +0000 (UTC)
Date: Wed, 21 Apr 2021 13:51:31 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: firmware selection for SEV-ES
Message-ID: <YIARw09TcakElBco@antique-laptop>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=phrdina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VKyrxpirx3IUzasa"
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VKyrxpirx3IUzasa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 21, 2021 at 11:54:24AM +0200, Laszlo Ersek wrote:
> Hi Brijesh, Tom,
>=20
> in QEMU's "docs/interop/firmware.json", the @FirmwareFeature enumeration
> has a constant called @amd-sev. We should introduce an @amd-sev-es
> constant as well, minimally for the following reason:
>=20
> AMD document #56421 ("SEV-ES Guest-Hypervisor Communication Block
> Standardization") revision 1.40 says in "4.6 System Management Mode
> (SMM)" that "SMM will not be supported in this version of the
> specification". This is reflected in OVMF, so an OVMF binary that's
> supposed to run in a SEV-ES guest must be built without "-D
> SMM_REQUIRE". (As a consequence, such a binary should be built also
> without "-D SECURE_BOOT_ENABLE".)
>=20
> At the level of "docs/interop/firmware.json", this means that management
> applications should be enabled to look for the @amd-sev-es feature (and
> it also means, for OS distributors, that any firmware descriptor
> exposing @amd-sev-es will currently have to lack all three of:
> @requires-smm, @secure-boot, @enrolled-keys).
>=20
> I have three questions:
>=20
>=20
> (1) According to
> <https://libvirt.org/formatdomain.html#launch-security>, SEV-ES is
> explicitly requested in the domain XML via setting bit#2 in the "policy"
> element.
>=20
> Can this setting be used by libvirt to look for such a firmware
> descriptor that exposes @amd-sev-es?

Hi Laszlo and all,

Currently we use only <launchSecurity type=3D'sev'> when selecting
firmware to make sure that it supports @amd-sev. Since we already have a
place in the VM XML where users can configure amd-sev-as we can use that
information when selecting correct firmware that should be used for the
VM.

Pavel

> (2) "docs/interop/firmware.json" documents @amd-sev as follows:
>=20
> # @amd-sev: The firmware supports running under AMD Secure Encrypted
> #           Virtualization, as specified in the AMD64 Architecture
> #           Programmer's Manual. QEMU command line options related to
> #           this feature are documented in
> #           "docs/amd-memory-encryption.txt".
>=20
> Documenting the new @amd-sev-es enum constant with very slight
> customizations for the same text should be possible, I reckon. However,
> "docs/amd-memory-encryption.txt" (nor
> "docs/confidential-guest-support.txt") seem to mention SEV-ES.
>=20
> Can you guys propose a patch for "docs/amd-memory-encryption.txt"?
>=20
> I guess that would be next to this snippet:
>=20
> > # ${QEMU} \
> >    sev-guest,id=3Dsev0,policy=3D0x1...\
>=20
>=20
> (3) Is the "AMD64 Architecture Programmer's Manual" the specification
> that we should reference under @amd-sev-es as well (i.e., same as with
> @amd-sev), or is there a more specific document?
>=20
> Thanks,
> Laszlo
>=20

--VKyrxpirx3IUzasa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAmCAEcMACgkQUi1kczAH
4YxdFg//RdLBbZqP8wlFrdBTofFCpnlLTD3MJoli8ZQ2jBxx0TGqhe0vEdoVJ2DX
7bOptoQePiHdP039uO8IBEik2GiLInBzGyyh0K/TiO5XVzoc0mY3/Jw7yvWbmfrv
NVZdVZ/FxYdfw/KdgbDKtKXTPSSwussdnSkGrKEgbllX78YZKxV1i0f8kuh83mZt
mkHOOrC+h8DgJEvhv3e8c59Wyz/OgLbXYhXptn+2TR7SMVDw1JikZhd+DvZqWmIb
+vuiMX2RlGLipe/i1VSrzEWqx6EXy8i+pOehJZxlq6ZXJJH7cAmuE4/IwjUcLFKp
g+UWJRvvoguiujgdnJ4zVi4O6mUX/qKpqIBxmIqjITEUuTIbysL8EvQ7ZgxQst4u
yrMRizdtqGW7ScGpXN7vqGviq5Ose84+J2dOQrxAK8R7U+KQa+epcrMEpxQTVAUQ
DwiLtUzeoUjL25AiTn3mBqECZu1BgIQdo1WPSPpdaT6W4tGS1+Q+0nxvdZkwwYFr
kAmJVI+ylHqUHCa6AHXlq6lXlxD591HclG1vkEZ9YVFf0Za7+Uxjiq2MCr33xIq+
hif9xqG0D9gbRNG5Q1ZUJgc/x0I/ufQPxS6gXSKubLtQzdj+9qqa2Nr8A4iw2bPE
zkCmD3qSqcSyWY9+hGD7wuS5VNjMTztyjOvbCsVZ9kN++Q8vHeg=
=Lmm3
-----END PGP SIGNATURE-----

--VKyrxpirx3IUzasa--


