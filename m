Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7912BC1E4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:02:22 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ5R-0005b1-V7
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ47-0004l2-7W
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:00:59 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ3z-0001yg-Pf
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:00:55 -0500
Received: by mail-pg1-x543.google.com with SMTP id s63so599472pgc.8
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D0o9x4hkSkrT/zYxKvl6aROB43Lh2lY7moTXCTtywUU=;
 b=zhd3U6u4ebfiNBy92xPolcMHM88YZhRQLuNVNXfFJZYSnLaCSUkSDFD83TVzpVzwWk
 g9x8MopJGXoc1dgW85LhxMxXDjcFLTZI1f2zpoIvPh5bpaNB1bT8RVonmD1H8o6HC6zk
 JlW/P2mK0b+McdBOhBkYduahYEgQeGrote5rXTw1ip0urX8QcnFvo59wB2TXwLnBNXQN
 +KmjCOxvLBZrrOgeoML5r/q4bm8P8+j7WtFUN4fLkNuZC4gT2QrvFKPAFWsDv9x0oxRL
 Wd8TRk4X9ykadJIlZGMzUIpFw6f0iK7QOknaQyh4Uf+s7SedzAtk53WTcNzOdq1wVXDw
 MhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D0o9x4hkSkrT/zYxKvl6aROB43Lh2lY7moTXCTtywUU=;
 b=f19KrMg2KJgXBIBhduIHNgIyhg96wKxWNmu7ybRPYSfqSXOFvSPxikHUuQJbmIryPz
 gNl+pKLBSumBe/6uIk7SGpwItsrnhXEGhUfERWkVsO2unQTmPZd7i+YbmbuS/hCGEgtl
 WTjiSw0OSIdgH96mzEDqwsGXqpESHNPZ+F/UlN2eQGHvsydo39zzp+9DUnCbnnXZDMd2
 +gApGvxKe7tM+D5Zy4PZLrn8fDwXfzuWZ+V6qgjh2upsMGY8NAtve5UFXmy1VWpJFJI3
 FbveZ7nA7YfzEOoh6fQs5MlW7cZPaVAj+uM50eonWj6YUFNvK9KT0uflQ74G+ZkK35pl
 3/Ow==
X-Gm-Message-State: AOAM531Sjr8o2Ldlh870/B+tUSA5EX8kC17Tgm8zRosWfgbgbqfjppKT
 0eTE30plsYJccn2unEH2xMO8Dg==
X-Google-Smtp-Source: ABdhPJzrngGex3pgn86ZjxaZN6q4cZWT0KGt70hyLuVgw9opefGm/JWReQ4xVEPHdia2+DWtiEvEuw==
X-Received: by 2002:aa7:8205:0:b029:18b:3691:e447 with SMTP id
 k5-20020aa782050000b029018b3691e447mr19212755pfi.69.1605988850392; 
 Sat, 21 Nov 2020 12:00:50 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y5sm8000133pfc.165.2020.11.21.12.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:00:49 -0800 (PST)
Subject: Re: [PATCH 10/26] target/mips: Extract the microMIPS ISA helper
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <708bdf67-a5a7-d0f9-4570-7280c605c6c2@linaro.org>
Date: Sat, 21 Nov 2020 12:00:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract the microMIPS ISA helper definitions to
> 'isa-micromips_helper.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                   | 10 ++--------
>  target/mips/isa-micromips_helper.h.inc | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 8 deletions(-)
>  create mode 100644 target/mips/isa-micromips_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


