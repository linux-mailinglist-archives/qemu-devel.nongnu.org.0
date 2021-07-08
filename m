Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148833C16B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:00:00 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WRT-0004xH-1k
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Voc-00054U-RR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:50 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:54989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1VoW-0000Hv-HV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:50 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2m7Q-1l3GEC41Ou-0139Na; Thu, 08 Jul 2021 17:19:33 +0200
Subject: Re: [PATCH v2 1/8] linux-user/syscall: Fix RF-kill errno (typo in
 ERFKILL)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b84ebdb0-e28a-63ad-81c7-0dc7b02c0182@vivier.eu>
Date: Thu, 8 Jul 2021 17:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g4XFhyu5ijjwZbPNhBq18q9nPFv8zFqfsqg8xVFZkPGcLcUg4ny
 Ja54rxeOhUH/MbrkscH+21qKlcNsukikNbKRfg7QYs832FJP7Ha2Azce+SSUM/YncTWcKhC
 389dVwKB427UcL+FEb/tSsvDCpOSmBMsG5YcjIhdRackohx9gZyLDFJNRsz82REl74/Skmn
 OTJi6KTazP83gr2QREMwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jgRAJGH3ed8=:ZAU1ISjo62YzioMedlQXds
 qeUlo2JKoDCqTib/YXBuL3XdHJpl1ElYwfW8peaVbhHCGsFGITVhnqyaJsQ7XHlk0zj5cPala
 BZqWAJwwtvPGCywYf2Wrnyh/T0XxNHyU/8hycjMTjHMf7YwP/WlDOIX/s/LCRjX7EwzPvw+cB
 xucIOp8PH55v7bOleZLhmo29MAtmNwli/x2LkUE6GcbIbZJc/FcqzWA2eP3dp59CEWiZ0z+sD
 kbDiu0J0VRBXk6mT2bTFM8puIJAd8/IRasSje/GuquzpkrAQygCQP95YygB01Dmz9JO5/kV41
 0PKQTnvhYAXrVMJVtRwHNdG3xFMOeF+/tFpkPtnOx8FsjWzGyAsycdHeFg3NQKLwh5oopkOas
 vl4jnqRRm4SNCC3rExMtvR5uqriiN4LtAkEdMACFoJbLZQPCCWl5/qCip7EhUaosc9D9Y1nu9
 e9aV6OVr1wOVe2GpYYKiezaWSQilNhCQhc10ByWLTTMsQn7BSBNyyLFb63VhTBGM/X/41COjJ
 Dbn03AOg1/ylCWc6ns4rwg+OiStKKm4+6E8ro3zOgx/V6SKjWIX2zLgYa86pUpqxmgVtNmuso
 7b3PtT5+g4M7kK+GVwtEmsMHuPmb/vLOilQVxLTJaPiL0lCxf4Eyishxnl+7vxu4vzW2dvq5o
 krKQtg243lVtQmefXAA5JchKdr3akV2bWJY1BExGlv5k8fpwzLfcVIckzUXLBLHGG72u4ct+K
 J4/skbncGUOLKNvDgYe/ImuEQuRGHvd/b1VDs7Ehj559W0O43hazAgDOMfOFf8KScwnowrOGI
 4gWZAY/GDMwEmw/sO3AHiD17uYk93JYaucaB9sNCXLoyLstogIr8XNR0hwL/Nq/zUmlZ7pk
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> Affected targets: alpha, hppa, mips/64, sparc
> 
> Fixes: fe8ed7d5794 ("linux-user: Handle ERFKILL and EHWPOISON")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e826206d22..4842a1987b7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -629,7 +629,7 @@ static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
>  #ifdef ENOMSG
>      [ENOMSG]            = TARGET_ENOMSG,
>  #endif
> -#ifdef ERKFILL
> +#ifdef ERFKILL
>      [ERFKILL]           = TARGET_ERFKILL,
>  #endif
>  #ifdef EHWPOISON
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

