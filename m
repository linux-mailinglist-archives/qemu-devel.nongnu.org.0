Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35342D3E5C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:19:59 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvde-0004zr-Lg
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmvbA-00044T-QY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:17:24 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmvb8-00055r-Jv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:17:24 -0500
Received: by mail-wm1-x343.google.com with SMTP id g25so492934wmh.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DhEexIPrt7u69AggAVnat5k7tJsbULtT8rgXthgK4NI=;
 b=UY3JgWi9uEqcUQn2dQ03bjRaI7V8TuWWCJoQHjis3I7TBft5Gg05tUmLSNDm5NeQNF
 zaMfvqlkUR4Vyv8EqQbacGLasBfoYY5pJrjJ59HNctP4A1vSMveCPXRJNSYz8O8Ajp9X
 /FA5sWZfX7hv5PeqqZelWsS8sCjJXop92eQInE5kTTADL0dBQW94Rd6zibWIqAcfmxEZ
 4K9gor63LqfG+1xijbV2i+DrDGYa28O7HK/0eEb5qwJaNGYxZepbOM2ztk/k+RlOaUBW
 KvwrdkfYCS190cbUAmSUTx10FYGmRJSs8VsW5p1xwIW3+7ejgErfPdWGE9NPv+J9JZwk
 Kobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DhEexIPrt7u69AggAVnat5k7tJsbULtT8rgXthgK4NI=;
 b=N7XQyDexPvX9LemexAuW66xl0g4kwXJf5n3NNXPfYBRW3iXayAqxDaO1W1omX99CJk
 hCGOc8H30pn4QBQC6zrXg7/1shi5+Jw30pA7x5NM4mNnFnZ4LhA2lfVCCwRMc6MZJvai
 vueILAI4wUx4X+MX88h5dftsJzScN56uEm5c21LDyba5Lma3ALpuOLZUmJoWEOj5ssX+
 AsK3H1ROtgiWWfEbMK5ILsKDF3pFjp3e5jQpS5d2it/zKv0OGHLrsbnbezDgRx62RhD2
 dd6soaWm5w1xOShZhki/Qd4Hfpc7ECbYw4VV9guSwPbk+Vw5lCPE7lrXTSuEZI5o84Z2
 2byQ==
X-Gm-Message-State: AOAM530zodKNFKUK7B2BSAjanq252KfiSP6mPZHzZ/snLKnYJxeHY1hU
 X8QLzXAl277bLu5SOMVPuoY=
X-Google-Smtp-Source: ABdhPJzIQyl2m3bRnpnQP/Mwp+WL2VZKtevGkn9HkLgfGEt6UOlC5UhJsiPrXCBqpKLzZgsQrXUOAw==
X-Received: by 2002:a1c:c254:: with SMTP id s81mr1690532wmf.132.1607505441021; 
 Wed, 09 Dec 2020 01:17:21 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h98sm2442236wrh.69.2020.12.09.01.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 01:17:20 -0800 (PST)
Subject: Re: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in
 'translate.h'
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-15-f4bug@amsat.org>
 <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
 <b0cf35c4-a086-b704-5710-0f05bf7921bb@linaro.org>
 <58a0d6c4-fc01-3932-52b9-9deb13b43c51@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1d2a6f44-1eab-2e92-01c2-703a2ee5bd50@amsat.org>
Date: Wed, 9 Dec 2020 10:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <58a0d6c4-fc01-3932-52b9-9deb13b43c51@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 12/9/20 1:03 AM, Richard Henderson wrote:
> On 12/8/20 6:01 PM, Richard Henderson wrote:
>> On 12/8/20 5:56 PM, Richard Henderson wrote:
>>> On 12/7/20 6:36 PM, Philippe Mathieu-Daudé wrote:
>>>> Make gen_msa() and gen_msa_branch() public declarations
>>>> so we can keep calling them once extracted from the big
>>>> translate.c in the next commit.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  target/mips/translate.h | 2 ++
>>>>  target/mips/translate.c | 4 ++--
>>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Actually, I think this should be dropped, and two other patches rearranged.
> 
> Actually, nevermind, you already get the right result in the end; there's no
> point re-rearranging.

I'm interested in looking at your idea to see if I can follow it
for the next conversions after the MSA ASE. The criteria I'm using
is (in this order):

- keep bisectability working
- keep patches trivial enough to review
- avoid moving things twice

In a previous version I tried to directly pass from

static void gen_msa(DisasContext *ctx) ...

to:

static bool trans_MSA(DisasContext *ctx, arg_MSA *a) ...

without declaring the intermediate 'void gen_msa(DisasContext)'
in "translate.h" (this patch). The result was less trivial to
review, so I went back to using an intermediate patch for
simplicity.

Is that what you were thinking about?

Thanks,

Phil.

