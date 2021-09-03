Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1A40096E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 05:26:55 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMMKT-0008Aa-Nt
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 23:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMMGk-0006Kb-Dx; Fri, 03 Sep 2021 23:23:02 -0400
Received: from ozlabs.org ([203.11.71.1]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mMMGh-0005EF-5K; Fri, 03 Sep 2021 23:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630725765;
 bh=M1wfW3POZ1s4K8pZn0Wbl43gs5jAIri4ihV3ywtcK/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I81nk0UiOzZIgU2SjaSKgSlsM/e7rGjfFGy9tQivEdWSh5TqZ5uLiLYB8JzYByKjv
 MxbPgdKnoQf9dxM+y8XW1XAk/MjIQeU07GJpsnkjIbdoRZQup6VWytJ4Ofj0YM+QFw
 e+wh8CdBLjJ1GjJWQinrN0AL6oy9lWw2IDEYlLlg=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H1g2s5LWjz9sRN; Sat,  4 Sep 2021 13:22:45 +1000 (AEST)
Date: Fri, 3 Sep 2021 21:45:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 26/28] target/ppc: Replace g_memdup() by g_memdup2_qemu()
Message-ID: <YTIK35r5tWqs8US/@yekko>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-27-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YrBYwP/4GpI03OJ0"
Content-Disposition: inline
In-Reply-To: <20210903110702.588291-27-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YrBYwP/4GpI03OJ0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:07:00PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu-hash64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46f..2ee6025a406 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1122,7 +1122,8 @@ void ppc_hash64_init(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    cpu->hash64_opts =3D g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_=
opts));
> +    cpu->hash64_opts =3D g_memdup2_qemu(pcc->hash64_opts,
> +                                      sizeof(*cpu->hash64_opts));
>  }
> =20
>  void ppc_hash64_finalize(PowerPCCPU *cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YrBYwP/4GpI03OJ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEyCt8ACgkQbDjKyiDZ
s5KSdA/7B6R7ERH3RvRVfbpr2R9syLywVbWMy7eBD1S+XTfEIT4JcelfN11AykK5
6cqSsyTGZkPmjgguDPnzmCJDy1Xri0aJWp/oOTpwUrH5q7DT2MK3vniaZ/UEdT0k
ny/Ab9+tm5rUPHyeTskB6rWIjuLLok+d/933K/wTmTQcCUTXcKcz8tP/kG4Ni80Q
X/U+h1QM8ilyYHLpWtTzjgX7pBCh0o+mSdm0sLq7rS1y5JBPc+BKVaZIZ5RxR6LW
8Tq0/g8QhHWiiwDT8CWRttc4jAJQzDXbnnmJ2D/WWWV6q37XPZiOyTlMhMOp++Un
BJMTCnD9H0YmE76A8MDF47bfcf0GvbkHldzF9FooqGcweem2YZHgJKcRPNx2oqtD
uHlPjp5vwylH1z36twVF+MgEjXPWSLySNcSEaFmbZFTqWquRroI9JdYrp3mTEeWf
GzdAUrRczUVxEMomi5hroG6moNDcJnh13nYNh13uLazXI03YIrUjS9v9fxR42cTC
wqWtq/vVm6Lg44CNTztodnastS6RfuaNMowE2HIC66xFKWUZQmmz4IrfC4U1iiaD
U92ltytwL2ZqFZKQ5mK+YrzcL2rrP1QV6X30g7eP9HXXRta0CBKIrmX4Uy+aCaG6
ORMDyDKq9wDKJXv6nnj5aIFSevIMgEN2bpmW6EIOoxkpUT5sBMI=
=86Pt
-----END PGP SIGNATURE-----

--YrBYwP/4GpI03OJ0--

