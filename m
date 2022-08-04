Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1967658A03F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:08:52 +0200 (CEST)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfH9-0000c7-63
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfEn-0006EY-M1
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:06:25 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfEm-0007wL-6B
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:06:25 -0400
Received: by mail-yb1-xb32.google.com with SMTP id z5so330953yba.3
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=hEMlz9jsNyrU3mkcaruWS8Bo1j0uxSmaIFWlFsfVXiQ=;
 b=R5T91Rc8ckQOlB14vk3Y1eMy/C6p1sTfHsYOU0nB4R2l6WsuJtBVr2/UigAHb0bGQU
 5RUuzTtPCnZj4lWJBo9Frf3BCVhYmmiU7zLval3HCV82oU60sfLPcIbrOSjaiZgcoBbF
 AqrKiNtlX6bhNNI2BGI1/Scv0zG/iQYmpJMy3idQlosLyH+nK1q0sQTudTh5hYk1ad5c
 sPvV921VGAAt/NFGiAc7ckRxFGq21Qavh4QPyWFmO2nHUKknRoApf9GHHUU6YKWbiqZt
 Ip5Pf4OjVWyXjWM2i0sifYCesM7xUJHW/qMVm1YJz9wh+Hazhvd0e1bxb/gpXrL/6OGa
 Ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hEMlz9jsNyrU3mkcaruWS8Bo1j0uxSmaIFWlFsfVXiQ=;
 b=OZ4RUctgYzTf9ame7EA70aE5eHVs8ficmQ320Ima9+d7ANAEwBRc0PXJeHRWMOCHK2
 rG+ah+wov7CJyI0PBOV4WmcNBIdxnGgXROaArYne1iFsnGsc5odUE8tQOeDeWkY0DKeN
 Uufwuzapu2tIoOoKib8GWdmcOUEOo5npp+QGvKQ7RThbiz7vNRGDzQ3JfRQKfk9lIfHf
 Aq1S538bFFIYFcWDp/qewVuFLWiYBbFlCAvTBHaYqw2TTZJ7hYiCOcucyuH+2SJYZ0a3
 3gNSHC1FlDr9CGO1Nto8EUtGeFXE0T2OE6ymO2C1df2mRNXmpvf5KpQuJXeQmL2HFbue
 t5mg==
X-Gm-Message-State: ACgBeo3ugAa9s8X8c5Qb983AywLYgN0wVtyjCuhCo9R1G3bX8qoNJVbD
 C7P9g0ruuLsb0PAvGx8WaY1MRdPsaeBwsaqsZWnjBg==
X-Google-Smtp-Source: AA6agR7tuxu4ktpw5/mWQUTiXJvzOV5ATHebBMnMrnMs4G0t0oenrGRcE+TSjSOqQc0YhcUy1YRx3OVOFLH+cALfQGM=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr2323309ybq.140.1659636380944; Thu, 04
 Aug 2022 11:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220725202122.1810709-1-danielhb413@gmail.com>
 <20220725202122.1810709-2-danielhb413@gmail.com>
In-Reply-To: <20220725202122.1810709-2-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 19:05:40 +0100
Message-ID: <CAFEAcA8Pk47gdvbPqqyx6QGVNrqUCYiKSr-KAz+oV_Z6dP7G_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/ppc: fix unreachable code in do_ldst_quad()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jul 2022 at 21:24, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
> check privilege level") turned the following code unreachable:
>
> if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
>     /* lq and stq were privileged prior to V. 2.07 */
>     REQUIRE_SV(ctx);
>
> >>>     CID 1490757:  Control flow issues  (UNREACHABLE)
> >>>     This code cannot be reached: "if (ctx->le_mode) {
>     if (ctx->le_mode) {
>         gen_align_no_le(ctx);
>         return true;
>     }
> }
>
> This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
> always result in a 'return true' statement. In fact, all REQUIRE_*
> macros for target/ppc/translate.c behave the same way: if a condition
> isn't met, an exception is generated and a 'return' statement is issued.
>
> The difference is that all other callers are using it in insns that are
> not implemented in user mode. do_ldst_quad(), on the other hand, is user
> mode compatible.

This is a Coverity false positive, and I'd already marked it that way
in the Coverity UI back on the 20th. Coverity gets confused sometimes
by ifdeffery.

So you don't need this patch, unless you think the code is genuinely
better (more readable to humans, etc) this way.

thanks
-- PMM

