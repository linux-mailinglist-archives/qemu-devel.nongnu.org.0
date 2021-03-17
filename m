Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026933EC22
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:04:02 +0100 (CET)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMS5w-00010L-OU
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1lMS0h-0000OL-J5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:58:35 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58845
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1lMS0e-0007Y2-O0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 04:58:34 -0400
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id EA1F1C1EEA0; Wed, 17 Mar 2021 09:58:25 +0100 (CET)
Date: Wed, 17 Mar 2021 09:58:25 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFHEsXnxK62EXYLv@dropje.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316135301.4fd08476@redhat.com>
 <YFDcxAK8/XokMJoi@diablo.13thmonkey.org>
 <20210316181750.6306bfc5@redhat.com>
 <20210316213408.0de27ac2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="752y9X+j2X3dLHtA"
Content-Disposition: inline
In-Reply-To: <20210316213408.0de27ac2@redhat.com>
Received-SPF: pass client-ip=80.100.255.32;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--752y9X+j2X3dLHtA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 09:34:08PM +0100, Igor Mammedov wrote:
> Thanks for reporting it before it was released
> please test/review fix that I've just posted:
> 
>  "[PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset"

I've tested qemu with the patch, booted the install without specifying the
machine with -M and it boots!

Thanks! I think it could be considered fixed now?

Reinoud


--752y9X+j2X3dLHtA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBRxK8ACgkQgpw3AEPI
qmhcIQgAw5He0ElhZKzWHGMR4db/s1Pt/IjCkrSS5+ltH9xOX8imVAtmiAP/mJJC
h+3z/fLAMRMtUMxckzz96wBVn0P2GA4KLF2AuNXeNcGog0pt7I0A3TBGtHZLNW0Q
VSv8XLhsLfmzGRxel7CRdjRnU8wLfUkgZuuvBHfZQnseakGoBnHFwkSNhAvcVHmr
e27B22YtqR0FQGm2qjpLux72fdnq+F4Ih3iZK8bvVB4ArSt8kx3s8PFbzDiLPYIQ
NnhyeqTMJ/qYO6v0/rs2QPoP0TvlyMopOPvjtLrDsMu3dDH/vJD6/s5IVY4V/z37
gD3Gm/7lb+Jjy4CtnnaCcIXRC64wTg==
=zHkW
-----END PGP SIGNATURE-----

--752y9X+j2X3dLHtA--

