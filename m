Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E202BFFD9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:18:50 +0100 (CET)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5BZ-0002LQ-Mj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52J-0001In-5t; Mon, 23 Nov 2020 01:09:15 -0500
Received: from ozlabs.org ([203.11.71.1]:48537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52G-0006dP-Mp; Mon, 23 Nov 2020 01:09:14 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDH1CyCz9sVJ; Mon, 23 Nov 2020 17:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111743;
 bh=rBWl0re+jjrt/NvAVRE6kU/uCY5mI41Pw2l+O6zFfPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kfWGSST0zmcB5ktHjPS+D9YCnVXqh4pYbEP0QyvCfEB/FIaoidm1SsHtWebD+n/ND
 bZJRw8Hoq19QqDofWuDki8S/0HuREfDVgtETOcp80/Toepi0yRpJIJ4oWZGoRTPymC
 I7s+Iw+7vlu14pkEp3IRuPxkSEhzRePYhYTlq1KY=
Date: Mon, 23 Nov 2020 16:46:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v3 6/7] ppc: Add a missing break for
 PPC6xx_INPUT_TBEN
Message-ID: <20201123054609.GS521467@yekko.fritz.box>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
 <58864f26-7e06-efc4-86fd-b7b710def15e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R0KbGFzrRdaLlFh/"
Content-Disposition: inline
In-Reply-To: <58864f26-7e06-efc4-86fd-b7b710def15e@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R0KbGFzrRdaLlFh/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 12:46:32PM +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> David, can you queue this patch for 5.2 (bugfix)?

Sorry about this, I've been on vacation.

Although it is a bugfix, it's been there for a very long time and
no-one's hit it in practice.

So, I'm disinclined to push it in this late in the 5.2 cycle.

>=20
> On 11/16/20 3:48 AM, Chen Qun wrote:
> > When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed wa=
rning:
> > hw/ppc/ppc.c: In function =E2=80=98ppc6xx_set_irq=E2=80=99:
> > hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplic=
it-fallthrough=3D]
> >   118 |             if (level) {
> >       |                ^
> > hw/ppc/ppc.c:123:9: note: here
> >   123 |         case PPC6xx_INPUT_INT:
> >       |         ^~~~
> >=20
> > According to the discussion, a break statement needs to be added here.
> >=20
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> > v1->v2: Add a "break" statement here instead of /* fall through */ comm=
ents
> > (Base on Thomas's and David review).
> >=20
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  hw/ppc/ppc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> > index 4a11fb1640..1b98272076 100644
> > --- a/hw/ppc/ppc.c
> > +++ b/hw/ppc/ppc.c
> > @@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, i=
nt level)
> >              } else {
> >                  cpu_ppc_tb_stop(env);
> >              }
> > +            break;
> >          case PPC6xx_INPUT_INT:
> >              /* Level sensitive - active high */
> >              LOG_IRQ("%s: set the external IRQ state to %d\n",
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R0KbGFzrRdaLlFh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7TKEACgkQbDjKyiDZ
s5JZ3xAApOAnr6iAFeE5y3QbiyuSxXA+E/pUK2yIF0pocASe1N+eapY0OZWP0ksm
cOUp9KqTrIrQ/lfU7fDfMezjTOjn4U8CCU0bLFRpf7RsjPlAHzb0PDdIdsIMcOxP
BJaAAGbUlk/OS+2JDIABY+7zk3Pnvq4wTwfA3j2hBCwspyfS0vjCuslOMDAVobEG
Feeal0KCouTgA9To8OBvUIyaxD9UtSgNF+YPHvKtzqMyL74tKPi+yrqtm82G0Wll
bGjOuJ2COdnVGO/Z2Roo7v02JirnslFIWyivdvReltxKOacDS7H4BnljJT5Dfl1Y
ZvIbSOiCdzX5pti3cCMMaLqK3LPsSiWROshw8wSFQ/zorX+di0YLn+9QEwQqZujW
I0bBLiu6/0GpREDvXrZ7qP+KCYGm3KNQd2jyvF7Nv7iLJXUq5hNfcv3qD3Z9q7zv
oqkwx8S2lMH4uG0bQR+GMnFO40bzvBB2TJdtHU+yTAZmQGs8sIH/St5+DkhlXE4L
1oB/QAQIE3dlXTCs1GlmPQEGwVZN5nG7375PQ4/MdcdxLmHHDAFb0Gx4uokt8uCs
5pjVfACyzehVz3XOPGEk1z3XR7DaD6/TcAAdtUFOnVwhWUrTQQbJR3Kgad826Ys1
qkkPxnbVYJWRCm+E7OJg0iYfgsexgyCX7pMI0cM7vLRdRsRDWU4=
=JUGW
-----END PGP SIGNATURE-----

--R0KbGFzrRdaLlFh/--

