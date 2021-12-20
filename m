Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831147B5F3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 23:46:10 +0100 (CET)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRQ1-0002DN-6i
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 17:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRMt-0006uO-9z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:43:00 -0500
Received: from [2a00:1450:4864:20::536] (port=45910
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mzRMr-0004IJ-TP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 17:42:55 -0500
Received: by mail-ed1-x536.google.com with SMTP id j6so23609254edw.12
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=smcXF2g4VW9uOr8/Dsy9Whzq7L15Q/c7osSy8snQp1o=;
 b=VcZn7vaaAzvj1JoeyWRNrK8/5F4miMZVJzIjQjrkClBHGF8XBzn7hAuWoFE9WYZRKB
 kZYf9x0DI0XAlHwG2r0c1QxLvsM1B18MICaiJuv0EPediupmaTk+40hWjwczZLocnhLp
 i74dAHdU2rLahW+jtkCrjAgukR25XGhMdHlKyIRd+u1vEnJCAZlc5kwtKDRVmXT7UKr4
 yrzZVYzgSVCPQfONlEIbjLc4kPhZk4l7SfYIR71KU5/jfj/q2GK4Ru3vnCMHamW+q8cr
 ROJxk7+u7PJGrStmxe6l9uxrLF0jsyiKP3oOJYHvMInyztEgfeVXWxpJp1+YmiPNB9bC
 We9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=smcXF2g4VW9uOr8/Dsy9Whzq7L15Q/c7osSy8snQp1o=;
 b=8Re3kpOp4ptm6E4g+Cnzon7O1UNVWA88FE/t+kVfZISP656tRxXQdyOiShaKv4VFQB
 iAOwz8imhyWaFBP3WXzKQ5YGTfOyP6lKc5rLTusOictCC2FcYDpPWq1LLFWotNk1j+oK
 In1hnZNLcEdWARbcRJc12Z3C0XrPKc4IvEnF+6VuWDt/PUsG5iRb4X9DBHF9eKvjgwLG
 PNJ2zu/V30SIdlKdcHcYoFUFNnglAQCJDsnwOFYT9nnaLIM/Ze6rGRS3peTmbxegy+0P
 hg15TArP8OYnTcBeLkkDJ3NI2VDF19GEHpemG0E3fiIEDYwxmnwjF9HZdEMyFqVw5tIf
 zWqg==
X-Gm-Message-State: AOAM533d5iyllQn96fxMn/Bc70q9vbElpHF1qy1ZVhaWpkHbMvsZiTd8
 z6QYSH2sqCcx616T5vOrwxa37S577zI=
X-Google-Smtp-Source: ABdhPJysVtbj7xrZ1a6bH/HrjBqYn42z6VagJaFeaRQDyv+SIumSwbdYf2e7EABnWzXYHYCxXJoilg==
X-Received: by 2002:a17:906:1be2:: with SMTP id
 t2mr242839ejg.399.1640040172502; 
 Mon, 20 Dec 2021 14:42:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b5sm3129378edz.14.2021.12.20.14.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:42:52 -0800 (PST)
Message-ID: <98f8d99c-3395-57f3-70d4-f05499cfa6f0@amsat.org>
Date: Mon, 20 Dec 2021 23:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 07/24] linux-user: Remove TARGET_NSIGFPE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220210529.150423-1-richard.henderson@linaro.org>
 <20211220210529.150423-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220210529.150423-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 22:05, Richard Henderson wrote:
> This define is unused, and we have no similar define for
> the other signal sub-codes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


