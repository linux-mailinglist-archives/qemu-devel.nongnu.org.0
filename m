Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D731B048
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 12:52:49 +0100 (CET)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBFxI-00009C-G4
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 06:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBFvb-00088X-6J
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:51:03 -0500
Received: from mout.web.de ([212.227.15.14]:57429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBFvY-0004jb-9a
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 06:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1613303438;
 bh=EWVL1GqwdE6IMOy9zmNNcJ1lpYuraeKv5JGevWXgZ0I=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=DrMbuGLINbdNWMVoEEU8oiP6Xa7+42JNt9QSeExWLg5KTQSv9+13qoOcDb1bB3hKN
 G6iZlsCsc80M+LAUNPzxa65SDKLtQVBH0E9zdRbhOYzWXbIGr1IXD1WGnNKI3H4IwH
 s5h3eKt6MkFpatX9EwsFVWPkzKJvA9EMVRfTvHZY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.128]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MDPYb-1l5WMt2qth-00GtJQ; Sun, 14
 Feb 2021 12:50:38 +0100
Date: Sun, 14 Feb 2021 12:50:36 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 00/10] Fixed some bugs and optimized some codes for COLO
Message-ID: <20210214125036.3661503f@gecko.fritz.box>
In-Reply-To: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_hZV_obzStWm9YN9s3r4wqH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vgAoboa92NZc56xNMHHHzkrm0i6vYaCbjHEN95C6ixcS8Ft6rIf
 aW8hz3h1+AxzCjGaPtNkVQP+0pNbz6fBLY6/vQF9XAJrhgdyaGe8GIbKwqhZ3DEw3bdivBi
 4/AYwfc+IUAqcsOI6f3ICdBTZu5+pQV/zQ/s2G9ISy7d+pdv5qx5N+pwdzow2Zq3tGEYO9C
 JZYG0/taqYdq3JtZH/eAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QZyyNPo/uAc=:d/G65uQl1Q0oCqVJvwAA3J
 Ffq4sD9fywIm4jziMM92/5VUtLmL0t0LUHxCK/ph0aPyOUDxlXZhouhI4TOaysJQcpl/szNwV
 +a1kwSxYom0VFa36kG1t4P4+U4HgiqYfxPcdP9QKuzAUG5frnFBEueg1+4V8raJsj5s2W89IN
 NlvFoT6w/oyiMpGMK5u38iQLh4Wg0BMMpWMAsy4gDQXCT6CwZjcsu6pA2n8BteZ1lgbI7l/8U
 A54NnNUqLrar+p/EfKWEzlpsxKnmDn7OTo+lNw27eC6XOvXTg7iJRWKRiLmwelTlqILtdaAl1
 th+ugC3DDJSpYR89ImvXLcsm97pD76JnK2+JkrAVgsoHE1Jv/ifw+Z5OEkbmWjedi2QVBd4SS
 Ys7R/avHJ04N0LHEY1Pf6j94GJQCcF3aXpXn5RsCv5+tu6l6nUYBIlc/fNIRyVWsMKC1YH2Hw
 YvtdjBN5OOob9IS8CHyn+UKhOVchKi9elo4ZPueNScn9Av1RB7DqGtnQ3Mer9qKCnNI3KuXWM
 CMnpf+fxgDtCx8XAcnrygqtTv3wMBMfJbM7jl42hBqZyN6JapntrzWV69X9eFusbZ7S18G0mY
 EoaYDVYxkgNO5TWcNv/a6mqPjQGr0Aa3u93E6EevOifM+HEESLmuPDIu2HMKRvcy0skIjgHoZ
 Gn08KgT4ACmeiR0nPpqz63czUEgOIJTc2+mKte2dcomwu+TMS05LEujZmFU/jbvy619ma1g5F
 dnecYvueLOIi4A/1e3pCpb+Sl9u5k6Dm7GwKOUh3SofdsWXeYWWZgkTo8WZ8hTWxjGjjCP9wd
 Z3d89wZff8Z4QP0PEelX7PYXRof4ArRcGH4cfnatZtXMDHglvZsgjEIfCHcIFJxmR4yme5qDd
 DU/UyYxkUQs7qFrpPLcg==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/_hZV_obzStWm9YN9s3r4wqH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:25 +0800
leirao <lei.rao@intel.com> wrote:

> The series of patches include:
> 	Fixed some bugs of qemu crash.
> 	Optimized some code to reduce the time of checkpoint.
> 	Remove some unnecessary code to improve COLO.
>=20

The rest of the patches look good to me. Can you address my comments
and send v2? I'll then run my test-suite over it and give you
Reviewed-by for the whole series.
Also, you should split this into two patch series: One for network and
one for migration, so the respective maintainers can take it trough
their trees.

Regards,
Lukas Straub

--Sig_/_hZV_obzStWm9YN9s3r4wqH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmApDowACgkQNasLKJxd
sljnCA//YaXmN+npBgvSiiLaG6AqNPJbRhMjh5ibg6+7Lo6aU9v794pUBTUROheH
yEVZ5rNFmaz0Pa7T2i7pIddn9894JzU0riI6O+reYy0eQvGf6Wep1AfkmJ6MfuZm
gdz8JVv7YCgyEeiRfcbue8dlpNz3q284xYMQZgpLrZAwSQR9awH8kd04aoD5kCmn
vvgvzPnOJwYP/iQj3T10axLXSzP2Yb1dzp94kSat/5pbWvUjMe/bfjSEVK+LnojP
ATuJ78bAW/80hggsVnEERNZtsU/HlTGWIMc9KedwCXC/ibOOdCqOstIPxtXGP1hy
Vt7rEChVWevY9qTDmOP0frurRrnWGIX3n46OY4B1dtqbuZ4dZSX5gshHMzeazuvP
+7oyuzXAz3R8842pASHyC3kaJwq/g+pAsIGxNml3U7hbH1m5KOgxGtGvIcCRPBgv
SjHhfTnZ0jNG2GhfnB2dAbk/YM+IX8rgG2wI+TEUOya7WmzS/l5u6SMq9Ra/w67I
Ve1ojtOQZfjrI7EG7cB3wDtkMCx6saszis4u5fu+Ip3gOptjN/2nE1ySv8BZIURn
zUrOhKltH4D4MB12mA7JLwvF677X+tmR03oAhxDXYFIBwmfTelpoFi86QGrHhsP4
tU9OxyXA7axnOJYY9uHQz3EbejMtupEj8c/5fBdZ4Fphecm2FdA=
=6nJQ
-----END PGP SIGNATURE-----

--Sig_/_hZV_obzStWm9YN9s3r4wqH--

