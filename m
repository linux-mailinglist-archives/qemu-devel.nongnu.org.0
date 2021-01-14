Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A892F65B3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:29 +0100 (CET)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05QC-0004TJ-87
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0549-0002es-EC
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:01:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l053p-0001h1-FG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:01:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r4so5125512wmh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lw2YSkzLEodFER7hAZ43SoAxLiVvVrdb53MYn0Wl1Z4=;
 b=GQgSKowKDHeqClROVjoJ3TGD+apAsztrJRI8We/O9ZQmrt1NGKFeAVZtlb99+M9IQI
 eglhNK66WGHrNm9KWQuxuCXc361TOI0vPt+Sv44kt8jQBIwO+RrY09T9nAzzWNf/Y0od
 3IZZftSbSZAP6kt9GGuZVjeAWAP7h9gacjVCDFqJPgb873ceZM6vK3XcF8Iuqp5HJoxH
 LLJiaABMT0nO8U25+Uv2gToNQjmujjrrEVBE5yogD7CG+Y5ZqS8XF0fjGOWhr05nVobk
 Y3qMBI34ctGMNDqjNmWOwD+K2OdUzUUGDTdjHE3X6NaZDxGdRbahaLnL1/35kXDznajJ
 8Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lw2YSkzLEodFER7hAZ43SoAxLiVvVrdb53MYn0Wl1Z4=;
 b=IYRREYr5R34GNY7lOCymkDTfej/3egYNg4dJInYrg6IpvwfxFoctnBOif1afkhAnts
 jubLbgNZrIqoWBlXfHlydOy2Kt+ecLCjULBU8vRHps40238xi/N5+gG4/5nXIwtqtB8Y
 rmJFsySIoEzhs7/KwjiR6imOyVNVJG7TaRFoUxMYRU/DGG3K3PseN6+zOBNNLFDGwPCT
 txWQocJRLKGZME8Zdgn2GCeXLgsEWDCU/wRYBLD0fn7rP41UpPGXd7X6DKAIq1ywp51h
 0HO82RRLuWIFxZGPLeWyP7q+wsmrICuLUWECztqSVUT/87K4G5aBtznV7xBjyPwGtv8f
 hceg==
X-Gm-Message-State: AOAM530Gg7A1br+iwW+2wctZSOWzyg7S2tBRFyw1efRE7YOTg347UUx6
 Cr/aTL4UqvnK7MYkQWfkrUE=
X-Google-Smtp-Source: ABdhPJznL4Q7OSUcSN+wkTAethQ7/TXD4LE9CBlQYqD4dzx/Sadh7C+5SBf0ohPCLm7uNHWURLHukQ==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr2618056wme.112.1610640075152; 
 Thu, 14 Jan 2021 08:01:15 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r82sm9527868wma.18.2021.01.14.08.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 08:01:14 -0800 (PST)
Subject: Re: [PATCH 0/3] target/mips: Remove vendor specific CPU definitions
To: qemu-devel@nongnu.org
References: <20210112210152.2072996-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <64be948b-03a7-c1aa-1c7c-f0102f4ab314@amsat.org>
Date: Thu, 14 Jan 2021 17:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112210152.2072996-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 10:01 PM, Philippe Mathieu-Daudé wrote:
> Trivial patches to sanitize MIPS CPU definitions.
> 
> Based-on: mips-next
> 
> Philippe Mathieu-Daudé (3):
>   target/mips: Remove CPU_R5900 definition
>   target/mips: Remove CPU_NANOMIPS32 definition
>   target/mips: Remove vendor specific CPU definitions
> 
>  target/mips/mips-defs.h    |  9 ---------
>  target/mips/cpu-defs.c.inc | 16 +++++++++-------
>  2 files changed, 9 insertions(+), 16 deletions(-)

Thanks, applied to mips-next.

