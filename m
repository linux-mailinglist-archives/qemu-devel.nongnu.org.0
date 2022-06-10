Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC7546908
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:07:25 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgEN-0003yp-Mq
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgD8-0002Yy-PR
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:06:07 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgD5-0006FQ-Ld
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:06:06 -0400
Received: by mail-pf1-x429.google.com with SMTP id x4so15518314pfj.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m6CZBJ10VjF8+4mPoZxJzLTTWHodDPhV4gfWp9jbKnM=;
 b=Pud08NK0Ru1BsRG0/fe//4P55UXsMgTdYpVFr1g3ufHm2JBV+YxXt/+N9EndtX2/ky
 fpXp/Lwwgp3RbkV/rKFmnNoZiJxXws4QPfSj2TBpTecLLWJu/EegDjuNEQ4S+NTbKjK+
 5OflcWUqHPqspnXPrd4rAjK8+DafNFdc3C2QoBIB9J1lvf+gXa4dlJZAXDvmA0W5JBVk
 ++uKF0Ht/FPyfijaedjBoU+hjrPAG0GG5OkZfsbSyqTFY6v11dNeWqqpSk8tKjkbk5hy
 TbRFJj8JEQVmBDcvP0PjOVCSdc9QWcB6ObH9WY1Eoe6Yo16EXviO4PnMEAGR5whdMqJ8
 3S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m6CZBJ10VjF8+4mPoZxJzLTTWHodDPhV4gfWp9jbKnM=;
 b=DL92ZYBK47To2IRCIlPCcipMNsRY9nLbOXXYdMeA7Dqaky5ZOzu2n9CCsjj+379H9s
 ttLtet+MyKG8+2zSoqqxEWxQDhipoff97/UMtGkQoyB15+SjGQ8cKHv/+9joXvemBjG5
 kxzVQ64oOoxO/f5MoNRZ5IMeheKR5XRcRvrbb5bA+UWEk9Wylw/xBLUkHP2+vw/bHZuo
 slZauJSj+GdnYas7HuvX31/QVssEKVuREHw+RSGVfkMj2am5Z0+chn/1E5PUZCEgAvnI
 xsGNa1cctG4QBhx5ygw4NWDecUfyzN6HIbkeeYPm4h9IcmnxGxIGw3c52pupFugXkelt
 Lw4g==
X-Gm-Message-State: AOAM532VF49wl7DrNZw2pIEVCFas/fi+g5DIJofChtw2QW8sas19zSPm
 xqN+00AES2D3SDXTRYCAtS4=
X-Google-Smtp-Source: ABdhPJx/AKOCl9jwE6ldoaV8bJp7A2AoHlJgQo8OkNd4/bCeIjnjWn2Mic1weyhTNNG5sIN+9mMacQ==
X-Received: by 2002:a63:5464:0:b0:3c1:4930:fbd5 with SMTP id
 e36-20020a635464000000b003c14930fbd5mr39228637pgm.94.1654873562126; 
 Fri, 10 Jun 2022 08:06:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n46-20020a056a000d6e00b0051c0784cb45sm12228206pfv.99.2022.06.10.08.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:06:01 -0700 (PDT)
Message-ID: <1cfdf6db-791b-1d4c-29ac-4248a917e273@amsat.org>
Date: Fri, 10 Jun 2022 17:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 03/11] target/mips: Create report_fault for semihosting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-4-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
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

Hi Richard,

On 8/6/22 07:19, Richard Henderson wrote:
> The UHI specification does not have an EFAULT value,
> and further specifies that "undefined UHI operations
> should not return control to the target".
> 
> So, log the error and abort.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 33 ++++++++++++++----------------
>   1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> index 2a039baf4c..33221444e1 100644
> --- a/target/mips/tcg/sysemu/mips-semi.c
> +++ b/target/mips/tcg/sysemu/mips-semi.c
> @@ -114,6 +114,13 @@ enum UHIErrno {
>       UHI_EXDEV           = 18,
>   };
>   
> +static void report_fault(CPUMIPSState *env)
> +{
> +    int op = env->active_tc.gpr[25];
> +    error_report("Fault during UHI operation %d", op);
> +    abort();

This is a guest error, no need to debug QEMU internals...
Can we simply exit(1) instead?

