Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986703BF129
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:02:29 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ege-0004H4-Mi
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EfU-0003Gv-DK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:01:16 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EfR-0002sK-Vx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:01:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id f5so3610511pgv.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZDkzHyfD/TORuF0Q4vScv2YV5nWpwNlSXWF5Cg54K4c=;
 b=hFGXmOivz5OdxwGNUu3mdeT5zgsC7JNCWAGFOfAGUQJzpROp8trAoSrOyhOBBJpd3A
 kLRfMaBp7bE0w0MLtQ9WiBV9sUaQRFbTWMxpQDYu25MqkWPa6E4p+ZezwLDIAGJcWgzp
 3++xtXC1ocKhDS3ztAWnqRc0pKmP7luO14opVMPSAYnRn+jBJJi1Hd+wpZ/nGr9UaIJk
 L0tsw7RyUAX32WX8SIQ8OwKbRkEF9bVmWMXmOSoZ0AgyBCSAlTOzwDoHFqrOJ2OxsYoV
 1ASxCUnKURHWV6P+zmY/7Q/pPCy7ucbD0c+xD00ezOjSs4xWNGa5I+63yfWT86JEz5Uq
 XZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZDkzHyfD/TORuF0Q4vScv2YV5nWpwNlSXWF5Cg54K4c=;
 b=FgIwaVsU7pi9/kAHp9NRMiwEzvXtdD9tHxxFN8NfXKCnsN9oG4ov6g1siWscOfpaI4
 Y4+vQI08jMRDqNupAfnAtdrUyLIDj71Txo41n8Hs+P1mchCcucVc5Q5yW7iSBrWe/pse
 Ddi2P49fLHrzzB8UMJk5oYz39nTAD/pU4WPpIFpjHuV5wUxdbQ1MQQaN7u0Sp5PpAFOj
 cXzYykhrRNKYMAeBIZ/iDIbmjQgAbbwJ04l8WxrW7VNrdmKx2LixOl2QxMIUBa0jsJjR
 YsxWH5MZQKSWVUCaUBv8HFAZMrBPYrHNMb01JhSrf55MHmxvJYUTgs+RteFw6VCwwml9
 oDOg==
X-Gm-Message-State: AOAM533e/sZmTklD9d0LL1iVXrksqz9uVYECy8qeJ5uqgiBNf8ZhkHHe
 +DEeeMWrUtaShqMaRFyzTfFImw==
X-Google-Smtp-Source: ABdhPJy7l63GFZFcwpOMjcp82JrijUmdHxHTVgA6/v70mc3O81ai4Z3VePm7OYyhNvfpVYbsn8/D0g==
X-Received: by 2002:a63:5511:: with SMTP id j17mr28464159pgb.191.1625691672181; 
 Wed, 07 Jul 2021 14:01:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p14sm99354pfo.101.2021.07.07.14.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:01:11 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] target/i386: Trivial code motion and code style fix
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <20210530150112.74411-1-ziqiaokong@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1647d7e2-2ea0-f7bb-6cfc-92c56f9e11ae@linaro.org>
Date: Wed, 7 Jul 2021 14:01:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210530150112.74411-1-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/21 8:01 AM, Ziqiao Kong wrote:
> A new pair of braces has to be added to declare variables in the case block.
> The code style is also fixed according to the transalte.c itself during the
> code motion.
> 
> Signed-off-by: Ziqiao Kong<ziqiaokong@gmail.com>
> ---
> Sorry for the duplicate emails due to my bad network. The v7 has no
> difference from v6 and is sent just for clarification.
> Changes since v5:
> - None
> Changes since v4:
> - Rewrite commit message to specify the reason to add the braces.
> ---
>   target/i386/tcg/translate.c | 957 ++++++++++++++++++------------------
>   1 file changed, 484 insertions(+), 473 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

