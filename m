Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2E18FB9D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 18:37:21 +0100 (CET)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGR0q-0002xb-77
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 13:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGQzj-0002Wm-QB
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGQzi-0001SH-K1
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:36:11 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40373)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGQzi-0001RN-5X
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 13:36:10 -0400
Received: by mail-pl1-x641.google.com with SMTP id h11so6200051plk.7
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yZUTVmgYw51H82cm4DpkH8NxJUhsYOxNVLcCAhDQeZw=;
 b=BAiTSYQ5Fk3xY3H73ikG44Vd8HOVsByQ/g14GUABVkUCD9iENEYKNr8qgzBbgbBjCY
 HF0yaRPMSkCf+UpG1S9lEvCoFRvDnlNhG1AOqHHktPeGqt6ex4mYFnhzku0YNlBBdgfe
 0xRYSMTrC1fcZM+9BZvj/PSLgPgxToWpnWhEnpm+eD/LITotCxuMGr5x+bXukEX0L0xk
 XvCScgis2skbTGgkHoMADrPUAC9dpIW+V1xxH4BIPGMlGK5TzVYjR/PXHf39m0MUwj8C
 AvKWfrjgI3bOh2yvvUiCK7iz182DrPBNusO5sg/iJePiwWCr8G6vYCSlb3zGOxL35w16
 ewwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yZUTVmgYw51H82cm4DpkH8NxJUhsYOxNVLcCAhDQeZw=;
 b=m0X3aFTsPSV96BAriHEV38vlpvG4P5bd3kCeaHOh+r5Z4DARqJeFZyehTNFvPjMYVw
 jr6E0Wz17GGU9aJyPQG15Bt+IHrkCvPfOpOdI9vfsxCboiTJ4rYgjaDlka2fx0tFJZi5
 9oOqHPmya+4qb4drapfcSE8eFuAK0JTN+WGFHNp6tMsKZGzrl9OYa0oKeTGBy4WvvpQH
 DzHMfm/A4rK0VfpMKQcGhWS6uZ6LIk3+B1USIkhvp++UrkMxhAKJBeFTzUgKvJW9veBm
 +Vm/1ohSeYD8LmAx5ajoWA22STTlssMRxF+vRQ8QDBXjoHir3obN9NwNdB/m5MM82XFb
 5AvA==
X-Gm-Message-State: ANhLgQ1GLZ9I4KtQrTtg3iuFN1ifB/X8j2a+ItVBASCE5zHC/vReH905
 yXYDZOFFc1tMCgNVOwMQWAvl3A==
X-Google-Smtp-Source: ADFU+vu3DQBALhvkUUT6ORZNClf/qcGLfNJZLs3svrqbY7jBcEeSIl714WUmAYVdTxs0bLzGWr8r8Q==
X-Received: by 2002:a17:902:8647:: with SMTP id
 y7mr22829507plt.224.1584984968231; 
 Mon, 23 Mar 2020 10:36:08 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i23sm13868448pfq.157.2020.03.23.10.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 10:36:07 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix loongson multimedia condition
 instructions
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20200321045621.2139953-1-jiaxun.yang@flygoat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f0864ce-200c-dc0b-a1e0-5f4ddda29386@linaro.org>
Date: Mon, 23 Mar 2020 10:36:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200321045621.2139953-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: aleksandar.qemu.devel@gmail.com, aleksandar.rikalo@rt-rk.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/20 9:56 PM, Jiaxun Yang wrote:
>      case OPC_SLE_CP2:
> -        /*
> -         * ??? Document is unclear: Set FCC[CC].  Does that mean the
> -         * FD field is the CC field?
> -         */
> +        cond = TCG_COND_LE;
> +    do_cc_cond:
> +        {
> +            int cc = (ctx->opcode >> 8) & 0x7;
> +            lab = gen_new_label();
> +            tcg_gen_ori_i32(fpu_fcr31, fpu_fcr31, 1 << get_fp_bit(cc));
> +            tcg_gen_brcond_i64(cond, t0, t1, lab);
> +            tcg_gen_xori_i32(fpu_fcr31, fpu_fcr31, 1 << get_fp_bit(cc));
> +            gen_set_label(lab);
> +        }
> +        goto no_rd;
> +        break;

There is no need for a branch here.  This is a deposit operation.

    TCGv_i64 t64 = tcg_temp_new_i64();
    TCGv_i32 t32 = tcg_temp_new_i32();

    tcg_gen_setcond_i64(cond, t64, t0, t1);
    tcg_gen_extrl_i64_i32(t32, t64);
    tcg_gen_deposit_i32(cpu_fcr31, cpu_fcr31, t32,
                        get_fp_bit(cc), 1);

    tcg_temp_free_i32(t32);
    tcg_temp_free_i64(t64);


r~

