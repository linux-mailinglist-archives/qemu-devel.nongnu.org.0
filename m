Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3E4546912
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:09:39 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgGY-00067m-II
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgER-0004av-7r
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:27 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgEP-0006Rs-TI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:27 -0400
Received: by mail-pf1-x432.google.com with SMTP id i64so529988pfc.8
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IJJrVI+1Ls4BVe1aVqbN8G0D/4iJYb2vxNYhDUIPI8k=;
 b=ReDEGFwJSVFiWiaGXTBaeQCCB4IXltRTAhfXEqq4K0bP+BGZNkty8fF760c+mIxgdN
 PXzg8ZCOqwUPGLC1EeIguX0EaIKsyK8R/5PznHJjqlpS1JjQJMoGMqmCptHWTH3dhHEZ
 DPqNoDBn7Q4rvdJvn1hIfOvRlT3UBi2Rn7Z0B+Jd/aZg1D3VZBlOKeWLWN2LEf21swyE
 ozQ0qtHXaya8e/6GTpWo6rvKYIweeOKfJXvgkgIaltpxJukPIS54bF7qDt6Ok1BGYwkY
 NuMavsSp0KK+6oa57F7wXiE1dPQ9HDWHszgpC/J57m1kfmfxXnzkXPp50gs0PAxrlWww
 42IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IJJrVI+1Ls4BVe1aVqbN8G0D/4iJYb2vxNYhDUIPI8k=;
 b=Birti5exkqmyp7p1jbPQEJJh8oDYF2M0oBs0ptzYqbFiLsZ9PZWI5SImaB1p3ZJiT/
 9sk2kgvslGlnCyHrr+kxpCDZ8rU852uAW/s9nmfhHQXwd7icef7051CnNIxAUjJyJN9s
 fXn9D46gUWyDHGLzK1fzmWXGp9Hz5jVApjtReiru2UocZ9i9eC442w1BblyVKxJ07VzZ
 bxX87ZD9QIbc41jqDppE1aC5jDU52/bIyMVH+amms654ItvKnrkj+vnTMisxRipq8do7
 fy3I1zowTq/vvI+LCmVsjYMGz00J9y45uoEHB0T3H75sQdXYW3KLByHFJuTBokJNINWO
 lvJw==
X-Gm-Message-State: AOAM532SOuwbFcrrjnKSVRtSykTKYRzVA5j9w0u1lXs97kFUEIhGvQJb
 y4gQvugX9uH8r6vEQ4yAYQBb2ynkmnY=
X-Google-Smtp-Source: ABdhPJxHSSuICOCk8M/eW2+EEoAhlzw9Cu+VZcaW05CaNSkNU1l93zB7SOfrQWiLoTZ6vKS54SBecQ==
X-Received: by 2002:a63:1226:0:b0:405:dd6:52d2 with SMTP id
 h38-20020a631226000000b004050dd652d2mr98386pgl.541.1654873644424; 
 Fri, 10 Jun 2022 08:07:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o131-20020a62cd89000000b0051c70fd5263sm5487065pfg.169.2022.06.10.08.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:07:23 -0700 (PDT)
Message-ID: <2da06651-da8b-1f17-79b5-e908496edd6f@amsat.org>
Date: Fri, 10 Jun 2022 17:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 05/11] target/mips: Drop pread and pwrite syscalls from
 semihosting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-6-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
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

On 8/6/22 07:19, Richard Henderson wrote:
> We don't implement it with _WIN32 hosts, and the syscalls
> are missing from the gdb remote file i/o interface.
> Since we can't implement them universally, drop them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 39 ++++++------------------------
>   1 file changed, 7 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


