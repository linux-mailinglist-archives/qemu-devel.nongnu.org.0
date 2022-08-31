Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317585A83CD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:58:49 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTR39-0003GO-Nf
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTR0C-0007ll-GP
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:55:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTR0A-0007CE-GQ
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:55:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k17so7689114wmr.2
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 09:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NgCOHRBROjuf3jPB3HnPCIX1ruEFp6rM5PpVUlhppM0=;
 b=pEfhL41UucnLnXDz7RxR0sg+jCfQo1IsMAMRnjsCHqvSOk8Bih/lKYJKDj+HXq88eV
 p3VmwlbfM1jWidkxm6cnNFxD+vG6Wj4W/oZh/5omylFnRtsUW9rU+rTfK8QEJgW6C1v2
 We2y32w5AA20VAhlUBZAC+8Mx1AmQDI/dZNQ18dlSwLZY/EnpfRqWltC12icifFNQfQU
 sYUqe4FrrKLmSUtruSMemqMtaA52e9CiTCDZcz9rf8HE21VhlQWRkV9umU68Cb+VNOJ9
 RvHu0dChdzCCngKX9vdACBVMnxEejMDiM8CRkDnUgdkHfl1aQNcaxu2iIUgG5kel22C9
 MhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NgCOHRBROjuf3jPB3HnPCIX1ruEFp6rM5PpVUlhppM0=;
 b=3P/6Niz+3jE2fHRKOm8zhOHUytxYxofUivGOd7cXr7EKsVE39CjxdUOd1Nkj1sAhyX
 Fgrm117J7G418Gebu0M/T+Fqkk52VDUixcfcWZOcXFe83AhouUIBfD2zd+yTnASBS++M
 qG40RV1RngQYYbGwr0wqoobmQMwDertsFCtGUmzP6wWYqXgS5IhkMlCBkZak5o+KoVBq
 SknJB4gb2CVlAXO4Im//2BljC1M6ufMMeYKuFcwlBPCyLy9ey15vOoTc5sfIendHkMOk
 ZFWzJoNk0zExMleb4AucgYZVpsFGQ97hRYp8B24nHhwkLgE0ejb7kTH3pzG1FI+B8iQ4
 Rc5A==
X-Gm-Message-State: ACgBeo3Z/SS7DhSpl/oL7CO8Ctb6gbiNu5wOYQLeyE63x80d/Zrh2hx6
 sqhuCj35p7i36XVg2pjUgUKjnw==
X-Google-Smtp-Source: AA6agR5RZG0RdYEbCOIad0RtQPZRM0D8co4t7LllChrSD6xhwP5DbCIAP0YrnA+3b4hgD3zIC+2kpg==
X-Received: by 2002:a05:600c:2e48:b0:3a5:b600:1a3b with SMTP id
 q8-20020a05600c2e4800b003a5b6001a3bmr2511480wmf.180.1661964938441; 
 Wed, 31 Aug 2022 09:55:38 -0700 (PDT)
Received: from [192.168.30.32] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a5d58d3000000b00226de10c0c2sm7279232wrf.15.2022.08.31.09.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 09:55:36 -0700 (PDT)
Message-ID: <dcf5bb5a-39a7-0993-c429-ec449546148f@linaro.org>
Date: Wed, 31 Aug 2022 09:55:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-stable@nongnu.org
References: <20220829021325.154978-1-richard.henderson@linaro.org>
 <c2c0edec-c93b-f6fa-b148-9452e4e7b7@eik.bme.hu>
 <ecaee2a6-c2be-388e-425d-3cbe3dda2a4a@linaro.org>
 <87y1v5xkrc.wl-ysato@users.sourceforge.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1v5xkrc.wl-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/30/22 18:30, Yoshinori Sato wrote:
> On Tue, 30 Aug 2022 01:10:29 +0900,
> Richard Henderson wrote:
>>
>> On 8/29/22 02:05, BALATON Zoltan wrote:
>>> On Sun, 28 Aug 2022, Richard Henderson wrote:
>>>> The value previously chosen overlaps GUSA_MASK.
>>>>
>>>> Cc: qemu-stable@nongnu.org
>>>> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>> target/sh4/cpu.h | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
>>>> index 9f15ef913c..e79cbc59e2 100644
>>>> --- a/target/sh4/cpu.h
>>>> +++ b/target/sh4/cpu.h
>>>> @@ -84,7 +84,7 @@
>>>> #define DELAY_SLOT_RTE         (1 << 2)
>>>>
>>>> #define TB_FLAG_PENDING_MOVCA  (1 << 3)
>>>> -#define TB_FLAG_UNALIGN        (1 << 4)
>>>> +#define TB_FLAG_UNALIGN        (1 << 13)
>>>
>>> Is it worth a comment to note why that value to avoid the same
>>> problem if another flag is added in the future?
>>
>> Hmm, or perhaps move it down below, so that we see bit 3 used, then bits 4-12, then bit 13.
>>
>>
>> r~
> 
> It looks like the gUSA and unalign access flags are mixed.
> I think the flags should also be separated as the two features are not related.

Well, of course.  That's what the first patch is fixing.
Balaton is merely discussing the order in which the bits
are defined.

r~


