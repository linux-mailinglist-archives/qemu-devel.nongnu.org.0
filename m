Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4A41715D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:56:46 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjor-0001my-WC
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTjly-0007AC-2f
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:53:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:22110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTjlw-0006yO-Hx
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:53:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-ivr34FCuMR-jj77BHtIO4A-1; Fri, 24 Sep 2021 07:53:39 -0400
X-MC-Unique: ivr34FCuMR-jj77BHtIO4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23EE51084684;
 Fri, 24 Sep 2021 11:53:38 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1943B60BF1;
 Fri, 24 Sep 2021 11:53:34 +0000 (UTC)
Date: Fri, 24 Sep 2021 13:53:33 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 2/5] MAINTAINERS: Remove David & Greg as reviewers
 for a number of boards
Message-ID: <20210924135333.3e065369@bahia.huguette>
In-Reply-To: <20210924095536.441849-3-david@gibson.dropbear.id.au>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-3-david@gibson.dropbear.id.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, hpoussin@reactos.org,
 clg@kaod.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a typo in Herv=C3=A9's address.

Fixing it from hpussin@reactos.org to hpoussin@reactos.org .

On Fri, 24 Sep 2021 19:55:33 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> Greg and I are moving towards other areas and no longer have capacity to
> act as regular reviewers for several of the secondary ppc machine types.
> So, remove ourselves as reviewers for Macintosh, PReP, sam460ex and
> pegasos2 in MAINTAINERS.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  MAINTAINERS | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3408618f2a..20436be86f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1265,8 +1265,6 @@ F: hw/ppc/mpc8544_guts.c
> =20
>  New World (mac99)
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/mac_newworld.c
> @@ -1285,8 +1283,6 @@ F: pc-bios/qemu_vga.ndrv
> =20
>  Old World (g3beige)
>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Odd Fixes
>  F: hw/ppc/mac_oldworld.c
> @@ -1300,8 +1296,6 @@ F: pc-bios/qemu_vga.ndrv
> =20
>  PReP
>  M: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/prep.c
> @@ -1356,8 +1350,6 @@ F: hw/ppc/virtex_ml507.c
> =20
>  sam460ex
>  M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/sam460ex.c
> @@ -1371,7 +1363,6 @@ F: roms/u-boot-sam460ex
> =20
>  pegasos2
>  M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/pegasos2.c


