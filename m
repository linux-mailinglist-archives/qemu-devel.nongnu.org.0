Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7F2E7FC7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:50:47 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuwTe-0004hB-AY
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuwRg-0003SZ-Ss; Thu, 31 Dec 2020 06:48:47 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:21317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuwRa-0004VJ-OX; Thu, 31 Dec 2020 06:48:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 295287470F1;
 Thu, 31 Dec 2020 12:48:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F275C7470EF; Thu, 31 Dec 2020 12:48:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F09637470F0;
 Thu, 31 Dec 2020 12:48:34 +0100 (CET)
Date: Thu, 31 Dec 2020 12:48:34 +0100 (CET)
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: David Gibson, please read
Message-ID: <71db1c81-696f-7bae-8bbc-5c6e33c3ea73@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

I've just sent this but my messages to you are bouncing with:

<david@gibson.dropbear.id.au>: Host or domain name not found. Name service
     error for name=gibson.dropbear.id.au type=MX: Host not found, try again

after trying for a week so you may have missed it even though I've cc'd 
you.

I've also noticed that my patches don't show up in patchwork and my From 
address gets modified by the list that don't seem to be the case for other 
messages so I wonder if it may be something with my email.

I've sent this to the list too so you have a chance to see it, please 
reply off list.

Regards,
BALATON Zoltan

On Thu, 31 Dec 2020, BALATON Zoltan via wrote:
> v2 of https://patchew.org/QEMU/cover.1608937677.git.balaton@eik.bme.hu/
> with added Tested-by from Guenter and revised patch 2 as suggested by
> Philippe.
>
> Regards,
> BALATON Zoltan
>
> BALATON Zoltan (3):
>  ppc4xx: Move common dependency on serial to common option
>  sam460ex: Remove FDT_PPC dependency from KConfig
>  sam460ex: Clean up irq mapping
>
> hw/ppc/Kconfig       |  7 ++-----
> hw/ppc/ppc440_pcix.c | 28 ++++++++++++++--------------
> hw/ppc/sam460ex.c    | 16 +++++++++++++---
> 3 files changed, 29 insertions(+), 22 deletions(-)
>
>

