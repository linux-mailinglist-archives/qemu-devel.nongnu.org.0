Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FD4542C7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:39:39 +0100 (CET)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGTh-0008BO-QK
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGSr-0007XD-E7
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:38:45 -0500
Received: from [2a00:1450:4864:20::432] (port=38487
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnGSp-0003Z5-GP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:38:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so3057961wrg.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Nw+YF3p0T3CO8ZpE8YhR+a2uY/GH/saZqjichVeth4=;
 b=BOxGGM9AjcxGz1P5abJZt/m+7fivUWR2Ehc1ymw5T1WKxhOGJXpH5SGTOtJ9oY3Qrj
 RXhktfusUgPmCbjIDYjQmCi9fHjwUB6rmwnkAuMiGZJdq14g1+ji5gf3zGnx2jKF55B4
 A8qsM7RqG8ye5rqBk3RBpZc/hjdYMBGqSX4yjI8SsYdM+1O4CTGANxbIsRLFVfWijwTX
 26+nLMcAYHZfrzyLs1Zn8Zmp/KtYPlLHWxzunhLuxF2Am3ZoWFsu9b5tcLoQNQgVXy2B
 JV2XalP7I94vb97NMIirwl1IlogYWgfF2Lifq6hLJMTwFt1PThggrj54dqSNiVZnH0RA
 pv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Nw+YF3p0T3CO8ZpE8YhR+a2uY/GH/saZqjichVeth4=;
 b=vlLfPvH8NMqI3TFKKkSx1io6hjmIxKvFCGhJTTIVN7flB39t2XRPLjk9AyNPxbNVcX
 Q4gIZob/UO3xK4So9uJnsRNwoluc1mb3wrjabS38Ag9+tPmb6ConJfrLnYsjD0K64sAG
 /E60uvrGTyOQTRf8zm9c1TTWw7mYVDRiHYxFGFJHT84BIhYhbYrlXEbRv0Md1pYjuqu5
 BPgFoL3VDWHIKIhY09Rpr+S6syPXXOUFfn0UlbUuRqxLFr8xImtj9mUsShZqbPgnDXIo
 Vtx5s1zV1PkzzNnqpHsLHgzttRvUUB82qW29stYBZSsDbrif9gulQNvvgr3AmN706BEi
 L10A==
X-Gm-Message-State: AOAM530pNGYz1JchTrU38vIGvVgUK//7RzSHvTsAYCe1E5vqcPuzBIi2
 2hBPA5IgpdE35MijQ61EnX8=
X-Google-Smtp-Source: ABdhPJx2onjv+FWBGRFKeX+dhyfFLDrRFmfwLLunAQ7HLtHPlCj8F/Iy9Qg5sHbYGh1Nx4D/VUzk1Q==
X-Received: by 2002:adf:f40b:: with SMTP id g11mr18298563wro.296.1637138321629; 
 Wed, 17 Nov 2021 00:38:41 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q26sm19597536wrc.39.2021.11.17.00.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:38:41 -0800 (PST)
Message-ID: <702c39f6-9652-4385-4a3c-b7396105adb0@amsat.org>
Date: Wed, 17 Nov 2021 09:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-9-richard.henderson@linaro.org>
 <dddc2e78-27ae-dcb3-6f10-29f935fec9c4@amsat.org>
 <31127125-7e7e-ac1f-07f9-2f62df6c1f28@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <31127125-7e7e-ac1f-07f9-2f62df6c1f28@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 09:32, Richard Henderson wrote:
> On 11/17/21 9:23 AM, Philippe Mathieu-Daudé wrote:
>> On 11/16/21 12:02, Richard Henderson wrote:
>>> From: Warner Losh <imp@bsdimp.com>
>>>
>>> FreeBSD system calls return positive errno.  On the 4 hosts for
>>> which we have support, error is indicated by the C bit set or clear.
>>>
>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>> [rth: Rebase on new safe_syscall_base api; add #error check.]
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
>>>   common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++
>>
>> Can we split this in 2 patches?
>>
>>>   common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
>>>   common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
>>>   4 files changed, 42 insertions(+), 1 deletion(-)
> 
> Why 2?

Personal brain limitation, it is easier to me when I focus on
one base arch at a time. Previous mips/sparc64 changes are
in different patches.

> They're small enough that I think having them all together is fine, but
> otherwise why wouldn't I split to 4?

4 is even better for my brain, but I think I could force my brain
to focus in 1 hunk at a time in a single patch :)

