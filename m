Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C855E50B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:42:43 +0200 (CEST)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BUI-0003Rn-39
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6BSK-0001IN-9K
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:40:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6BSI-0005l5-Qy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:40:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s206so3244657pgs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eg7g0PuzDCGzu5uW7wshh4aaKanx5Sryl6gN5WfPrNQ=;
 b=ITvdTCAFmOZGxbTiDqw8xcOyO4LrSb0w+qRwXpsmZbdlO/WCyQkNWVYHQXbcmmFl0b
 drvNevyexSKqUxw5ZBSfxs22M3S6uV4RqM/8QtyE15L49KI1qmy0qQ51xsP9UWZHUv3C
 6m4YvLI67eQWpeeKTIn+DCY4/FktdThsvrr3jRIuL4ecP1fZpDq3lMi/U/xRc8RrxKw0
 5aSh1uvvGwB8Dbq90B4VqpzdXAtB96ET01ALdvV6vb2j6SwhUkmJRgYc0f2Pb701U+pv
 856i8wuGqXdBsWtxrbwybC2GqfIdpDR6G4wCLRC2H8RheciCr85+ACjl9DxnRCBbEzOa
 HXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eg7g0PuzDCGzu5uW7wshh4aaKanx5Sryl6gN5WfPrNQ=;
 b=VGSbMbZx+fwsDMEbviF6eheQ9d0Ml2ZEjUFadjvFn6zQMlTclLCTQG3O33T1s546Av
 5haw+lyTtI6TWwoT6Amg0v+hIUmOJ1J6kRLUAKYJMoD6anjA9BxlIpOZ06umtq2chGUg
 dXKvpp675JRZcZzwgSel7qV9/GQ59lsd4/gUVFnLIGEfrY+l3FfGxLWOoF+xIFfANqZx
 eROUf6G7FCVbms+OLUuzqkPAPGfWetquRpvBwueEiNm2xveMR8tzM9I79TXdsnYkTQLf
 Gm07Zq3LjAkfEAHPQqAiZQY2C71mvac0+8qAkDUjKKx1puV0p5ZaFRF0d7wKKsMS5J28
 MxJw==
X-Gm-Message-State: AJIora8fivKDaWwdUe6rlajNXqCS3tpKBG2TgWWPtKdJbIU+d+26UXN9
 +fKjRc3/jrCzdnL1DgeM8G8gL009BA9vv++zEO8=
X-Google-Smtp-Source: AGRyM1vDP32/Io1ww7DLnV94aP86Ick7467xQNBmYNTKP/RZRk5SEvlOg4BNpQVbDckbreAlOboI7xSL0vqJl1Qio1A=
X-Received: by 2002:a05:6a00:1c94:b0:527:c49a:3249 with SMTP id
 y20-20020a056a001c9400b00527c49a3249mr4471267pfw.18.1656423637194; Tue, 28
 Jun 2022 06:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220628114307.697943-1-richard.henderson@linaro.org>
In-Reply-To: <20220628114307.697943-1-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Jun 2022 06:40:32 -0700
Message-ID: <CAMo8BfJaCDbC7gdSZbYRaDZ9fvPX_6QFREe6g6D-0w9U-7GM9g@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] target/xtensa: semihosting cleanup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
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

On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Rebase on master.
>
> r~
>
>
> Richard Henderson (2):
>   target/xtensa: Use an exception for semihosting
>   target/xtensa: Use semihosting/syscalls.h
>
>  target/xtensa/cpu.h         |   3 +-
>  target/xtensa/helper.h      |   3 -
>  hw/xtensa/sim.c             |   3 -
>  target/xtensa/exc_helper.c  |   4 +
>  target/xtensa/translate.c   |   3 +-
>  target/xtensa/xtensa-semi.c | 229 ++++++++----------------------------
>  6 files changed, 59 insertions(+), 186 deletions(-)

Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

