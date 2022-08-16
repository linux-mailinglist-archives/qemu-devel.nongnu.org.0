Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78459522E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 07:51:13 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNpTr-0004qc-VR
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 01:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNpKE-0001KO-64
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:41:19 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oNpIf-0004zY-46
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 01:41:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id h28so8446127pfq.11
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 22:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oPI32NRdEuu65J89pNAl9YxqkxREdXP271MOrnzfAC8=;
 b=AbcZzQsaVJ/o9mpLLvHgrYLRZp23uCwhGr7N78OvCO+DTfvlWlMPXa6wQZ10zJADKN
 zVjajT/K7TBqIzrR84NqcAf+Q/7u9QTLuzoNv+U3K2QQGqwnWt7PjXt5yy8+DZVKxAf1
 eIWms7QZ56KluxvemzTscvsh8IObjLdO0B+/R0+44SXCKXG4BKh+wyKUivG9v1t6dtAu
 MRIBWZSGZB+MjGttl5gz/93J3VoORit73I9tVeqhUJquHCUNsWaisLNjSx+/kjezxyS7
 gpuLadugcLv1+gteGbA0EiComt5HrXlMA1ijDVXqeG6191XSPZmAXSykTvso9POSS7jG
 oiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oPI32NRdEuu65J89pNAl9YxqkxREdXP271MOrnzfAC8=;
 b=x3484V0AE/opoR8Od5UpLzEDfQOPA9jw/oejDd0Cv7xzXUP9FzTJWhGQn0JOAJiY8E
 U9/safAjib85+kfu+MORC+GMi1kgd3nTDRdkQ8YVoT51GKmlRW01qlsf0lBDz2McuHNY
 BMZcfVfePcB2ofKYo/TpnJLaX4RgLOoSOqsNDmbp2/LeM8Zq7EKlTEz+OxlnCaB3kMZa
 IF6fJR+lymN0+hlEvk+k5XsKl1z7GmLq0F4+UhUbNkJs+l8ZOVQJ1VGKHUHnG+W/mHZa
 4mitY0QViepAe2G6tbwhittKZaRmlyQdU0m/vfQZJBddU4h/crUiOIOSpwOCjyJ8Kyu6
 Farg==
X-Gm-Message-State: ACgBeo0Tz95G3hZ3GE25lD+jiTRslJB1v8Jmv2U4C80z3gjX/U8O0pJh
 2k4EchnZuaTFUr5rQOGyso3ScXdJxVjk4uic0O2h9A==
X-Google-Smtp-Source: AA6agR7VKuuXf2bVs+ahRggr80t5ngK204T/A5ROc5pjXf98Vz2YFwrE+7WPlMvcypFd8oeZBf9ZcqV5FNViMTn7/yc=
X-Received: by 2002:a62:79c4:0:b0:52d:cd3d:2027 with SMTP id
 u187-20020a6279c4000000b0052dcd3d2027mr20054985pfc.71.1660628358460; Mon, 15
 Aug 2022 22:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
 <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
In-Reply-To: <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Mon, 15 Aug 2022 22:39:07 -0700
Message-ID: <CA+tJHD6pdQXBdeF_t_qmqhkae9sJdRUustAsKqeiWmu5WuCb2w@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=furquan@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Mon, Aug 15, 2022 at 1:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/15/22 14:03, Peter Maydell wrote:
> > The riscv target incorrectly enabled semihosting always, whether the
> > user asked for it or not.  Call semihosting_enabled() passing the
> > correct value to the is_userspace argument, which fixes this and also
> > handles the userspace=on argument.
> >
> > Note that this is a behaviour change: we used to default to
> > semihosting being enabled, and now the user must pass
> > "-semihosting-config enable=on" if they want it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/riscv/cpu_helper.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 59b3680b1b2..49c4ea98ac9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -24,6 +24,7 @@
> >   #include "exec/exec-all.h"
> >   #include "tcg/tcg-op.h"
> >   #include "trace.h"
> > +#include "semihosting/semihost.h"
> >   #include "semihosting/common-semi.h"
> >
> >   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> > @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       target_ulong mtval2 = 0;
> >
> >       if  (cause == RISCV_EXCP_SEMIHOST) {
> > -        if (env->priv >= PRV_S) {
> > +        if (semihosting_enabled(env->priv < PRV_S)) {
> >               do_common_semihosting(cs);
> >               env->pc += 4;
> >               return;
>
> I think this should be done in translate.  We should not have the overhead of checking the
> three insn sequence around ebreak unless semihosting is enabled.  Note that ctx->mem_idx
> == env->priv, per cpu_mem_index().

FWIW, the current series worked fine for my risc-v use case. Thanks, Peter!

>
>
> r~
>

