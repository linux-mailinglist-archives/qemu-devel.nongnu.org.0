Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE72DC6F9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:20:40 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcLn-0003Hx-7L
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcDh-0006pj-I6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:17 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:33940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcDc-0007t7-A7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:17 -0500
Received: by mail-ot1-x335.google.com with SMTP id a109so24140721otc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oii35g2QjMXcHI/BGMxohvRzSWPDWa7dCV695PVaGMw=;
 b=uiF7/dzKzSumxnaO/hmCE9o6abVfIrs9kpi7qF4JSUA0O0p77j5iNskEC+iLYIoB+/
 uB2XwUsgQwjp26ACU6nII286JfY44csmgYiO1uTHjvjhSBu6dSFRdXRCLdoEN/K/DTR5
 qazxE4J8A/TuxXc3WUKkZ03vcmaVZv+FfrdHgYn0bh9QoHwiaWSo+43lFAcOfcRB96ZH
 kFy9SkPVTTAHpTyTGeYXXISRqWLKLy17dN88kjC+ktetcueNYnNWXo8/SwfGI2KAC2rp
 TcvCY5XvFZbvlT/f+1OPOiqBJhWfLVzXdxT5cAtbaXi0kI4xwEr6amvsfvXTyeua8weV
 lXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oii35g2QjMXcHI/BGMxohvRzSWPDWa7dCV695PVaGMw=;
 b=AMcvVRo832Yz+OkmuzlU0sd7nVD0YYzb7vRedkn9/W8yrcGvXQ3X04/U20AoAQfV+K
 JTZF9o8MgD7vVhWjXonNnej5OZs4CItlbUeoLqjbdfcYzOtGdQT4BZISiMww5DE0iGpb
 kRGCr6Q+VV6PZ9xjzq1FTMlclndmIS4lEDDAMIEPjqVF3ILgKEZAbm0AfMeRm4KckqD3
 8HjOapa4rP1lXEhGO4VD52uLHxA1P8edvmsrNJzttArohnBpL8XkjPd7/mJYbGKHfhc0
 B5q2Hd75NcR6FWRt2snUfREAqxvV4Z0SfSZ0Hs6z5sPw9mo5riRcuQIdJG+TlzYyQFwy
 n/4Q==
X-Gm-Message-State: AOAM532r8P2uBhs2tGy35qNE0zcfm2UFaD6+GMeYIioGzGW1mpyNhbXN
 Wpdt+TGzmB9rI4qeQ10xdjRmCA==
X-Google-Smtp-Source: ABdhPJzuc0qSdFiB49x+ekmtFQAtT3DeZ2zknl+rozIZlbf7JtUNhi7onh4ha/IURmVf5v8zPg20NQ==
X-Received: by 2002:a9d:620d:: with SMTP id g13mr26676844otj.56.1608145931154; 
 Wed, 16 Dec 2020 11:12:11 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j22sm660717otp.45.2020.12.16.11.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:12:10 -0800 (PST)
Subject: Re: [PATCH v2 03/12] target/mips/mips-defs: Use ISA_MIPS32 definition
 to check Release 1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ef6ad30-7bcb-cffc-753f-97d2185ad810@linaro.org>
Date: Wed, 16 Dec 2020 13:12:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> Use the single ISA_MIPS32 definition to check if the Release 1
> ISA is supported, whether the CPU support 32/64-bit.
> 
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R1 in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h |  3 +--
>  target/mips/translate.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


