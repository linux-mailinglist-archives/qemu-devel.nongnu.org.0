Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028D15EC023
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:52:24 +0200 (CEST)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8CN-0002wc-0B
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7rr-0001Lw-2x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:31:11 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7rp-00064L-Ic
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:31:10 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTi9N-1opTmA2N4f-00TzwJ; Tue, 27 Sep 2022 12:31:07 +0200
Message-ID: <82c5cfe6-3c09-0bed-c773-2ae2c438941e@vivier.eu>
Date: Tue, 27 Sep 2022 12:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 6/8] linux-user: Update print_futex_op
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IX92hOasau7xCHcupa/1zeQmk85THLaCMuXS3e9jWQHHosi0k/8
 J7Z+dhxFNF5ivaICvaJkOPmQ4oxUl7JIPq9DRXuD6/wkEZHUl6CoBxKLOVu/UJKyOttI1o2
 aPe4FI7S29HIcZJw+NM3a3SFoWkW5Ncu0DTbg7bnwXDsPhjWH0034dyPiJj7RK29UQ1MSkV
 lS+naAlhdTFtBMC5pEQtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KXFJl2jJP4s=:BQkI/b/Wv151TCanJQlxua
 JubAs6Ba5BtDtR7nqm4BZJ1RH2LCJ3sCN17xYxO6SpvXOxdSe4ze1icBz5H2GXo4xJ10OSc3l
 tlE4uN7JF4eUt7IGb+NIi8fcAO6O32FldxTu1hCfzFD5zfhpfs9aKC8enm02mbdazZoc2h0nY
 iNVmlJotrS0+VeBwCdIwawvegFpLRNgM7ImGCVTe5EFgfUnj5Rni5oCpJbWfVqIc/MKLrUlFt
 Yj/Y0BY10lURbyv04KgPCwp6iG71ZEzU/BYpGLHSu/co3Jj5jy9nxGlVPUcP8dvcUAecmOf1F
 WvpyThwEoZLNJToeVu3BTdxu6wxWPdMvCVDI67bagPeKmIq8prKoRjy+ca4QhN0JKSypUBjxH
 x7rLiRQwSMJ1dx+X58IFqu4xBjwxKReZvmmmerOgAls6Fs8GHuhqYw3TeW8vP/ERbNMH69fUd
 6toM9xfHO88fCcDSRdVfafrTAl+WXtFAuymYhmw3buACPaA8s8YabgXIuHJA8V2JLPhlnHBCS
 VDY8d/tKcGeCM/oFOWxNS9adutyMjJn82WDGyYjPZWVLlq9FwrXekvGKdigFLXgzTjMTh9qoh
 EmsUDHdwEtN0iq3XgPFekeoPygiUPc8VKPyARLlxltmghEe6KxM+rFZixTINibYCV/bRqYaQu
 8PdG+UJMPX0jPf93dVd7GGvhUhi5AY3Z5Rbftq22Jfy9HJVB83RNzwTEDAlwvIwcULSrlefmg
 ic16HJ+3z6ENyHmegnvDJ482NbSvovrLHnrAfZY3amjkEI228OnOQFx4p5urEQ+DmRiuBaOmW
 OEc2X/a
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Use a table for the names; print unknown values in hex,
> since the value contains flags.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 65 ++++++++++++++++++++-------------------------
>   1 file changed, 29 insertions(+), 36 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

