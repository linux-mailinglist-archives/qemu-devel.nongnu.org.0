Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDE539CAB9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:24:45 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbuW-00033y-Gd
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbtR-0002CV-UA; Sat, 05 Jun 2021 15:23:37 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbtO-0004OA-B8; Sat, 05 Jun 2021 15:23:37 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7s1M-1lkfwJ0lQA-0051mu; Sat, 05 Jun 2021 21:23:29 +0200
Subject: Re: [PATCH] target/hppa: Remove unused 'memory.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517101558.1040191-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cf677039-ff7c-2da0-b4af-dbaf8c5b6302@vivier.eu>
Date: Sat, 5 Jun 2021 21:23:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517101558.1040191-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oVh+O0s4JgacQDghyq7W7X1vhrBWokt35uZ9zyyJ/F7mb7aWuuM
 wTGNM6ObeCV8f+MDl+t98bzaHK59ctE9vt5GDCo4DrtSoZWcR586+wU4c2N+oFBt6j5VU9J
 eUWf/XmmxY9vn3kskpw4rTtTbAED8SK9XArY6EU3kQtwC8ex2THvQsaehwImii12EWCYS96
 mf92x103HYJtH0CkhLQWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1PNApR4T2Nw=:c9Wd+6mVIuNtfSxZNZVNJO
 pttbJpvsk4ZC+IeX1T08T8rz/NqZ0VqhyGpb9WWS1YXhmqHBXjZutb2qExpiPbnuR+SvvWd4N
 ZD7MDVU4kLXyHlQdnVHr4BJ4uRu5BMTL1U75/BhgjW9H7NWBIHhhAfmtiJASg9N9Ij4hZuAIe
 eLjeOg5kRbYumBODEoUouXe/8oGoaGsFFCHEgmXulQVKEFLqrsgeC3lmVnXZqD+E+80dD9ZL8
 w0yhJnCDuOMkt/EQUJP8rI6QX7mDf9aweDPmU3++te7kWV0kyND6VWrIdZkOsfk7cQr4rn+VW
 oFeEQVZYcCK4nHvRfMFx83fXZWMgUsdl6SVcsc51QSDD1O7BBTeqt2npf/x6eI15XU0XFmqfp
 LJ7GOVkEpSAPK5j/wHFUxyR5yNL3l0oo6j44ZEOs+1mZNLEpSKItyQcqXZjbg+tR7jJYOQXRn
 ZENjH4k1dtB99o5iY680Mc8peyWm9CN2r0mGbXzljvm8KNGfARfaJnZmKKnjTSSKRZEVWgALL
 sHvKBa47oIHtckGUVRpiko=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/05/2021 à 12:15, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hppa/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 61178fa6a2a..748270bfa31 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -22,7 +22,6 @@
>  
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
> -#include "exec/memory.h"
>  
>  /* PA-RISC 1.x processors have a strong memory model.  */
>  /* ??? While we do not yet implement PA-RISC 2.0, those processors have
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


