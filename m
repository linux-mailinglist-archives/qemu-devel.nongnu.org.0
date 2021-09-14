Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501B40B5E5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:29:50 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQCFh-0006qQ-7l
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQCDH-00064J-9g
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:27:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQCDE-0001uX-Vc
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:27:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so21523742wrb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vXYIi1wpXD+MPtZ6CSLQvGMCdzxi/48oZvEugccQJl0=;
 b=EAfmssFhkCdtXFYUL8Ewk1Y5wbaCquWxuU+UsbeDdpUU/NG2n4Cj8MYiRycKoCE/fO
 QjpKNlj/278obsOTbuefxiWWZzPz0lKe9+qLA79DGNmE2vnCR+LCCul0P3EOMJgVDWiW
 jDNS3hmFHCiEZkxl7iYyVFXViCASaAIme4ArGCjOvIU9VjdwoMzTH6Rt5r6aOrkO6R0O
 jtf/pdglU027+eGNpRVeqBQyOEeWyW0Z9u8UsUowQ3KALPJy2S2GgtqjrSQ2hgBp0t8w
 Au5umE5ziar8um6RYHgEwOtM81PlVQ4iTRfV6b71nPs3jWdvJUlKrt7qlyNVz2gCxZdG
 4kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXYIi1wpXD+MPtZ6CSLQvGMCdzxi/48oZvEugccQJl0=;
 b=V4b1beP+zp2JmCJLd9rjil5rtu4Ol/4RQ+AzojJY5xhemY2zLSuS9lG9a7tKsWoTdL
 meMAPwH5BsXN1oeh5Ya1SdzSQAMVQDq9m9/WCnwxnvnb6BHxkCOXbhidEw0YDhB+uzLE
 n3LhSM36HQIbjCiBqXUD2i4jW5sZIVAiNEjjb/iW3cxwbVB98S40fHBgrb5Yy0a7XCuy
 FhSZ1mzBTnumm8nrTVivBAXzzC26sRLWeDcLPd/ih3J/DcRp0HTNBaee/j4tn7xtzX/x
 zctXcVW4/Zysb6n5rjeJIUe9FRQe7s5PqzGG+ibSu+ch0qC4tP1u16rr0TOYfEzYTLYK
 Gi0g==
X-Gm-Message-State: AOAM5329P/QHa2tlOC7jeDVrPC2FfZ/j83UhKR9EpZxoI4NFYWwM+6wg
 nTB4ljRiGxlN3huJsXk6sIJjK3edhkk=
X-Google-Smtp-Source: ABdhPJyaaU+Y6D9eSS6Vi6yz0ZLG92Wbd+HdkJKSLiIXmlNwZN5Wt0yj5K9DAW2T3UKplC2YIufssQ==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr350487wrr.246.1631640434071;
 Tue, 14 Sep 2021 10:27:14 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 10sm1729859wmi.1.2021.09.14.10.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:27:12 -0700 (PDT)
Subject: Re: [PULL v3 00/44] tcg patch queue
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210914155342.1296339-1-richard.henderson@linaro.org>
 <CAFEAcA-f=n6XHp5Cj7=tH8NWO1GLA50i34=5GyaHrZELyr0bjw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <436fa0e3-ce97-1d9d-339e-828c9266563f@amsat.org>
Date: Tue, 14 Sep 2021 19:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-f=n6XHp5Cj7=tH8NWO1GLA50i34=5GyaHrZELyr0bjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 7:13 PM, Peter Maydell wrote:
> On Tue, 14 Sept 2021 at 16:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Version 3: Rebase and fix a minor patch conflict.
>>
>>
>> r~
>>
>>
>> The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210913-3' into staging (2021-09-13 21:06:15 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210914
>>
>> for you to fetch changes up to a5b759b6dca7daf87fa5007a7f5784bf22f3830f:
>>
>>   tcg/arm: More use of the TCGReg enum (2021-09-14 07:59:43 -0700)
>>
>> ----------------------------------------------------------------
>> Fix translation race condition for user-only.
>> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
>> Fix tcg/arm tcg_out_vec_op signature.
>> Fix tcg/ppc (32bit) build with clang.
>> Remove dupluate TCG_KICK_PERIOD definition.
>> Remove unused tcg_global_reg_new.
>> Restrict cpu_exec_interrupt and its callees to sysemu.
>> Cleanups for tcg/arm.
> 
> This throws up new warnings on FreeBSD:
> 
> ../src/bsd-user/main.c:148:1: warning: function declared 'noreturn'
> should not return [-Winvalid-noreturn]
> 
> Unlike linux-user, where cpu_loop() is the direct implementation
> of the target-specific main loop, on bsd-user cpu_loop() seems
> to just call target_cpu_loop(). Since target_cpu_loop() isn't
> marked noreturn, the compiler complains about cpu_loop() being
> marked noreturn.

Sorry, my bad. I ran this on Gitlab CI but now realize the
FreeBSD job is marked as "allow to fail" so I missed it :(

> Easy fix would be to just drop the bsd-user part of
> "user: Mark cpu_loop() with noreturn attribute" I guess.
> Otherwise you could try marking all the target_cpu_loop()
> functions noreturn as well.

Richard, can you drop the offending patch from your pull
request?

