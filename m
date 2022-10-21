Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9A60751E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:39:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpRC-0002Xa-Lg
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:39:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpLv-0001GS-7u
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpLj-0000pj-1M
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:34:01 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpLh-0007xI-IP
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:33:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bk15so4093561wrb.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QXxu2YkBfOpHD6G0pVXdjBAbYvYBVfdJSLp2Z52v2LI=;
 b=MeOOCVUA7xo+OdwxMUpdmdvMDpWu/ECC1eTlnEdA+JhTCoUMdKF+HstFOAl+vrv/Xp
 7/BauszGXH3vdLg9e9hDCxzjEiIWjBTfVkgi6caMFBDpcsA9vAfjNCf1Oi7hlO0pCmCO
 wQm9tc8J9/TW13KG6YcautsSsuWs+wNUmEhcHmChs4NH2sYZ20j6k9fbF/YafFwiQhvO
 j7qznKXyEApBz08gdYxNAsYCYXtAyK8z26dFVwFV6LRgvPnzqJqugD2MQLQCa7xbkeFC
 gJxQwjFjhUesa4bV3migvg/LifC4HbFv3mm89r+AHqSDVAfTqv4QdFI39OlCDO+sX23z
 FtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QXxu2YkBfOpHD6G0pVXdjBAbYvYBVfdJSLp2Z52v2LI=;
 b=Tv91Db2wbvQ+VEt7OupycrihGkH0BGPUENTYYfiTuIMH0Q1hMx84pFxHBf5A/wNXPf
 B6fZK0mcEHArRNigDyM6bHkXjP3po6LmMVhWDY/NzpK940C6vsizv3XPjAvLl+iuvq1B
 sVUIAqPWRwdLQDEnq+VuTWP3I6dOZAfRYF8pV8tXc5UZftIpQFmrNYflQgPLXaIHlHQG
 Hx4cje6TtERVMxZ6FlFHVQx+S0OBFt9cfahlHHo2goRIAptfSgULcC/UmHryQODdcYuf
 ZtDpDBiZSoR4b4zGw4uME+re+gc9tN0yM2UL5aCO7+anN/fefuTzxdC71uKIH6xVFyBE
 BVOg==
X-Gm-Message-State: ACrzQf3TEcV2Be0asUQVW6UJVrm/PAha4vfAmq1TqteCZ0UX+WYAyDuW
 PQtD7+XgCpQhnk0IdOs5+2jXIw==
X-Google-Smtp-Source: AMsMyM5Xh8YTPRBJqkCeiP83Psl/7CK7qoMzi7Ym7OdctKxlQ2xf1f9wV4g6AZImdPw9kjUr1fbDgA==
X-Received: by 2002:a05:6000:168c:b0:231:7950:1114 with SMTP id
 y12-20020a056000168c00b0023179501114mr11310627wrd.484.1666348436112; 
 Fri, 21 Oct 2022 03:33:56 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfe641000000b002206203ed3dsm2425699wrn.29.2022.10.21.03.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:33:55 -0700 (PDT)
Message-ID: <c3dbcd20-d724-bb52-cf97-410fc5edc90a@linaro.org>
Date: Fri, 21 Oct 2022 12:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 18/36] tcg: Replace TCG_TARGET_EXTEND_ARGS with
 TCG_TARGET_CALL_ARG_I32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021071549.2398137-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 09:15, Richard Henderson wrote:
> For 64-bit hosts that had TCG_TARGET_EXTEND_ARGS, set
> TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EXTEND.
> Otherwise, use TCG_CALL_ARG_NORMAL.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.h     |  1 +
>   tcg/arm/tcg-target.h         |  1 +
>   tcg/i386/tcg-target.h        |  1 +
>   tcg/loongarch64/tcg-target.h |  1 +
>   tcg/mips/tcg-target.h        |  1 +
>   tcg/riscv/tcg-target.h       |  1 +
>   tcg/s390x/tcg-target.h       |  2 +-
>   tcg/sparc64/tcg-target.h     |  2 +-
>   tcg/tci/tcg-target.h         |  1 +
>   tcg/tcg.c                    | 42 ++++++++++++++++++------------------
>   tcg/ppc/tcg-target.c.inc     |  6 +++++-
>   11 files changed, 35 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


