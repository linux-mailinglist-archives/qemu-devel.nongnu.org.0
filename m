Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171B66BE01
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:41:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOnG-00072p-BV; Mon, 16 Jan 2023 07:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOmz-0006uJ-S6
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:40:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOmx-0005Xn-Ur
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:40:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so27340357wrz.12
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T0DnhvNFGwHuRGwEEuxHzYvSKe9TQZxtnNHYQv7Jwds=;
 b=w/6RDx1BLSBYgB1DPhUjc4gjvUx+j92umGSw9FFx3woQ2hESgFhafzh+HnRvyLrt1W
 V/Gt50Qcyegtgg2eGFgEeO1S2W/FeuIpkIqrVuLKW036/wrvrMgZg+znXqZw65OpgRHZ
 yxly2lFaRmWW2ARZlu02Di97zTIgX/m4GH70dUqey6ob4ZqJrde1nbdfxH0Vd/yz2NFE
 bJejOlvqQHShAwkqxqoRKHHXlPTHHv/R8/Lqub8Hfa9A/sGrP7NdyB4bZ76yDYaarCqW
 FT7bVU/OiRK+IuzH0U0q6LGXrYEqDrLFzbwMw/nYtwSpC3FMzdbnIDTPAjIOVUzzhdya
 z1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T0DnhvNFGwHuRGwEEuxHzYvSKe9TQZxtnNHYQv7Jwds=;
 b=hbdpPIcYh2tZJH6xtskazhvGdbxbJ5TLVD/i+jt/rp7qu3iN8XOrZv4iiD4QlmeiYL
 j8VWHVX4BiRKtyiUDybEkeK1jScxlo7M19y8U0J+rdpSei/MrRMSu3JnWBI6CrXz2gJK
 VFMjUZsH1ZtZlCLsVL19CaIEbb/2zwly6EccOWDAqED6boUxpDOK4UL65C8phtoOJG1w
 7DHQ8Zo354KkGTaUXD+liuNGHAJYxukDB1V6NQvFGBCgAGmIhs/83EEvct8jf+Pw8d+u
 BOJDdkxW5ekTx16xmw2tXsYeKtQezc08lbLtt5PzEJiyPNAZa4W+3k0OYgfGOM7nY0K1
 2lvA==
X-Gm-Message-State: AFqh2kqQio8RIDba5qWCxWVnD7WgxVurqjzk1HTjnQggygUWIpWzEpIj
 VkJdY/Eoj7QQH1zC6Rsg9E8JIQ==
X-Google-Smtp-Source: AMrXdXsw/bdAzrE6lyUYRIuWy03wpiIkU4ORvIJFr0YZkLjO5jUMKG4Q5YFTSLW8yaM3t3CQnH2+Pg==
X-Received: by 2002:adf:d851:0:b0:2bc:5e1:6ff1 with SMTP id
 k17-20020adfd851000000b002bc05e16ff1mr8265962wrl.10.1673872834152; 
 Mon, 16 Jan 2023 04:40:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020a5d4d41000000b002bdef155868sm6487957wru.106.2023.01.16.04.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:40:33 -0800 (PST)
Message-ID: <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
Date: Mon, 16 Jan 2023 13:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87pmbil5rn.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/1/23 18:10, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Sat, 24 Dec 2022 at 15:19, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>>>
>>> Add a test that locklessly changes and exercises page protection bits
>>> from various threads. This helps catch race conditions in the VMA
>>> handling.
>>>
>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> I've noticed that this newly added vma-pthread test seems to
>> be flaky. Here's an example from a clang-user job:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3600385176
>>
>> TEST vma-pthread-with-libbb.so on aarch64
>> fail indirect write 0x5500b1eff0 (Bad address)
>> timeout: the monitored command dumped core
>> Aborted
>> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Error 134
>>
>> and another from a few days earlier:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3572970612
>>
>> TEST vma-pthread-with-libsyscall.so on s390x
>> fail indirect read 0x4000999000 (Bad address)
>> timeout: the monitored command dumped core
>> Aborted
>> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so] Error 134

Yet again:
https://gitlab.com/qemu-project/qemu/-/jobs/3608436731

> Interesting those are both with plugins. I wonder if the tsan plugin
> fixes in my latest tree help?
> 


