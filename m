Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C4528B0C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:50:49 +0200 (CEST)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdvk-0003Of-4R
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqds7-0000SA-I3
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:47:03 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqds5-0003po-PA
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:47:03 -0400
Received: by mail-pl1-x62b.google.com with SMTP id s14so14990131plk.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HpMJNdTY0O7BmlzK0aMziTJifvMLtRtLtz4a+vaeYW4=;
 b=LauFeiS9avYw9gzXs9l3ys8VoI2Y890nwQgSXJRRjzTVmitFc4+NFMXgjf04kOXqRO
 7U8pE1FPou12k+7NOjp8zRSbPI35KyMivEMKnx4FKQgWb05IUob+Onxt6uvvUREFHgEP
 5d5a9Fj/NciwaHuUydczvVbALuasL5fQNe0XGLIX6Ngp/W8Sc91+1lVwoea1HtJ45AJg
 SRpQMbG9vyC8C5axDJyvvcbKiOZddp9GCgTL0zDxvTZtr9bdStTmX4SG2Qget3r4mNgx
 8fnFRNvu3uchxEHerzLixqsRoSSIDPa6pLMRnydDUaYVpRUtcB3Ge2hCl89vJr8DVRAe
 t3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HpMJNdTY0O7BmlzK0aMziTJifvMLtRtLtz4a+vaeYW4=;
 b=emaDr4j8J2z8aCE5Ny74+bvgzoQDexvZirSrc/7k2CJ2gqf2rfXO4pQpQU76nlKtZ3
 DfT0xJssLK3CpvNRUKBOgNfke7X+ZLTj2IF9HAaBEw1cPQmpK/YwV5Z0vpxng3uyQykF
 QtktTR+jxba2dbzKTqzXY8Y6Ddgyzf381KfRfhVIu40+GQiz7gGxSOl1hCwlVN+jm5Sw
 SE2ozi6T4GUZREnmKkqLZjKDp4t4T/JuRv0L7iQMLMkuV9/1MHZRqqlNfNkXXjFw+c/j
 t64mqW7Vt3zHmkivFp7czKEOZE9CyS/VI+heZ9WiyueCUrfmVQJ69tuTwR4H+lLBEogi
 3j3Q==
X-Gm-Message-State: AOAM5320uv2N7Cs8nIbJgifC70SRhHBy+OSp1ECNALJqBpjbEGXPILmq
 Nd5VxVobJtRut9xAFRyMOVR9lQ==
X-Google-Smtp-Source: ABdhPJxYLxjL8cx52QjsTLDL/WN+LH+5L6cmr6zgEdhRb6wuVYyogRH5/hFsauruwq575fCseKUrFw==
X-Received: by 2002:a17:902:eb90:b0:15e:b55f:d9c5 with SMTP id
 q16-20020a170902eb9000b0015eb55fd9c5mr18583449plg.33.1652719620295; 
 Mon, 16 May 2022 09:47:00 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a63b554000000b003c6445e2aa8sm6996651pgo.4.2022.05.16.09.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 09:46:59 -0700 (PDT)
Message-ID: <02b0c561-c93c-2ac8-7579-6c456c37771c@linaro.org>
Date: Mon, 16 May 2022 09:46:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
 <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 08:46, Peter Maydell wrote:
> On Mon, 16 May 2022 at 16:43, Thomas Huth <thuth@redhat.com> wrote:
>>
>> According to
>>
>>   https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/
>>
>> there was an issue with Capstone 3 from Ubuntu 18. Now that we removed
>> support for Ubuntu 18.04, that issue should hopefully not bite us
>> anymore. Compiling with version 3.0.5 seems to work fine on other
>> systems, so let's allow that version again.
> 
> Commit bcf368626cb33c4d says the reason for requiring capstone
>> =4.0 was "We're about to use a portion of the 4.0 API", not
> "Ubuntu's specific capstone 3 is broken"...

Looks like the patch to which this referred was never merged -- CS_ARCH_RISCV.

I still have a branch with riscv support sitting in it, from Sep 2020. Sadly, I never 
posted that patch, nor said why I withheld it in the end. Perhaps the actual riscv support 
in capstone was poor at the time.

The 4.0 requirement patch itself was kept for Ubuntu 18's issue:

https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg07542.html

# Changes for v4:
#  * Require v4.0 from the system library.
#    Fixes an issue AJB found from v3.0.5 from ubuntu 18.


r~

