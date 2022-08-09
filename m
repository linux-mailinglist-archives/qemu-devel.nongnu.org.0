Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E878958DD9E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:02:55 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTZ9-000125-0r
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTKY-0006Bq-UB; Tue, 09 Aug 2022 13:47:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTKX-0000QW-48; Tue, 09 Aug 2022 13:47:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC561748166;
 Tue,  9 Aug 2022 19:47:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 56BFD747F40; Tue,  9 Aug 2022 19:47:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 54F0D747F1E;
 Tue,  9 Aug 2022 19:47:46 +0200 (CEST)
Date: Tue, 9 Aug 2022 19:47:46 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 22/24] ppc/ppc4xx: Fix sdram trace events
In-Reply-To: <20220809153904.485018-23-clg@kaod.org>
Message-ID: <c68a933c-7039-8f4e-9134-1fa6ca85fd8@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-23-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1556240402-1660067204=:57026"
Content-ID: <28df8761-924e-eb25-8a5b-5f19a9f04dc9@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1556240402-1660067204=:57026
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <96184e93-205d-8db-6ff4-090d5397dfd@eik.bme.hu>

On Tue, 9 Aug 2022, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/ppc4xx_devs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 8a8a87b03b28..c06c20b195cd 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -143,7 +143,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
>     }
>     sdram->bcr[i] = bcr & 0xFFDEE001;
>     if (enabled && (bcr & 0x00000001)) {
> -        trace_ppc4xx_sdram_unmap(sdram_base(bcr), sdram_size(bcr));
> +        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>         memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
>                            sdram_size(bcr));
>         memory_region_add_subregion(&sdram->containers[i], 0,
>
--3866299591-1556240402-1660067204=:57026--

