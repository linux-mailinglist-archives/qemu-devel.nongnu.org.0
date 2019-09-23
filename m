Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E703BB218
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 12:18:50 +0200 (CEST)
Received: from localhost ([::1]:54542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCLQf-00045d-2S
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 06:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCLPJ-0003K9-3P
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 06:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCLPI-0007v1-2d
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 06:17:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50578)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCLPE-0007oe-Er; Mon, 23 Sep 2019 06:17:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4440118CB8ED;
 Mon, 23 Sep 2019 10:17:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 362915D9E2;
 Mon, 23 Sep 2019 10:17:14 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20190921103405.19623-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <908de611-8875-843b-ea56-2d75d8a8d30d@redhat.com>
Date: Mon, 23 Sep 2019 12:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Olpvw2oJcfJiOB0J6Sop2EsrcRUfoyM7Y"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 23 Sep 2019 10:17:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Olpvw2oJcfJiOB0J6Sop2EsrcRUfoyM7Y
Content-Type: multipart/mixed; boundary="FHhfKoDvy6YwjrajVhHlu9mi4XQJkx1N7";
 protected-headers="v1"
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Message-ID: <908de611-8875-843b-ea56-2d75d8a8d30d@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
References: <20190921103405.19623-1-philmd@redhat.com>
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>

--FHhfKoDvy6YwjrajVhHlu9mi4XQJkx1N7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 21/09/2019 12.34, Philippe Mathieu-Daud=C3=A9 wrote:
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index bf97ef3e33..59bb2fa0d3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>       * we might still make a bad choice here.
>       */
>      info->initrd_start =3D info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> +        MIN(info->ram_size / 2, 128 * MiB);
>      if (image_high_addr) {
>          info->initrd_start =3D MAX(info->initrd_start, image_high_addr=
);
>      }
> @@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARMCPU=
 *cpu,
>                   *
>                   * Let's play safe and prealign it to 2MB to give us s=
ome space.
>                   */
> -                align =3D 2 * 1024 * 1024;
> +                align =3D 2 * MiB;
>              } else {
>                  /*
>                   * Some 32bit kernels will trash anything in the 4K pa=
ge the
>                   * initrd ends in, so make sure the DTB isn't caught u=
p in that.
>                   */
> -                align =3D 4096;
> +                align =3D 4 * KiB;
>              }
> =20
>              /* Place the DTB after the initrd in memory with alignment=
=2E */
> @@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>                  info->loader_start + KERNEL_ARGS_ADDR;
>              fixupcontext[FIXUP_ARGPTR_HI] =3D
>                  (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
> -            if (info->ram_size >=3D (1ULL << 32)) {
> +            if (info->ram_size >=3D 4 * GiB) {
>                  error_report("RAM size must be less than 4GB to boot"
>                               " Linux kernel using ATAGS (try passing a=
 device tree"
>                               " using -dtb)");
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


--FHhfKoDvy6YwjrajVhHlu9mi4XQJkx1N7--

--Olpvw2oJcfJiOB0J6Sop2EsrcRUfoyM7Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJ7iIR+7gJQEY8+q5LtnXdP5wLbUFAl2Im6UACgkQLtnXdP5w
LbUW9A/8CkW8WK2gJmI5/raC+0iuGw6z4qoipdoHYoApP2yj0D/cn9qjErIVQAA9
W4Hq+g5t8id8f5znOKJlmGYTd+zXbroMHHBDIAncbWzASrrgtdoWLp58leY50Zhf
A/wgLNFzy1ZS4ENJlM/ay0jSmIrhl1DAhTsxmYQAlXbseHtBSUNkao1LNd7R2zO6
bNdJJrhbAciZZwhTfWK+wjITd+/z+pFobTD+AyOesPkJK5iAo040VSqP6qA83JSb
Ln0DKV2QDyN3gMjOwC5YIQJCjMmUrjjMslsnAT9IU2l40Fr1p88dFE3Vol5MtmMl
FVxTAza9z3vkONTNMzFSnXsLJU21kLO920jzuF96Xiy4bu1GT4/lvbNMLt9FYyTb
BHuKwuFRimRjdZgTrYRjIn0V5ttjXufakdq8lBfCZfARdcfoyB/K86TPYvQtImTW
gHwKVZGx6FOncd2BrGscY+Uh4PYbUuAtrr6mhcgyLIceyv70lfHzzxKEHStAOKQm
/o6d7wApMhQfj1yTy5fJ2P41Qqk8YABUNhyxXRPQM8ar/bihfWBQQGpOy2GtIpAy
49jt6ny/32Eos616Cm6cPSLkGgz5UwI1HrLyWp3fDS7CmLJQyLBM1Lv5T6890wq+
K+T5QvPUb0tuh3HtWiEKr9/wL7kbukKXia+jDxIaYSXe5VXOsE8=
=R82V
-----END PGP SIGNATURE-----

--Olpvw2oJcfJiOB0J6Sop2EsrcRUfoyM7Y--

