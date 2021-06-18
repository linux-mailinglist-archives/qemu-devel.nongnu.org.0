Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB553AD553
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:41:27 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNB0-0004tq-N5
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN9B-0003Fj-9S
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:39:33 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN99-0005DQ-MN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:39:33 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e20so9070218pgg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y56ei5J3vHZ6w6P0jvsnjbggVrKShQF3V2T3IvA8aNE=;
 b=kzcfcb48rmamMCHJo+jvvMRpqu47az+GuaKs6MCg9r8aNTUnXhK9dvJ8PlIaUkXpn9
 4qBomrG+aB018MWDFD7Uc+NCbXy9xKFlxr4wGn5LEV+vPndjVeKAPbiMSSR4U9kj215H
 TMHKi+UiQHLG4MKBl/GadmnIaa8l+1WvVt+uLY9sGbI2czXAffWF58EUJmglt5d/yrYO
 /Uchu3PnsI4o1qQ1ePxyCE8yPSOdtr7JNZcMYDCwzw76/XOyxnl+H/otgklzJYYKn4Me
 /ClOVCb5eSnXe18TpBWfgb+nIWlefa4clZelM4/3clWoPnEidUTdMJE1ZWfAT5mmu0Ka
 bEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y56ei5J3vHZ6w6P0jvsnjbggVrKShQF3V2T3IvA8aNE=;
 b=aP3DMcTN+2MfJ9yZZBU7/0zEiFWD2X20y34n+Bh3FXfo+PLhc2oZeBzMyhv75UWUnK
 5lhVreahJ6ij0n/hgx8eHeDmGeJSoHkTG+P/lW6T0DKNZq9aT5MizMKfKZ8eybvmP6LZ
 cJSLQAWgXMtT7UnZHaIi0+v33grYDtsq1uB20fz/qLiCYq6pDymgCpd0O40dbml/Ifmk
 YTnOHY+7DtFwgE/SYmdPfSiBjD974cJDL8d5vyixdePxD4HT+B9V6NnGSCVxroevnthD
 FgyfOlUWJein1HPAR0VvGplKcSILQd1IQFA0KY6S/5ca9E7OrpRv3jQ9vz2Cblxvhg82
 jM6A==
X-Gm-Message-State: AOAM533zQQLj66q350ed6Iz40EuUHpKoNsFVKmWd+Jtn4csjn7m8FWVK
 rtOTiq7L/WJuX8371/D1Isb7mA==
X-Google-Smtp-Source: ABdhPJycqGhFS4rNHTXueYPbcc4MQ0RJ9PJEXrHYMIBQqtUasqAivBhidMg8wWZmITP8GFHXLSj+2g==
X-Received: by 2002:a63:582:: with SMTP id 124mr8475716pgf.132.1624055970457; 
 Fri, 18 Jun 2021 15:39:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o139sm9343774pfd.96.2021.06.18.15.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:39:30 -0700 (PDT)
Subject: Re: [PATCH 6/9] target/mips: Remove SmartMIPS / MDMX unuseful comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ef8d72e-1977-cc38-3c2b-f3099ef2933a@linaro.org>
Date: Fri, 18 Jun 2021 15:39:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> These placeholder comments for SmartMIPS and MDMX extensions have
> been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
> More than 11 years later it is safe to assume there won't be added
> soon, so remove these unuseful comments.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

