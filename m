Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB2474631
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:18:13 +0100 (CET)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9ZE-0000Hg-Me
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9U4-0002yF-8n
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:12:52 -0500
Received: from [2a00:1450:4864:20::434] (port=33535
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9U1-0002vJ-H8
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:12:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id j9so805942wrc.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j1RjnrjncjpfRq+h/GH0VrBpLAEFfpV+QJtUqSj6rzA=;
 b=N9q2Jy8oqugCzV3SsqDUjhMeQYdKch1MCP87aXk5UftChJltRxKHtWALbHfZkOiei6
 DAAdHt3smgNXxIhZGCeOCvhRMsD/JnIdtcIPZd9fxK4+yvr1y5bQJ2QW4vclFbqcsB8p
 YdFZ2BSpJA491F9y/UCjt/nawlIYzZBcpociKqqxi1bKkugPu/2UWtPJ/Qg3aANTItxZ
 DRObr60pR3OI+0xxnITSNJ7sLyqaA8VYTHY1vDXsBlk9BWlPgGlRpSsku6XlS5coKS2I
 7TQvPvNXXqahkl7HDoeSBHXDstozqD43S5XBrvncrUxwi3No+1A63iq5ENL48W6oBsrT
 74dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j1RjnrjncjpfRq+h/GH0VrBpLAEFfpV+QJtUqSj6rzA=;
 b=s0vdXJVuUzqHjgPJ+RqJbkrjFXy2w3+KLR8BW9qVraWEA4SFoF9h3QOSEmT7UnHS5E
 ejmrSI8B/dCi6SrBaWDIEDh2GnnHvKsLXmEmfZsOQpw5fEDtVyFCXOycIUUsR3H4pldn
 vl6oj8ruYfNtWytAdCopPN8oI2YuJ7hUfuoB6D0wX4YSjyGTDWdWsLaFSRC9m3X35zBh
 1Baf66iF7h4ozzG85ORYaLuhjtUzL3a9iPh9zhok/gewtE0sIj0994p8eherU8Cok7O0
 Af+S4MwVAmk8HDEJk5Bwmum/DQHw83V52c8H9BwkxTjeRiCLpjSRGZVXIR0dnBerKU8r
 Te+w==
X-Gm-Message-State: AOAM531+Ffv2i1l8Jhp3t2TNa5eqWUPIVUjQTxmYMLAKzR5nFuTkoJ69
 NBf9ZWRb4+txNaO+CXAofbsT4afjvBE=
X-Google-Smtp-Source: ABdhPJyRpySS2n910/FI9vYQqmOrKjyGx0VXD27eF+u2JiiyO9PocqAVK0/fNAToVWrGA+SGrRwElw==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr6265728wru.390.1639494767494; 
 Tue, 14 Dec 2021 07:12:47 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a198sm70261wmd.42.2021.12.14.07.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:12:46 -0800 (PST)
Message-ID: <d41a520d-8593-16fe-8ce6-e45b6288c336@amsat.org>
Date: Tue, 14 Dec 2021 16:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] MIPS - fix cycle counter timing calculations
Content-Language: en-US
To: Simon Burge <simonb@NetBSD.org>, qemu-devel@nongnu.org
References: <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
 <20211213135125.18378-1-simonb@NetBSD.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211213135125.18378-1-simonb@NetBSD.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 14:51, Simon Burge wrote:
> The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
> constant in target/mips/cpu.c.  The cycle counter resolution is defined
> per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
> cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
> which has a CCRes of 1.
> 
> Signed-off-by: Simon Burge <simonb@NetBSD.org>
> ---
>  target/mips/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 4aae23934b..0766e25693 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -440,8 +440,9 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
>  {
>      CPUMIPSState *env = &cpu->env;
>  
> +    /* env->CCRes isn't initialised this early, use env->cpu_model->CCRes. */
>      env->cp0_count_ns = clock_ticks_to_ns(MIPS_CPU(cpu)->clock,
> -                                          cpu->cp0_count_rate);
> +                                          env->cpu_model->CCRes);
>      assert(env->cp0_count_ns);
>  }
>  

Minor comment, it is better to post patch iterations as new thread,
and not as reply to older patch, because in thread view your new
patch might ended hidden / lost.

Patch queued to mips-next, thanks.

