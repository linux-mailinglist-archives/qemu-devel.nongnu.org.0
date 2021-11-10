Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D644BEC7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:36:20 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkxo-00054U-2U
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:36:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkme-0003dl-Dy
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:24:48 -0500
Received: from [2a00:1450:4864:20::32c] (port=56100
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkmc-0005H1-NB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:24:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v127so1658335wme.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 02:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SXay7eSLLVrR1Ri7y5BTQ/91dLy+w8HpsWYSdZ5eTZk=;
 b=D3ohfARMx1/Z2DEd9zrC1W2W4C6DYBEpmBylSqOg0Ty4MXXEAF5kWKH1BbaO9FPBLK
 mh2QerNKniPD/20YOHopVXxdQmGE5IHeVgr3cfOuKWJOTi7WWqI/ELmEfF1kB/J2KVMv
 wrVyDEGbfBChzlbLFj1uyZl0evUe0YY5ukUvQqkj/kkYRZ0JHHVr4TKQaqUtsghl9lRX
 Go9TzoVVevpNPEUYW7Spn/o4BC2wyK0+a1caJ1R3kb5sHkdC0FTE1v6D9vzNLYiVwmZf
 w1gi8R6v43Fn1DyfUD5xmGVe58Os3MlG8RbLp/1tnCpJOZpmSMNkfZNpNRv0TO01qh8J
 H/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SXay7eSLLVrR1Ri7y5BTQ/91dLy+w8HpsWYSdZ5eTZk=;
 b=ITN99J6fWvd/4o8155M1v17xtGrTTBH9cXs7+TFNpNdtfJeavSfBVE6OVzNd+b66+O
 0UJq+Guw8m2x/dNn2tw62TKbkuDVBCKPrukdK60NvVwEK7Tqq0uFpvFh5L4o2guiAwbJ
 vH3VPFd92zorn7b4OkTppZJ09e5Kfj5iIEogel6S2sGnMB1FVX/U1s5aKQ5HLy+NP56w
 rufkEAoHOjvodBe6e8LQMWlhrOnZY5QXzFfbEPnXO3t+E+P8a7GodVgSBh+qZQmOYn9A
 6kVCjQePTlkw3/reVDUbMgWadkjhDWiLQOoQ1+vEUADZ82HYTZ8YiHETqRlG/Afa9ZP/
 NJwg==
X-Gm-Message-State: AOAM530T3KTs+VyBXvmbh/Do60cOAsCpGtMQMsG/j0Zw8cnK/wHwjaKt
 W0TmGXQnjGY2PDdt+bkqEvrevqUNORcClj95
X-Google-Smtp-Source: ABdhPJzd6PcK7rbV5kLGbNaktvK4BsUU6xHs9WmF7URME+F7aC5b/vjZ8eT4fXwXqGoiLjCgiQkVnw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr15339019wma.72.1636539884922; 
 Wed, 10 Nov 2021 02:24:44 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id l5sm23177060wrs.59.2021.11.10.02.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:24:44 -0800 (PST)
Subject: Re: [PULL 0/1] Monitor patches patches for 2021-11-10
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211110054541.2368410-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6634a67f-39e7-34fd-7880-036b97519b7f@linaro.org>
Date: Wed, 10 Nov 2021 11:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110054541.2368410-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/21 6:45 AM, Markus Armbruster wrote:
> The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:
> 
>    Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-monitor-2021-11-10
> 
> for you to fetch changes up to 1bf4d3294bd48b702530b131e3344860495425fd:
> 
>    monitor: Fix find_device_state() for IDs containing slashes (2021-11-10 06:14:51 +0100)
> 
> ----------------------------------------------------------------
> Monitor patches patches for 2021-11-10
> 
> ----------------------------------------------------------------
> Markus Armbruster (1):
>        monitor: Fix find_device_state() for IDs containing slashes
> 
>   include/qom/object.h   | 12 ++++++++++++
>   qom/object.c           | 11 +++++++++++
>   softmmu/qdev-monitor.c |  8 +-------
>   3 files changed, 24 insertions(+), 7 deletions(-)

Applied, thanks.

r~


