Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2B60BE31
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:08:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6U9-000677-WB; Mon, 24 Oct 2022 19:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6Tk-0005uP-Jf
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:03:38 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6Ti-0004eK-Uk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:03:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id y4so9712477plb.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/JxDVFbfz9v3atitIE6L8Admra3QoW3cyysQ1jszWo=;
 b=v/ITGPti2Yr7L0nQWwk3lErfjOVp+liStOn0A6ui3dgplu93UmezqW11mLKMVv2fDf
 IrpW82KC2gdKN9sYrw/Oyn3+0fdDjKn2kCHGfy5/Sj9WE2FzH4E+OripZ83ehpDmK01C
 Us/xlBSXBxqhkcBGJe8wi7LtssncTCMA9FxsBqmTpya9I7500dr8EbkKvXI8BbpDmQWI
 uyE/yazHJsGED8owFBsBb/GtHQJRK6EMs3nXODyrp45YDcrBbhPzAMK1EuA2XcfOKZT3
 eppr8QFqwT1XxZwq8phM9X1gDV6lJLnRDbStVWHncqP/vvZ16KKZnC0rY4QSy6NZaH/C
 S0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/JxDVFbfz9v3atitIE6L8Admra3QoW3cyysQ1jszWo=;
 b=L2IU01lCbhb5/SlQWcQmIziFIPn3bHhSiaSM6J6Z6dB9iNp2LssLLJNs8TQv0FcMfy
 2y72SRpl9cFYUYT1WAQayBtleHNNgnmIXeiH3EGE3z42/LtGM8k+LD3RSqmeUCNTP1Bw
 yUfUaqBj9SHOIK9YLbr99WuE0VnnSME35a4bBTMlxOIpSvfS7hWK8/unLTFmp6IUw2E5
 x50/EIBd7g47XPpDRDlnW9QVKUFTfrl6/dEEhuSdh2VjJcOzt/GeTEzM6IqSXaMu15Nu
 IjJj0an7V3HgrRl4D6jRQCM6fSlR6+jmlAm6k8dRkPopHgmOoEe+goXNYeHdQ7Idlmgn
 lg8w==
X-Gm-Message-State: ACrzQf2ieOByAWhTycJb9iVh2EoPU0NJ3RteEBKoBJxKGkcYvsI86Lq8
 pyqf5bocLwkdwllx59nME9UyPODtpRLTEA==
X-Google-Smtp-Source: AMsMyM6sBRhlkVrAh+MN05fX6dfSwLfuvKJ8M3nQxV8d5y1VwLdMTFLL9XuBo8DaQCDQ7QHa/q0vBQ==
X-Received: by 2002:a17:902:c412:b0:186:a279:717f with SMTP id
 k18-20020a170902c41200b00186a279717fmr8815372plk.29.1666652607679; 
 Mon, 24 Oct 2022 16:03:27 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e5c400b0017a04542a45sm214533plf.159.2022.10.24.16.03.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:03:26 -0700 (PDT)
Message-ID: <45df6cae-6c4b-5edc-44b8-4d8d776327e6@linaro.org>
Date: Tue, 25 Oct 2022 09:03:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/3] tcg/sparc: Remove support for sparc32plus
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
In-Reply-To: <20221017062445.563431-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

On 10/17/22 16:24, Richard Henderson wrote:
> While working on other cleanup/new features wrt calling conventions,
> I noticed, again, that I am unable to test sparc32plus.  The current
> debian installation in the gcc compile farm is for sparc64, and that
> is also what gentoo is currently building.
> 
> It has been 10 years since qemu dropped support for pure sparc32.
> I recon it's about time to finish the job.
> 
> 
> r~
> 
> 
> Richard Henderson (3):
>    tcg/sparc: Remove support for sparc32plus
>    tcg/sparc64: Rename from tcg/sparc
>    tcg/sparc64: Remove sparc32plus constraints
> 
>   meson.build                                 |   4 +-
>   tcg/{sparc => sparc64}/tcg-target-con-set.h |  16 +-
>   tcg/{sparc => sparc64}/tcg-target-con-str.h |   3 -
>   tcg/{sparc => sparc64}/tcg-target.h         |  11 -
>   tcg/tcg.c                                   |  75 +-----
>   tcg/{sparc => sparc64}/tcg-target.c.inc     | 275 +++++---------------
>   6 files changed, 78 insertions(+), 306 deletions(-)
>   rename tcg/{sparc => sparc64}/tcg-target-con-set.h (69%)
>   rename tcg/{sparc => sparc64}/tcg-target-con-str.h (77%)
>   rename tcg/{sparc => sparc64}/tcg-target.h (95%)
>   rename tcg/{sparc => sparc64}/tcg-target.c.inc (91%)
> 


