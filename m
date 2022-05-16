Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD25288BF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:26:45 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqccN-00028v-Rr
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcHj-0008HN-S5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:05:25 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:44449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcHA-0002KN-Gs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:05:17 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2fee010f509so40500777b3.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ejf0z1P2FD0oGopVZyA0J+tEQNb46TwdN7ukfePIF1w=;
 b=NANvTvDdDZ0p1kL76FYV+WXFi7ZOTYuZgSoVLZ1UC4/LpJOg+7CrXx5F0ulJZIdcEt
 K17w44p6qKLm9mCjh7NzjbFE54DUv7tX2Z/5pOtITqdX5qQdTDoKIs7SCSGPIfgy2SQN
 7zYucaky3SYhrQxsnmmHBoJ5wVObeqIFPojdycnRl3TnYWrUNc6T82UpsOQ83FPEVGpI
 uiy2FZ8xIz6tiHThXdqN28pRl0gfbYNNDwtsWNugk3+6fMiF3Pcg/u8GEx8NQzjycX1q
 JzcHtrw58RyNvintr8HRcM84dgqxAuh3OO2i35/ZLFqgN8r2vzz0CCesHKgt8gtBVLvN
 u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ejf0z1P2FD0oGopVZyA0J+tEQNb46TwdN7ukfePIF1w=;
 b=yDuOuq1fUs6lhuPS8lBWpNdZDphBc5lFHlNuggqO7D7XMAku3+dmekna581eMjVzpe
 s9PwRXl6E2UKXjiDQnD9tD2JIuCPIi8yGxxGcMBFMTk3IAKqKqBt7CkWTx8SZJ6x007e
 X4rwUM49A30OVW0YyJRtfx8hmlLFbJDVu/ZNWpZ3yiWSbDea6GL+rJfKHWUNRbqA9f5e
 A8WwhOpTQAhe6K1gz3fzWCMuPpmWrn3EgJCPI9vHUJfwnYa+29kZzWTagNsTiR+Ppx/P
 zAwfztWek6WqT97yrpMf5tGANpClR31SzAsmr44w5xKPxXgHybnjMHDzh1wVQzlK8AW8
 vOkw==
X-Gm-Message-State: AOAM533+lPYbpEvQXgyOimcvYl7JQhx2WCzjnOT2+ulAGMzbfJ3rugum
 D2YyXK0+tCKybJRcgO2VNTFCnCjfJaauBT8EeAb+OQ==
X-Google-Smtp-Source: ABdhPJwZJMD+5AqngcRJ5zlsJpEoo9GpfMKZ606/v96NlAscs9a6qjd/BeRueSuZmbAPkOw4Amo0fkGi/DDezsZkAsI=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr17815082ywd.469.1652713462722; Mon, 16
 May 2022 08:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-5-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:04:11 +0100
Message-ID: <CAFEAcA_1QVvtxVn=oAn+ih7Vb12NQtwFpOwPbM23fzoAetXFqQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/74] semihosting: Move softmmu-uaccess.h functions
 out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, 3 May 2022 at 20:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rather that static (and not even inline) functions within a
> header, move the functions to semihosting/uaccess.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

