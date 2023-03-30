Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25116D0573
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:56:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrok-00035t-Rm; Thu, 30 Mar 2023 08:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phrog-00034Z-78
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:55:46 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1phrod-0005q7-MV
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:55:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MI59b-1pcgjX1uQJ-00FF1j; Thu, 30 Mar 2023 14:55:20 +0200
Message-ID: <cb1daac2-d4cd-5291-f643-0bc4536f2c58@vivier.eu>
Date: Thu, 30 Mar 2023 14:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] linux-user/sparc: Don't use 16-bit UIDs on SPARC
 V9
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>
References: <20230327131910.78564-1-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230327131910.78564-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lGN/67RI6Y4fKwgoZyFRKuPOQ/rAaCpgebH1LUccWaWyEckYOQT
 1YjmU22FSVaEU0PA78Tmplygd/bTnenYtCRqZ25VAyv1wDJOjMyJrZSiofRqS+nxifaEghU
 VTzT2omvEZ+2SXcwJV7ukOeKRMJV5M9Aqxvw1Krgh/+cicOpuwt5BQyOTnJw6M0r286iGXJ
 zsJmFKpPAf2WC+lN37GpA==
UI-OutboundReport: notjunk:1;M01:P0:GzTm7HeZ3S8=;pxtQfXJfchp7udxq8raGJtrTEM2
 0aB5rjYssAYsQ8RqFErJdQS5aYJITWP9sOIPpJE+yMLryr8G/uDDIWpTTEivr/RhTLMv+HVq3
 gD29d5xJ107aQyFLmu5TuE8Kla5AItK7m9HKmxSewlpu3afRHqi4DCBXMifMx3+ehqZ4W5H8C
 YFRE57A6GX4TQwOHwyFe1IWeg27dXhRaQJYVuievxc1zGgPfYAva/4j4MRdPX7UJ6eujn+XNG
 IPYlNHnPSEBJd3gjwednW7wqCJwUPyH1dVNPA21Vm/3j3pWc3vgyEbz9irblC8H7F28dkE8D1
 zHiFw819JRqP2QY76oNICsnX79gFOz+njF/Bdaam8wgN9rL320sm9/9+WlLYuctxDygNIQPa7
 hjget/w2JFVFAmrHsTeilooIp/YXMHPpXXQ2Tvkc3Cx9ODzYHeRiXeGgbyqczaTNuhRtcmw3m
 fET6qob5wbFZWPzRerGnAGUzaGduiwN182YZdxQtpjGV/xf5roSkgxk1UjkDjTuoBECKYKcc3
 wQQMylhtiqZgugQBepPgPYLXlnetP5NBBn97SseavGAlf/z+AKCHtE4UWseydz3a6auHHfEKG
 +ix/vuZAuAmNVD600d7gacEfcbnGCYbfgXmRfJutBIsLM5rw5nMVTlcpw9frosc3GZNMqGwF6
 jvPOj2xv/zOoH715p1rfXqz8DyQcSabSWiG/E0IpfA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 27/03/2023 à 15:19, Philippe Mathieu-Daudé a écrit :
> The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
> the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).
> 
> Possibly missed in commit 992f48a036 ("Support for 32 bit
> ABI on 64 bit targets (only enabled Sparc64)").
> 
> Reported-by: Gregor Riepl <onitake@gmail.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Tested-by: Zach van Rijn <me@zv.io>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/syscall_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 614a1cbc8e..cc37054cb5 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -61,7 +61,7 @@
>   
>   #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
>       || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
> -    || defined(TARGET_SPARC) \
> +    || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
>       || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
>       /* 16 bit uid wrappers emulation */
>   #define USE_UID16

Acked-by: Laurent Vivier <laurent@vivier.eu>

