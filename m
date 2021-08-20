Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F763F2D50
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:43:04 +0200 (CEST)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4nX-0001i5-3o
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4lm-0008V1-VV
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:41:15 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH4ll-0003pU-KY
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:41:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-9ZfTLzVXP0SPUUTrxwdJFA-1; Fri, 20 Aug 2021 09:41:07 -0400
X-MC-Unique: 9ZfTLzVXP0SPUUTrxwdJFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FDAA1008061;
 Fri, 20 Aug 2021 13:41:06 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFDF5C1BB;
 Fri, 20 Aug 2021 13:41:05 +0000 (UTC)
Date: Fri, 20 Aug 2021 15:41:04 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 02/26] ppc/pnv: Change the POWER10 machine to support
 DD2 only
Message-ID: <20210820154104.7578fa35@bahia.lan>
In-Reply-To: <20210809134547.689560-3-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-3-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Aug 2021 15:45:23 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> There is no need to keep the DD1 chip model as it will never be
> publicly available.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  include/hw/ppc/pnv.h | 2 +-
>  hw/ppc/pnv.c         | 2 +-
>  hw/ppc/pnv_core.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index d69cee17b232..3fec7c87d82d 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -170,7 +170,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER8NVL,
>  DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
>                           TYPE_PNV_CHIP_POWER9)
> =20
> -#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v1.0")
> +#define TYPE_PNV_CHIP_POWER10 PNV_CHIP_TYPE_NAME("power10_v2.0")
>  DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                           TYPE_PNV_CHIP_POWER10)
> =20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d16dd2d0801d..b122251d1a5d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1916,7 +1916,7 @@ static void pnv_machine_power10_class_init(ObjectCl=
ass *oc, void *data)
>      static const char compat[] =3D "qemu,powernv10\0ibm,powernv";
> =20
>      mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
> -    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v1.0");
> +    mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("power10_v2.0");
> =20
>      pmc->compat =3D compat;
>      pmc->compat_size =3D sizeof(compat);
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index 8c2a15a0fb2f..4de8414df212 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -347,7 +347,7 @@ static const TypeInfo pnv_core_infos[] =3D {
>      DEFINE_PNV_CORE_TYPE(power8, "power8_v2.0"),
>      DEFINE_PNV_CORE_TYPE(power8, "power8nvl_v1.0"),
>      DEFINE_PNV_CORE_TYPE(power9, "power9_v2.0"),
> -    DEFINE_PNV_CORE_TYPE(power10, "power10_v1.0"),
> +    DEFINE_PNV_CORE_TYPE(power10, "power10_v2.0"),
>  };
> =20
>  DEFINE_TYPES(pnv_core_infos)


