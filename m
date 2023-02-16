Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4724698DC0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:27:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYfI-0003eN-0t; Thu, 16 Feb 2023 02:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYfC-0003e3-08
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:26:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYfA-0000fm-7h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:26:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l2so958509wry.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czL45BJVkaLt4PaTDTZ6Ji3M1kSUa4b888QaZJQggKo=;
 b=rVQ6hQPNfUf05esMB11s7qL7ozyJaxmUQo0Xow3mxc/GOVLpJWhN4IH9wMUgW1EMXC
 QwC9U+U8UnttQZZ/JaLCD5cRs9ZYzEi8mcw58fUuhWRw+Y5iprd8fnmATcuwC5EAEc+9
 BVIjc6747Vdg+ymqyJLKrcgQ/7xI1XZeHBzTGJbQEvxswya7yQFkS16qnPbRWTN+0WdR
 R1M708rmdHxZDCG6jReH/LKaa+SJKgCRwWO741aCHq6rgJ1IXrd6NDnvSkdp/7sPMmuz
 Ak59mCwMrs4iPdPjfzT14sRq1kQP8P9fmuWLAc+hzean4VJpTlI3IzQiQM9/9PAWMcYR
 pNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=czL45BJVkaLt4PaTDTZ6Ji3M1kSUa4b888QaZJQggKo=;
 b=LBssESIO0RhucA/b6ZK/XvCUzej7WfVnjTIyiEWEYTVkJeUzqFvE6DN3KwotcUZ6iN
 zPfH/U40DmkeL0AqvZzo2+lxkw6GGQI5YRP0y0FRSCCLdAmAtl1gN3s/hIj+pwS5D7L7
 hPuiqoJrC5RhrLDfp8c7Fy3zcI9+dKhpfdEPPp2yEOyCyunYK3mJM4GfH9ewb/aFFljh
 LPy52r4bk7JHm4NC9Ah5khcs0lBDzSoJTxVEF59lrbVblnXRzz57pAfI7wVjfhVfLbZd
 JVx/6HFuXVFWh7YCG5JCjF3MGFGt3NXV5ZYC7QPUEexCNGQAT9F5XP+doOpFMFLR4gtM
 4bJw==
X-Gm-Message-State: AO0yUKVayM7WjWv7989vftMHdI5qqtSkoxN6xl3f04D+5YDRq4fX8+2n
 2qK/5xiW4Fvs8YugkgyPb60W7A==
X-Google-Smtp-Source: AK7set8nfajDLIvrDL7B+Ox9BQUeLF2xL5Rqf/Av3Db9kvzLrXuxvaNr397sAclcyz3ohflYR9JOBQ==
X-Received: by 2002:a5d:640c:0:b0:2c5:4c8c:410d with SMTP id
 z12-20020a5d640c000000b002c54c8c410dmr5224177wru.6.1676532397705; 
 Wed, 15 Feb 2023 23:26:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfce09000000b002c5493a17efsm727237wrn.25.2023.02.15.23.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:26:37 -0800 (PST)
Message-ID: <1a1b4e05-c225-bff7-3e2a-ac75f8d03570@linaro.org>
Date: Thu, 16 Feb 2023 08:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230115012103.3131796-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230115012103.3131796-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/1/23 02:21, Richard Henderson wrote:
> Failure to truncate the inputs results in garbage for the carry-out.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1373
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/x86_64/adox.c          | 69 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       |  2 +
>   tests/tcg/x86_64/Makefile.target |  3 ++
>   3 files changed, 74 insertions(+)
>   create mode 100644 tests/tcg/x86_64/adox.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


