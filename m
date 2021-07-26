Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BF3D6388
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:40:19 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83eM-0006C9-PJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83dG-0005X4-FP
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:39:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m83dE-00007X-TZ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:39:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id m1so13670504pjv.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HounEtXdJXkaiDOqTkSK8pSP6w+pOyqHckSdVoGV8Ho=;
 b=jCvtNWlTMf9z3nUWR8WuFCr7ntrRSSnHy/0FU7+Y3zOTppOI3J/M5PtCLFOYfjndMA
 BZNYHV1H4lL0b4nnhG20ZAKYLjNZgtvWSxqyr8NqfE2/uCL81EXt2MC07F2NOdxB/dhM
 v0956ngdSwAHja6rl7xtTHrhIotkruCzprD+ROnruBuYtiJtdHWO41dvbisz3UzYQI/R
 hS7wpnaTpH5Ul2HL8UyMTAjsjwtf3JgKqFP5rQ8+BbUhTQXjAtzKkUsvnaVQVCa29DzO
 w68ZNoWQXgnQTHoJc+QCcbUClyHbtvrwL5DYywmnU0PXbL31zudNV3cYZMR+a9qmLypI
 u7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HounEtXdJXkaiDOqTkSK8pSP6w+pOyqHckSdVoGV8Ho=;
 b=E0D9so/2H7+lkcto97swOkHY3tO8A6INmC5yKDjoDHFV4T6znq3UzSTPq9zUqiIIHe
 7a9VxrfIleUkDCwcYiT3WPStTe9GSqLAgHffSlWJwzhivlMKdhJO39nyvG/jGOVBkWSt
 Hi+hFgf2mKXL6Ot/x0zVPwWw6nkYBI6OXlPvfCC+38oTLkU9W89gPuUUt/Xd2GnvQwEr
 ysjuX2G6aSsqhVN+i1j9mvvUn6XwXgUFMZ9SqnpwWAT7NqfBSZQrDUgZXxl52S4KWu15
 RIRcJVgpCIIsVaskUDsJmOwF86hWaYj/ESVijHfbk2nQI4Iivl35NjORdz2gdTOIZ0Gh
 JWkQ==
X-Gm-Message-State: AOAM532KtHo3KhnPVThON6dLUHzCYh92/Bn8c0E5RwDjrH9pnI1m19OG
 JaFPXDnjbU34/n5wVwI0ec6ypQ==
X-Google-Smtp-Source: ABdhPJza1kriRjZW1SFyf6oj5quWByZDJVcDqIc4htKrcSdwssTBJe5T+AaQsxpkhTxkITcoOIBLtQ==
X-Received: by 2002:a65:6088:: with SMTP id t8mr18777781pgu.371.1627317547051; 
 Mon, 26 Jul 2021 09:39:07 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id u12sm138645pju.15.2021.07.26.09.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 09:39:06 -0700 (PDT)
Subject: Re: [PATCH v2 09/22] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
 <41541363-117c-6428-cc46-2660827cb803@linaro.org>
 <302f3f01-79b7-343f-9616-644fed0d146d@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6f078bc-6f30-adb8-454f-101ae543428d@linaro.org>
Date: Mon, 26 Jul 2021 06:39:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <302f3f01-79b7-343f-9616-644fed0d146d@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 2:22 AM, Song Gao wrote:
> Hi, Richard.
> 
> On 07/23/2021 09:29 AM, Richard Henderson wrote:
>> On 7/20/21 11:53 PM, Song Gao wrote:
>>> This patch implement fixed point bit instruction translation.
>>>
>>> This includes:
>>> - EXT.W.{B/H}
>>> - CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
>>> - BYTEPICK.{W/D}
>>> - REVB.{2H/4H/2W/D}
>>> - REVH.{2W/D}
>>> - BITREV.{4B/8B}, BITREV.{W/D}
>>> - BSTRINS.{W/D}, BSTRPICK.{W/D}
>>> - MASKEQZ, MASKNEZ
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> ---
>>>    target/loongarch/helper.h     |  10 +
>>>    target/loongarch/insns.decode |  45 +++
>>>    target/loongarch/op_helper.c  | 119 ++++++++
>>>    target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 839 insertions(+)
>>>
>>> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
>>> index 6c7e19b..bbbcc26 100644
>>> --- a/target/loongarch/helper.h
>>> +++ b/target/loongarch/helper.h
>>> @@ -8,3 +8,13 @@
>>>      DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
>>>    DEF_HELPER_2(raise_exception, noreturn, env, i32)
>>> +
>>> +DEF_HELPER_2(cto_w, tl, env, tl)
>>> +DEF_HELPER_2(ctz_w, tl, env, tl)
>>> +DEF_HELPER_2(cto_d, tl, env, tl)
>>> +DEF_HELPER_2(ctz_d, tl, env, tl)
>>
>> The count leading and trailing zero operations are built into tcg.  Count leading and trailing one simply needs a NOT operation to convert it to zero.
>>
> 
> My understanding is this：
>     
>    cto -> NOT operation (tcg_gen_not_tl)  -> ctz,
> 
>    is right?

Yes.


r~

