Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B046D2DC41B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:27:42 +0100 (CET)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZeP-0002aS-NN
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZcB-0000C1-VC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:25:23 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZc9-0007Cv-U4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:25:23 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s2so13205853plr.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kaJVsuiZGLpTpUX6LevuWpLqM5gPjTgFJgdqWdpdES8=;
 b=UiL4ENjkCuK+1OYS1gpxDbo0zjvD9j7DvNUNj38CiGvDD3+Ggm0EgYdlzAbGnKpGl7
 ocooWwcajtuR6TkRq+klIu1H+n4ys4HlX/Qz7u7egk6DlhHi0B4yLCXejVkQDm1XmhxX
 QASEJKlEVyDXJpfhhM4TkDXyZkEa+YyK3cSmKji0+L5AiQbC/cTgEzm1IfRHxJkR9Cjs
 tSLir5/oKHn9MhlKfXgr5K/H7U0bu7Gn8PI6ejfQhLGIBi3iCvBtV+M6/KJ9gBSlZNPC
 dw1WzjNV2zdZ9D6+30NMCfuvWpieBOap7IpOrVJTkJ5jF60ZnBbKKXgyJwam++jIhrvR
 YVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kaJVsuiZGLpTpUX6LevuWpLqM5gPjTgFJgdqWdpdES8=;
 b=GMVC8HZtHmq1+lRHJumdFhot9uGQGdqhZM2l2NS0x+1FbUa6QouN6zVO+rNcRCmuRH
 dKOI/U15aFNJh6S7ZvkBs8FUG4obuL9fZKAkky0Jv/IJL04rDxEVzQ+RT+1GiFUUBhV1
 ysuiyQYB+jje8g7RXvwbmbQ1ERcI+HcXcU4jExbk0vDLclPwL1KY7vTMKBP9xQXIgw+S
 RdKQdyBiTesoHzV/wh3LNf7Moz+NMpOJXcRdiuSGwjV6L/MIxh6NJ6iPvG7Fct9xspUz
 yLPmGcUW8+AlOBTlVdQbEzR3bwI16ImioJMii/E+R4n1FIKoxS0J3ymrdtV8wHniNeWA
 FQ6Q==
X-Gm-Message-State: AOAM533Dt599UWqguRagknzMERCBsK6+eL9RWghQtVoqQwTlsOhPByhZ
 BTJyV/x3XYpczFHsBKnlU8Ucaw==
X-Google-Smtp-Source: ABdhPJxbR1UTyC98l+EQIBSArhFIilUzQPdS4FUGApFAb830/74kaksPgmdMCoanwnhDVsaA0AVa7A==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr3746639pjb.83.1608135919793; 
 Wed, 16 Dec 2020 08:25:19 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id s5sm2549219pju.9.2020.12.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:25:18 -0800 (PST)
Subject: Re: [RFC v2 07/15] target/riscv: rvb: sign-extend instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fbcfe60-6bad-02cc-27dc-a354794aaec7@linaro.org>
Date: Wed, 16 Dec 2020 10:25:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
> +}
> +
> +{

Stray "{".

Presumably a rebase error fixed up in a later patch?
Anyway, with that fixed,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

