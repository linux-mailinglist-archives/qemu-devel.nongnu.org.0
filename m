Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2D6F8449
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvgr-0000cM-Tg; Fri, 05 May 2023 09:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgp-0000bj-7I
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:41:39 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvgn-0007I4-He
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:41:38 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3424289a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=yJPaqQ00/KJmQbXoIb6NFRd2HPNWf6NLeVpuC2MyDevHxgGzpD90pOJACg9MCskezj
 oIKsvLmLZGtHbj5pkwyuL3yIXIseS6K4CqTMrF29DxSI179yCw8wYP5RCYYauBoTgmRl
 YBOyKL0buoJBLAdiU7HtOp5Y2OpHasx79Itu0ZIMwQoAQxxPkqN4KvD+17jVfGMQvRSl
 yI45SNtKAjAGvLIl7e9GkLHNn1RwFe/J+KZhmg+pct9J36N1PPA32FsJc3zFf5jhNhpE
 18+PVyzEv1KuB5MeU1+Xh5jB6RQ2GEYtrpmSQRfsNBwYggbOooX2wXhGjjDxiFH+69hf
 CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683294096; x=1685886096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7f5h1iRZb1+tDkLxOl0fFHf+gL+y5D18jFkKmHbEb/g=;
 b=SgMUL8GVEZo+sidIWcgsOkUzzK/He3uHz2MKzPWBnl9AErCD7SAmDuVEhSJ3A+NeVA
 kaMm94bWs3sY1tvV52LhJibGGz/L6QaLRImniCC46iYTxzduWcULDj2mlPW/1poYkFNQ
 PRDiLgghJPMjQLzekDfmS7v18B5+1D0bBtfa/e7l1w2+f7NInFJMmE0wqSJ07HvOA4gE
 +EzJ2Alqnncj+SfP7vG27vbE55r+yoW/iIRHNhLBaRPJWdlB2Hhi45MBKF/Z+GtuKJAt
 WX7Aef28ZkuReCB4LUEwJPz4KA1YWDBw8M/5uxXTf7nyC1iaJm5/LqiZEcwz2XJaj+E1
 5i3Q==
X-Gm-Message-State: AC+VfDw8gbH/P5Yg4GXYLjUhRkFfJ4n5umQAnbzw3BsXd7NpFCkyHH26
 4nqd9tA2MX0Ki1L8sXKfaUS9zoKTkepwfey5TXIu6g==
X-Google-Smtp-Source: ACHHUZ6KiAdx4Jwp8u5hWKEAnWHG9t82fJpOtt37z7CkjIo5iyyRmoAweNwgCRCZUOYGBgo/0PsjSqovrpTAnBTKLEs=
X-Received: by 2002:aa7:c241:0:b0:509:f31f:b570 with SMTP id
 y1-20020aa7c241000000b00509f31fb570mr1435960edo.23.1683294095764; Fri, 05 May
 2023 06:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-56-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:41:24 +0100
Message-ID: <CAFEAcA9UhVw_x_1WAgNBWB6NNfpLAt=ALXAZ+Thcg+rbNhcGUg@mail.gmail.com>
Subject: Re: [PATCH v4 55/57] tcg/aarch64: Support 128-bit load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use LDXP+STXP when LSE2 is not present and 16-byte atomicity is required,
> and LDP/STP otherwise.  This requires allocating a second general-purpose
> temporary, as Rs cannot overlap Rn in STXP.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-con-set.h |   2 +
>  tcg/aarch64/tcg-target.h         |   2 +-
>  tcg/aarch64/tcg-target.c.inc     | 181 ++++++++++++++++++++++++++++++-
>  3 files changed, 181 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

