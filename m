Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5C2DB3CF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:35:45 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFAm-0003co-RS
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpF1E-0002Gr-SC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:25:54 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:32775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpF1C-0005K7-Jt
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:25:52 -0500
Received: by mail-wr1-x444.google.com with SMTP id t30so2801796wrb.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P9W5y8DADPRKZkUbGunXJtu96lAIAcP0837WSjtLahI=;
 b=btAYlmnUnUqagsKsYUjGY7ndn+sm7FY87ZReVsvLEtUDcv+F0ueOTzzABDJVXTJktI
 5VrXxid7MoRrdLEqH7fmFa0ASIKvO8DU2NWUUJE0q29WfppiQn5Flxc7jdaQgZQj6KY+
 o+fKzQPIUxMyUZN9LaYNYGEnK22mkUpQwrgzHqorU3nRPRJdogLi/dB3GmHlyKfirAlt
 mnlzqKyHVG5kibt7AUjfZirId+QanfIb7pIsMO0KON0Y5IVQZpsoq2SP0R8pU4vu8DQe
 UOX9oNyu2yKOAydYeYNQrn0vbSQ5vDjBn4e6nR4jMuH4SCKfopdIHUwNxToHl9cgz1Ro
 Husw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P9W5y8DADPRKZkUbGunXJtu96lAIAcP0837WSjtLahI=;
 b=WKkGfFeaQJ/1RB4itgP/u8vpA2AJvoKlzIg+Yi4fxVHGoL/gHU101GlrK4TFsPBzTE
 F1oO86m7hQtnt6+xNOBB3QQ8lO7Ja2//CdvYEDbVzYdICh/cRMAmmJ/PGfwQPEHRv3oo
 nOZS+ytGgAcY/mFjUE7l9KoBH0I6ZDfOXSFzobM/+7rE0aO6eG6Qk+mPiFJk+Xp2N/Z2
 YHo74CFBs3lrsZU/MkciZo6R0/FaAcmIIS5rhF2yHdFppTRKE/oKmuXXURMQfz10IoDg
 T66yl79M8HbDKHsjwqfD2N4WywHEVWOnBheFu7uSypWLpG8QOjdOICHKR9rZAvhq+A21
 DA2g==
X-Gm-Message-State: AOAM5303wY8Uz5KxzpMJfB06NPdkYv2NGuNaPZJ37IlK3B5pgZfikfF9
 cHQiLAgRNmybr2svE8nOBKc=
X-Google-Smtp-Source: ABdhPJx32FVYKg43msran7gZJvxsjebq7zdSf7EVp9KWvcPpiiegrPRgt9OkvzFwpQm657nuVyESlw==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr4135100wra.68.1608056748792;
 Tue, 15 Dec 2020 10:25:48 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a21sm35825548wmb.38.2020.12.15.10.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 10:25:48 -0800 (PST)
Subject: Re: [PATCH v2 05/16] target/mips: Extract common helpers from
 helper.c to common_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-6-f4bug@amsat.org>
 <c9164ee8-ef2a-269d-daf6-6e1efa5fc24e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7911deb3-cd31-f45f-453f-d6eae60f734f@amsat.org>
Date: Tue, 15 Dec 2020 19:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c9164ee8-ef2a-269d-daf6-6e1efa5fc24e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 3:07 PM, Richard Henderson wrote:
> On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
>> The rest of helper.c is TLB related. Extract the non TLB
>> specific functions to a new file, so we can rename helper.c
>> as tlb_helper.c in the next commit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/internal.h |   2 +
>>  target/mips/cpu.c      | 215 +++++++++++++++++++++++++++++++++++++++--
>>  target/mips/helper.c   | 201 --------------------------------------
>>  3 files changed, 211 insertions(+), 207 deletions(-)
> 
> Subject and comment need updating for cpu.c.  Otherwise,
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Oops, fixed as:

  target/mips: Move common helpers from helper.c to cpu.c

  The rest of helper.c is TLB related. Extract the non TLB
  specific functions to cpu.c, so we can rename helper.c as
  tlb_helper.c in the next commit.

Thanks!

Phil.

