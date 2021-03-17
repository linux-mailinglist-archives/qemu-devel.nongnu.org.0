Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6E33F3FD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:32:03 +0100 (CET)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMY9S-00022D-S2
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMXoQ-0008RI-LH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:10:19 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65511
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMXoN-0001Qo-U6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:10:17 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 427A3C13ADD; Wed, 17 Mar 2021 16:10:12 +0100 (CET)
Date: Wed, 17 Mar 2021 16:10:11 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFIb04rrDojG10hh@diablo.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316135301.4fd08476@redhat.com>
 <YFDcxAK8/XokMJoi@diablo.13thmonkey.org>
 <20210316181750.6306bfc5@redhat.com>
 <20210316213408.0de27ac2@redhat.com>
 <YFHEsXnxK62EXYLv@dropje.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hqDJ1vCZmEOUwJlq"
Content-Disposition: inline
In-Reply-To: <YFHEsXnxK62EXYLv@dropje.13thmonkey.org>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hqDJ1vCZmEOUwJlq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 09:58:25AM +0100, Reinoud Zandijk wrote:
> On Tue, Mar 16, 2021 at 09:34:08PM +0100, Igor Mammedov wrote:
> > Thanks for reporting it before it was released
> > please test/review fix that I've just posted:
> > 
> >  "[PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset"
> 
> I've tested qemu with the patch, booted the install without specifying the
> machine with -M and it boots!

For completion, I tested the following configurations with the Win10 image:

              | NVMM/q35 | NVMM/pc | TCG/q35 | TCG/pc
--------------|----------|---------|---------|-----------
Without patch | OK       | XXX     | OK      | OK
--------------|----------|---------|---------|-----------
With patch    | OK       | OK      | OK      | OK


--hqDJ1vCZmEOUwJlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBSG9EACgkQgpw3AEPI
qmjszQf/eXRQn7KQsgcy3BpKCm5PBUb12CSB6U7MlTsdOxwLMlSJgsQ185O8Rgfb
F5CKhEi0rJaB6ZVTpKkI1eajD/soVB/rh31wAq3AfgI4GrOLZ6BY9iGASw2cfPMG
PPtzGWJaOefTdtF0352AzyGV5On/9n5fjO1iDwuQ/bTFR7BUoJ0qGvitNdejVJV3
HyekmzpEPMjClen/BuLwTU4GsGf8u/YuzQ9wp74FUnpImDVr3sqduLgBbRatWuBa
HdxfFag1jchldvz9PilK27f4dYFuZBtlIn90JnXyAdKPRo7tFE6dPaGkVR13rwC3
K9MdstYG/rRAAScSJ3+fbUPveFopVg==
=poTM
-----END PGP SIGNATURE-----

--hqDJ1vCZmEOUwJlq--

