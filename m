Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A41413BCA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:53:10 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmlJ-0004KW-B8
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSmhk-0002A0-7h
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:49:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSmhi-00042i-8r
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:49:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id e16so706584pfc.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HHiUm1Knr/0EJQe8VeAadGbRNEOxUwr0dM5MPasGoJk=;
 b=pD7jQCjqKC0Q6EYoAjgNfm4ZRsufEmI+/l/47Q+CCoZdpO/vXUJr6zhXs5gE1szlUT
 sdbJ84xpXoeZehlB7j8wW3zaEGCuuyGnft5ITD+MdjYzzQcbH83QGRAXKGJtJBZ+MQxB
 amnHaOL2wf12RTM1lepgAklfWmpMrlqNrjYFTQJgk311xVAAj1jSo3WLKPSyvPy3W0e+
 966oeLqki4qfGKJWJkLs22jzS2aS/2Y2/DMaqMfxTZJ1uv7caVS61ekSiqsHM2q6zf8a
 LGzfxy6V+XDmQ0adPMQm0/jIy+caNMm5FAU/z/SpYDcLCCo0zqXSKg2P9NIfs52jOfK9
 bgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HHiUm1Knr/0EJQe8VeAadGbRNEOxUwr0dM5MPasGoJk=;
 b=Yb8HMG/I6BQ4ZDOVHlXzm3493Blf5FgavIiFx6P9FTz/kwDDeHU31Sp4YLcB6vfnrD
 cjjuctTEiajPUCE30v9lO/aOxgE2XaE0vIqZTtRPWMNzRh/b3vlFlqqu6gwSIkfBLFkB
 wtj5mrP6LRe04NP3cGD5tpgdPJFHj48V0Uh6nB3ryB8vPEmjiRdJAmBIWVEyj6Rtaxa5
 jNTDgXYgPaSygFxO6/sFLbunWN5VWL7q+zd5P9j3gVFdNh6lcohFD8mX/umo92jtvPXJ
 dohol0Dt6X64jlWMb8fKOS3ZWAqn92hJWQW60UzcJuOaCahb3llzl0IZIpOt9Fmiojv8
 OWLQ==
X-Gm-Message-State: AOAM532gEh0tdTDID2wx6t6wtp6ynVKhgJx8A0EkISRw+guBU5CW4YuP
 DuqAt63RoxpxKVCT/GVs+vleSw==
X-Google-Smtp-Source: ABdhPJx9uu0wa+bph+B6gEroeYxBA3P6jsDvyNLawNVZC9avhSLIhFXFKsqxjBNZXxilEmbrfmQ1HQ==
X-Received: by 2002:a62:1c53:0:b0:447:cb0b:5eec with SMTP id
 c80-20020a621c53000000b00447cb0b5eecmr9776668pfc.23.1632257364577; 
 Tue, 21 Sep 2021 13:49:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a4sm31399pjd.48.2021.09.21.13.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:49:24 -0700 (PDT)
Subject: Re: [PULL v2 00/21] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68032bb6-a669-ba13-6eea-18f39954e6bc@linaro.org>
Date: Tue, 21 Sep 2021 13:49:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 11:53 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:
> 
>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210921
> 
> for you to fetch changes up to ed481d9837250aa682f5156528bc923e1b214f76:
> 
>    hw/riscv: opentitan: Correct the USB Dev address (2021-09-21 12:10:47 +1000)
> 
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 6.2
> 
>   - ePMP CSR address updates
>   - Convert internal interrupts to use QEMU GPIO lines
>   - SiFive PWM support
>   - Support for RISC-V ACLINT
>   - SiFive PDMA fixes
>   - Update to u-boot instructions for sifive_u
>   - mstatus.SD bug fix for hypervisor extensions
>   - OpenTitan fix for USB dev address

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

r~

