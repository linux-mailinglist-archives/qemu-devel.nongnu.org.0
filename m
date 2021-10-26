Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8D43B512
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:06:32 +0200 (CEST)
Received: from localhost ([::1]:60638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO23-0000qY-Be
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNwH-0003jX-K9
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:00:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNwD-0001vP-IW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:00:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s19so19703243wra.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HkSUmauhegamjHvqnDXS22TGJk+jm81u0r16zxNM/RI=;
 b=Jv43jQMhc0+rDgKTkBANh55zeGcVx3CGbnI5okTFMbhp3TLPGESrrcG6uKHP1Qm2mq
 OI7RKFW4Tnlw6FMUdNwhxk7MqORiU7wqAqK/YJ1uv7fm+fx+EQmBS2jcebTqQnIBTznC
 +YT3EESb/a5qcZWm5fKT46ZW6Wt6wY/pspJu9P1dJfLGEAZHadhfh/zCOOXelb4v9sJZ
 fpGnlYB2NSDZ5cj2U2Wn+1LDsP2q7J3BGkOiB8d+bcOhK+QQ0x0qrT05UTAu5AcXCjvj
 lubwp0N/sMYWgAlnJu1Dr4JghqgGSGNq0XIm1S6X0FzHAGc+NF8DPqhI5xJMXI/IU9yl
 fb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HkSUmauhegamjHvqnDXS22TGJk+jm81u0r16zxNM/RI=;
 b=aPxHPCUEmaTq3l4RFCdKaydWexwOUo4SyugMuxoxkfKDVKEl1C7a3j5CVgcidVdYbL
 JCJdxmWfqqsfwLvtp8B4SL9OnNK78sBsMpgtESbXhhi/hg2CUlSw9aRgDYshjwZrIl/R
 zJaVV8XvQAeB/KG8hYdXXZrlKLUxXR7gRSnwYbqdWFd+v6Zf2NWcHzwKKtnzAG2uTBi5
 Q82/UZhDLHJGm42JhRCC4RLhCHU89xpwoshscrgCOdEPstsrXw8LMC0SkWnAUaXVncX6
 DVCnraQI4YeTAzEIVhpVs5eM4wWtjgYRDwQ8OalmNkUMXCEHeXpPtrjsb+Hq4vMMJXZ4
 sGgQ==
X-Gm-Message-State: AOAM531Nc8PMHxYYIFncJiUcbrAroQxni1N6Mk4cyO6qO7ycnRvhumSI
 izlxxwKqEfmwgs6GBzwfbkw=
X-Google-Smtp-Source: ABdhPJxkAqhEF05T81n+jqW+mNC+JKd22tKXYG6gjDbGJ+3EULt1Dfjwzo0JFOwltUOfUKpyp9f+5g==
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr20990628wrp.101.1635260420810; 
 Tue, 26 Oct 2021 08:00:20 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n9sm944099wmq.6.2021.10.26.08.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:00:20 -0700 (PDT)
Message-ID: <d4c129a6-78ff-fbc6-4e4c-bf34bf1d7302@amsat.org>
Date: Tue, 26 Oct 2021 17:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 04/28] gitlab-ci: Remove special casing for hexagon
 testing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Now that the hexagon container is using a pre-built
> toolchain, we do not need to make the build optional.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-5-richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml       |  4 ----
>  .gitlab-ci.d/container-cross.yml | 27 +++------------------------
>  2 files changed, 3 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

