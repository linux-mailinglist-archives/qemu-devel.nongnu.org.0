Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9894D147F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:14:03 +0100 (CET)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWqw-0005I5-Fg
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:14:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWpw-0003qS-KV
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:13:00 -0500
Received: from [2607:f8b0:4864:20::b32] (port=39491
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWpv-0000N8-6C
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:13:00 -0500
Received: by mail-yb1-xb32.google.com with SMTP id x200so36688164ybe.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jVzQWO6naXDB9Y1lYciTYHtp/ID8m+xF7jrJpL7yTUc=;
 b=PMI1o0xHDJxa9am/MyFwaX1HuQQklJV7VqNueUeC2x7kjk6FqlTOFHs9vSBjrF7cQs
 oxaOZDbNuYKSruRQ1hani77ont6k9jo6C5BZBQl2t/Qz2IpgGGS0v1Qqx2Ykvv/hKFj0
 XK4fa7TFEqcZ9sAx/K24xN2qc1BPiAY1miObB5nTqZLiN4fvibaWnbcw+UyZ226gDVrR
 NYQ/dKaoM5MgleQV2SgvHo8l68UNdy97fBbpbJiYgwdk3vtHDDok45CkulW8jSfjEYHa
 7vHdAW3ZMoAWePCA1aSEJ+HRfhGQQBl+b2kk9KDwaUVYP7TJ03nEgillsKhkenW/3dqe
 h6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVzQWO6naXDB9Y1lYciTYHtp/ID8m+xF7jrJpL7yTUc=;
 b=BKuokcarsUmbLY6N+q+unPVvTSATjebty6Z2p7pN7h9U+u9g2M6o2e42hBJbwzV6RQ
 yWnVIHA+Br/d08sfeZafsDntCmuEr20nhxW6fmDu7No+V6FJkS4pq/4UW1OvPxqsZweA
 ffRXDkaPkA5ulpMvKeaTAW+d7NhDHCSjwA54HRlRvS6jne9x39YBDfJWBSROjr6N9zS2
 ID54BfPp8IivI2GUpSdID8UJp2matSJucQ53vVZpICX+WZwcebEtsCVZJT2VTT46Vbat
 NpJO1dk26W7l2z4E22YI6fd5rahwClbebtVGdnn4AULHvtgwh44FjQ2Gt7WkIOixIUa+
 2HSA==
X-Gm-Message-State: AOAM5332lZ3JHpJrBDXxV9m/P7vF0RByvxP/uNqjENCxlPf/B7ccH6Gz
 bH+VFZBAzVvcqjW7sCEQoE+dlGjoTihuGknYXbpvwJG12hncrw==
X-Google-Smtp-Source: ABdhPJzu8AKu6ePJFVl0ejvchpqPy12xBL/Ee9EX0nYMbAUY9HTDiapsIZt7TX6esNTonrqrvns+ykVufrfiqcKt7EI=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11082832ybp.39.1646734378209; Tue, 08
 Mar 2022 02:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-13-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:12:47 +0000
Message-ID: <CAFEAcA-5dZyXVZu=opxXxE5b-S8B=vOowHpjCeVS7mbJ9jUNQA@mail.gmail.com>
Subject: Re: [PATCH v4 12/33] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Sink the set of env->exception to the end of nios2_cpu_do_interrupt.

This splits the two things the patch is doing between the subject line
and the commit message body; the subject is supposed to be a summary
and the body should be able to stand alone without the subject.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>      }
> +
> +    env->exception = FIELD_DP32(env->exception, CR_EXCEPTION, CAUSE,
> +                                cs->exception_index);
>  }

This is a behaviour change in the semihosting case, which
previously did not change env->exception and now does.
Since that's guest visible I think it's not correct.
You could fix that by making the semihosting handling end
with 'return' rather than 'break'.

thanks
-- PMM

