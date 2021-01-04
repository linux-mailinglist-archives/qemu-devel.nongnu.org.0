Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DAA2E8F26
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:07:07 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwEKv-0000vM-Jr
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwEJq-0000IS-Li; Sun, 03 Jan 2021 20:05:58 -0500
Received: from ozlabs.org ([203.11.71.1]:57795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwEJo-0000rU-PH; Sun, 03 Jan 2021 20:05:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D8HW40JF4z9sSC; Mon,  4 Jan 2021 12:05:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609722352;
 bh=rwH0atFBoH3mQUgH+wm/tr+Pbh2VvezW/OU73AWNnsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D4S2tFSIW9KGEdqJF8RBFcZiLRT81h6u24N8E0tu/l0jPK/QLwUK/ftQIZRDzWCLg
 Rn0UliOh9yYKMcbWN/+iSKFUU638L8VhHv9PcmwgjdRqRV9bIJRoAGbW0YbaNuuB9S
 XHHaf/WXstW0FGHdQ37j19c4wuOVjn0TZZvPYnlI=
Date: Mon, 4 Jan 2021 12:05:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 0/5] Misc sam460ex fixes (was: Clean up sam460ex irq
 mapping)
Message-ID: <20210104010532.GB1915@yekko.fritz.box>
References: <cover.1609636173.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <cover.1609636173.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 02:09:33AM +0100, BALATON Zoltan via wrote:
> So this is v3 of a series that started to fix a potential problem with
> irq mapping in pci440_pcix (used by sam460ex) that got some other
> fixes along the way as by-products. But it turns out the irq issue
> this was trying to fix is not really a problem so finally we just
> update the comment for now documenting why it works and only the
> by-products remain in this series. Of which there are two more in this
> v3 finally fixing a long standing problem booting MorphOS on sam460ex
> (which I've got after debugging similar problem with pegasos2/vt8231
> that gave me an idea how to debug this.)

Applied to ppc-for-6.0.

So.. you're pretty much the only person who's shown any interest in
the embedded ppc stuff in qemu for a pretty long time.  Any chance I
could convince you to be ppc4xx submaintainer?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/yadoACgkQbDjKyiDZ
s5K5KBAAzlOItaM7nyS/C9wgYIRyFIfNkO6AJmKyDKNaHKwkHs8p6Jh7sYQVMPFE
wJTBgviJl5rf7dN5XsPvjm1IZ2Ef6IuTkhM0NCGJxoZcir01zrv0qfTi/eKTXOUt
IgrZuaykCxM2WcMBM0ot+9MaIxAn+f5HufgBUs3aG2t5bYSIqUToRnoH8Pxs2RL8
jFfY67+2SgEEx3XOFNUeDgSyubmZFg7pyxl8cxyENfm+fQpGrWTadaLKn5ZNlZhC
IsqkgLcks4nvrld3v44IwXTU1fjUxblcCbX3UW4zX5Pc+ehrHpEtSI9SfOb/8qE8
5hxLOyywCPni4Uwq4qThvcloPj46yTOBnNbbz1C6zW01Dz2tVEXAsUbAvENmntW+
3Ug5u9Eq8LqAbj+1gfA76JUAnvWLvqBHCU9c/nSQPKhT5U7/xylmN/bYJksREZ7R
BdkDShJ4NKUpAp/zw/MEwM7k9+1K06DE5nnoG2VbkVxe09eoHn8C37Eyg8FQs0NP
zBpWabx3ExhnhqyjSaCAUEe9DlJtSe7yowv3OvTxyRyMn7Iyd+i7pLpu+HPMaKiq
E+KF3u/JPm6Aw05282eNHIDvaV8PgynQZVL4+BXIqbpXbpCX+vvSpuFDFzdLFdJi
awcW9piJVPG817h4WgekbHN/Z2YS16T8rtcYihP/JMMVtZHrhE8=
=5cxn
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--

