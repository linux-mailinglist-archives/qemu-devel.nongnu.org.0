Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AFE43C4ED
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:18:15 +0200 (CEST)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfe8T-0005aT-UZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfe6J-0004F6-Be; Wed, 27 Oct 2021 04:15:59 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mfe6F-0007Vw-4Z; Wed, 27 Oct 2021 04:15:57 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8QiW-1mbGNp3Qqe-004XEa; Wed, 27 Oct 2021 10:15:41 +0200
Message-ID: <fba478af-d444-18e2-d66a-d3f011fc9c2c@vivier.eu>
Date: Wed, 27 Oct 2021 10:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211004083835.3802961-1-f4bug@amsat.org>
 <ff832553-d5cc-ded3-1364-2413d38af0b2@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <ff832553-d5cc-ded3-1364-2413d38af0b2@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RXwkRdrAOc/njsm1uwXY4msbk444+8CemtGEAf7wzmX3h/2MKFl
 eNNRm6iFQdVAAWSgd0nbR+JtgLq+Pd4YH6XnfBVU+dO+vilKJByV/uH5atkawAr90x8Oz7e
 pRKaRcbxyE+fFbKxpcNiGP8Ls2HNTvUo/hGpHwEC41nxFJRcmsfT6I0ThBnDnt26FqwWRIy
 JYRS/1BXEw1TB6K0BXhGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lH27LU1DBIE=:NRBb6qwX2RrfaaDMdpMk4u
 qX2LUTNsXvvovIx3upAwHr3KHWlO6dW1iRdyT2H6acZXhcq3YQVU9kQ4hVBbc6kcdGiNprPoG
 fwenB3MSjDiB4YNPBNlGPfidnTOWxuCwCtZuoMeS2fOvg9G9NBFh3jNc4s6a5ik6eec295dT2
 XKFvs5lJvDVA0Yu0XU0WeAsKiBIv2KS1ktc8806PlCz28P/B+mesh2BExr3KAi390hjZ2CdQs
 dPTgfDLExnjZ+lk0Vt5x7GQ+wqWOaeGjqlm/ybI3KjBoXgjokpa2nLIWRJWYxnRE006s/nHHA
 CvNM3Ugk/ZJsT/wSAMjyiT4/sq/uCNFfEdQMDntQGoLjnV2fMby3LQR5qKPaYgW+9LlOHbuV6
 tU5hUSIiWOh4V5uo1ZtFXmMqSH7tSxLth6hm27Mxh8SjeEAz+ywqm+eFOzc3m5Uf4nVCJgJ2n
 fSz2lBtqdQDHz93gRIAO7pw3cgOigH/zqXe7s0Vq6/l5wP5rbxUC3ByqYs0rYmvnj+X0wB/Y0
 5IuXc7o0PrpWeoaoU8+eUUmnclmGS2suiCnss8XsQbKMMzNofVZ6ITjEi1rzuBckLnzf5HS9o
 V/4rhnOJjK9OlxlCncf+rIBffst7zBV/Eo+l3ighMG9/2cp51VDLpEZC8KE2UcodRCzMDJiJQ
 Wdjnr1QuTsTR0A7nzd3QC6hzDGUboWfTtx1hhr5aOx4cmu4TsLWBdFbQtJktCzul6lkg=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/10/2021 à 06:15, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@ (patch reviewed)
> 
> On 10/4/21 10:38, Philippe Mathieu-Daudé wrote:
>> Hardware emulated models don't belong to the TCG MAINTAINERS
>> section. Move them to the 'HP-PARISC Machines' section.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   MAINTAINERS | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 50435b8d2f5..002620c6cad 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
>>   M: Richard Henderson <richard.henderson@linaro.org>
>>   S: Maintained
>>   F: target/hppa/
>> -F: hw/hppa/
>>   F: disas/hppa.c
>> -F: hw/net/*i82596*
>> -F: include/hw/net/lasi_82596.h
>>   
>>   M68K TCG CPUs
>>   M: Laurent Vivier <laurent@vivier.eu>
>> @@ -1098,6 +1095,8 @@ R: Helge Deller <deller@gmx.de>
>>   S: Odd Fixes
>>   F: configs/devices/hppa-softmmu/default.mak
>>   F: hw/hppa/
>> +F: hw/net/*i82596*
>> +F: include/hw/net/lasi_82596.h
>>   F: pc-bios/hppa-firmware.img
>>   
>>   M68K Machines
>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


