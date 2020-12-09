Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A92D375B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:05:14 +0100 (CET)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmyn-0004e5-FE
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmx3-0003Vz-Gf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:03:26 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmwv-0001ec-Hq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:03:25 -0500
Received: by mail-ot1-x341.google.com with SMTP id h18so475086otq.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v9Zbd3hMysWUE0vmbip6QeMTd4FqW/oqK4E5d/p0K9w=;
 b=LgP3cCOwkrkvIWeNrQFCD34np7ZTFALmCd8/ykuMhnah6ZBICN4BznmuR5k1UrNKfT
 M0AioMjjCqYoGnmDkog2GYlY1f4P0yADZcpBKNUaS0NVoBPAa8NbaOIU8WBCNAMSXayz
 HBDnHATjFiqC+CUBvRsKn68s35zkWqX2/gTvyhN5W2Dn8pwUV5XPGRd8RqtDaKhpJWYq
 J8FvSGUkKdwR1icCpxZfOUbANS0YRX9rUjQMMy7KhrJOY0/kAlxeXOnvM+8UBQSTt66e
 L7cQAAQ8fFAwu7p9InuSKqjRvV59sG64OPSYuJdamjBYfzaNcX5LjdzG4IS/FSNczQz0
 kqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v9Zbd3hMysWUE0vmbip6QeMTd4FqW/oqK4E5d/p0K9w=;
 b=mGguXQL1srZIoRw/zMHml4DcJihND3JVUU7JIZAFk5VLOe9GWnSrb/CVhgkou5ApUJ
 QV7g0mK7kwb6OFcuSHujzO9IfjaoK+r9mJA0/ntVNzaowds/twOgtzAsJH3O4g547JwS
 m8/vQZJleGUdnp4XvEFKWuiRJyRxTE+0iRH0kuPCGx+TsBIMnZu817xIaeJSSI6WFtfF
 QpHRD7sg4Z3gSkEFQhkxtnPhk2ttPB+Y11CJcercn/IAhsO4hn17JqSKyBANce8rHjEG
 Mjs0v8rCM9OBOXyeInqkMGxLr7HOewNMU3Sl8vBtRliUxfbi5JsW8q5mlnqM73SwDPvp
 1ccA==
X-Gm-Message-State: AOAM532DohHIiXdN2AqOOzBFH/let/3PlSUW7GUDsDmdcqabPCEXD+jZ
 wpjPst931eAROjuFDLiApz4B7A==
X-Google-Smtp-Source: ABdhPJyFOSiIgRDuUOyJ0eSUvk91D5XxLN09325/QoAa1sYB+6paSmuvDwIZGLT5+MsFoqzKtzdqpg==
X-Received: by 2002:a9d:65d7:: with SMTP id z23mr493876oth.131.1607472195622; 
 Tue, 08 Dec 2020 16:03:15 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k5sm127307oot.30.2020.12.08.16.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:03:15 -0800 (PST)
Subject: Re: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in
 'translate.h'
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-15-f4bug@amsat.org>
 <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
 <b0cf35c4-a086-b704-5710-0f05bf7921bb@linaro.org>
Message-ID: <58a0d6c4-fc01-3932-52b9-9deb13b43c51@linaro.org>
Date: Tue, 8 Dec 2020 18:03:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0cf35c4-a086-b704-5710-0f05bf7921bb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 6:01 PM, Richard Henderson wrote:
> On 12/8/20 5:56 PM, Richard Henderson wrote:
>> On 12/7/20 6:36 PM, Philippe Mathieu-Daudé wrote:
>>> Make gen_msa() and gen_msa_branch() public declarations
>>> so we can keep calling them once extracted from the big
>>> translate.c in the next commit.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  target/mips/translate.h | 2 ++
>>>  target/mips/translate.c | 4 ++--
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Actually, I think this should be dropped, and two other patches rearranged.

Actually, nevermind, you already get the right result in the end; there's no
point re-rearranging.


r~

