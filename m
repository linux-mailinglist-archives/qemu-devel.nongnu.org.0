Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4AE3EDC9E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:52:14 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgmS-0003ob-Ns
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFglZ-00038Q-C8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:51:17 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFglY-0004nU-14
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:51:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id f3so21577659plg.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oQBzR/MxaoduCHwEO/II+yN5lEW0lGovoxbzE3vDlB8=;
 b=QE+bazu/+cwFA7i6qYsOwDjSv8+U//dOwGuQ/s6PHiBnmDPtZi+33PlX21FnB7PKJP
 qmebqbF1aQU3m+r4olbuEQoOHKDxDuf9TVpdrHrObQtsh3XcA2kiODHbahVYh1wleobJ
 s9bE1VerS71iwuz3qL67TBuqUAppGiVFlj8e+8lQSBJFa/jyH+V1xCdasX6Tm5ZkF7g4
 f518SwEelLGKiaygpUJ5h/rSWeJpPlB6V7zrLJQOaZoT3ngKx4q7lv9rHAEqfb3blnc9
 lFcmOWYsz4Rb3GoIpeEoUkxpRhkqlD9bVkt0+i+7U0WnFK3amE0CI2gtLli5Gqb+jAg5
 TB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oQBzR/MxaoduCHwEO/II+yN5lEW0lGovoxbzE3vDlB8=;
 b=X5MqsKFHBrhhaajN4HINb18XN4MNXYK8A466QXoVXBTf9Sk4FBkIXy7L2jfNImM1l5
 uh2oDtgrg0WRmfj8orz4hzle1IkQxTevDz3//t9pVwCC+vndSmj9wGlBoBFuJLIyR0Ui
 g9sPWbrOXjbmKyi+v2ZhsGQc5Mv4/er20LGFIet2eaWfJ3/eV1RwTzEsDlARk/DdXhC0
 W2+/sv5o/NMop0RO6z3oMbLlNJWaA2YS1kUatMWg62bqqi2TJXFwMcC9+wKcl/8oudes
 XCdfDG0bYs2TFbSl7uCNAkY+wUqLxqSICepWYDYBllZpOhpGBoKzMtybxK1tSzlU2hqd
 SXQg==
X-Gm-Message-State: AOAM531lqG2eOpcrdeNYLpRJwQcjfqHgYItJLCrHgvCSAl4wkwaoCufW
 0xjAkJMZm2kfIAo/A3J9J3mZPkOvZcaoyw==
X-Google-Smtp-Source: ABdhPJxSVhum3MRZLFa0lMmEVZC4fELoPeCkAjVbJuqgk7wB9xRGA3+vRySnseBI3ZSsmhONc5RACg==
X-Received: by 2002:a63:4a41:: with SMTP id j1mr3118pgl.227.1629136274320;
 Mon, 16 Aug 2021 10:51:14 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id o22sm36641pfu.87.2021.08.16.10.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:51:14 -0700 (PDT)
Subject: Re: [PATCH] tcg: Remove tcg_global_reg_new defines
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210816143507.11200-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7387add1-e03e-9624-829c-264fd10fcfb9@linaro.org>
Date: Mon, 16 Aug 2021 07:51:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816143507.11200-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 4:35 AM, Bin Meng wrote:
> Since commit 1c2adb958fc0 ("tcg: Initialize cpu_env generically"),
> these tcg_global_reg_new_ macros are not used anywhere.
> 
> Signed-off-by: Bin Meng<bmeng.cn@gmail.com>
> ---
> 
>   include/tcg/tcg-op.h    | 2 --
>   target/hppa/translate.c | 3 ---
>   2 files changed, 5 deletions(-)

Thanks, queued.

r~

