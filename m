Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C8328125
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:45:09 +0100 (CET)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjnI-0005qi-Tn
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lGjkz-0004E7-Uu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:42:47 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lGjkx-0004oI-9S
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:42:45 -0500
Received: by mail-ot1-x32b.google.com with SMTP id g8so12996333otk.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=muYCTXVdLJ6CbfyyOAOGWFWB2m/EafH9clXz8BJBxvY=;
 b=ov9RD5WPNtRFSg7k8BznDiqgNLG/gB8d2myEgf/f/Vm9fNUtIXT834nTTKKCHkpzoz
 mDH3s66jZX+w3N2QtAw3rXIAE9ICBV81lwfMFX+ZdoRd1y62Sqmpmlp075B8iC9lodsh
 kNez8JucdHO9jynH5liKiACpj1IiJq5FqmBZ82PeIZML7h5/RTdjWqkDB0NQXU5lvA+H
 40lyaincyJKK+AbowKHrnk/zlMo/tGZBpKsyMJTydZ2zJ5doL30BkxBEORdIVg3Nn7Ur
 gYjpsCMG7XiYw0wgqmVUp0bIZnWZUEs5GhgsNYDfgT+G4soZfmNRw38dDM3h9SHvknxb
 Trfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=muYCTXVdLJ6CbfyyOAOGWFWB2m/EafH9clXz8BJBxvY=;
 b=Vd0/TpHsfdBctpm/ooN5kdiaPP9LLvjw5VRyJdrHmMp9A6flTJRP3m4C6mZ1aO3Zvl
 sDJ7jCUtk48ftn0Sysk5ZjGjq/KQW28GMuLKiWTcgbiavWRAluTYjAqEDyFeF3UXSVgm
 aU4t253eP77ubwqVcZEpUbLlORYKJRR7rEnng1hmuRPErvOl3wEKjVAPD8Z4Uc3YTzO3
 VwuzuTPbx3lAcwIk89+zlAKVUoHSGCE0cEUpbR15PcEZwcRbR1pMZhEIYcLBrNe7R60N
 3cDIWs1FvTtFb68DLKIFsyF2nFmjskeQFDBFAosPqFNyeaUFUkKJAf8NFQflg48qUb51
 IWZA==
X-Gm-Message-State: AOAM533eDJr59qfHvyO5utXiAC87yFJXXApV9J0AVy4nFZaTd+e7f/2u
 1WaVz+zD8Pf8D1zyVj6zS223/nRIYnSoM7xfHb0AEhnNwCN8IeVtMtdy0+Sx0ISq9Pw3b7j2Hf6
 vSw1W2l/4g1bADit/VnfpX6zDdBtJH2HRE2Y5xFn4EN6KFAEJ7B1r/IHn3jYQZpHY9nVUq04=
X-Google-Smtp-Source: ABdhPJyFSEbbKzHFpZvXaeAMMj2H0yIcVg8Zq6ntwCJn44JSUoZd7sMfq/HXIiZtlf6c4pyv7JdBRQ==
X-Received: by 2002:a05:6830:4d3:: with SMTP id
 s19mr13681317otd.355.1614609760914; 
 Mon, 01 Mar 2021 06:42:40 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d26sm2320314oos.32.2021.03.01.06.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 06:42:40 -0800 (PST)
Subject: Re: [PATCH v2 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216224543.16142-1-rebecca@nuviainc.com>
 <20210216224543.16142-2-rebecca@nuviainc.com>
 <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <3763284c-e68b-d7c6-511a-65104a5f48cf@nuviainc.com>
Date: Mon, 1 Mar 2021 07:42:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7ad3acde-1f9b-13d5-7600-000400fe0c38@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=rebecca@nuviainc.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 8:45 PM, Richard Henderson wrote:
> On 2/16/21 2:45 PM, Rebecca Cran wrote:
>> Add support for FEAT_SSBS. SSBS (Speculative Store Bypass Safe) is an
>> optional feature in ARMv8.0, and mandatory in ARMv8.5.
>>
>> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
>> ---
>>   target/arm/cpu.h           | 15 +++++++-
>>   target/arm/helper.c        | 37 ++++++++++++++++++++
>>   target/arm/internals.h     |  6 ++++
>>   target/arm/translate-a64.c | 12 +++++++
>>   4 files changed, 69 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

I think this was the last remaining patch in the series that needed 
approved?
I just want to check I haven't missed anything because I haven't seen it 
go into the tree yet.

-- 
Rebecca Cran

