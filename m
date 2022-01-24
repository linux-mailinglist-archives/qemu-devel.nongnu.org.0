Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA6499C84
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:09:19 +0100 (CET)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7WY-0006sY-Ac
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:09:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7UL-0004o1-Ih
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:07:01 -0500
Received: from [2a00:1450:4864:20::42d] (port=46641
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7UK-0003Gq-45
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:07:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so16193116wrb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HJVUUhaqn+U0i9D9Y03oJWY1wIcohhxaHgxJvYpoCmI=;
 b=krzfcZf2EqReMU7IJom0ujUmavl5VfXy9sSmS4gu0aM9jVQsDgtwZDNUdNcI7HM2sk
 5/d1tMZR5/JDqiFv4l1PlS5B0N9kB3BlMwreYOT2xnugqCQE6fspfwD1mD1fyT2XqVeN
 lzoQ6arzd2KlvWi8PyaYC97CalhFloPMoFKAoY8yRpahnWKxYIfPIu1dHji3slpO3Hja
 kTQpsnjd2PDd/KW6tirqbuBNGuRMhi5gF0EM9LwZxfHMBNcR8ejJh61Y/KavX4WUnPMQ
 uQUcdM2+abG5C47xxrOCCJW9A4Jq7bJ4syN4dNYXZuZTN6dLkw2lfQCPspFHXNxBO7yF
 QJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HJVUUhaqn+U0i9D9Y03oJWY1wIcohhxaHgxJvYpoCmI=;
 b=BI1CC86P44X89RCF9fCxi8jDMhmDhcjfiZpAWRfvEzDUEdHi4dncvxpdOEtMjv22zH
 +t5DZgcAYcdmTLJZr5Cl6dmIdltGk0n8e7SWxSjyiKK6lH5daxyiGv/Mf4mvFNE7hyDX
 tjPigWulI1Pi6yzKVIQmYa2obZM6kG6KLsvetFjuWCi7CPYOspkwk9RWWwykjnpBLlA6
 yZ/naTmQGkNhXp1pA3A9n2XW6rCPsqOSEXeIxMaOB7mMonii3euPhjkVcJknJfevw6ww
 wnbKyceJXm4ZmMeIq1jEFCIM32/H6Gbj06igevWuqCw9uJpvAGj+YOYt+OHRW0HQYTKC
 VUzQ==
X-Gm-Message-State: AOAM530pvAH5ZSogQxnSNAUw9Nc6LNv4itolCMXAIiPjJA9mkFvxQXAS
 j4Ab1InTWMp7+IqQb1Qxij4=
X-Google-Smtp-Source: ABdhPJwIvGmh62tShCq0OSDqyhDqgdR6JWhuKjyN9iRu8oJ574B3tIsg/YnG7oRz+JAY8D3VdNhkbA==
X-Received: by 2002:adf:d847:: with SMTP id k7mr15335425wrl.127.1643062018884; 
 Mon, 24 Jan 2022 14:06:58 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y15sm17983946wry.36.2022.01.24.14.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:06:58 -0800 (PST)
Message-ID: <e7b1247c-e433-c389-0fa6-caf575a01a85@amsat.org>
Date: Mon, 24 Jan 2022 23:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 14/22] tracing: remove TCG memory access tracing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-15-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/24/22 21:16, Alex Bennée wrote:
> If you really want to trace all memory operations TCG plugins gives
> you a more flexible interface for doing so.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Cc: Luis Vilanova <vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> 
> --

git tools need 3 dashes '---' sto split ections.

> v2
>   - dropped extra line
> ---
>  accel/tcg/atomic_template.h   | 12 ------------
>  accel/tcg/cputlb.c            |  2 --
>  accel/tcg/user-exec.c         | 14 --------------
>  tcg/tcg-op.c                  |  5 -----
>  accel/tcg/atomic_common.c.inc | 20 --------------------
>  trace-events                  | 14 --------------
>  6 files changed, 67 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

