Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821673F9F10
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:44:08 +0200 (CEST)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgpj-0000ih-JY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJgbw-0003dv-1K; Fri, 27 Aug 2021 14:29:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJgbu-0005G5-HV; Fri, 27 Aug 2021 14:29:51 -0400
Received: by mail-wr1-x431.google.com with SMTP id h13so11837627wrp.1;
 Fri, 27 Aug 2021 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tUKEmAIVWGAUDdNwaPnLSPyB8egaP+f1AL5oy0771os=;
 b=BEeiq0r5BSFbdOKHZDuefAOF1xfjsWQU6kGPgz5XXmQCyxGx/YXfJtieBF9oXwTG3Z
 17MuaWpYSeMgZIyXPob4d74NwVvM4oniS76KyHPvh9YwHGrs+NvJw6vqwX6VqKZdVbyZ
 XC2F6HcV1bdcOWe2ht59kBM89H/5AFFqWeNZocicKwfxBWFWhVpzPLVIwxnMd8V807Uq
 bJ5PdG9DGRvibbPdcMAMU4PSN5ftyDFWKXd4J0m6HgIfYyuR3NDpXD0ma+h8aY19SMWu
 lLLXnh6YiYytkgrZqUGOKOCJPmL/kaHbeP5cNLG/akDHE0sXzYVVJVUvI85NeLyQH97Q
 GqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tUKEmAIVWGAUDdNwaPnLSPyB8egaP+f1AL5oy0771os=;
 b=tyoc3h7dffPyWegUxdt/seXFZnjW5vxa0NgeIv4l+MRkEQJ4uI9WRNi8hl3UunTXQ+
 QOVatkauk9ofeBd8ElZ5jZ/iDeFq+i1NHyNO5jwKzOTNlhAKTQ2B+YCEQeW0K1bh6li/
 MknzYOnx/NWPlFnzYgbrzziV/z8EnVYs/4/rWFY5PSzTzvVr9CU8ccQZDVUxAVxD1x53
 wATgLzfT/fDibRlRTgV5Qz1lH54DTjG4yr7kKiWOgl8zzNm8szybSpGj7E2LpVN0RSG2
 vZrQDU3z/eaA5o7EAnKNXprMjgozCRc778brixf1l7c4PQDTQeDp7B/oli77uCsDHNZI
 ahWw==
X-Gm-Message-State: AOAM5309/aFHTPnC79a4/XeaHchKROGNs1LJHa6JYsvUnFpK/6Qrzpz9
 AfDJ/kjl6dmHzrXFOsoyUx7dpaC/npI=
X-Google-Smtp-Source: ABdhPJw1iSSl8VC5//vEUdOobe8c0KxUZOdxYe8mJXyUxSqktALK+EwdnbJWZ7vdSGvE+EtWSXWZmw==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr69286wre.26.1630088988950;
 Fri, 27 Aug 2021 11:29:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d124sm6044061wmd.2.2021.08.27.11.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 11:29:48 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
 <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
 <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <88820040-ca86-1442-5dd3-68ecbf878c87@amsat.org>
Date: Fri, 27 Aug 2021 20:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.437,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 8:01 PM, Willian Rampazzo wrote:
> Hi, Phil,
> 
> On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Peter,
>>
>> On 7/9/21 6:00 PM, Peter Maydell wrote:
>>> On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>
>>>>> Since v1:
>>>>> - renamed tests (Peter)
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
>>>>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>>>>
>>>>
>>>>
>>>> Applied to target-arm.next, thanks.
>>>
>>> I found that this seems to break 'make check':
>>>
>>>  (09/52) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
>>> ERROR: Could not perform graceful shutdown (40.38 s)
>>
>> I can not reproduce. Maybe something got changed in Python/Avocado
>> since... I'm going to simply respin (updating 6.1 -> 6.2).
> 
> I also could not reproduce. I checked and nothing changed on the
> Avocado side. The version is still the same on the QEMU side.

Thanks for double-checking!

