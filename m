Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD144030A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:22:13 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXS7-00051t-W5
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXI5-0007tB-CR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:11:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXI3-0007GG-MW
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:11:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id s24so7485196plp.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=07eeFmKLikh8D2Eafn2eeqPpTxGaVEX5pRpHEGlfKGw=;
 b=JCNEfswCe7XQLlcOtUh6ddMOC50WvZBdLT3Yw34NvSTzYM37ZZmVYMius1NId2q6sm
 1xAvVIEZY/M3mHR63UNzxqLr0m1xZDq795SpmPMCnstJFG6lrErl6jnyW7dJpvBZveFJ
 i52luDEOSXAvg7en/D//Sl7jTJeQoWlI8Z3/lRW+m1mQ4r3EwfdMzjsG/ooltLWYCbg7
 5fazgK/sjzPTIF8nO504q+AdF7IdU0w1qRSLS3uZfnbWl3PiAZZY9mUcmgdbJEblxRki
 VZLoKeYB89PQ+FNxvjBB6YKKD+efo7fy58nS5O70TVXN9RphngBb0CfCRnW/BFVEXhg4
 81lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=07eeFmKLikh8D2Eafn2eeqPpTxGaVEX5pRpHEGlfKGw=;
 b=aAeb+nonSshUIJqTsfHtBRF4wdzEHeglQUOg6yFSldf0qn4xAzF3Bs4RjGAghK2vf0
 p5nKbDqsiXqI1XAs/+OdycJ5D9c2tXJ5gIJ9shIiALmPLas7sEBnsroLmhWcag1/+TYX
 3SFLu8aAIHnzvVVKS5EUifHxoNcf6DdpQpAuu5Jy+83pukohBVz2MPT/+8JEOowDHA25
 EM9+i3nl0UJkl1vd1N40Sc4FZQSZljzJs4BUwMm0MvugSmuIoB1Stys2eM51vvoYaA49
 tFvPGATMuXCwBAJ1MhyEM1TNT93Pdt1M4Mm1QJ1wQAm1oFX3U5JoC50ZCSDa8i3h3wFU
 pZZA==
X-Gm-Message-State: AOAM531sYjPzjwOJ2jLHAYf8afRnfqqBJLkZ1kkdRXSQyJFhlPPJ+Wmm
 Q+gVWTQRs0plKIy5wfHdzMu+7Q==
X-Google-Smtp-Source: ABdhPJxk72QD/4pWrptz72UQoJpjNOPs+X3n5EzYmJQ9RkkmKAMYOPC9cpB+ZiCcVt4r1CdYfGIM3g==
X-Received: by 2002:a17:902:758b:b0:13f:974a:959f with SMTP id
 j11-20020a170902758b00b0013f974a959fmr11224596pll.40.1635534706075; 
 Fri, 29 Oct 2021 12:11:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y13sm7891563pfa.43.2021.10.29.12.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:11:45 -0700 (PDT)
Subject: Re: [PATCH v4 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-29-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <321d1f1a-871d-6366-8647-88fb2e2d9d79@linaro.org>
Date: Fri, 29 Oct 2021 12:11:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-29-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:11 AM, Taylor Simpson wrote:
> Tests for
>      packet semantics
>      vector loads (aligned and unaligned)
>      vector stores (aligned and unaligned)
>      vector masked stores
>      vector new value store
>      maximum HVX temps in a packet
>      vector operations
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/hvx_misc.c      | 469 ++++++++++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/Makefile.target |   2 +
>   2 files changed, 471 insertions(+)
>   create mode 100644 tests/tcg/hexagon/hvx_misc.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

