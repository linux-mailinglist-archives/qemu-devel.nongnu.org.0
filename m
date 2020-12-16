Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19B2DC6F7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:18:17 +0100 (CET)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcJU-0001kt-G1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcFk-0008LU-87
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:24 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcFi-0008Ae-Ac
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:14:24 -0500
Received: by mail-oi1-x22f.google.com with SMTP id f132so28804854oib.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QwIeVqosHKYpJywDeBuSbw5kCKTHOkwnjMcUmTpjM6M=;
 b=ysSehQO8cI12SSwtG7jkhl4YDU4R50ksxo8rpIheEWXPUlGkoAH7XI5CrN7CaDsCPv
 LCmabKlQsmQ2dxlTgI9wteh4KbiLg2IrGFoevSZdzqezmk11TXPrgR1ZLPNqzALJ6LWw
 ZWgSDK2sZEg+tbLh3h8e2frSZoQzr0vI31QskzWwXOPxQhd2QVx4RFtL8lxHewkvmDuZ
 8931AQb2qTW2RfGglxuFqw8kbhnxxQTASfvZNnRliXMY08NMyfL3aoR0r+Ip4qDx4S1S
 x8lKNhdFFyBiRQfNWd4qgggvV7ivJkE0QXxel/TGnlPEAr/s8ABdO2fKkK7XbbhP9GQO
 g2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QwIeVqosHKYpJywDeBuSbw5kCKTHOkwnjMcUmTpjM6M=;
 b=pfIYfz9t6jLgxp30l3lHxpwYunvDW7mixlUeaKGGGKECYF+YWFhH4IpzMZK1ILTWqK
 BFivKiMi26wXQFW60UGhq12zwGy2fomLRbiuHvSraAcGK0R4/5t4q05jjvxyiJdTrb7b
 EWpJqXkISo0fDqAk0Q/mgb/+UXStpG9ZmA/brHVfVysMafd5hWftA3d+EZwO1+2zmkMM
 megXIJWUKHU2GXe+YPu80XeuL7fyg5TVHIEgnyxByZKgRfvv7zelf27pK0SzMs0X8+9m
 evpwl7NNSl5RvqwC+zQi6TunAEHEJFsU5v4+QiuE3GUxIubUOeGEoJDthLCPMUTQjU23
 vbXg==
X-Gm-Message-State: AOAM531AzyfKzSlr/d6WffUhwnwiGdDfS2YKlWyHVJ49XrGBgHwhvwhX
 w9+DEAVPIaSYKg9eT3xGiwBuxg==
X-Google-Smtp-Source: ABdhPJwuQAkx5Q3d1NHlU+a3A9BLL8JeFxHIAUrtbTwJXXGF4GC9DggG4V2y/Tffs7DEzh2kluySCw==
X-Received: by 2002:a05:6808:344:: with SMTP id
 j4mr2866159oie.54.1608146061225; 
 Wed, 16 Dec 2020 11:14:21 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n16sm737368oop.9.2020.12.16.11.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:14:20 -0800 (PST)
Subject: Re: [PATCH v2 09/12] target/mips/mips-defs: Rename ISA_MIPS32R2 as
 ISA_MIPS_R2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfd82c79-3182-12c1-bea0-7eba615aed20@linaro.org>
Date: Wed, 16 Dec 2020 13:14:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> The MIPS ISA release 2 is common to 32/64-bit CPUs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h     |   2 +-
>  target/mips/mips-defs.h    |   6 +-
>  linux-user/mips/cpu_loop.c |   2 +-
>  target/mips/cp0_timer.c    |   4 +-
>  target/mips/cpu.c          |   2 +-
>  target/mips/translate.c    | 138 ++++++++++++++++++-------------------
>  6 files changed, 77 insertions(+), 77 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


