Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B929184C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 18:14:55 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUBKg-0002z0-Mv
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 12:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUBJL-0001hF-UO; Sun, 18 Oct 2020 12:13:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60536
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUBJJ-00065R-Pl; Sun, 18 Oct 2020 12:13:31 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUBJE-0001Mh-PU; Sun, 18 Oct 2020 17:13:29 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1602965621.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3f3c6cc9-3b65-d5b7-8aad-9e26afebb816@ilande.co.uk>
Date: Sun, 18 Oct 2020 17:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <cover.1602965621.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/6] m48t59: remove legacy init functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Herve Poussineau <hpoussin@reactos.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2020 21:13, BALATON Zoltan via wrote:

> This is inspired by Mark's series:
> 
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-10/msg00251.html
> 
> and implements what I've suggested in review of that series to
> simplify it and avoid code churn if implementing my suggestion later.
> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (4):
>    mt48t59: Set default value of base-year property to 1968
>    sun4m: use qdev instead of legacy m48t59_init() function
>    sun4u: use qdev instead of legacy m48t59_init() function
>    ppc405_boards: use qdev instead of legacy m48t59_init() function
> 
> Mark Cave-Ayland (2):
>    m48t59-isa: remove legacy m48t59_init_isa() function
>    m48t59: remove legacy m48t59_init() function
> 
>   hw/ppc/ppc405_boards.c  |  3 ++-
>   hw/rtc/m48t59-isa.c     | 25 -------------------------
>   hw/rtc/m48t59.c         | 37 +------------------------------------
>   hw/sparc/sun4m.c        |  5 +++--
>   hw/sparc64/sun4u.c      |  6 ++++--
>   include/hw/rtc/m48t59.h |  6 ------
>   6 files changed, 10 insertions(+), 72 deletions(-)

Unfortunately this arrived too late - I'd already finished the tagging and local 
testing, but didn't get a chance to do the final PR before having to head out yesterday.

I think most people here agree that this code could be improved, but I'm not clear 
that this is the right solution given that Artyom has already pointed out that 40p 
uses 1900 as the base year. There would also be an overlap with the ideas that 
Philippe has expressed in this thread which would cause more code churn later, so if 
this is something that interests you I would suggest starting a separate thread to 
gain consensus as to the desired solution first before working on an updated series.


ATB,

Mark.

