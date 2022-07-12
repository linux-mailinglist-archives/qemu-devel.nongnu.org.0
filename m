Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5657278D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:43:39 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMjK-0003Ft-E3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMV5-0005ob-FU
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMV0-0004sb-KD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id b26so12758179wrc.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gL8x9uZuIlu9PysBtxO5Ec7KlznPr6v02QdAFrUtKSI=;
 b=IJ6fKJTKcSL/h11z7uMIeC4w0H7pqDf7D0KD1j0QJ/c4HWm3vOF7UUAmsQCHlbfLai
 150qZ6Ng6+B+s+TFEO9ri54FS52W+dr45n/+UqZzRKQQDaxpaPKUHuDfhwk5Y8S9xs7u
 tpefrYJgAXAWoQVVTBC0z513UBrPsDLxUVgSsJTKgKzHw8MOIfiPsCsgScD2RL0UDDtW
 vTOcM9JNz6sh/nn0TG4WeGWY/coORNCQqPnw8vOt1OHrN3bM9fPj1hPqBQuAxlZWp1jq
 U7xrIAML2ZmJXaJhQUH3tmraHgRKkbEsOqGMUAged9z0aryWon0pciMbeQPbd4KgvRmp
 5pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gL8x9uZuIlu9PysBtxO5Ec7KlznPr6v02QdAFrUtKSI=;
 b=MBYpgb+SvXN9AYIC3UYiZVw7mcaVtF+HSR5A6haFzmcWDxNxHTG2iXeVESusgTzqpC
 C8tHQAo2QP9gPyCP1FrN46GMDma5CRUGUjfRr1uvM9StEroIC3Ghi5cAGDkA8+a2kEoV
 zgSPhm9Wco/R1s4LjRrfAUuPgdwpeYpjkooxo5cM2hGJUNaQMQOyqfGNC++4rSraij+P
 4IhZhPXiRfHxat7mzVWHppQ41jEkGLhWWNjPH5VJ3CUVoC8vLQOoUrGCY5LO6LOJKVx4
 ekEv88QMruFW2N4GXR/Ov1u+ySBOpXvcFmDVuEA2oHv4pCyt6eaOB79EJGtUCEU7BhFa
 yUfg==
X-Gm-Message-State: AJIora+bBvn5nqqoXiCGx59tp6GFOVZsDpTI8NJ6fEzGTduT7nWHN3Xp
 xAD6u9XTGIqGWKBztHBULyqBJ/4UohxWMrbk
X-Google-Smtp-Source: AGRyM1t9zjHI61G3eOHh16wLvhk/LcLgJNTYLPQVQjy3SXyVsf3b2YL4eMEn+BqHD0UDI2C4I7vVhw==
X-Received: by 2002:adf:ea12:0:b0:21d:7be3:aba8 with SMTP id
 q18-20020adfea12000000b0021d7be3aba8mr22941996wrm.180.1657657728737; 
 Tue, 12 Jul 2022 13:28:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adffed2000000b0021d6e758752sm9084285wrs.24.2022.07.12.13.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:48 -0700 (PDT)
Message-ID: <d92573fa-5916-647a-b9c0-9b665026d20c@amsat.org>
Date: Tue, 12 Jul 2022 22:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 3/8] target/mips: Use semihosting/syscalls.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-4-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/6/22 13:16, Richard Henderson wrote:
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 219 +++++++++++++----------------
>   1 file changed, 95 insertions(+), 124 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

