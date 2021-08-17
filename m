Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676793EE4D1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 05:14:11 +0200 (CEST)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFpYH-0001ok-RZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 23:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUP-0007xa-Tm; Mon, 16 Aug 2021 23:10:09 -0400
Received: from ozlabs.org ([203.11.71.1]:58485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUN-0001qB-Ua; Mon, 16 Aug 2021 23:10:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpbcX3WF0z9sSs; Tue, 17 Aug 2021 13:10:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629169804;
 bh=mTBvveuuBIYM/x4tWSsm95/NjYUQWyGjso334ZpujJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BttRDe23xJ4s6pc3ZnB49ado76srHlzKaSBr+7VReu+wa0U3twm5ztfAIFPIBq+Jv
 irqXG4/xZqkWaHIlgLJcqA6tfnsLiEWQre1B8dYpD9FlN5pGtVDDGXs97J9czkrYAs
 i4mROa4AKJLb9YJyWldDPdW5oNss2oO8EPrIyU1k=
Date: Tue, 17 Aug 2021 13:02:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
Message-ID: <YRsmu+GznscSE9j0@yekko>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
 <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
 <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com>
 <YRnrn0EeT8apvqFI@yekko>
 <CAFEAcA9zPiJhPmghVtoWuT_A-JD3fNWkhD6B4t-J=FHaWZf2ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="USdXMxMMRCiUOSyP"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9zPiJhPmghVtoWuT_A-JD3fNWkhD6B4t-J=FHaWZf2ug@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--USdXMxMMRCiUOSyP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 10:07:12AM +0100, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 06:41, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > Indeed.  Revised version below.  I'll only attempt to push this to 6.1
> > if we're going to rc4 for other reasons though.
>=20
> We are doing an rc4, but I don't think we really need this in 6.1,
> given that the original leak only happens on a very rare error case
> ("/sys/ not mounted").

Fair enough, I'll punt it to 6.2.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--USdXMxMMRCiUOSyP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbJrsACgkQbDjKyiDZ
s5LgUw//Tz1vjoS4qv6Ll46JULhA8wyu4CtToIxFRFSDz3Y+oXEPSupoX8TXkYYd
3BMJ7s2CIz50wlbs0aue3BwHP9U6ncbESsYWZnxoUqeXJFfo3zN5Uo3j4x1DIgY7
Q0+Pxcd9V/9oyC0j+RnFNXyeMSxrQ8VXKGLyT+d6hMtqGI3uKtpmSdcc8gQpLlPq
rA+nYeLQ/2HwNNN6ZGjFyPbbOe2XRQGo/RoPOQ360MXjQ6kdBP3o72a3I3JG5yIY
3KX1gJMQJQWckMKqAbOp5cvDUJmtoZeufxEPCe7OenHRe8eMqokQW3eeYtHonPvy
FVoBscwOKj3+/RdBGVMTOgdbeawrs2tPmtc6EQ2WBpHTuIPGZcVA5aRLfxrNb4Kj
v5Uvm5oxL/KauYsJhgRYFl0ymVK9wPi/ZcHYFl8zxnPc9Rz3BYFxlXN+UgC7oR9t
mcDA6KReiiqkYYk6xjC1KE9scdpGjjWXL4iP2+bFVGR45Lx6OclNsjMgCwINxRaa
V9T1mUDtQSBMJg9B2LdJzgaqbxw1WVHZlKePEmrg1UB3UAYA7sLqdhr83gjq/pGP
svvWZ6Xgdsvd/M6knOb3Zo6zE0I9CPPUnXc0NZXpUj+FHeXwgxx78FXwo070uzWo
3sEftgIe+eGFgbALow9Dk8yzGMzuJtS8ZKR17NIH+Snzf0EkWh8=
=fA+n
-----END PGP SIGNATURE-----

--USdXMxMMRCiUOSyP--

