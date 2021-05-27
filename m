Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629F539249D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:54:30 +0200 (CEST)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5ED-0002Ot-FI
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58T-00060N-Rc; Wed, 26 May 2021 21:48:33 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42079 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58R-0001tI-OR; Wed, 26 May 2021 21:48:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gz0lbVz9sWQ; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080095;
 bh=wYdHBIgATXHabkW72GOXvsnPv3KK2alFvGn+IyaDWgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcDnKgWG/QKt0DLbdSGLHV2gl7nttbUGX+9cGfkxmkkkb2whHKuCt1imUTwm/5M/K
 J9m/6B89FuxJnamWlNHLhFCLWiOncv2qIi5G8+mbFVVo59f/phKEHa0vWeTPhcLRGA
 29bi8lHRnM2KnaZ6luT687eB1+UuIeTHw15MYuAs=
Date: Thu, 27 May 2021 11:21:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
Message-ID: <YK70Cbg8acE+bjUq@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N+7xwVpBp4oS/FC/"
Content-Disposition: inline
In-Reply-To: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, farosas@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--N+7xwVpBp4oS/FC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 05:21:04PM -0300, Bruno Larsen (billionai) wrote:
> No more architectures set the pointer to dump_statistics, so there's no
> point in keeping it, or the related cpu_dump_statistics function.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai)
> <bruno.larsen@eldorado.org.br>

I'm happy enough to stage this through my tree, but an ack from
Eduardo or Marcel would be good to have.

> ---
>  hw/core/cpu.c         |  9 ---------
>  include/hw/core/cpu.h | 12 ------------
>  2 files changed, 21 deletions(-)
>=20
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 00330ba07d..b700d884ad 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -218,15 +218,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flag=
s)
>      }
>  }
> =20
> -void cpu_dump_statistics(CPUState *cpu, int flags)
> -{
> -    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -
> -    if (cc->dump_statistics) {
> -        cc->dump_statistics(cpu, flags);
> -    }
> -}
> -
>  void cpu_reset(CPUState *cpu)
>  {
>      device_cold_reset(DEVICE(cpu));
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index d45f78290e..6d14923206 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -93,7 +93,6 @@ struct AccelCPUClass;
>   * not be used by any callers other than the pre-1.0 virtio devices.
>   * @memory_rw_debug: Callback for GDB memory access.
>   * @dump_state: Callback for dumping state.
> - * @dump_statistics: Callback for dumping statistics.
>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>   * @get_paging_enabled: Callback for inquiring whether paging is enabled.
>   * @get_memory_mapping: Callback for obtaining the memory mappings.
> @@ -155,7 +154,6 @@ struct CPUClass {
>                             uint8_t *buf, int len, bool is_write);
>      void (*dump_state)(CPUState *cpu, FILE *, int flags);
>      GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
> -    void (*dump_statistics)(CPUState *cpu, int flags);
>      int64_t (*get_arch_id)(CPUState *cpu);
>      bool (*get_paging_enabled)(const CPUState *cpu);
>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
> @@ -562,16 +560,6 @@ enum CPUDumpFlags {
>   */
>  void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> =20
> -/**
> - * cpu_dump_statistics:
> - * @cpu: The CPU whose state is to be dumped.
> - * @flags: Flags what to dump.
> - *
> - * Dump CPU statistics to the current monitor if we have one, else to
> - * stdout.
> - */
> -void cpu_dump_statistics(CPUState *cpu, int flags);
> -
>  #ifndef CONFIG_USER_ONLY
>  /**
>   * cpu_get_phys_page_attrs_debug:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--N+7xwVpBp4oS/FC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu9AkACgkQbDjKyiDZ
s5KKeBAAtHv5YJI5uSUaF7qhlptjYTEHwGvdimE6nr8V9117zPV7T9JXZtV5ELzD
5nQjIQlTe73a3e0RbChj8toabWtxiknSa8s4mO41DSx1A+i7QQnfQnnc/XGDBURe
eBXEwrx/sXh+zGfRQ3Y+C06Um4b/in1QSxgK6NhmQagKe0VQNieblp0RihSvWFiO
bIpaLNaM4euTX08uhv3TzJahH1Q0A6QhKRejakjG2GgXa7d4y41bdBvgEz5qrBze
8f+z//RVuf1cpQHhcVwk8MEEr3f6oKv2d9k+ZhsI3qPi1jYn+E15Cabt0aAzGXuO
3WvDNszE1ww4xEdZPBbhHj9y6s2sVCudYdDmIqFuC+sXoFZtRqopC6CsBGzwlZzT
Y9gxMLbaPUlZCNJ2dZSGXngJ0b5qL9s7/DrO2557IZuiLYIZz5RxER5/iDWulaXy
dbqg9SJ1fsW2NXXoWBPyY3fInHc+16jDFrbL56or/HhiG/8VWzOBO2xFu1iAofe2
Yurh/BYsbCYmgv3EcBGsfa3bx+yuyBo/5J88/6K2JqfDK2i9KWtvx3xN5Btu+0wu
e1ZX5YXGMkdOsNoaiqsOi+YQH/4drvLqxVFr8lsN4bG/M2tRe4C0McR9LpV5JHpt
RIGdv+pjPJNofbNSA9xAsa+KYCmYi0m3FmzKLcouHrwmjIZM31s=
=RegV
-----END PGP SIGNATURE-----

--N+7xwVpBp4oS/FC/--

