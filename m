Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387684C5F4F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:07:18 +0100 (CET)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORhF-0005BM-50
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORfR-0004FI-G3
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:05:25 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36632
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORfP-0000Oa-OD
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:05:25 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t14so6902483pgr.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BLeeWvRBB20y/wGX+1qXsKksZgA9uy1nvc+fF0cHf4s=;
 b=nihYws9rccbZgBppe84KGq5ix/O5pl9KvgiXIwqqtsMhZsVgQC7V6L374OsH7V+ova
 /CSV3eFcNQ+Q0m5NMdqqOPnGbzAtlKQwOJsCUS2E/eieNlaJDPUQVPTLvHdSxtarqnXY
 2vn+TKb34rx+YfJ0jNpXDLvvyFn3Ybgxx7MOdBcNcPKt7gDyL/0dHuGQPumTy2Rs+WF/
 h7A3Vo7dm70qODSIiaG/RYrNwIn5NdTFKIKTX3XRD5pb17vOKq/93vHpLNDuEa0vUr6t
 Zp5MOwKZ2Fb7LBd+4Mpn7WOUgxcTLf9DD+tSYdw1E4fjLBWkd+ftHdoT2c5AfcAn3h50
 AOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLeeWvRBB20y/wGX+1qXsKksZgA9uy1nvc+fF0cHf4s=;
 b=XLcCgq5EDrqF1U90ToNKYjt44pK6G46XrnpqMcViafXztnJnVIrNeXb1JI2EZK/q/B
 AoTRILa/wPDfAKmbiJxyabH9OJiuDaJiklDVzbJNwXtrWzKE4tndZ7YpvHaeeSUTeJMB
 PkEFjiaS1urqV3WzcMZfRlgNLl2QxbVIsrUN7N2IVWT8vKCzegASbe1GVmkhtDtK5wdK
 QfzmR42eyhghn+Dp0r6/JRjrQoYopNs4jKdua/hWPtpdml7OOXSCh9GbgRw+tZwqNS0V
 cGmyrWaeLRvAyraBbuJ0m0yCumF53Y6Udwz8t0XZCrqJglph+qAfuXzaw02IEUS4XEGU
 coBw==
X-Gm-Message-State: AOAM532+Z+5GKJXYY7/dgBWBODBUqA4RP24QvkPKVVfmSyyxcbzeiLYK
 ePjdwddWXNVG7G6AphV2bAY=
X-Google-Smtp-Source: ABdhPJzykTzRpo8dWHkBR5L83vJhQpIjB8TDXqp84fztUl1ZIZmGaLnbaTqJrhrO2Jz4+164/fjOBg==
X-Received: by 2002:a05:6a00:1810:b0:4e1:2d4f:14aa with SMTP id
 y16-20020a056a00181000b004e12d4f14aamr18409122pfa.43.1645999522415; 
 Sun, 27 Feb 2022 14:05:22 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 h2-20020a656382000000b00370648d902csm8397599pgv.4.2022.02.27.14.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:05:22 -0800 (PST)
Message-ID: <b9e75e23-d3e7-503b-87c3-4e8031e19f76@gmail.com>
Date: Sun, 27 Feb 2022 23:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 7/7] target/nios2: Rewrite interrupt handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227182125.21809-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 19:21, Richard Henderson wrote:
> Drop irq_pending boolean.
> Drop helper_check_interrupts.
> Move checks for irq disabled into nios2_cpu_exec_interrupt.
> End the TB on writes to ienable, just like to status.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/cpu.h       |  1 -
>   target/nios2/helper.h    |  1 -
>   target/nios2/cpu.c       | 10 ++++------
>   target/nios2/op_helper.c | 19 -------------------
>   target/nios2/translate.c | 14 +++++---------
>   5 files changed, 9 insertions(+), 36 deletions(-)

LGTM but better have another review...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

