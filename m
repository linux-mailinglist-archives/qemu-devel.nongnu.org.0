Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E369B037
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3He-0008Gb-LT; Fri, 17 Feb 2023 11:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1pT3HB-0007qd-Kk
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:07:58 -0500
Received: from 77-173-18-117.fixed.kpn.net ([77.173.18.117]
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1pT3H0-0001fb-J8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:07:55 -0500
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id F0B452FF093F; Fri, 17 Feb 2023 17:06:42 +0100 (CET)
Date: Fri, 17 Feb 2023 17:06:42 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IeTsL3ygDfdK2IKP"
Content-Disposition: inline
In-Reply-To: <87a61cbmti.fsf@pond.sub.org>
Received-SPF: none client-ip=77.173.18.117;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--IeTsL3ygDfdK2IKP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
> I feel the discussion petered out without a conclusion.
> 
> I don't think letting the status quo win by inertia is a good outcome
> here.
> 
> Which 32-bit hosts are still useful, and why?

NetBSD runs on a bunch of 32 bit-only hosts (sparc32, ppc32, armv7, vax,
mips32 etc.) that all run Qemu fine. They are all actively maintained and
released as part of the main releases.

Maintaining 32 bit host support is thus vital for those machines; not everyone
runs a 64 bit system.

with regards,
Reinoud Zandijk,
NetBSD developer.


--IeTsL3ygDfdK2IKP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmPvphAACgkQgpw3AEPI
qmjUTwf/YeWTHxyKgHEsdxGKaH4uHuyVuRPS9biWrQf/4cD/i7arHhkfjfz54Li2
dGRtnWtZY95BVvbo9qiSGD0aTnUAJDLrVXt1O5uLb3JiRt4csUcBKVK1TZqWTuE0
HJgnWiIJYsGMSw6W69+cF8gWi0bXsaY5kd6sWo3rcr+tTzzGa3Mn5mGDVG9J7y+/
ioJh6SVpT91qZasauGjeGKPH2ENTs3V1mhuh+BRY54ojVBbaVArnaK0EI9C4hRUM
ZtMlsm4mmkL1QGPxEFhR+uWys1fI1kPT2inriW6rURWUAsqEgqVBvooWdzwukKqq
mEaBygxAde3FlPBC3dht69doPK328Q==
=c5dn
-----END PGP SIGNATURE-----

--IeTsL3ygDfdK2IKP--

