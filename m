Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89B442E3F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:34:36 +0100 (CET)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhszr-0002nw-Ky
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhswT-0006MM-WF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:31:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhswS-0007jO-0u
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:31:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so1752399wmj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Om7lTl7iqtqCD25Mj/uMN12kP/oY6Qx0CV4A9fq9RQ0=;
 b=X/3DbuZj2BBzWMMl5heNFz197D9Awf0L4PEO9p3EEmfksQRCGuOCnNL9Q9EbrApEyf
 nCp9vsfB6dD7nPSEofEH/lAcyk6Z++9Mw2VkbHKtZWW3KrE7p1sMFb+XYz8jIjS0ZKPf
 uHVFincvAC8vhkVmLxGBRxGDVWDltiNDL+QO2l3/sik4JUz1LxzyHAsPDA+uFqYsO78r
 iuKZypKD4/VAvym/kL3qa/eTR04x1pzJP2JB9oqWVk72/3ZQfX56feXyTJLPypczgBPX
 dW6NkW2kKxbzO0JGIfw1yMOD+VzS4qw+gsJZZKYSBtsBNpCz4ZcwV5IjNdo7Y74tuDNK
 qLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Om7lTl7iqtqCD25Mj/uMN12kP/oY6Qx0CV4A9fq9RQ0=;
 b=MAbLw8caRFQZRroHwR7WswQbQp8yXEA7X3iJnfr2NcmNrEAYUCZwva8o4B5y9GKrMC
 jOc0Aw3LF6ySXBS84PW1RcnmgeAclMyvhF/N+FFqWszpV3FP51ZRImRzz9N3nVSOGngd
 JzyBJIwMQkpxpclnV4AsK3eBZscA88toDgwLPuaibJHf+MMtP1dG87m5HeZzzbNnsv6Y
 sNECp4TjFaTHj28TotuR2ZWBliQjc1O5/NRjUiUT1tjp3CMKVNzoOdQVoNize6h0WygY
 ZYdSqRevMM6mWWjk+XJ8UczijGgqnIfPVMlMMN2NUbiAFsn8nmWSJnAfO648J1bNMcDa
 4d+g==
X-Gm-Message-State: AOAM531TtfCcuwc/t0VqwBaXXuSoZt1xf6J80hZEmC+ggtk3IBHDI8bh
 h/b7W16El74u5C7qomnxNqE=
X-Google-Smtp-Source: ABdhPJxqBFjEdk8Fa1OzIrJZaXryB/7E09R5JkRy+smguRFAYDGRAuAjiCwa2+tuSfDEp5oaJa5k2Q==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr6740928wmb.78.1635856262181; 
 Tue, 02 Nov 2021 05:31:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm2662813wmi.1.2021.11.02.05.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:31:01 -0700 (PDT)
Message-ID: <5779fee0-b41c-d9ab-e74e-835c37d04303@amsat.org>
Date: Tue, 2 Nov 2021 13:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 20/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 1/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-21-f4bug@amsat.org>
 <7b392e80-b4a5-b01a-e9ec-0d2fa6a39e76@linaro.org>
 <df826b1b-f563-2fb9-7e92-f823dea61936@amsat.org>
 <5e9487be-f0cb-391c-11de-461e536fab65@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5e9487be-f0cb-391c-11de-461e536fab65@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 19:50, Richard Henderson wrote:
> On 10/29/21 10:23 AM, Philippe Mathieu-Daudé wrote:
>> On 10/29/21 18:35, Richard Henderson wrote:
>>> On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
>>>> +@3r                 ...... ...  df:2 wt:5ws:5  wd:5 ......  &msa_r
>>>
>>> Nit: should this be called @3rf, since it includes df and...
>>
>> "3R" is how the manual names this instruction class:
>>
>>    Figure 3-40 3R Instruction Format
>>
>> 3R has 2-bit DF field, 3RF has 1-bit DF field. The other
>> arguments are the same (for the helpers).
> 
> Ok, I see.

FYI I amended:

    Note, the format definition could be named @3rf_b (for
    3R with a df field BYTE-based) but since the instruction
    class is named '3R', we simply call the format @3r to
    ease reviewing the msa.decode file.
    However we directly call the trans_msa_3rf() function,
    which handles the BYTE-based df field.

to the commit description.


