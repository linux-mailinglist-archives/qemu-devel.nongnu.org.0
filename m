Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95918546BA9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 19:30:07 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nziSU-0004SV-64
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 13:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nziQe-0003d8-L0
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 13:28:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nziQa-0002Hr-30
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 13:28:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h5so37452494wrb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLFYo+xTMbEr3j+Z6mFEOzuhLPJVbsNAE+aOQpP1BNM=;
 b=EiSutmWWEeIfczsVdYNkVE5aXkOrqahSJB42Ukc/9avgzAdYtoR7mHsbsBGoJOkNe2
 YGUfKeQO8oufFNQMu56Pr8bwqmPBnJzCGj4qLLct930FZtqasO7nedQ2RoJ+08/ZOvy6
 CMeEEswk6NxDJS9g1ny5FD+ksE+pa+g+aN+11Y8Me66ysGC/3FTMsPJy/nuwXDQJlfbD
 ZDOxO3ECsg8w+pfNqjfBiohxc44TIrIuhCDhk+lpN5+fGoLBywokyaducZm9Ynjyo4z5
 /u+t0w77gK8f9019OwoMhwkEI4lnjC39i9wkgP5D7PT320BDOXULp3PdeVVpyOj/5JXH
 qTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLFYo+xTMbEr3j+Z6mFEOzuhLPJVbsNAE+aOQpP1BNM=;
 b=FL8GoBwQgWQDfjk/WLISzpEy77KW9IWnW+psa9Gg5OewqDydLI2wbn7W0j3mgJ8Seo
 s0CPPslzCSYVnuJ5Ghp9W6U1XZ6rH/KNJZa+CxBm2anXScSM+YO5C5dRu02So1qwgQ5/
 w5hAoLshLdJOuhlUskmR2VzjfjBEHj9S0Z5NxXpZW4b5IUrDMPHNDf9Sxo3eMigac53i
 j+smboi+Uob8BGgWZwjHKluj5wgP7YTCOi3fkfKxVyk//I83yguOzb/32NLdKxJjOZeY
 aQZddp9KJy0wBVs5UGFyBbxpGChRpGb/MWuNZy/evc+GMfDLpjAon5dg9J4NB+VdDJ5r
 vs7A==
X-Gm-Message-State: AOAM533MZNAnEc8mFP42+RKD+DUBu/p1tTw5r312Wyaq/y9LSn5bjkFD
 UrXiHt+k4DCTgvLyvSYVZ02AtgegPp4movCbUcztvg==
X-Google-Smtp-Source: ABdhPJzzFKdWxxakEc/JB62QCmW3tGzHXMgw1rD74QZLNCEOHptdpJR5FBgR/K5aYF5nPjGOhTjN8DhKW1ISbKQaaVs=
X-Received: by 2002:a5d:6384:0:b0:210:5f39:53af with SMTP id
 p4-20020a5d6384000000b002105f3953afmr43343910wru.346.1654882086248; Fri, 10
 Jun 2022 10:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220609033011.752714-4-apatel@ventanamicro.com>
 <OSZP286MB1435EBB271F8E9EEF5E2EF95C6A69@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <CAAhSdy1zyiV9PgDCY+4ijrzfeAdJ44wfT0b5dY+NqXzieZo_KQ@mail.gmail.com>
 <TYYP286MB1439D28F79FE7CE82885DB9DC6A69@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYYP286MB1439D28F79FE7CE82885DB9DC6A69@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Jun 2022 22:57:53 +0530
Message-ID: <CAAhSdy1-0aU2dMPe0WW=re_QXionheQzpfC-kcfOjOPZNn5EoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: dramforever <dramforever@live.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
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

On Fri, Jun 10, 2022 at 5:20 PM dramforever <dramforever@live.com> wrote:
>
> >
> >> In addition, the various V-extension vector load/store instructions do not have
> >> defined transformations, so they should show up in [m|h]tinst as all zeros.
> > Okay, I will update.
> Just a clarification/suggestion: It might be easier to only write non-zero for
> instructions with currently defined transformation. Writing zero is always
> legal, but writing an undefined transformed instruction is not.
> >>> @@ -1355,18 +1558,31 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >>>      if (!async) {
> >>>          /* set tval to badaddr for traps with address information */
> >>>          switch (cause) {
> >>> -        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >>>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
> >>>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
> >>> -        case RISCV_EXCP_INST_ADDR_MIS:
> >>> -        case RISCV_EXCP_INST_ACCESS_FAULT:
> >>>          case RISCV_EXCP_LOAD_ADDR_MIS:
> >>>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
> >>>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
> >>>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
> >>> -        case RISCV_EXCP_INST_PAGE_FAULT:
> >>>          case RISCV_EXCP_LOAD_PAGE_FAULT:
> >>>          case RISCV_EXCP_STORE_PAGE_FAULT:
> >>> +            write_gva = env->two_stage_lookup;
> >>> +            tval = env->badaddr;
> >>> +            if (env->two_stage_indirect_lookup) {
> >>> +                /*
> >>> +                 * special pseudoinstruction for G-stage fault taken while
> >>> +                 * doing VS-stage page table walk.
> >>> +                 */
> >>> +                tinst = (riscv_cpu_xlen(env) == 32) ? 0x00002000 : 0x00003000;
> >>> +            } else {
> >>> +                /* transformed instruction for all other load/store faults */
> >>> +                tinst = riscv_transformed_insn(env, env->bins);
> >>> +            }
> >>> +            break;
> >>> +        case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
> >>> +        case RISCV_EXCP_INST_ADDR_MIS:
> >>> +        case RISCV_EXCP_INST_ACCESS_FAULT:
> >>> +        case RISCV_EXCP_INST_PAGE_FAULT:
> >>>              write_gva = env->two_stage_lookup;
> >>>              tval = env->badaddr;
> >>>              break;
> >> Instruction guest-page faults should set [m|h]tinst to one of the
> >> pseudoinstructions if env->two_stage_lookup is true. Otherwise it should set
> >> [m|h]tinst to zero.
> >>
> >> In any case, as this seems to be one of the first implementations of
> >> [m|h]tinst, it might be worthwhile to confirm with the spec authors and clarify
> >> any unclear bits before this gets released.
> > This is already handled because tinst is initialized to zero.
>
> If an instruction guest-page fault occurs due to a G-stage fault while doing
> VS-stage page table walk, i.e. env->two_stage_indirect_lookup is true (I had
> mistakenly wrote env->two_stage_lookup earlier), and the faulting guest
> physical address (env->guest_phys_fault_addr) is written to mtval2/htval,
> [m|h]tinst must be a pseudoinstruction and not zero. This case is not handled
> in the v5 patch.

The v5 patch is writing pseudoinstruction in [m|h]tinst when
env->two_stage_indirect_lookup is true.

Regards,
Anup

