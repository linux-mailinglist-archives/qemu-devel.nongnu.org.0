Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD004AAD8C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 03:35:04 +0100 (CET)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGXOJ-0003da-5p
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 21:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGXMh-0002wB-Gh
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 21:33:23 -0500
Received: from [2607:f8b0:4864:20::102a] (port=46865
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGXMe-0001C9-Ui
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 21:33:22 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 oa14-20020a17090b1bce00b001b61aed4a03so9898373pjb.5
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 18:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BHv+mOar5TtI9lSHvhE04u+JYCJmdkkLn8IxWcWItq4=;
 b=rD01zJ6QSducPKzKyblXX6Syz7FbcLYB+yzckOhwHZFApRdeSPcH2c6apDUB/7L2SE
 3LExT0ZGDldDBGyU7yws9WRv/I2z4ALLI4pr7h9UCPPxpszf3LDebVH9gS8qdokwtss4
 mvUKVuM0CfBxqT5Sksv56WJdmskvzaSKX0R5E50RTadnrLOufB8UC0M6PyFwKxhKxz2p
 57vVwyMd/+kw59cNNrhQU6cPCp+6z277Hulgnegkz7+5PpIl7ZUTuXaA9U7Z1BZmLyDR
 XZyHAWC24NJKvMzo95m0huqhxzNrcaAAU2l7h3SYzv1h+RWZf4t3NFtWK57bgNk8UjRH
 si6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BHv+mOar5TtI9lSHvhE04u+JYCJmdkkLn8IxWcWItq4=;
 b=Q5ViYNNbX/6VMb3WbXUraorsaPBrLgk7Ib4/prGrY3V3ui4EILQlDIzaFk7j0641OK
 AunfuDZk5st9wTu+qhkccNKB0zlhKZ1C6U/evZMvwmk9EqeFMTeLkZJInO7rzuojlrad
 +Zz47UzJ3T1uOVbRtHVbBLic6eswjebnN3u9HKCHtQQRy7vXdKSfu5GHcvj3KNjt7nJ5
 SaR9zkSfkh0S1Kw35bnqZF+CBqjlDET/WwS5vvBIYu2Z/UmUnoNfzc97m3asIZVgLzvu
 q3G+RDaKdOMgg+/icesyrHExK1SsZA/Rss01hAC5h9JcQtgmtXgpTwqGUhHSR2yOoIZU
 vZbQ==
X-Gm-Message-State: AOAM530B314BfJ7UGbhQSQkgD9hu9NNYqZIMEFp05FJJAY2v+fDiXhnp
 GUnUwi8vZIkwtfcxfFCmQ9qsdg==
X-Google-Smtp-Source: ABdhPJycSRYSrB0J6yqTDinNonEBpDRyWibMgSIr55LxL7irK4DqD1bxd/SOVzfNJH2H6aVIDntkzA==
X-Received: by 2002:a17:902:a413:: with SMTP id
 p19mr10802088plq.35.1644114799145; 
 Sat, 05 Feb 2022 18:33:19 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id t14sm16657733pjd.6.2022.02.05.18.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 18:33:17 -0800 (PST)
Message-ID: <224046b8-4dcc-f0e4-41d0-c78a97542fb4@linaro.org>
Date: Sun, 6 Feb 2022 13:33:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: New arm alignment issue with 6.2.0 - bisected to single revision
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Watson <scrameta@googlemail.com>
References: <CAOG2ctwLQhtezS80vKWZOJQs5k4qr3PsD2UK+cx8Ce+Sa_HRww@mail.gmail.com>
 <CAFEAcA-67WPBrZsnOE10UmrEq3ce5LvuiL3VT9TfSffnM-_UaQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-67WPBrZsnOE10UmrEq3ce5LvuiL3VT9TfSffnM-_UaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 04:09, Peter Maydell wrote:
> On Wed, 29 Dec 2021 at 20:15, Mark Watson <scrameta@googlemail.com> wrote:
>> I'm seeing a repeatable alignment exception running m68k system mode on armv7l (arm cortex a9) following this commit:
>> "fa947a667fceab02f9f85fc99f54aebcc9ae6b51 is the first bad commit
>> commit fa947a667fceab02f9f85fc99f54aebcc9ae6b51
>> Author: Richard Henderson <richard.henderson@linaro.org>
>> Date: Thu Jul 29 10:45:10 2021 -1000
>>
>> hw/core: Make do_unaligned_access noreturn
> 
> 
> cc'ing Richard as this was his commit. Do you have a repro case
> (QEMU command line, any necessary files/images, etc) ?
> 
>>
>> While we may have had some thought of allowing system-mode
>> to return from this hook, we have no guests that require this.
>> "
>> With this included I see this in the kernel dmesg log:
>> [10621.993234] Alignment trap: not handling instruction f843b004 at [<b677bb2e>]
>> [10622.000479] 8<--- cut here ---
>> [10622.003609] Unhandled fault: alignment exception (0x811) at 0xb13eed96
>> [10622.010162] pgd = 45acdb93
>> [10622.012941] [b13eed96] *pgd=0557a831, *pte=c01ee743, *ppte=c01eec33
>>
>> As well as bisecting I've verified it is this revision by checking out clean HEAD then reverting just this revision (+ fixing conflicts).
>>
>> The patch itself just seems to be adding QEMU_NORETURN (aka '__attribute__ ((__noreturn__))') which I'd expect to be benign, so I'm not really sure what is going on.
>>
>> I cross-compiled it on Ubuntu using gcc/g++ (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0.

As far as I can see, m68k never generates alignment faults (do_unaligned_access is 
completely unimplemented), and never sets MO_ALIGN to require alignment on any memory 
operation.

It would be helpful to know what m68k guest insn has generated this fault...


r~


