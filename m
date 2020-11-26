Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB42C4C31
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 01:31:08 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki5Bi-0005bf-Qa
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 19:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki5AA-00057s-DY
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:29:31 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki5A5-00048C-Pb
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:29:29 -0500
Received: by mail-oi1-x241.google.com with SMTP id h3so356913oie.8
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YT5JomdzSjBRQJnLM5nvP+NTZfEahYVzOnDxWR6IIB0=;
 b=HRdPiPxfjaKdSiqowgDkGBp2n3I9mjUDJqEJnVPcCHIRro6KHlVeGgWTVTcG9BA+YQ
 5aSDMhFLVe1py/r8oVMOdaTRzlq0scKskc/ij+CN0lgrLx7iUD58TvYPPB1plPqjxInu
 bpQ17zL9xVzrK8BLnbdlm8ijIOO4DNSp8eEonMNJ8M7c+bvpuPkAFnhf7hkAFUM1Z0e8
 U34x4FlxckO3jDZd41/5mE/ug/FNXUUQcqq29f/2hcr5fEawcP9J92A7zeKuai83V+Ck
 H+ckYV0+MjEh7+PnOJ5EvtHzoziVKeMPUbc9MwllpajtHdh/dTpb8cG7WusLp2m3Pz/O
 k5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YT5JomdzSjBRQJnLM5nvP+NTZfEahYVzOnDxWR6IIB0=;
 b=ne0PXlEn4M1N8OO6L/qAS2lSolFBCrogc1UKSsKYQASz4qCyUOIEmB2UFZyvDGkCDt
 D3WCcExJzqJ+EBxpODFMIHjyCfvgF42GFvSv/+DsSXfrC+xgtY+Igmi5zzh6UzoV9XGh
 +ea9rt2gHcVArPxzoIWhA9EZxY4Lqm6Cf6e7onxxqNsw/4w+58D/rvA2244SS1T5L2c5
 oXQC/jtbpD2SosZM2qz3JRlPmKlrgqxx1+SpB1WSlVlzy2PbpR1W3MgySearNQpcOFSI
 jtBhpSHfp5diTxURya0hVkuc6lh/OG/FYVt97LRVIAyowPmhneX/3de3ltbNPlPHApjm
 BG0g==
X-Gm-Message-State: AOAM533wp2dqwmY/qNZJN/0s7ys7dqz04sF1QkxnpC6bgT2y4sQnjDs9
 xs/C8wcPsB8yFALGniVHe1o6KePZktee3Q==
X-Google-Smtp-Source: ABdhPJxSr51XIG0NhwZU1Zh9FbAYSPV4gwPFnXn+FSKV/IsJQnP5utRUpTmkOaPSOngNL3Y5qO57PA==
X-Received: by 2002:aca:534f:: with SMTP id h76mr486655oib.60.1606350563770;
 Wed, 25 Nov 2020 16:29:23 -0800 (PST)
Received: from [192.168.20.233] ([12.220.158.163])
 by smtp.gmail.com with ESMTPSA id d8sm2050693otl.15.2020.11.25.16.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 16:29:22 -0800 (PST)
Subject: Re: [PATCH v2 22/28] target/mips: Extract XBurst Media eXtension Unit
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <590a6502-85ae-ceb7-3ac2-72e94506c116@linaro.org>
Date: Wed, 25 Nov 2020 16:29:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Media eXtension Unit is a SIMD extension from Ingenic.
> 
> Extract 2900 lines from the huge translate.c to a new file,
> 'vendor-xburst-mxu_translate.c.inc'. As there are too many
> inter-dependencies we don't compile it as another object,
> but keep including it in the big translate.o. We gain in
> code maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                | 2890 +----------------------
>  target/mips/vendor-mxu_translate.c.inc | 2892 ++++++++++++++++++++++++
>  2 files changed, 2893 insertions(+), 2889 deletions(-)
>  create mode 100644 target/mips/vendor-mxu_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


