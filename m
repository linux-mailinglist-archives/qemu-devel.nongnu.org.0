Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40B53C166
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 02:06:13 +0200 (CEST)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwupP-0004Td-V7
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 20:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwumS-0003UD-TY
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 20:03:12 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwumR-0002vC-5B
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 20:03:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id b135so5972265pfb.12
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lSYsrPU0wHrkSmBa/82pMLoo2ptTjKoSk39zVdm2zm8=;
 b=OG6k+O/uDmWwukxnGX1ZaRLxKq6O895y7grebEsTc1od994RK2K9kGhY+Slxn5+Gfg
 rJRvOd2TvLckTWGXKZauegqA40R1DDgRpizAzrTHzSPkZ5LKLNRACxuGEHhs14AvdOkt
 m2lgXUglxczgKIuwVDTdJfoI/TK5OuWlzh3eEV9toXbCkWk0T31Aho/lr981tW/ydmqy
 64CGl9YIIhGXNQdCaYX1zl3xYCXkzf9mfpqajwh5ztBUmDPX3cXmLY+ASROauj2cpC9g
 RppmsPlbNP+cHHjyrPkbvR7g14ty/1EvBtYp4931s9I7f4Vpn37quaAWEhAVqgNf1sYX
 gyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lSYsrPU0wHrkSmBa/82pMLoo2ptTjKoSk39zVdm2zm8=;
 b=hF5672C2FnYGSD4v8ip2dqOwzWUdeW/WYUuusBvTTgHbFO5jtVFzJ19YXZD7rYtmzE
 ddhqplPG4uh1Urgb/e9pMPYuEu4n63iKUcDb/Cuu/RjwpWLWk6kIsEkvgLcN7v5tVLua
 XzFWaLj9fIxJ53Q9jBES8YgbeT1hOTPnsLZurQahWYb1BZDzGn6hKY7UQKaqGyRL/RPR
 f1SQIPeOEg7miSCda7hQhZvYA/VhorsXRmSaKLa+7+5BSzDc6/KwOQhbrsliUr95KM2o
 pw+NpT5wazTZqfJj0mLo0JGBR/35tEhyYd1/oIhOpB5foxENP+flSFalVBow3AYC5qnb
 WeYA==
X-Gm-Message-State: AOAM5309GkIQYSZr/szTyr62ug88KPfkZ7ASVfLS0xxFKY/BMib7osUp
 eEAqM8HSZzkaS8kKPkOAhAe14Q==
X-Google-Smtp-Source: ABdhPJzf9HC+4mpJMS6FkUjbtjVI8yhbvswfI9gTm2GMRwkxMBtGlx2YQ9XbP46FCRLFMpWu7j8ZYQ==
X-Received: by 2002:a05:6a00:c95:b0:517:f266:465 with SMTP id
 a21-20020a056a000c9500b00517f2660465mr74788666pfv.42.1654214585370; 
 Thu, 02 Jun 2022 17:03:05 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a170902ed4200b0016392bd5060sm4069670plb.142.2022.06.02.17.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 17:03:04 -0700 (PDT)
Message-ID: <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
Date: Thu, 2 Jun 2022 17:03:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
 <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/23/22 05:15, Thomas Huth wrote:
> On 19/05/2022 13.41, Peter Maydell wrote:
>> On Mon, 16 May 2022 at 16:22, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> Now that we allow compiling with Capstone v3.05 again, all our supported
>>> build hosts should provide at least this version of the disassembler
>>> library, so we do not need to ship this as a submodule anymore.
>>
>> When this eventually goes in, please remember to update the
>> wiki changelog page's 'Build Information' section to let
>> users know.
> 
> Done: https://wiki.qemu.org/ChangeLog/7.1#Build_Dependencies

Ho hum.  So... the first time I try to do any actual debugging after this has gone in, and 
I am reminded exactly how terrible capstone 4.0.1 is for anything except x86.  There was a 
reason I had chosen a development branch snapshot, and that's because it was usable.

Here, for instance, is how ubuntu 20.04 capstone disassembles
tests/tcg/aarch64/system/boot.S:

0x00000000400027b0:  10ffc280      adr x0, #-0x7b0 (addr 0x40002000)

0x00000000400027b4:  d518c000      msr (unknown), x0


0x00000000400027b8:  d0000fe0      adrp x0, #+0x1fe000 (addr 0x40200000)

0x00000000400027bc:  91000000      add x0, x0, #0x0 (0)

0x00000000400027c0:  d5182000      msr (unknown), x0

...
0x0000000040002850:  d5381040      mrs x0, (unknown)

0x0000000040002854:  b26c0400      orr x0, x0, #0x300000

0x0000000040002858:  d5181040      msr (unknown), x0


And this is the extremely simple case of ARMv8.0 with no extensions.

I am very much tempted to re-instate the capstone submodule, or update disas/vixl and 
disable use of capstone for arm.

Would the ppc folk please have a look at how capstone is or is not handling ppc64? 
Because I strongly suspect that 333f944c15e7 ("disas: Remove old libopcode ppc 
disassembler") is also going to turn out to be a regression when combined with the removal 
of the capstone submodule.


r~


PS: While there are tags in upstream capstone hinting at a 5.0 release, there's no 
timeline for when we might see such a thing.  Anyway, it wouldn't help anyone with an LTS 
distro for the next half decade.

