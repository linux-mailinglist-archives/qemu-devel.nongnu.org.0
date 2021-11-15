Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95F4515DB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:56:39 +0100 (CET)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmj1p-0006LF-PH
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmj0v-0005W9-6h
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:55:41 -0500
Received: from [2a00:1450:4864:20::430] (port=46734
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmj0t-0006gd-0q
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:55:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so33200255wru.13
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bUHCdysZwgUKYXvY/rWFCDz3Vbqt2z5h9DRV8X0bcuI=;
 b=VULUNF3HRQ9oWoAKwP5rKyu5qrhqN615k6DUJddFCy8X51wu4Q5iDkDeP2XdKGQc1h
 /GKGsXpRrB7w2d9kdK1DJKb3b3v4T38q1j5br4uQ+UpWXaCrFnuAcae3Cg6T00/wRuY5
 DHu7/ri/uvRIwXwsAUAAZcBcU0h21GCwiEiJ/Dpp1tU3EpvE005ikPSI5VT7N1Rr5cgn
 Eb6SFFplVop9aOVqJMMEukYSUufGtrFNfIifwhYg8rb5RWxZIjW9zBFeegRHsvNqzjsW
 IACXF+bA6HLROymK5oC3x3YvJCuCFN0QbliFYSSVLqbT9lo0ZT5AVhF9nFp05j1FuWdV
 SeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bUHCdysZwgUKYXvY/rWFCDz3Vbqt2z5h9DRV8X0bcuI=;
 b=f7yiaZpiow+pQOXBmhAnQe33lVxr/PPULwmFlR6MCb12urWcN8wgFYY/uWBrbZXOUC
 g05mqNp9OvjTB1sObC4IEqd8IqlwSXS1mPqXoL17NlWh8no+I409nntc4vU238dmGXYU
 P9YSuwweW9KFyjgt0IWOqI+rNn/9MqEjZQpdJmvNBhVaf1SwLd1MvjF2vV6NhJ60FG9h
 HJ9dd4WohhUkyw65MJqHfQA2IQlKGuPHdqKshKdJwzmDC3uVyOKPLM1mxvWwqyP+5a5G
 0VAlozGPSyapuni3KpTHeyxaLCj4H/T/vDZxy7GS26ZoUNa9UnlqjHKU2jAhze4G7YOC
 8G1A==
X-Gm-Message-State: AOAM531rp2KKXJiB3AlojRTxtZMaN5hxEE0OP/gHGcva4MYdZl4+8fET
 p8gl9c+Zl/oQjZ0xOAFaHO28AENC4/dCQ2ULgr0=
X-Google-Smtp-Source: ABdhPJxPHlcdo9Cv2ulCVgLC9BF3vt1wyZQTpkXjX1tuDb4iEYaEP+p4M1eRGNrnCdqa6nWP+19fug==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr2464748wrh.293.1637009736466; 
 Mon, 15 Nov 2021 12:55:36 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id e8sm11576317wrr.26.2021.11.15.12.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 12:55:35 -0800 (PST)
Subject: Re: [PULL 00/13] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211115145409.176785-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c9b8d2f-7e93-b0d3-bccb-1fcb43b5bb0a@linaro.org>
Date: Mon, 15 Nov 2021 21:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:53 PM, Kevin Wolf wrote:
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 7461272c5f6032436ef9032c091c0118539483e4:
> 
>    softmmu/qdev-monitor: fix use-after-free in qdev_set_id() (2021-11-15 15:49:46 +0100)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Fixes to image streaming job and block layer reconfiguration to make
>    iotest 030 pass again
> - docs: Deprecate incorrectly typed device_add arguments
> - file-posix: Fix alignment after reopen changing O_DIRECT
> 
> ----------------------------------------------------------------
> Hanna Reitz (10):
>        stream: Traverse graph after modification
>        block: Manipulate children list in .attach/.detach
>        block: Unite remove_empty_child and child_free
>        block: Drop detached child from ignore list
>        block: Pass BdrvChild ** to replace_child_noperm
>        block: Restructure remove_file_or_backing_child()
>        transactions: Invoke clean() after everything else
>        block: Let replace_child_tran keep indirect pointer
>        block: Let replace_child_noperm free children
>        iotests/030: Unthrottle parallel jobs in reverse
> 
> Kevin Wolf (2):
>        docs: Deprecate incorrectly typed device_add arguments
>        file-posix: Fix alignment after reopen changing O_DIRECT
> 
> Stefan Hajnoczi (1):
>        softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
> 
>   docs/about/deprecated.rst   |  14 +++
>   include/qemu/transactions.h |   3 +
>   block.c                     | 233 +++++++++++++++++++++++++++++++++-----------
>   block/file-posix.c          |  20 +++-
>   block/stream.c              |   7 +-
>   softmmu/qdev-monitor.c      |   2 +-
>   util/transactions.c         |   8 +-
>   tests/qemu-iotests/030      |  11 ++-
>   tests/qemu-iotests/142      |  22 +++++
>   tests/qemu-iotests/142.out  |  15 +++
>   10 files changed, 269 insertions(+), 66 deletions(-)

This is failing iotest 142 for build-tcg-disabled.
I did retry, in case it was transitory.

https://gitlab.com/qemu-project/qemu/-/jobs/1784955950


r~


