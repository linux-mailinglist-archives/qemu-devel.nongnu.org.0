Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D444CC6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:04:14 +0100 (CET)
Received: from localhost ([::1]:34592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrgL-0007QR-F3
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrZ0-00038Y-D9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:56:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrYx-0007Wh-QR
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:56:37 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mqrjz-1nuXXH11JR-00mpUe; Thu, 03 Mar 2022 20:56:34 +0100
Message-ID: <cd15c08e-d8bc-356e-11cd-645dda789972@vivier.eu>
Date: Thu, 3 Mar 2022 20:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/12] mos6522: record last_irq_levels in
 mos6522_set_irq()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OYZSt6mCCXVBajzPolPSUkrZQwXp82LrFdicW2ixNnd/ViW2Rt2
 aQIq+pYDf40LdAFDLYdClhhMmjrxqo6Q+fn/rWMSSBa1nY3iLVtoAEHWJGH+0G/P91nFobk
 gN01J0QdvHJnSgVtdATJS4Xa9IfwExvL0raTpFPjknB6Guz/svz/okP21f/in4k7tkGTf62
 HCmq6MUVsdAhNQaZFeoWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kyt1UeYxgM4=:8xE6TB58CSPpkCB08cJDVq
 i96QNtnYTwXGjOZ6ap1n//hERBugLvRRYFStpnGLAkzv2HadWAMmJgBNb7ZihkKFDXO4jIOFk
 NUpsWj8M7HbDixIJKYYuqllkbMjTrm1Qd5wrRop3IfIP2mV3+hf3o1a5tCCPXl+6d0Psg1mS1
 RFxLfKXTkSTKH6QWp3hAO6ayuflcvFzayovqEgK8VA4AWh4YZOTE0G6AzV0gvaMIIsS9ZWXEw
 0o7UQMoLEiwznOU7d29YixVAReid52+YZ/1jFb6dAQzVLAnxwlp4SC6gFQ32YcSpUo2SO/hod
 rYyV6I3SlJX4mUU3Zzwt1waJgADLwzCsUtmDYpUaCqmPrLEYCcGnSPDgKVp+bkDZsn78tYhlV
 wld9hyOIyoOy2XW/9QiTYcEr9J+Khn0BSG4yzdFdgpoGZneLeOu2csPRcnODKTVkPm2XudSDi
 XmpradBEiIiIPkZpDs5e3vkE7PhNk07LQ8c6xsIv2+3+mTFtNs6tf5lCPNDL4C3d1kWuMk6A9
 8AaKBiBPvaiDR0zqPJFKTllk2qmphkGDMtST7p0jCxys9/Grv8QA0Ft5TF397xCO1CAJsxK63
 5ythSC85JiV2jMiRjW1TW7XHBuMAXZL24mbPOTCYNoB3mIyEz834MHGHWTrmbVtuWadDhPt3t
 Cf50jmsN4LJHLYbXyTUrrc11sMNZ1to1RJ/ghgfsN9WcPU+rv3uSLEnnXxEbRnEeE7zE=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> To detect edge-triggered IRQs it is necessary to store the last state of each
> IRQ in a last_irq_levels bitmap.
> 
> Note: this is a migration break for machines which use mos6522 instances which
> are g3beige/mac99 (PPC) and q800 (m68k).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/misc/mos6522.c         | 11 +++++++++--
>   include/hw/misc/mos6522.h |  1 +
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



