Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DA5AA159
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:05:39 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrNZ-00078w-Bl
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTrKb-0005FS-H5; Thu, 01 Sep 2022 17:02:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oTrKX-00026M-T2; Thu, 01 Sep 2022 17:02:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 69A3B74632C;
 Thu,  1 Sep 2022 23:02:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2EF64746335; Thu,  1 Sep 2022 23:02:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2D653746307;
 Thu,  1 Sep 2022 23:02:25 +0200 (CEST)
Date: Thu, 1 Sep 2022 23:02:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 00/20] ppc4xx_sdram QOMify and clean ups
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
Message-ID: <1816eb34-a93a-c8cc-9abc-c38f5a4e38ce@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1938227092-1662066145=:314"
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

--3866299591-1938227092-1662066145=:314
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Aug 2022, BALATON Zoltan wrote:
> Hello,
>
> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2

Now that the queue is flushed it should apply on master so

Ping

Regards,
BALATON Zoltan

> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex. This is all I have for now I don't intend to make any more
> bigger changes for this now.
>
> Regards,
> BALATON Zoltan
>
> BALATON Zoltan (20):
>  ppc440_bamboo: Remove unnecessary memsets
>  ppc4xx: Introduce Ppc4xxSdramBank struct
>  ppc4xx_sdram: Get rid of the init RAM hack
>  ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>  ppc440_bamboo: Add missing 4 MiB valid memory size
>  ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>  ppc4xx_sdram: QOM'ify
>  ppc4xx_sdram: Drop extra zeros for readability
>  ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>  ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>  ppc440_sdram: Get rid of the init RAM hack
>  ppc440_sdram: Rename local variable for readibility
>  ppc4xx_sdram: Rename functions to prevent name clashes
>  ppc440_sdram: Move RAM size check to ppc440_sdram_init
>  ppc440_sdram: QOM'ify
>  ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM controller models
>    together
>  ppc4xx_sdram: Use hwaddr for memory bank size
>  ppc4xx_sdram: Rename local state variable for brevity
>  ppc4xx_sdram: Generalise bank setup
>  ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>
> hw/ppc/meson.build      |   3 +-
> hw/ppc/ppc405.h         |   8 +-
> hw/ppc/ppc405_boards.c  |  19 +-
> hw/ppc/ppc405_uc.c      |  33 +-
> hw/ppc/ppc440.h         |   4 -
> hw/ppc/ppc440_bamboo.c  |  29 +-
> hw/ppc/ppc440_uc.c      | 267 +--------------
> hw/ppc/ppc4xx_devs.c    | 413 -----------------------
> hw/ppc/ppc4xx_sdram.c   | 723 ++++++++++++++++++++++++++++++++++++++++
> hw/ppc/sam460ex.c       |  48 +--
> hw/ppc/trace-events     |   1 +
> include/hw/ppc/ppc4xx.h |  66 +++-
> 12 files changed, 844 insertions(+), 770 deletions(-)
> create mode 100644 hw/ppc/ppc4xx_sdram.c
>
>
--3866299591-1938227092-1662066145=:314--

