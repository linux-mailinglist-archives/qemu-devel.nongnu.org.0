Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA96A1D28
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:55:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVYWg-0004jx-LN; Fri, 24 Feb 2023 08:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVYWb-0004jB-3x
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:54:14 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVYWZ-0002Bv-Jv
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:54:12 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z10so7490547pgr.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KfDAnPFWBRG+VjGaHVnTNPd15rQOW11NyQTPxEG11GI=;
 b=lnDVGRCDt9orEeDTuBKJaOYKdkxRYcR4yZIl+9oIWE4/uDrPmUEDY41fy5r/jLCI2B
 XVO0QIk9kLiK0sYY8IZeBWtADdEYyMAXI26zHOrjqbNTSP2AtIvicg+nfz7RcaKUjGc8
 23xJifiOxHByR3Ck9PIh4iXtiT15a1ltC6xuM83lEBaRuvFtdJOjZaXc7d7wTd/MJS3h
 T+dkApC6avC5S6wGqcc/84I0urLoYZEyydxC71EtifctmZUJKfN1KaupgoVE45xxZMlY
 5iRh/PeszzaqyGpR/ni+MxoQsT96w5uEar1+hxMqB7Ua7vzbVqh7fLmBp3zsFhl93mIm
 tsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfDAnPFWBRG+VjGaHVnTNPd15rQOW11NyQTPxEG11GI=;
 b=md6Vcoz3rk55KNsC28eUitAyXadgHi0YndyVzwB68D2vno/9jBbu3WIyeq/dS+r6bl
 BoYHkyd1dKQATK4701jWNQc521gMgTwmq6iZKQGPyXA2hc+wFSH4GURNU17IOpYfbU6A
 pSdG/B6hSTLiSYvyBohpZ4BaLZuPLbtWfMypaBKM+O5f9kOYtNSQwAYyQbH3Nr75HiVL
 8h7MYf/hnI3UtSI5njGAeq7B2nOWpEQ5oJiamA8Zraao7QvAhDSmb0K70x4r9xST9Wce
 RRe0iKENuNXUbFS+T+cVTHlzqWMJPYVi8mak65MoS75I78Uo7+WXsi0wbTBHpCXZDA8+
 KhBg==
X-Gm-Message-State: AO0yUKVbLu0bZRToa80Ne95pPXUOJSooubIf4yZ4A0rHpMTWTJi+mOAl
 /8ZtBt9rdQtEzDPv6AWor9U3obqHcW4+vrFFoDacFw==
X-Google-Smtp-Source: AK7set9Hl/taWPvqBTVcarhkz4hEQWQG1tgY3Y8ZHoUQ3SUUeW2TmLZU59yl2fN/cGx9h7Ancj9PiYtwrYkRdwPSCG8=
X-Received: by 2002:a05:6a00:2d94:b0:5a8:aaa1:6c05 with SMTP id
 fb20-20020a056a002d9400b005a8aaa16c05mr4400918pfb.2.1677246849809; Fri, 24
 Feb 2023 05:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-5-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:53:58 +0000
Message-ID: <CAFEAcA-mzXuxgfrkU85k2PDgvRwy5_e1cBb-_1gwXdH6eQJAQg@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] target/arm: Rewrite check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Integrate neighboring code from get_phys_addr_lpae which computed
> starting level, as it is easier to validate when doing both at the
> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
> especially S2InvalidSL and S2InconsistentSL.
>
> This reverts 49ba115bb74, which was incorrect -- there is nothing
> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
> pseudocode is consistent in referencing PAMax.
>
> Fixes: 49ba115bb74 ("target/arm: Pass outputsize down to check_s2_mmu_setup")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

