Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35867538D86
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:13:27 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxwM-0000tP-0x
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxnG-0003fB-4f
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:04:02 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxnB-0003yA-Hg
 for qemu-devel@nongnu.org; Tue, 31 May 2022 05:04:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 137so12249703pgb.5
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kyHbNw16mpobWVIWmU63uZ9+5Y5Hg/uoCzNWpWRY7zA=;
 b=YO6VyWgcffkhLKPqOaKBNvNaqKoUweY8svtMzBsjKECVC187IfE5GMwsmMe+E0bo6M
 ItUrCAabCr+sEVr+FTgwh7yn5Fhoxk8sJs4EMFO8lGlZPLXJTcz5goIJyZQWNIcbrzEu
 +msJro/gpmPrLC9Vze20yEFWmYO+0UjXp3B4+4h2zKMO9T+FEsKHw/TIlKAg9x6syeAH
 eb1kIQe8HwOceZE51NdynwG4+nRuuHkx+8Gnju93ZaZ6Sypt255S/suvkvBJqGI7NDl/
 V+tBr9O4xuy21NmtdOIrY1vP4Pqg/QiRT0+mTYXlNPZqGDKegTpCW5Fts3mFyyFtd1+U
 ux1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kyHbNw16mpobWVIWmU63uZ9+5Y5Hg/uoCzNWpWRY7zA=;
 b=Q4a1OloTYOqf8V7zAzD/SO1QcRoc64nEsl9j7Ny/Pt5opjNXks1dnSnME7D4uK7Jes
 BklvAjZZcewPpSfWFlVOGgwkuo3p1eWj9ZHUhyIkIXno/Z9z8Zlnvp4QuYsptRGZoZlN
 Z6Q6nZaf5Ok7kcyVafm183PD1MvM1YP4zomY+WEgslb6LSsEGiuEqcxSr3eCmSaFpOrF
 MydyR6YRsB96Gs92QOddd5dZ/FTySkqLM44DqCLAtK6fhkeWnvuk6CJer28ii+hoG8wD
 Vox30aiMjI+zPCqvTYwz9N5627PXA9oGQ9Jn1SvEaTGP2URfC8DCInLqrenYIaqCrYCP
 P8SQ==
X-Gm-Message-State: AOAM531FWTA8yna0+CEwfDd3G/eGKqjKe4OrmfD1Y3Oth36J4NSAlGAz
 pIapg+7ggDk1nC/o3xI1fBRpSMGXka0=
X-Google-Smtp-Source: ABdhPJzYYkIxkcUOT86Mp4GINptb5Bk8JxbTCkNLThoOoD2UqiIjfhYK1vi9dphrZKc30oeQ5aTgNA==
X-Received: by 2002:a63:5143:0:b0:3fa:218d:db2 with SMTP id
 r3-20020a635143000000b003fa218d0db2mr38857977pgl.354.1653987835766; 
 Tue, 31 May 2022 02:03:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7954d000000b0051b9c02e4a3sm515132pfq.178.2022.05.31.02.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 02:03:55 -0700 (PDT)
Message-ID: <2175b413-7dfe-22ba-6ea3-c8ec67f1fe49@amsat.org>
Date: Tue, 31 May 2022 11:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] target/mips: Fix WatchHi.M handling
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Marcin Nowakowski
 <marcin.nowakowski@fungible.com>, David Daney <david.daney@fungible.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>
References: <20220511212953.74738-1-philmd@fungible.com>
In-Reply-To: <20220511212953.74738-1-philmd@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/5/22 23:29, Philippe Mathieu-Daudé wrote:
> From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> 
> bit 31 (M) of WatchHiN register is a read-only register indicating
> whether the next WatchHi register is present. It must not be reset
> during user writes to the register.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> Reviewed-by: David Daney <david.daney@fungible.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@fungible.com>
> ---
>   target/mips/cpu.c                   | 2 +-
>   target/mips/cpu.h                   | 1 +
>   target/mips/tcg/sysemu/cp0_helper.c | 3 ++-
>   3 files changed, 4 insertions(+), 2 deletions(-)

Queued to mips-next, thanks.

