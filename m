Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DEA592DF0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 13:12:48 +0200 (CEST)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNY1W-0002fh-Gt
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 07:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNXwU-00007x-5Q
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:07:35 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNXwS-0002Kv-Fp
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:07:33 -0400
Received: by mail-pf1-x433.google.com with SMTP id 130so6106867pfy.6
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=2kZ2zqBUingcOXRQh4FQNZXCz/q4H+GNNCP5wy7D3/Q=;
 b=Hu2Y1/rJAdwrcTm4MbZBUhzsqfuKK0HK7R9TJjDedZxbkTwwGgS+cqvqtllzkpfN3h
 Tdp+yDNfYiU/EqbG6iXOOWPUj1X1s2/yP0fbeDfPejvZCPs7UF+gqji9Sc3b5N+5K5Wp
 jrHsTjIA8rcIrG+DGn0MFBVlfW93NxWu3LTq0lQsj8eZhPQkuy8MsRgO3YkuEDT9guqF
 4DTmf/8FtX2AbAzfOEokCgPjO5vuG9Z88mmL7yjwK3GiwYmlbRIahSbIGIuXglhbyv/A
 p8xWYsKHFV9Jm4ppVwwbaSG5E1Ibw8QWEI68fIzhRSqkBv0pvYY+DFDPT1/XpaFp8Tk9
 D0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=2kZ2zqBUingcOXRQh4FQNZXCz/q4H+GNNCP5wy7D3/Q=;
 b=lDT8YI3VdcIBg8jbwXjo9vcTe3g0VOeqfWFp1E27uK+cFFVWOzj+5ZrzIcs1k7o64F
 I85iblC7haPSG+yIuf99YH3G5Ir0f12cpEtkQNn45NtLsDuOGAAff5D1LEIMDIqhiofS
 1LEV5Az/CZyBxi9PWuUaT3T6R+GPDYRFnKG8AUN8ocKQmBHs/unpfcRQhohbHC0u395s
 HqSO0dRpvsZ2ZkIArtznIXeglHyYc4KSU5XK78ZZB9VYtRYHzZtbxqPoohn5VJPEtF7v
 KJ6RNTsIi+k5C9M+d1syE2v4bCXI8nPrnFbAFzYMv8M2mzLFeWw/J7HFrUGstAyqh/md
 S0BA==
X-Gm-Message-State: ACgBeo2wFJvo5/ZaC3ZxBwYW6cVweM+4+40tMfRVb2MxTMvUttYnIdI2
 cBjlrHTC4ZnNIYxQRL+sRQ8=
X-Google-Smtp-Source: AA6agR4TjN2CEa3gDyJquBU/BemTf/TL7Bw33JkK5bm1/u7pvm9eFlRHdSYgXYxeq3QyESGlDGFKgQ==
X-Received: by 2002:a05:6a00:188e:b0:52e:2606:a805 with SMTP id
 x14-20020a056a00188e00b0052e2606a805mr15541849pfh.49.1660561650998; 
 Mon, 15 Aug 2022 04:07:30 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ik17-20020a170902ab1100b001708e1a10a3sm6764481plb.94.2022.08.15.04.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 04:07:30 -0700 (PDT)
Message-ID: <45cd1f33-7d72-26ce-55ed-66901bfe3675@amsat.org>
Date: Mon, 15 Aug 2022 13:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 05/20] disas/nanomips: Remove __cond methods from class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-6-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-6-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
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

On 15/8/22 09:26, Milica Lazarevic wrote:
> NMD class methods with the conditional_function type like
> NMD::ADDIU_32__cond, NMD::ADDIU_RS5__cond, etc. are removed from the NMD
> class. They're now declared global static functions. Therefore, typedef
> of the function pointer, conditional_function is defined outside of the
> class.
> 
> Now that conditional_function type functions are not part of the NMD
> class we can't access them using the this pointer. Thus, the use of
> the this pointer has been deleted.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 42 +++++++++++++++++++++---------------------
>   disas/nanomips.h   | 14 ++------------
>   2 files changed, 23 insertions(+), 33 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 039c353d0b..9e720d0e8d 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -787,7 +787,7 @@ int NMD::Disassemble(const uint16 * data, std::string & dis,
>               if ((op_code & table[i].mask) == table[i].value) {
>                   /* possible match */
>                   conditional_function cond = table[i].condition;
> -                if ((cond == 0) || (this->*cond)(op_code)) {
> +                if ((cond == 0) || (cond)(op_code)) {

QEMU C style is more like this:

                    if ((cond == NULL) || cond(op_code)) {

>                       try
>                       {
>                           if (table[i].type == pool) {

> diff --git a/disas/nanomips.h b/disas/nanomips.h
> index a795ed44e8..0e6670adf5 100644
> --- a/disas/nanomips.h
> +++ b/disas/nanomips.h
> @@ -31,6 +31,8 @@ typedef uint32_t uint32;
>   typedef uint16_t uint16;
>   typedef uint64_t img_address;
>   
> +typedef bool(*conditional_function)(uint64 instruction);

Please add a space before the returned type. I'd rather
prefix functions extracted from the NMD class with `nmd_`:

    typedef bool (*nmd_conditional_fn)(uint64 instruction);

>   enum TABLE_ENTRY_TYPE {
>       instruction,
>       call_instruction,
> @@ -71,7 +73,6 @@ public:
>   private:
>   
>       typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
> -    typedef bool(NMD:: *conditional_function)(uint64 instruction);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

