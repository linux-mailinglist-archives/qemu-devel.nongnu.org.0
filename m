Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC04E56EB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:49:29 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4Aq-0004sj-As
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:49:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX3zp-0003TE-5I
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:38:05 -0400
Received: from [2607:f8b0:4864:20::536] (port=40822
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX3zn-000295-R7
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:38:04 -0400
Received: by mail-pg1-x536.google.com with SMTP id w21so1557265pgm.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uop86yX2NLSLJx9A/oQAVrOKvoKbO3AEvyONPMWKFu4=;
 b=Axm17iyR3ZkY2d6F0c06TKYy12xpwjUfSTC7QwpQ1apfh08sirzonA0NIP8/BHrR3F
 QveGmWHwO39Aah3Q4yXbZC7sVbmexcx3o6JQgoznXjdzPqr3IFWyUNazqBUKwpp0/1BF
 noPHsNZ54immJlzuVIML+QLPbSJG+HXPo3RXFEMHVNDtjQVVpKtVSx0Fsdq9S3et/Kgu
 ixv9cathmioxQdKPwEpN1bFNlYZorf+Q/Nu1Xjr2ddaXFRnh67T/GdUEWd++JEsHBAdh
 3v18/Y4QpJ1LtVbJ047qWmVuyFSRY4Scaa/FPCVMyT4fYw8opukNqzBRAtxNnLcjAHmN
 b1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uop86yX2NLSLJx9A/oQAVrOKvoKbO3AEvyONPMWKFu4=;
 b=Kkvj+BxAhGylIprRDZx0HQGVCj8YpDf9KM+9Tj1zE7lrRtLXAhYveiRoz0KEhVmGAU
 aD/Sigw4u5g8xSOza7g/07qgpBxq0xJHUlu4PfB6xFnnE+z4g8ZtENCMdm3EFnHo9YcG
 myLmiKNN9k+W1VYhoDcwEBhlVmlGfN+XhEmz4ezCw5tUG7M6cSWyCMfSObAryhpLw8ei
 cSnVfVf4PNOQgHcDgsSTD4HIpME8IIoDy/C9jXGIQBo6q7FOPbFl4ezXYRkSA37aStL4
 O7o1M+D8sM6lPkly0pLlre2X+/Jttks4js5YREmQrvXAdOpp1qXttqT61oXjpEUDIX77
 v02Q==
X-Gm-Message-State: AOAM533ZHmtXB/y/55P6tpYsFXcstehcUrx5ByJ7kH/kgdawZg9XpVpx
 LtT/MQA5NPj5CUbKwz/8liqzDzk98xw=
X-Google-Smtp-Source: ABdhPJy/gGHQVafVxixFNBoCTkZa/yZeW+GbBFjxQE4vz2bpnqCnoLRk1YjYr3PLLiQ8EyfrX+kcuA==
X-Received: by 2002:a05:6a00:1516:b0:4f6:fad6:f0a7 with SMTP id
 q22-20020a056a00151600b004f6fad6f0a7mr797596pfu.21.1648053482277; 
 Wed, 23 Mar 2022 09:38:02 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm209834pjl.49.2022.03.23.09.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 09:38:01 -0700 (PDT)
Message-ID: <7488f005-1611-63c6-68e7-c03579f04e77@gmail.com>
Date: Wed, 23 Mar 2022 17:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] target/i386/hvf: Free ressources when vCPU is
 destroyed
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220322190745.37727-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220322190745.37727-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo s/ressources/resources/ in subject.

On 22/3/22 20:07, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Both xsave_buf and hvf_caps are allocated in hvf_arch_init_vcpu(),
> free them in hvf_arch_vcpu_destroy().
> 
> Reported-by: Mark Kanda <mark.kanda@oracle.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/i386/hvf/hvf.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index fc12c02fb2..39fa4641b9 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -163,7 +163,9 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
>       X86CPU *x86_cpu = X86_CPU(cpu);
>       CPUX86State *env = &x86_cpu->env;
>   
> +    g_free(env->xsave_buf);
>       g_free(env->hvf_mmio_buf);
> +    g_free(hvf_state->hvf_caps);
>   }
>   
>   static void init_tsc_freq(CPUX86State *env)


