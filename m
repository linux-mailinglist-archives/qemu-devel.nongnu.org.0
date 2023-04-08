Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC966DBD29
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 23:16:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plFtg-0002m3-FB; Sat, 08 Apr 2023 17:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1plFtf-0002lq-2C; Sat, 08 Apr 2023 17:14:55 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1plFtd-0002aT-Gp; Sat, 08 Apr 2023 17:14:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A359D60AD9;
 Sat,  8 Apr 2023 21:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9849C433D2;
 Sat,  8 Apr 2023 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680988484;
 bh=Vo5nLmrf6z33Or3scG8N3FLyeOo3L8XLOetrrRaZJvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bzUxpRx3lKLiY22FTLzROFu9JAGHmgqJX3jhU7G+PEuDWh3MT4fgrTatGuSv5cXbU
 quI9OKdH47I8MQjO0Poho8ViskHFlCwfdIVPuVBbSr3Ywd3Z4piJmD7rMdU14il5o5
 osPRFo6FNZ/CWY4zoeG7kqtNpOzJZtK37arvD46wuzZfpuWbGDVeZzfIbP0zC5M3LX
 Gxo7EOcMfbFjRL9dxfcbj2ZVblCmYoCM5bebTmJSOfTqECg4tmrNPT1R6Po0qmWFt5
 pQosCw+NCztG08shc0ECQQoRfo1ryB3lPsioRtREsDvd787K3urazlxZsd+SM7HIlP
 0Q8xLaWpoRLuw==
Received: by pali.im (Postfix)
 id 0FF927B7; Sat,  8 Apr 2023 23:14:41 +0200 (CEST)
Date: Sat, 8 Apr 2023 23:14:40 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
Message-ID: <20230408211440.vdkgjorvipxgayke@pali>
References: <20220703195029.23793-1-pali@kernel.org>
 <20220704101851.lgbeojdntx2bzm4f@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704101851.lgbeojdntx2bzm4f@pali>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=139.178.84.217; envelope-from=pali@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Monday 04 July 2022 12:18:51 Pali Rohár wrote:
> Just for completeness, here is list of all Motorola/Freescale/NXP
> processors which were released and have e500v1 or e500v2 cores.
> 
> e500v1:
> MPC8540
> MPC8541
> MPC8555
> MPC8560
> 
> e500v2:
> BSC9131
> BSC9132
> C291
> C292
> C293
> MPC8533
> MPC8535
> MPC8536
> MPC8543
> MPC8544
> MPC8545
> MPC8547
> MPC8548
> MPC8567
> MPC8568
> MPC8569
> MPC8572
> P1010
> P1011
> P1012
> P1013
> P1014
> P1015
> P1016
> P1020
> P1021
> P1022
> P1024
> P1025
> P2010
> P2020

Now I figured out that also P1017 and P1023 processors were released
with e500v2 core. And I have not included them in above listing.

They are not linked from the main NXP P-series webpage, so I did not
find them at that time. Product URL has to be "guessed":
https://www.nxp.com/products/processors-and-microcontrollers/power-architecture/qoriq-communication-processors/p-series/qoriq-p1023-17-low-end-single-and-dual-core-communications-processors-with-data-path:P1023

> (sorted alphabetically; not by release date / generation / feature set)
> 
> All this is from public information available on NXP website.

