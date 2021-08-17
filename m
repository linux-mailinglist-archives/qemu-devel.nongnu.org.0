Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AE3EEECB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:53:45 +0200 (CEST)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG0TH-0006Kg-MQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0SG-0005T7-EY
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:52:40 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG0SA-0008Ma-JU
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:52:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so5700141pjz.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ECLUXzWGi79CaHQYwTiXSLTJCSVxfHhi6efcLVLABmY=;
 b=mSbyZjrvdfmqFlskA2M/VM7xNDshbaEzqqZ+QiksuQEnFvWkVBRxO3AoA8IG+4uySv
 wweV16KCk0PFKQwhPb1bQU9q/iEYk5IkAqxz1pYYlypUY7fxr9+piqaDT+9ZHTJXUXnV
 AmXpYIwp5d/v47vKc4o7g5w8438aeuWTB7lQju8P/yrGScMBLFIJzaLZjrShMLAkXLoI
 BXQyQ4oT5TYHZCiVt9wBSYZDbJMp889uY4iSOmwz8VNyA06w1upDasp+EGgxyZKGR1XQ
 SpDcPzFID1rpyIOB37c7GbDr9tU0SxeAdr202o583kih7S7iNRp8+9kWwAIOPttj02Oo
 HWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ECLUXzWGi79CaHQYwTiXSLTJCSVxfHhi6efcLVLABmY=;
 b=ToeiW1+9afF2t4KjDWH+65YHHOZGVPpHt7O+gs8ZB6hi1KcGivCXHFwG3O62CdQAwX
 kZxYKB7vKDXfRewUaNQilSQHULt796IougdZ+5Er5dtG2msxedwmH6XXEj+TssKSr70s
 Cfuu7GnnhaZnl1GZd+5/0zeh0wdqZWG87kOGIwIWwt6RONFE3uvWtlNoGhRGf2tgJH6a
 qgGMN1S+Go9236MS1eevM9cKW2JfKBUaucemvabY32O21AGbLETZ+QN5rSqIFNjJgEfc
 W/q9mPP3hX/mjK7tZnhye+xFOgaAOP9M5YIgi6IEAl54MW6vdTRKdXBsvBB3lgSrE+Bw
 JgDg==
X-Gm-Message-State: AOAM5302qZZzPeXCwNZRe9WhMcsQMYEkRiSHbpIKVV/odpYGhLZDNMXg
 ufF1NipGnA98sfHiCfGSx6Ld5A==
X-Google-Smtp-Source: ABdhPJzOpJshAKlM8DJ8/hnT9CNeE4Td1GOC6f77MQBh5QIVfsjg4k5RubNyMDHT7++U4S5lowic9A==
X-Received: by 2002:a63:5b01:: with SMTP id p1mr3880518pgb.250.1629211952098; 
 Tue, 17 Aug 2021 07:52:32 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id fa21sm2549104pjb.20.2021.08.17.07.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 07:52:31 -0700 (PDT)
Subject: Re: [PATCH 0/8] target/mips: Housekeeping in gen_helper() macros
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210816205107.2051495-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95d3f194-1042-6cf6-08e6-cffd1fd87620@linaro.org>
Date: Tue, 17 Aug 2021 04:52:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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

On 8/16/21 10:50 AM, Philippe Mathieu-Daudé wrote:
> Trivial patches:
> - Remove unused macros
> - Use tcg_constant_i32()
> - Inline the macros when few uses
> - Move macro definitions in translate.h
> 
> Philippe Mathieu-Daudé (8):
>    target/mips: Remove gen_helper_0e3i()
>    target/mips: Remove gen_helper_1e2i()
>    target/mips: Use tcg_constant_i32() in gen_helper_0e2i()
>    target/mips: Simplify gen_helper() macros by using tcg_constant_i32()
>    target/mips: Inline gen_helper_1e1i() call in op_ld_INSN() macros
>    target/mips: Inline gen_helper_0e0i()
>    target/mips: Use tcg_constant_i32() in generate_exception_err()
>    target/mips: Define gen_helper() macros in translate.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

