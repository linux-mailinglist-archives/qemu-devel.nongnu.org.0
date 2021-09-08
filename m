Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C540349D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:57:16 +0200 (CEST)
Received: from localhost ([::1]:55556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrWG-00058n-0F
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrSs-00031o-Ih
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:53:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrSr-00038g-6p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:53:46 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDyoU-1mGBwx3bm8-009zma; Wed, 08 Sep 2021 08:53:43 +0200
Subject: Re: [PATCH 10/12] mac_via: remove explicit viaN prefix from VIA IRQ
 gpios
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3d8e40c6-006f-61dd-d212-e71c659d9252@vivier.eu>
Date: Wed, 8 Sep 2021 08:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fJ3rrRCLbk8eEB4N4KAfqnBZ++5bf0fsT03+kNdpXdnzDOXHEzz
 xyheIqKn+yRjR+GH9WQSLal1Wpul3N0Z0NM1CsQlDD1woQLClBfi4Tx1VAkeAQ0kseleHyb
 4AW7ngzVEJ1G/XgDf4ZvrvX9IcX1+BUOIm/ZUtubATqrsG/3VwrfdLkNOQspkMp2cSX9Mw/
 /PO2LCffvF/YS8jZTs2EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1MjQvYR1+ts=:8pNHiwNPVXjS99Yi98kBSy
 alvkQWcVKgHnrIuDNunVQiVBPcPGZFbCen/T7XR6GO5GSu4E2bcZJoNw2pD3/tjCpZP7Qf0ws
 qt+jH0oNuaFpIVQq6IRIKo9Yi4SL4nHp9bO0+W7JmWec0e1kQLY2mGKaMZQdlHX5YmuIGpuu2
 ZqwHyUxc4yVOIIXwmQQ1cm68O2hsgKiAkCGOpUjwmoQBT/DeYrr9Aqlu5CDh/DGtJN9cFMNeq
 wuKWFU4kjq5QmHArfP/bspYH9PimqG8wDL/tsojATA9x2Qdu8XxPi6zN08JeDyyFoWxkr70zD
 /m4ybkvOFl4N+XeQl2Kk3lTf98oRZEs5cbC/ZyZGDT4+/B1Vl5AcMfDj9d0P9eAQxjsw8P0M5
 N7+m5g6V/sQOjZiMy4Ag4zFLomz4yDtWEE2chn1XYE9Hzjw0rvIwtGHqHKrVDZq0Ab8/DCCzI
 avUZMCEM0pMMbT45YQd219mPU8eAZlK8lEVoCZPWckOuW93vnQB8XtH0btwGeTwMqcoEYZGhx
 SsPMyLPGLe3y8f+1X6CQuJWFropcQQX852OsfCh7YKcGJ4j7Tz3mFRRlTJWhom+ZgIsHxP4em
 x/AvHGlnDFAvCe0HXQNk38bx/uu/R3ewC0hPxIm7dV/qMkk5JeFPJx33iGSmaxHnQduUVycR9
 nZJ4e6aENd/pvxcFf1qY9R74vzBokQgLDKJcVAE37jLhK4r14KZU53EpmCyjJ/S+HwpJOomhf
 XD6/Mzo00rToSkWtBj6n9M+y8i83z//hmLzk1Q==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> Now that q800 VIA1 and VIA2 are completely separate devices there is no need to
> add a specific device prefix to ensure that the IRQ lines remain separate.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c    | 10 ++++------
>  hw/misc/mac_via.c |  9 +++------
>  2 files changed, 7 insertions(+), 12 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


