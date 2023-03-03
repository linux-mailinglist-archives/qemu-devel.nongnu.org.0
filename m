Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAFC6A9DB9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9FJ-0001Qb-CU; Fri, 03 Mar 2023 12:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FH-0001Py-Qk
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:31:03 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9FG-0007ic-DO
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:31:03 -0500
Received: by mail-pg1-x535.google.com with SMTP id p6so1975276pga.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=EjgxcE/0dBUUdbaQphTA0Lbw8siPMn7ulYY1y/o4HEz/PKmm6ZZdrZwg8LAPRk1PSS
 tgGJGdXB4Iy94L/E8OgpVZgOYe9WYWXZefbRdaEajHBcASfLcmyCQoxfZHvewgcoYR6n
 xvV5XTX9l8QwxxZtqpqwZ8BTG4uMXc6fJxxrhKQTKSLZt0KCjbpgnuC6CoOhRiDGv91d
 uJvAX31FD9TkrWGKi8lVX/t240OYhFlBOlHmIGnVeh5IGYcGUnRCwtU+EVLQpqkeeoie
 WMU3aBh6En8dOKJQw+NlBkSnf/FAYGSQZSWs20advLcM9eiZBSoHxbhVqW0na5OaxolA
 yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LO3H0xihPu/J7zCAeMi7XJn5vVG/43m/HalvuEQr3o=;
 b=GtuBSz4LLt99x8quu6yrh/WH0mgRPbqPiY7t5GanCEJ1qlvZh3JWanP4r3UP4UvPXE
 4a3AbDGAbp9WiCFrvYpKyjYzV60Ny5KOj41m61AUruGApi870fn+8O98l1KHXc9zf1P6
 Fsze+o9tUAtL4GjproT4uJiUXgH+lvexRNT4HBGwVlgTtNTaPaoqGnCQIPcesJR7yOWQ
 EpqCzESsd6Qd4Q+DRdfPMZyIkjhr9T9nMNeRVpln4hW3drX9W2QkwPuC3r1/noyLT5Dg
 saX3MtvhECFza2zaSUAH27fF9LJDDw2Z6aWGOfAoX1TcSgJ6Kd26VemI+aZQcZP491yT
 oVKw==
X-Gm-Message-State: AO0yUKVHSksFrR8WupoPHXen75j/0Tn6r4ahYHqoJZY1awXf5WVh1zBe
 MmR8bY5Zd173e2/RXVCpPeoXd605qSzj4Hqd7wO2pg==
X-Google-Smtp-Source: AK7set/XDpILp5H8f1RSFrbqRocnWwpF2ExtPn6MF2mttgJYQPYoP6FpW4PFfp0aqNEBi0g4AW7NCNabUmWsnEwUhwE=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr746185pgb.9.1677864661031; Fri, 03 Mar
 2023 09:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-7-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:30:49 +0000
Message-ID: <CAFEAcA8JB219zg9gFkBd_FQN3jm0pto1LJ+eFun1Su1-WYw4ng@mail.gmail.com>
Subject: Re: [PATCH v2 06/76] target/arm: Drop tcg_temp_free from translator.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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

On Mon, 27 Feb 2023 at 05:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

