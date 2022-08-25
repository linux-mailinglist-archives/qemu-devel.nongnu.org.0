Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A45A0905
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:43:48 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6ag-0000S3-VU
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6TN-0005wj-Gt
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:36:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6TL-0007f9-G4
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:36:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id u14so23292346wrq.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=d7UStIX39CNRrvv/KKdJvRoFW9hPhFsDGQ7JQijLQsw=;
 b=ZriFRzu3BRWJOQby/AsAJADESkbPy0CmlFb+xxRVvojcx5JRvSEFe9dpsRhn1wJXac
 dnuFlYv8pu3wYopfIEAHxnryGjk/rdO/6QhesdQeB5+StDoCjaDM0Oi/JWcJhnoMb5mA
 LshFbvT/9sJeI1XBD4FjfK3TGGBjIUU/hKtBaXVOavUGP1V7EwvrU0iY0hr4Xao5K6Kt
 E7MGDmPr8unsiiIreLRXDOf32lA0/c+3gQPsM9tRPlA9eNCRXsMI77zFTY4fSNczjiB+
 JpPyc8V0f+iKJuPnm2Kr/xDH0piXGzyDBZUyNSJTBf8mXIGdcGh5+UcZzE+Kn0tNXVZW
 LqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=d7UStIX39CNRrvv/KKdJvRoFW9hPhFsDGQ7JQijLQsw=;
 b=yJkIiv1aHJiZDOmiWpf99HA5e94paflBQUrZweEq4A3YiqmyJQmaZzZUAlmNvzKNPR
 NG9+BWSYOvvkrgr2UVARsdNIt9++SXTAGph0U8HBbjikUdRAUKShN33dROsF0NmGVW4A
 SIKAnpf82ibM8LlthSAJrWUNaqutQm0rqZybP28a4DSWQx94Hen10pISmp+7IZpQOW2C
 N9NYHk0uE4jaFd0bu0zePf3SyqqxV15ohfSCZeRO7IHS9+0nl9GOXtmXW5e57b4NaT9v
 HNYx3JTJBqcQJ3BF8GkdRsijWvXz3+IUqBuDQOH26sjTRHFfb4iD+NZLW283gz24Y1zM
 C64Q==
X-Gm-Message-State: ACgBeo3zrWI1eQt2eC70jlthIZxLtqsEAQ9jMdVn+rcdT2Teu8rImf3c
 fuzcA88va9ax41T0a6gF7dA=
X-Google-Smtp-Source: AA6agR6r7MqClw3p0l/clTTBoAB637TmO5IL98/m/vZvRuAOA4JCYtJZNR5XG2NU58qiiCRrJWjS4w==
X-Received: by 2002:a5d:64e5:0:b0:220:7859:7bc with SMTP id
 g5-20020a5d64e5000000b00220785907bcmr1136443wri.669.1661409369102; 
 Wed, 24 Aug 2022 23:36:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 s1-20020a7bc381000000b003a35ec4bf4fsm4084530wmj.20.2022.08.24.23.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:36:08 -0700 (PDT)
Message-ID: <9749bce4-e55d-0a5f-66cd-ff340c2ccc6b@redhat.com>
Date: Thu, 25 Aug 2022 08:36:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 00/17] (The beginning of) a new i386 decoder
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <dd30d0e2-3e7c-164f-5a34-98c67648c5a5@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <dd30d0e2-3e7c-164f-5a34-98c67648c5a5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 8/25/22 01:01, Richard Henderson wrote:
>> One notable
>> difference is that the new decoder always sign-extends 8-bit immediates,
>> so for example a "cmpb $e9, %dl" instruction will subtract $0xfff...fffe9
>> from the temporary value.  This is the way Intel intended "Ib" immediates
>> to work, and there's no difference between the two.
> 
> That is in fact an improvement.

Yes, it is and it is a direct effect of encoding the operand types and 
sizes in a table, instead of writing ad hoc code everywhere.

>> Anyay, porting these opcodes is really more of a validation for the
>> whole concept and a test for the common decoder code; it's probably more
>> efficient to focus on the SSE and VEX 2-byte and 3-byte opcodes as a path
>> towards enabling AVX in QEMU, and keep the existing decoder for non-VEX,
>> non-SSE opcodes.
> 
> Eh... I disagree.  I would really hate to retain the existing decoder.
> This is already so much better...

Absolutely, it's just a matter of programmer efficiency, and then 
SSE/AVX is where I would start.

I would hate to not get there just because I didn't have time to 
complete the last sixty-ish one-byte opcodes (which are also the ones 
that benefit the least from table-driven decoding; that's already 
visible in 90-9F).

This was just a heads up that if I complete this patchset I would 
probably ask to have it committed with "just" SSE/AVX (plus the BMI VEX 
instructions), in a similar spirit to how the Meson conversion only 
covered Makefiles.

Paolo

