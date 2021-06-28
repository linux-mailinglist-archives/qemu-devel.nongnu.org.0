Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6843B6650
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:00:01 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtg0-0007CY-Tn
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxteN-0005q5-I7
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:58:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxteL-0003Ug-O8
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:58:19 -0400
Received: by mail-pg1-x535.google.com with SMTP id t9so15818911pgn.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMgiMwAusZsCMxftwgQh68lTQB9eLsl6lv2KON/EoqU=;
 b=UtSsknGUHIieqX6dQ8ZYxGo4QjSMyKF4DlxPJiHKPRAeovh7hAHiCgxG/rF3pkkYhU
 /FsonvNJjUhZQSVAjgq3h8xiyEffqYIu1gVVVG2c3zhhs8QRydd7DR4Kw8v3Ae3zDc4n
 PFkOzLPtc6Qtp5SYittTpjSXvPWT5fQl2qpa2D5IfUJYpPSzhoH0vq5RCGHhviCAYLhg
 dW/Uwlgto68V8So/VNViuxix/ERsm5In0Q6AwacVZdnxd7Ri0e83mTLYRk+lclosD5MQ
 xQQ6yDT8kucZHGZDIOGgyPeJeCQimeNtrdNmY/TDcKkoXFby4RNBaGv7y+SU3xPpMG0G
 Rb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMgiMwAusZsCMxftwgQh68lTQB9eLsl6lv2KON/EoqU=;
 b=HGJ64oANVD1iXJu+5ghc3pNa61YFIXZ1fcYLVbeQqtY7pm9kjpd9UIEYatGiyKWGlp
 5qd7WhU/IE+kolZFV4fAmxoSvtAldeCfPLO8VSVDKqd0moLJgFCUjxHbkJjU1f6sTlY3
 RXxWr4CHEqN7Z6eK8U6avLHO8NATogOsIh7ztdoAnJEHAOYLCqvvJoNQrD9FQIcOsPVv
 fduoIXRA2XzJPcuAbofpzLLecYCatKdi4QpOuYRMZ2763Dkx6DYbtBmUqQP9hoX64DpF
 ByqPF2Wf5dF8Hpq06ZfUF1HZcxIZ0IBeiCJJBKqUX3yYPmbAXJkyo+YBL/N0P3R+3UBC
 H8iw==
X-Gm-Message-State: AOAM532R47tXkocdUwulwaH8it27+xosoIQI1y6Sy0KKTaWd2RNAMdrn
 V4Xyd1HelzAPrPvbbjcusk9c0Q==
X-Google-Smtp-Source: ABdhPJx2BStvIICYyipcb6qpmudBBR2ObYwyY52p+WBvZLzaH7DHsjtgRtYHVdbVl6plQ/CUYCnPVg==
X-Received: by 2002:a63:5442:: with SMTP id e2mr24089387pgm.365.1624895896164; 
 Mon, 28 Jun 2021 08:58:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v11sm98499pjs.13.2021.06.28.08.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:58:15 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] target/nios2: Remove assignment to env in
 handle_instruction
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-7-richard.henderson@linaro.org>
 <CAFEAcA-9h+vUQWR2GxZQZk+O_cE+-gyoKi3XeY1=VaTsTJXh_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8bc3392-34f6-4212-c158-b4e191bcb665@linaro.org>
Date: Mon, 28 Jun 2021 08:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9h+vUQWR2GxZQZk+O_cE+-gyoKi3XeY1=VaTsTJXh_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 8:31 AM, Peter Maydell wrote:
> On Sun, 20 Jun 2021 at 23:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Direct assignments to env during translation do not work.
>>
>> As it happens, the only way we can get here is if env->pc
>> is already set to dc->pc.
> 
> More to the point, t_gen_helper_raise_exception() does
>      tcg_gen_movi_tl(dc->cpu_R[R_PC], dc->pc);
> before raising the exception (as you would expect it to).

Ah, didn't notice that.  My comment works from the other direction:

Within the page, 0x1000-0x1fff, any insn executed will raise the 0xaa exception, which 
means pc will be set for that insn.


r~

