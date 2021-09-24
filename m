Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A741707A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:54:23 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiqU-0004yy-3M
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTiph-00045s-Ik; Fri, 24 Sep 2021 06:53:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mTipf-0002oB-FK; Fri, 24 Sep 2021 06:53:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 308B2746353;
 Fri, 24 Sep 2021 12:53:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 081B0745953; Fri, 24 Sep 2021 12:53:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 060097457EE;
 Fri, 24 Sep 2021 12:53:29 +0200 (CEST)
Date: Fri, 24 Sep 2021 12:53:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 2/5] MAINTAINERS: Remove David & Greg as reviewers
 for a number of boards
In-Reply-To: <20210924095536.441849-3-david@gibson.dropbear.id.au>
Message-ID: <a2c9d721-969b-6220-e6f2-31c34738e@eik.bme.hu>
References: <20210924095536.441849-1-david@gibson.dropbear.id.au>
 <20210924095536.441849-3-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1415106647-1632480809=:16439"
X-Spam-Probability: 11%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, hpussin@reactos.org,
 aik@ozlabs.ru, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1415106647-1632480809=:16439
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 24 Sep 2021, David Gibson wrote:
> Greg and I are moving towards other areas and no longer have capacity to
> act as regular reviewers for several of the secondary ppc machine types.
> So, remove ourselves as reviewers for Macintosh, PReP, sam460ex and
> pegasos2 in MAINTAINERS.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> MAINTAINERS | 9 ---------
> 1 file changed, 9 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3408618f2a..20436be86f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1265,8 +1265,6 @@ F: hw/ppc/mpc8544_guts.c
>
> New World (mac99)
> M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
> L: qemu-ppc@nongnu.org
> S: Odd Fixes
> F: hw/ppc/mac_newworld.c
> @@ -1285,8 +1283,6 @@ F: pc-bios/qemu_vga.ndrv
>
> Old World (g3beige)
> M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
> L: qemu-ppc@nongnu.org
> S: Odd Fixes
> F: hw/ppc/mac_oldworld.c
> @@ -1300,8 +1296,6 @@ F: pc-bios/qemu_vga.ndrv
>
> PReP
> M: Hervé Poussineau <hpoussin@reactos.org>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
> L: qemu-ppc@nongnu.org
> S: Maintained
> F: hw/ppc/prep.c
> @@ -1356,8 +1350,6 @@ F: hw/ppc/virtex_ml507.c
>
> sam460ex
> M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
> -R: Greg Kurz <groug@kaod.org>
> L: qemu-ppc@nongnu.org
> S: Maintained
> F: hw/ppc/sam460ex.c
> @@ -1371,7 +1363,6 @@ F: roms/u-boot-sam460ex
>
> pegasos2
> M: BALATON Zoltan <balaton@eik.bme.hu>
> -R: David Gibson <david@gibson.dropbear.id.au>
> L: qemu-ppc@nongnu.org
> S: Maintained
> F: hw/ppc/pegasos2.c
>
--3866299591-1415106647-1632480809=:16439--

