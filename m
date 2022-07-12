Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19B572989
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:55:24 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOmf-0001Vd-1J
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOQB-00057M-9b
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:32:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOQ9-00049V-Dx
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:31:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id o4so13099425wrh.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tXWFPpA4TnmdFeW8zHL0XdF8sOZeyxaXr7aKDmNqhCk=;
 b=PchlZIvoKlAjPrKNQ52Vuz25TKRx91tLiCICarTtnwUXAjCFThxMKen05YvZFvud8f
 u+shys1sgTyldlgJmIZrm2V6qrAnaoQMT7Gy92LhhcOC/taTdsXrGbo/egyl6Cs7vTcL
 2eiVHKqIuoPwx8zPH1p9z+Sa9CEcHnm98sEGRVVx9kC9+OSt/Im45xLSetMeR464sHxT
 iJhRRfvQc1GzosS76VwRHwPFpY+W1cHcrMbIoIe0AH6v4Wce7K8kz/f1UChbH0T/a+kn
 Per6cMkFQ3p+LbLw7GNvuFRo56aTOPzEHsmVx3ETcH9NkJTybZZRV5ytho4HYp1cDeJk
 hDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tXWFPpA4TnmdFeW8zHL0XdF8sOZeyxaXr7aKDmNqhCk=;
 b=ar/TfbkWpNqZ2PXIQ0JgMwXDKtQGQ+NCc+VxeNXqMRPYkov/vkEvI711AqatCROqLw
 5/eXaoL3dKtHYQoWu80uxhsUB+9Wv1tmIZkHCAhITHB74dI3Au+XRY7hD+2lAIf1Dwwz
 vKWK3oYMLszAoC6739m5gbx4L9iTD0PXNGV3YZnljt2JK119+nfM46hESfqKbEgES9x3
 tuWIvZZ6ON/DuoDtDI8DdxtfnyLk0Zhnxs66Wupjo7SSuXjeUvJm2tDPwFtJUTYI/93J
 wPHHOesEWWG+27wqE25Y1WNat4RXT8X22uvfRZ/l1lUPaO5BxYSUDxT6CRkvkrTSGVGH
 a5Nw==
X-Gm-Message-State: AJIora+g10Y4myef2Ha5itXa43sssGogCBBcfSv41GP0+/lds6FQZBs5
 FDNZYaHtu+q4un8HWhDBqUSYxwUZ+kpLIYZa
X-Google-Smtp-Source: AGRyM1uhH1CHbAq4Ji1xHqD2Cd1su9LJENYOkTMdSa40sShf9xWvEjHOV3BgNOi/Tv902kwcXwvyQA==
X-Received: by 2002:adf:edc1:0:b0:21d:7157:f4aa with SMTP id
 v1-20020adfedc1000000b0021d7157f4aamr213490wro.454.1657665115134; 
 Tue, 12 Jul 2022 15:31:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k28-20020a5d525c000000b0020fcc655e4asm9320879wrc.5.2022.07.12.15.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 15:31:54 -0700 (PDT)
Message-ID: <477d1b2c-3fea-ee1f-28c5-d03dc1d66c9b@amsat.org>
Date: Wed, 13 Jul 2022 00:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user/hppa: Fix segfaults on page zero
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Ysc3vc0T+qfjiyKo@p100>
In-Reply-To: <Ysc3vc0T+qfjiyKo@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/7/22 21:45, Helge Deller wrote:
> This program:
> 
>      int main(void) { asm("bv %r0(%r0)"); return 0; }
> 
> produces on real hardware the expected segfault:
> 
> --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
> +++ killed by SIGSEGV +++
> Segmentation fault
> 
> But when run on linux-user you get instead internal qemu errors:
> 
> ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
> Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
> 
> Fix it by adding the missing case for the EXCP_IMP trap in
> cpu_loop() and raise a segfault.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index a576d1a249..8f374aeef6 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -143,6 +143,9 @@ void cpu_loop(CPUHPPAState *env)
>               env->iaoq_f = env->gr[31];
>               env->iaoq_b = env->gr[31] + 4;
>               break;
> +        case EXCP_IMP:
> +            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
> +            break;
>           case EXCP_ILL:
>               force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
>               break;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


