Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552596A9FD2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAal-0002Gx-VZ; Fri, 03 Mar 2023 13:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAai-0002Ac-MP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:57:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAaf-0004mT-C4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:57:15 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z2so3689935plf.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=S49icHihSGSwmnjrYViahlrSAljre0y740yYd6UN4zwtdJCdfr9fRHMi9sdtxv2j0a
 ndJj1d+GDGGYljI7nSb5upk1h3lp30bdU9d//E45ildngxUdGOIgYFmXPZsWl7O/DguV
 5aF+AFa7jgO8UkDkXrb0nzdERNY5APzwzutV5WyQUU7oC09ej4T+HQIOyvkkvGBIkn2o
 89BlTUbdZPSTl9Sec+ye1sJDw+x2pqu1FSNtsc829daa4OT+mw4foe4wNniYeQ0c19MZ
 Hui+w4z8pndyKVhu3GA5xUGqzCn76iP73PyvwesiY4Zwdt2hZHKDjNVi8SNODJ7QlL+6
 BV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869832;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oZ76+ljc+vBjoytTnNZoQcgLmS0FLLWld62xw+br3AU=;
 b=M1rGxvH0M2OpPmSreO+piSoOPqYSLb2QQV4civZDbgX1yYbkpfeOIkaY+f2qk3oEIF
 xiTTSYZnOt1sePhjxt+z6JzFUPTvQpqbAuIWumVAcsuKeXQJlWGGUYRtHc8qD+aUPdPF
 QEMwWXaZdPwKZyMBHLICNlxQM9sUL4yqpek1duCn2sdi28VwJorm4XmuFzDzlfXrtYi2
 aztHbVUdc0ZP6Sbm/CGEt1qqCzd2/bt2BXdWUNEONXZ6EiQ+qppWLPD3eMNWma8gvkJg
 xF5UHAaN/6gRn589Hf0jZI/D+wrGBLf1KpugiKzs0HRXqhRokcpxjDhvA5CEl+Pba/of
 tY0g==
X-Gm-Message-State: AO0yUKUUVtfkkZsE4eLHR9T6XJ7vIi3FSlRt11gGmVuJooEK5vhJj2CB
 iFp5a9y5fmkI662OlaycZfkf+hqY+k5ivbc8Xf90QA==
X-Google-Smtp-Source: AK7set/gUOO64mLarW0NX79U8W/4BpGx0M70iPzfL/pfyupYBPWuedeQBZcirPWZ12SyEE9esVe/80ipSpvZBsPkcX0=
X-Received: by 2002:a17:903:428b:b0:198:dd3d:59 with SMTP id
 ju11-20020a170903428b00b00198dd3d0059mr1083486plb.13.1677869832105; Fri, 03
 Mar 2023 10:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-34-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:57:00 +0000
Message-ID: <CAFEAcA-ktFQ9JesbmpTOnPOcuuZQbZyN4R86RTZyJsJnj2nK=A@mail.gmail.com>
Subject: Re: [PATCH v2 33/76] target/m68k: Drop mark_to_release
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 55 ++++++++++-------------------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

