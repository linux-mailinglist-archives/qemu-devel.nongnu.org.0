Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A574130E5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:46:19 +0200 (CEST)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScLy-0004Yz-Dn
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScHo-0002as-6J
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:42:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mScHm-0002tx-IL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:41:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so37189503wra.12
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OEgUg0wTP/3KjX+6dESwhDMou3aqagEAiX9HEbjvfJo=;
 b=ShS6i9TLbsf9Wn0dZB9nwLUUpmoZ2xXwluQJ9UJ82Jl7f1S65UMbyjhknC8ZGD6ObX
 rCsv1urwe2cAAfPIOlVni2l8B70tACBihAxgxKfr2yuqEyPfEjE+tP6Ooa4Bc25g/TWC
 gbr/scvib2BrYElnZH2SQQpEEkGYMhP235m/U184URw671x3EaWC4tZprP5TxCK6LYup
 AguEckwQCV81Oui8AKsMOpgNnhiho6PkRN+YJZWUT1jgamfl+rLrl+CMrg5mKrbiQ8Du
 IoM9jNTPz4bXBa/hBIhShBehYsG1nvI/z0mxD55wDhbIrd1T5SVNR0EJ/xzHIXaRQ27C
 a/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OEgUg0wTP/3KjX+6dESwhDMou3aqagEAiX9HEbjvfJo=;
 b=dgI0MNou9IJ//I3wdfqsGmJsyQ7QP6i1xoTd23SjVV/nFLTYo7YLSv8IbzzEPlSakC
 r9Y3oG2C0GXzCJBZaAYUXSuTAPkUbm18NhOWWdkN+RVZVGG2kJPMzskMovfp7HRkP6HO
 CCeRDsyhhYitIfSwXWv10FUP+yVYdzSEz8mNCq/j7/VSqbR7in5cswYUfmiY99fINWmz
 M2IYVeYgkR7zy/5KsrpFONKM4/ZM5W1GpkJV12ebIBXcT8hwXDTT2OlNhA/k/OD74aT+
 XlQCPcvUdrdwFqXHnC386c3TFSOscKA5Qib4OfhTAYkRcJT+NB+jRwcwROQTQERPyYTF
 851Q==
X-Gm-Message-State: AOAM533AJUMR9UI6tylYPTzPktF2JyMHKwt0dsDjU6J2FQ+GaBNwnBy5
 Wck8mafnMjKfG0vDTTaSwdg=
X-Google-Smtp-Source: ABdhPJxQxm88a98/TqnAZPZmbTyySRLdsPrqNG3+v0F4fwrc6QtVodp3ZmrG7tUhPCIPRSk3VqEaag==
X-Received: by 2002:a05:600c:1d16:: with SMTP id
 l22mr1783520wms.101.1632217317023; 
 Tue, 21 Sep 2021 02:41:57 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l2sm2789795wmi.1.2021.09.21.02.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 02:41:56 -0700 (PDT)
Message-ID: <c89c508e-bfe7-ad2e-b974-373e1e8e66a6@amsat.org>
Date: Tue, 21 Sep 2021 11:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/35] tcg patch queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
 <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
 <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
 <b4d17773-b226-b537-0374-46a668df0af2@amsat.org>
 <CAFEAcA-+pwETXYtSawvCRjLk2qio8PdEhnhW4yFhF85VvijVeQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA-+pwETXYtSawvCRjLk2qio8PdEhnhW4yFhF85VvijVeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:28, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 22:16, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Forget this crap. The missing piece was:
>>
>> -- >8 --
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index 0d5adccf1a7..da348938407 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -23,6 +23,11 @@
>>   #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>>
>>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>> +static bool arm_v7m_cpu_has_work(CPUState *cs)
>> +{
>> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
>> +}
> 
> Is this really all that's needed ? I would have expected
> at least a check on the power_state.

I started reading the PSCI spec this morning and you are right,
it doesn't seem restricted to A/R profiles, M profiles also have
it.

