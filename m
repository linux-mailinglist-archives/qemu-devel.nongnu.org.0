Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E34379AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:15:59 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdwH1-0000kY-1l
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdwEp-0007bM-AC
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:13:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdwEm-0001JS-PE
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 11:13:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso3771239wmc.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oNrZsqYWmNZA8SIUh55uX0AIAvozCh4hcE29t7MDUHo=;
 b=B8wCzzbVYpuCw3WOJn/5AcfRzvu2Jybdj0TxwmOl0XwFcbwusWTitPjdqzbghY8U//
 UCa1JTnv6WxLIgAk+8jqLrv84VbJk9KMXa1do0+WYQRCxQV5Tu7O1qrnUfbYhQf/gxPm
 ABArXifez8DbSFjAE5vkLIL3rJ7RUqkaJBTmrvhlC/cLfAtNnvpF0Xag18a0pg699cvO
 z9ZOwrpqfg0/cnpCzYQRvGh9t+5yV+YyATVEXMKGQGGBqP/RLjIfSHhP0SdtGEYDMJYi
 486JvGu7aaOduvd+LI0gzA/UUrm9IJyHrHr0KksEmNqEp3092NDyaM82zidfH7Iw9Dne
 TbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oNrZsqYWmNZA8SIUh55uX0AIAvozCh4hcE29t7MDUHo=;
 b=TV/FXo849mWFmUXNbH+j+B8mptj8IlLIxrjucptqYNTvCkNP56raHCXRx1ZhyDg9GV
 DjYN6KTrYLGPkEy6UCAxYvlUh2jiYltEljcKHB6moSPqLO1zVQadDoV/7v6IhoA3ht+m
 N37ueD40JWbcjzUYy/n0oXcl+q2tIcaMyuEXKOusz2cD9liGFZQOj2LzoTeM/7uQqNh7
 q5f9EINGvSXB4DzMJ8qHEgnE67JMR86krhH9FHEZ1NKpBJPeSFRWxNpN3bXXYGX6t60v
 bmJcGP33YcjCln/Q2atyuClgrhi5ZzaaQKqx5DDtwfEEhNVK6E6es4/9Ky1rO1aV9+pw
 9/PQ==
X-Gm-Message-State: AOAM530M0sKGQw0hATrbHfY3lmihcYlO2Sium9u0iPjWfk89tluYA2QB
 fXw9NEQfRsCYZwrgNPWtp98=
X-Google-Smtp-Source: ABdhPJz7/Oy16seXPIDkLy4gkjiX1aJF9mBT/GDu2LwetC8cJg2NPpMTX95Renx18lMqUjNC1IcLSw==
X-Received: by 2002:a7b:c149:: with SMTP id z9mr29945311wmi.180.1634915619410; 
 Fri, 22 Oct 2021 08:13:39 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id h14sm3972521wmq.34.2021.10.22.08.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 08:13:38 -0700 (PDT)
Message-ID: <1e8b107a-c2d1-a76e-61f7-402992ac0364@amsat.org>
Date: Fri, 22 Oct 2021 17:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 05/48] tcg/optimize: Move prev_mb into OptContext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211021210539.825582-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.742,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 23:04, Richard Henderson wrote:
> This will expose the variable to subroutines that
> will be broken out of tcg_optimize.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


