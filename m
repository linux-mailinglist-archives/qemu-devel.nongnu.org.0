Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DDC41155F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:18:17 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJBX-0004Qs-QN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSJ8J-0002QX-TH
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:14:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSJ8I-0006yV-Ah
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:14:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id d21so29542939wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n6WkSztp8JZ0aKXNeH4m+EbhwlRlnY6GGMydiOibA28=;
 b=Brg1e/6oEcid9rqHUMgETl5bKPLmRnjI/TJ5OuVamR5GUD0WUV5pDuK69rIQ1QKf3a
 zrXFo2jwCnFhutkhc1l4SPYwuP6+d7XHeMiXSZVB2ECAL0Qh4mhezpbqY66aQ7YGaesa
 pHBLWRW47VLdDhJlOTAXkmyFpZI1cfwHhX0+CjCfSm3/MzzyFJvyti2gkhPO9DKYj9Kh
 sh7Ef/5H35m2p7fQpHeK8kK78iKwmUQe2zgbgc62wp4I7YrNZrFubmVSOeKsX8lfFtdf
 T5GG/GuIohm2nsD6pDYJ1Q2rHznQARSvcdwHDR2eZ5qgdp2BPUD2GrFK8JP7TE2QHNNK
 Gaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n6WkSztp8JZ0aKXNeH4m+EbhwlRlnY6GGMydiOibA28=;
 b=b4WZkVo+PbDw5W2NhEWYIY8sUuHHFKkhfrszHnoW1Y7L87oK09h0iFt9B2fIyIbuag
 0IkgQKwvdKBPxdAWOp5EH6aJ9XmLoRlB8THW2W2Pb1E5PFucRViHmAO9moQCbf6I2If+
 euG7fgktumqgnkMYDYX3u/sIsMy5PjlZJQU3saKNkbvYbmbIa5gR5hEObKEKDbHCTvr8
 uVRr9y3vmXHBp1Ut4ZuDvz7GRwuHM0cIAvA13iRCTgt4InnnlPe0YIY1Pj0NEl5rZSc8
 cj3X2BCgZAzF0CWFklOqAf43wbQ66zoCTNAAeaMyafvEPbvz0njVkrkJLulLJoeVImOs
 P+hw==
X-Gm-Message-State: AOAM533mLxx6+ahpB2aYP94JWL2w05FpP+b92Qa+3oytL37Y5nMDu8Tb
 Wwr/H8rQiB6pwbTSxch47f0=
X-Google-Smtp-Source: ABdhPJyqBpanqDFaFp4F8GksRjf6/E//HNVurHmrUgn8V2sG8bgNj/sidQEb4YMHr6Gpqtv6RryTiA==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr24308625wmc.181.1632143692543; 
 Mon, 20 Sep 2021 06:14:52 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id i5sm15853371wrc.86.2021.09.20.06.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:14:51 -0700 (PDT)
Message-ID: <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
Date: Mon, 20 Sep 2021 15:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/35] tcg patch queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 12:07, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>>
>>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916
>>
>> for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:
>>
>>   tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)
>>
>> ----------------------------------------------------------------
>> Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
>> Move cpu_signal_handler declaration out of target/.
>> Misc tcg/mips/ cleanups.
>>
> 

> The 'check-acceptance' job also hits a timeout on the emcraft_sf2
> test:
> https://gitlab.com/qemu-project/qemu/-/jobs/1604251596

cd0d814b4b9b732f11885889070adacf87447751 is the first bad commit

    accel/tcg: Implement AccelOpsClass::has_work() as stub

    Add TCG target-specific has_work() handler in TCGCPUOps,
    and add tcg_cpu_has_work() as AccelOpsClass has_work()
    implementation.

 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)


