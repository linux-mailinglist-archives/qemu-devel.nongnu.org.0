Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1E3FF88A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:59:39 +0200 (CEST)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLxYQ-0007es-9J
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVf-0005H4-Bp; Thu, 02 Sep 2021 20:56:47 -0400
Received: from ozlabs.org ([203.11.71.1]:54697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVd-0006Dk-4p; Thu, 02 Sep 2021 20:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630630598;
 bh=XXRA9E9bkfiMuArjbNTfx+r3Un7G6QIyGWXT2AEimqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/oOJX4wVez+0NVv34NrPleBWRl5YwYrRYxkIYCYr2DBSXFoQW3ujaLS8VYNkCkdh
 k+y3JMpbgn9tPsrOUDPXq+7t9kf9MvRy3873T3nWL9uuJ/xjlikC8YswJYUk9vfu76
 vduXzNxO6Vij/+kbOiSMh1QGiktvH/h6gdwa0iwg=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0zrk2QpHz9sCD; Fri,  3 Sep 2021 10:56:38 +1000 (AEST)
Date: Fri, 3 Sep 2021 10:49:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to
 sysemu and TCG
Message-ID: <YTFxEPkY6Eq1+Xe/@yekko>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-21-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6Kw+8nBbrWcu5Nha"
Content-Disposition: inline
In-Reply-To: <20210902161543.417092-21-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6Kw+8nBbrWcu5Nha
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 06:15:33PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Restrict has_work() to TCG sysemu.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6aad01d1d3a..e2e721c2b81 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -8790,6 +8790,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr valu=
e)
>      cpu->env.nip =3D value;
>  }
> =20
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool ppc_cpu_has_work(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -8797,6 +8798,7 @@ static bool ppc_cpu_has_work(CPUState *cs)
> =20
>      return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> =20
>  static void ppc_cpu_reset(DeviceState *dev)
>  {
> @@ -9017,6 +9019,7 @@ static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
>  #ifndef CONFIG_USER_ONLY
> +  .has_work =3D ppc_cpu_has_work,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .do_interrupt =3D ppc_cpu_do_interrupt,
>    .cpu_exec_enter =3D ppc_cpu_exec_enter,
> @@ -9042,7 +9045,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> =20
>      cc->class_by_name =3D ppc_cpu_class_by_name;
> -    cc->has_work =3D ppc_cpu_has_work;
>      cc->dump_state =3D ppc_cpu_dump_state;
>      cc->set_pc =3D ppc_cpu_set_pc;
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Kw+8nBbrWcu5Nha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmExcRAACgkQbDjKyiDZ
s5IeEBAAv3cpcInuLFJXsDvzVly7wSr5p5Tp9oNaBy8UvvGyoBX2eesw8Om/A3+P
S/tu8jqAI/GRfxWwBaE+wNg+Fmpdl3CK+ThR/6t9NA5BhoBwy5rwsM4V32BYkawN
NS5jP+L14XMC5MMa9o1IbnrNIPcpSA7kLTxq6sZxP1UaSvLecauVW2a14q630sUN
0mQEVEq0V/dO9bB01U775VN8Nzwxc6khrC8oufvhvSL22oYCjQTvOTslr7LEN5Ro
Bb/6zxAXhGR1A8aBLekm7RSlqY767gZjEtIdn1zjx6g/owGyARjDez0rzwhiBL8C
WqVsrRndk6jLRe1SJSRpZvgCx0EybrQyITVbeyMM4A/lXZYmDD2HKvOuXpUtnNZg
frxhAADG1KW6Y1Ufvklqyz9YGnFpztZL6XevPw1xfXXFvC3jyZpBNYP5XrilV44G
Sl7xomR8sRiJqzvJ2fWj475h07KiQ5NjXVvX5NvWy4okv9IphyXh8JoxyQsrA2b5
zIuqvUOy4GNPsunnxcNha90XiMsN6i5ds/ibiTyMwKbllU/hgUI3GEKVICncvbGt
LmIo3UFw/vTG7+lqCUxRZUtGBBgDZlsyxpkAGXfiBf+aISLrhsCHQeXxbD18AGBO
tECHtorVH7MbCNLHks/1Ey6DsZyaJnMdBoNjA+d4GpSUzASXzxI=
=o8a9
-----END PGP SIGNATURE-----

--6Kw+8nBbrWcu5Nha--

