Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D382BC79A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 18:59:33 +0100 (CET)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgte8-0002z3-DT
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 12:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgtd7-0002Uh-Mv
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:58:29 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgtd6-0007Gn-Cx
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 12:58:29 -0500
Received: by mail-wm1-x341.google.com with SMTP id w24so15185423wmi.0
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nzuYnR+/tq210cUajV+7u0MJtRNHJO3soe65a1xwZvE=;
 b=bwyQzw6JXPTZbdgzwy4ICPnsNJLS6szbOHRQ/k+dtU/NT7fJE6/VxU35357EYluetT
 5MVVJ9DracpcLw2KodUbUiZyQVWZvye4UwXNQMbrGEvrUTujeiMjwCUsgXuBe9eMbY/P
 rfIi2ntxxfT3un8uyT52OrgXPf8EaUhhHqbjvFxe4m7UjvZE7pbgSm4rA0x2qmESY42e
 p1AzQenmfsxenWtHZNvrv5u/JgQK3P+yrtkLN3M3qeg0pwd7nVYfw6EMP6YML3ykRMz1
 6tezPB6ZgFwqMTS5wHUvP5Ljv+U5IYnJb2mXyeT2eeIINA6OoGDctYI4+QqlPF0bF7+d
 Td4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nzuYnR+/tq210cUajV+7u0MJtRNHJO3soe65a1xwZvE=;
 b=CXsfvO8pFvQgxnTqVSFk5xOLoFOM48B3sXHsFOSkj8wDsZc+Q8YAD/bT9uA73JbqEX
 JymOzP9LQenVXBAMLhvwQ4eRxfGywpI3/u3S55otKl3kPvXR94B9aYODjYDSF1apwEUU
 wu+3hSeZOSe0TfkiGBth/WiUjCm9j17/U1zSD5XzK+Ueh/MJqRNTh6GKlWHzVRJkb0EA
 AGM40iSPEaDS/C1GvD8ldv+z9Fh1FGJhvdzKEqkmsE9BxW/LFY3+5QdJhsC5symwH7Xx
 5l/PBlCNHgKbTWgN5NNb88a2WEIj/nryLC9aBiPlTPF04KEivfufY3MB79yBudOAUeIp
 KXmA==
X-Gm-Message-State: AOAM531Xc106GCJPpsE5GSdV3Oc9FTVlSdzV9AxXIKp5RxQfMuR1yGWr
 cIEUYHTXPue+2Wt3l4KGJSA=
X-Google-Smtp-Source: ABdhPJykQo12Qllq7727sFF4XcBzGXQQE1E/UzOntiyX9V7tjwX0/fB0OLwA4K3kUK050SXGxAIwdw==
X-Received: by 2002:a1c:66d5:: with SMTP id
 a204mr18915122wmc.184.1606067906918; 
 Sun, 22 Nov 2020 09:58:26 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z19sm11689403wmk.12.2020.11.22.09.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 09:58:26 -0800 (PST)
Subject: Re: [PATCH 20/26] target/mips: Extract XBurst Media eXtension Unit
 translation routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-21-f4bug@amsat.org>
 <7b5de3f4-92ab-432f-8044-c06baa7af4e0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9b88cec3-f3eb-08eb-a173-02e56072e82c@amsat.org>
Date: Sun, 22 Nov 2020 18:58:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7b5de3f4-92ab-432f-8044-c06baa7af4e0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 9:13 PM, Richard Henderson wrote:
> On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
>> Media eXtension Unit is a SIMD extension from Ingenic.
>>
>> Extract 2900 lines from the huge translate.c to a new file,
>> 'vendor-xburst_translate.c.inc'. As there are too many inter-
>> dependencies we don't compile it as another object, but
>> keep including it in the big translate.o. We gain in code
>> maintainability.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/translate.c                   | 2890 +-------------------
>>  target/mips/vendor-xburst_translate.c.inc | 2893 +++++++++++++++++++++
>>  2 files changed, 2894 insertions(+), 2889 deletions(-)
>>  create mode 100644 target/mips/vendor-xburst_translate.c.inc
> 
> Where does the xburst name come from?
> It's a little confusing that all of the comments talk about MXU but the
> filename is xburst.  Perhaps add a comment near the top identifying the rename,
> if you can?

This is in the first comment:

 *   "XBurst® Instruction Set Architecture MIPS eXtension/enhanced Unit
 *   Programming Manual", Ingenic Semiconductor Co, Ltd., revision June
2, 2017

But it appears at the end, and the comment is 340+ lines...

I'll move it to the top.

Phil.
> 
> 
> r~
> 

