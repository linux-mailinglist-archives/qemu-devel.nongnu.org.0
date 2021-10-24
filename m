Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC143897A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 16:10:43 +0200 (CEST)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meeCw-00045A-1v
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 10:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meeBS-0003PX-El
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 10:09:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meeBN-0001zl-Tg
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 10:09:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id p21so8044735wmq.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eX10VOWvm6HiVyOVEqn45x1BGdCtfUfJZ9loFtIwYng=;
 b=MPxYpfLPdGwYok1iuyYr+dFUXRSPIaObcc4e2atrk3VkG4NXicdEax25PPjgATh8oZ
 ZfahGLIrA/e/o5WFX635B3vHhHFaF3XfpN5EO3mRH8kspRds0k7F487nTBNbsIa7w8XU
 ROrc58TBliV5F+SxGWH+Fq2NMByiWCU0ia0PDvV2P8ycOvbYmG/lh/MI/FSmuI0ydW9W
 D3C6UyId6w7bbVvuInfybT3zDfzqxYde5az7I9xZcDoEhBl26Zjr8kvZxSn2zpCwZ1UW
 +2Lpji6SQRPIT6U6BY32R5sx4Z/PnH/bg+ZfNmzYVQVJJbEW9fqUTDMZy6Gj7+RGfQg1
 nmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eX10VOWvm6HiVyOVEqn45x1BGdCtfUfJZ9loFtIwYng=;
 b=eJRIVbz6YMWZz6wWddtzdO51n481htrOicmTTYB2q9bmeek1cN6l/2lgbylWvXdG2B
 MPfqnM9ViUXOKLBQsn3zUvvbg6GMYBiZJ1L1ZEfR59EbkGPtgHZjZLzzNVwjBgvxqGpd
 J7M3h+zenkVwSK5PBlqP480fbnDfZBLHIAgbmFxsgqOXSwf59xkBdg5Br/Y/uQc4PpiC
 3/ZJqK3kwLDMgJym0C2RtU3XHh7x5uyboDsBq3xJ+VHgjEf4XjzT4DDuImz6e+8ckpfO
 7EOENAR0D4GgurYafmtSlKC/WntiFZdA5r0Or1d8gqgyP2lO7NsiPk99+6Vn8DJTUDr6
 z1Yw==
X-Gm-Message-State: AOAM531dsRLn+9M0TvkNBPc3B+C6j9gM+73hjCNoO/slZpY8Y1yl++oK
 I4txhK5NBh6NT9APdu3LHZg=
X-Google-Smtp-Source: ABdhPJxF9322/qR3v2Ugkv8gTXP+evq6cwltFdZdYEQV2aawTUgFBdLXEgYSENLpPn54veoUQOshWQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr14223584wmj.22.1635084544154; 
 Sun, 24 Oct 2021 07:09:04 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n15sm1059825wmq.3.2021.10.24.07.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 07:09:03 -0700 (PDT)
Message-ID: <614eb8b1-aa3e-8c2a-aeec-bd0f60e0eb6f@amsat.org>
Date: Sun, 24 Oct 2021 16:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/5] hw/sh4: Codeing style fixes
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635036053.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <cover.1635036053.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 02:40, BALATON Zoltan wrote:
> This fixes coding style of files belonging to SH4 system emulation
> which were not following current QEMU coding style requirements.
> 
> BALATON Zoltan (5):
>   hw/sh4: Coding style: Remove tabs
>   hw/sh4: Coding style: Fix multi-line comments
>   hw/sh4: Coding style: White space fixes
>   hw/sh4: Coding style: Add missing braces
>   hw/sh4: Coding style: Remove unnecessary casts

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

