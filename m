Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA735B769C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 18:41:42 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY8yi-0004Js-St
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 12:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY8sg-00008i-Ip
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:35:26 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY8se-0007Dn-9e
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 12:35:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4z2Y-1pH8nS0e5E-010xfL; Tue, 13 Sep 2022 18:35:18 +0200
Message-ID: <a87f3e42-a8ba-174b-0f74-b9d31be35535@vivier.eu>
Date: Tue, 13 Sep 2022 18:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/2] target/m68k: fix two writes to %sr
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2KKJqrNJ6RGReEO+vO+hCtvmD103QaLHGte8GGPfhmFMbds3amw
 HK0Cw2ayvT/evHpbdR3hkDNX5sSUtvwbTCSQYPU7CMPRQsv7qc0F48ghIaHtf8c9UAVDhCL
 CiKsN1bD7DCV3BAWeTtM3bSS/ig7uzNAeuBxVQZticwZ/4TEoEm4EJPJuU4PLZVBImeLDBY
 Ci29nplzGPvbvKLqnRHFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kk/DmLrtNX4=:oj8GmjuXV0zKroi+Jq4ajp
 VOMkgDHGF0ECOWm7kJtr++ZGCH4sEsXTeBBzCL38fcnbboQQHTu/cJgdTekXSxseiEmypkl55
 pP+HMsVvcdotXI4DgN/CbcpahxK2+P0OeeWSkNHXO1WjS+zWeasSUvri5TjPcwUoRL2va6Zkl
 x1WtK78wgWxAYHpA71h4qGi2JCU68FHkeRuJqMS/zyflety9gxJcM61q3nUywq/cAvuL6fh9t
 AZNy/BDJD9RGsQaDFayjW0FAkP5Tl5MI7teYWJP4u0dzN/DUGO5a1Zhyd5Gn+h3nYhT6Zan3k
 DXzPosJczkzMFCql2oU+X2TYXKBL0PNKSzGpILORBZARhySY+X2dqnqFujSteX2kSwVIBgUuK
 ZX5HB9gATi50E1GfRMFrh2Heb4a6WgagfyDH/eJUpXBeQWggLaIJRW+Qgoab9+ckifMfF9wS0
 tDIq22Q4Craz4A+2nqxR5BLDWQ96iTxR42ukG8ERnJg8cIj7Xy2YkDJCHBD6dwIheP4Lv6tqW
 kTDrxjaNXotLUGxma2vi9S4Gwtwc3xS147jz8ZO1iYPTgM+Ak78iXxnN6xgdKJG3ZI5z9O6Rh
 EI0IxCc/s1eioKfyeE8C4KJ805yWjY4gtLKk08Sl/2zUvVbbOzY4wjrKEmHPT8Mcj/fkkViyI
 o0QoghuqNzBgHBTWXvJoL+PdiP1y+9SltnZ2xI6PbicuTdINXEOpzPBn2fhjsy/hJfdS2g16r
 ms3rRxcUnrDaO8dX3r/Id5FIHwB4cG/OqAQUYJZLn+ikx/KOV3Ir8IBcQTF3rCsXLoGvO/6Kq
 KT1F4By
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 13/09/2022 à 18:29, Mark Cave-Ayland a écrit :
> On 13/09/2022 15:28, Richard Henderson wrote:
> 
>> The second was described by Mark in the lobby of KVM Forum.
>> The first was found by inspection of other uses of gen_helper_set_sr.
>>
>> r~
>>
>> Richard Henderson (2):
>>    target/m68k: Fix MACSR to CCR
>>    target/m68k: Perform writback before modifying SR
>>
>>   target/m68k/translate.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> I've applied these on top of my MacOS virtual memory branch at 
> https://github.com/mcayland/qemu/commits/q800.upstream2-vm and I can confirm that MacOS 8.1 now 
> boots here with virtual memory enabled :)
> 
> Possibly it might be worth including a tidied-up version of the "WIP: target/m68k: always exit_tb 
> when changing sr with andi/ori/eori" commit from that branch which is also related to switching 
> between supervisor and user modes under MacOS. Shall I tidy it up and send it to the list?

Yes, send it to the list. I plan to do a PR for m68k soon.

Thanks,
Laurent


