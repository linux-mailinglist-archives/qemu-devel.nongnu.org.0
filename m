Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973741D161
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 04:25:50 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVllc-00019G-R5
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 22:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVlhh-0000JV-Om
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:21:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVlhd-0003tv-TR
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:21:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKcSH3WX8z4xbL; Thu, 30 Sep 2021 12:21:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632968495;
 bh=R78Ol/y5p4PLdUebkhLKoRGxGuj3QSW85i/94IZMFdI=;
 h=Date:From:To:Cc:Subject:From;
 b=XYX23teguW0OBXGb52/0POy58bRGgsRGVvICsHL5g0jNli4rGHhtCj+Bk4SPW3n7L
 v+PtI8gn+qTDdrGr44cdvJ3FuCT2cB0kORzxiDBQBYTHfz9aQIW75Ee79oNBn+CPVS
 gi7kmNVgvzAWzLRohrIdUtSCoNtlLB7hCejAy10o=
Date: Thu, 30 Sep 2021 11:59:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Rust in Qemu BoF followup 2: Rust toolchain availability
Message-ID: <YVUaDrf5BXPkZu5r@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9AG8NhoFAXVqazJS"
Content-Disposition: inline
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, slp@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org,
 emaste@freebsd.org, hreitz@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, brad@comstyle.com,
 alex.bennee@linaro.org, imp@bsdimp.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9AG8NhoFAXVqazJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again all,

I've now done.. or at least started... the second part of my followup
=66rom the KVM Forum BoF on Rust in Qemu.

I've extended the page at https://wiki.qemu.org/RustInQemu with
information on Rust toolchain availability.  However, I found I had a
lot more open questions on this one, so there are quite a lot of gaps.

In particular:
 * I haven't so far figured out how to definitively check package
   information for RHEL & SLES (they're not covered by repology, and
   RHEL module structure confuses me, even as a RedHatter)
 * I'm not at all sure what criteria to use to consider something as
   having "good enough" rustup support, so that information is all
   blank so far
 * I've taken a bit of a stab in the dark about what Rust version is
   recent enough for our purposes (1.31.0).  I strongly suspect we're
   going to want to move that to something more recent, but I don't
   know what, which will mean revising a bunch of stuff
 * I'm not really convinced that the way I've formatted it is
    particularly good, but I haven't though of a better alternative.

Contributions to improving this would be most welcomed.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9AG8NhoFAXVqazJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFVGgwACgkQbDjKyiDZ
s5LoIA/+IPF9FqGbed+Qy5nQeLplSZphOpQkkIb07/g98vYOolv+MEjFMbRo7wrj
aXHvXHXlvdOoHrt0gZNA+gFcHDkWufx8cnAKx5yKUHTaU71L2O8w7d/P8no74IVQ
xuYSNSsrzkGJ5A6+V/XscnNUWHuRUxHkCcxlvY7zqRzyjPfOPxeCYYROEOVg5QxS
aBSL7nP01l2+88IxthZNQsDY9tittTPkDlZiTjSnO9WVpk6JKvazsTsyECsq2hs6
9DuhkeV9mReumExy11opJIhc0wJcyUYIkDgHtsR9DykNTiMHZN/06FtxjShO4Gic
AKVWoR/DvSNRlBsiFJM/NwDTJlPiaV3fDyioOj942cLhgm+3jzKUxATelYSoBXkw
ffkQ5Z8SLZNktjjPTa0NOmPcU7EahaAfq0zNTttmBW79Jl16SpUb/B664Vws6kTc
GLS8HIHLYMDS+f9QqpZDp3zb0xSe6A+qtDndB/6oikoDK19ZCc08Xox3O02YYVT+
qMLGkKSGlGaYxXZL6dRDYWQUlDGpYaUuFSKfZufeuHHAtT8umekCo2f1VL1/at7i
JP8SbFhnFBaUK/wwvW8b8SJfmqklR3dZ7NCJxtQaHr13ML6HckYiIccw6ip9Q32A
up7L/7v7+275NYXeN+mPQLxtMc5LqBbWX44PsInWQjpOsMbe3CM=
=d0CD
-----END PGP SIGNATURE-----

--9AG8NhoFAXVqazJS--

