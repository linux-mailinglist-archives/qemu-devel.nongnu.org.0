Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915425757E5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:14:32 +0200 (CEST)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC82R-00022R-94
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC812-0000VQ-8T
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:13:04 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC80w-0005h3-I8
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:13:03 -0400
Received: by mail-io1-xd2c.google.com with SMTP id z132so2718530iof.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vazCX5gRNxkaKGQ1BugtbIk2BgCrm32nWYMIAJbwuQg=;
 b=NHOsHknkiNqe4o/IufHCkfg4SVFfKkQgH/dj5TlrYfHtcyJ4NZqWqyDTyPAzAPR5Ud
 NrCj5Nh3ohhQWmtD9xKzhJTUNy61RJktGtkJSJKPQHwO7kKcMq33p1RWhAOwRDfjNUHc
 CcQNgU/n6tWn55zhJvMP6VDQ/M4F8dnfFLL9pD9iwl0pXhL/BJGoTt5cCczhlMke3F7E
 fZ5kTQiVjLdQGSxG/lZJ6IW/2VM57iFpBd2a8jOjCkJ7j0k2G8EPx651Td8v5IXfsY3X
 vlFFMZGMylk5siGAOP2AHMjJcB/3IVjs1lzPEnAXvHjqkS39qEkAkYm96yub79Mx9PNi
 6tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vazCX5gRNxkaKGQ1BugtbIk2BgCrm32nWYMIAJbwuQg=;
 b=N1CgR4xl1DpJYkVLLHqv011EClvsa8xPlnhKgfXoaVsuXvUeeJvziVz7QcUUlE0Qu6
 20yiEBoKzFOCN2afZyBCxuBILxXIn7LW7NSkiFXIH+ZBCQkIR34qJ48v6zYkCrk49zto
 OwvKwbQBu6wRttH6dmidRN5LClTWXA69szBAHGNdPqYsn1p2ZUHLvgatpV4LGgqKaF5J
 LvcVjeJO6ms4i2TllmdNF/qzJjhzx1hUwFwNMS4Fnq0Mot6vAUlAHu5qavFNBxy9JH5G
 3GwEmIpsy+7H7a9axXndRdSymSQhEtX4ujChft4bfxMjizE7ALuCCa/0ujnVGfHrS6Jn
 4eSw==
X-Gm-Message-State: AJIora9rjUhW0wd+XIPUk8Z8EKsvkLnHWYyZOcbiYOYECtDx56yZH3pA
 /gpxWGWHwLH387Mzr/pbkJmZSw==
X-Google-Smtp-Source: AGRyM1uG/8GEKdkpsV5nbcz/LbNdN935qhe9H0j5OKGhxxNctYqzE5VzOMPru1sKUlkG4f9QqhfLMA==
X-Received: by 2002:a05:6602:2b10:b0:67b:80f8:6f2b with SMTP id
 p16-20020a0566022b1000b0067b80f86f2bmr5634886iov.147.1657840376896; 
 Thu, 14 Jul 2022 16:12:56 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a6be709000000b0067bcbb0d258sm1317313ioh.46.2022.07.14.16.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:12:56 -0700 (PDT)
Message-ID: <bcc17531-f644-f6bb-b6c6-a160f39889f1@linaro.org>
Date: Fri, 15 Jul 2022 04:42:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/7] target/arm: Define and use new regime_tcr_value()
 function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/14/22 18:52, Peter Maydell wrote:
> The regime_tcr() function returns a pointer to a struct TCR
> corresponding to the TCR controlling a translation regime.  The
> struct TCR has the raw value of the register, plus two fields mask
> and base_mask which are used as a small optimization in the case of
> 32-bit short-descriptor lookups.  Almost all callers of regime_tcr()
> only want the raw register value.  Define and use a new
> regime_tcr_value() function which returns only the raw 64-bit
> register value.
> 
> This is a preliminary to removing the 32-bit short descriptor
> optimization -- it only saves a handful of bit operations, which is
> tiny compared to the overhead of doing a page table walk at all, and
> the TCR struct is awkward and makes fixing
> https://gitlab.com/qemu-project/qemu/-/issues/1103  unnecessarily
> difficult.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h  | 6 ++++++
>   target/arm/helper.c     | 6 +++---
>   target/arm/ptw.c        | 8 ++++----
>   target/arm/tlb_helper.c | 2 +-
>   4 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

