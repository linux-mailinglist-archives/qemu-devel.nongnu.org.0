Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6236E932
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:54:27 +0200 (CEST)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4JO-00076h-My
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lc4Ib-0006fv-3C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:53:37 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lc4IZ-0000rW-9m
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:53:36 -0400
Received: by mail-yb1-xb36.google.com with SMTP id t94so24685625ybi.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 03:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcmInEdmOUQ+nCyuF9KHN84fzGcm8wXZ+x7Z3foN/bE=;
 b=EO/e+uB4IYMedzR/PDaS9hLjD+LZmtOu+anzgTT/1/Bm+Pz3T/HKMJ/pGvHKtakeaL
 7HjAQqWzLJ/Km3d/oydUBBp4duJ+eWUJb0GYuZE372xp+t7BglACj4wInIhquZwbCv83
 f+A+jp8SOxRGqjHWDWmpRrsLwruyzF1mBaFAs70EmpbzJk4aKrVApqHWJi9gXbwNUNA5
 aoCemXxzFdMmRMwM2DO7yEyB4KajnzatWkc+mOJTXD+taPpWI9hT4OaF0uZ7ohWJ2jSF
 OQe78ZW6N+RaL8pBSA0HBS8TmqMA5KDqVssEhZCK/dS93sxa//45r++xPH8y59E8L1hB
 ESAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcmInEdmOUQ+nCyuF9KHN84fzGcm8wXZ+x7Z3foN/bE=;
 b=Fjtvxt/Qrr4MQDeq/RCvOFb09zZyWmwhJKDrv678NBEgnRs2NcpPNS9tzhonlKJ5c4
 7EkkdYRwyjQu2/dJzuBEqsgHjbW7BEPKCnmqo4M+q3vkiz0faOQoN1jHdQ61Sx/E11j1
 MfkO1wNNpEUyGPqQmg6jaXCYFyAYyot4e9HvJE0mUeOwI4/4qUFlc1ziVbgDsRfQ1i5f
 jwbZEd7ukAtJPNkG1TevsAoKxkqAC9uE/UvjYMPqkVZHA7IfQuYfo+zPjbgtgUgeMvXg
 SihdhPSaaFNDmXlwq8cO+ySwQt88/35ewq5S/JW1PLE/wFxne0BxWwqzAtaG6WiRIGRk
 QzRA==
X-Gm-Message-State: AOAM531B9Wc23v1vZ1TKXiB1oB/iFN9pQogRu4HX59zCg42sCTVRcK+X
 QYs6Vo0Xj3hKISKtgrfSggu7qIOqMymxuwxaB1Y=
X-Google-Smtp-Source: ABdhPJywN7bRw6fuQYPWxsZ9Ltn9ihnw3iFCkSQZdO2cdrdZMfRxr0kwwdcvUoG+lJtgdO3rJgBeL7+1eHUQvKqwmwQ=
X-Received: by 2002:a25:9c41:: with SMTP id x1mr26847985ybo.137.1619693613704; 
 Thu, 29 Apr 2021 03:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-10-ale.qemu@rev.ng>
 <BYAPR02MB488654E65A2BFCEEC3D8AD16DE419@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CANnx7NNMoPxGeP2tda-0yBbvN3Donc+m2cFsr8ZaLg_JnZBQNA@mail.gmail.com>
 <BYAPR02MB4886605BF4386A88B443375EDE409@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4886605BF4386A88B443375EDE409@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Paolo Montesel <paolo.montesel.revng@gmail.com>
Date: Thu, 29 Apr 2021 12:53:22 +0200
Message-ID: <CANnx7NOcYKv5g7w_3+k6v6--dyXZRp9VsPzfKTuKj7gH0j3ydg@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=paolo.montesel.revng@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 5:55 PM Taylor Simpson <tsimpson@quicinc.com> wrote:
>
>
>
> >From: Paolo Montesel <paolo.montesel.revng@gmail.com>
> >Sent: Wednesday, April 28, 2021 5:25 AM
> >To: Taylor Simpson <tsimpson@quicinc.com>
> >Cc: Alessandro Di Federico <ale.qemu@rev.ng>; qemu-devel@nongnu.org; Brian Cain <bcain@quicinc.com>; nizzo@rev.ng; >philmd@redhat.com; richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> >Subject: Re: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser
> >
> >Thanks for spotting this. It's actually a bug in the lexer. The token `{IMM_ID}"iV"` didn't initialize `bit_width`. Now it does. This is the >result:
> >
> >void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)
> >/* fIMMEXT(riV); (riV = riV & ~3); (PC = fREAD_PC()+riV);} */
> >{
> >int64_t qemu_tmp_0 = ~((int64_t)3ULL);
> >int32_t qemu_tmp_1 = riV & qemu_tmp_0;
> >riV = qemu_tmp_1;
> >TCGv_i32 tmp_0 = tcg_temp_local_new_i32();
> >tcg_gen_movi_i32(tmp_0, ctx->base.pc_next);
> >TCGv_i32 tmp_1 = tcg_temp_local_new_i32();
> >tcg_gen_addi_i32(tmp_1, tmp_0, (int64_t)riV);
> >tcg_temp_free_i32(tmp_0);
> >gen_write_new_pc(tmp_1);
> >tcg_temp_free_i32(tmp_1);
> >}
> >
> >The `(int64_t)riV` cast is actually useless so I simply dropped it, thanks for pointing it out.
> >
> >This is all gonna be in the next patchset ofc.
> >
> >~Paolo
>
> This could be further simplified by doing the add in the parser and generating
>     TCGv tmp_1 = tcg_const_tl(ctx->base.pc_next + riV);
> Have you looked at the host code that is generated?  I would expect it to do the constant folding, so the executed code is OK.  However, there's extra time spent building up TCG that could be avoided.

I agree. Since relative jumps happen somewhat often, I went ahead and
added two immediate types (one for the current PC and one for next
PC).
I also noticed that we were using temps for `rvalue_materialize` when,
in fact, we can simply use `tcg_const`.
Overall it should give a nice improvement.

Anyway, this is how the code looks like now:

void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)
/* fIMMEXT(riV); (riV = riV & ~3); (PC = fREAD_PC()+riV);} */
{
int64_t qemu_tmp_0 = ~((int64_t)3ULL);
int32_t qemu_tmp_1 = riV & qemu_tmp_0;
riV = qemu_tmp_1;
int32_t qemu_tmp_2 = ctx->base.pc_next + riV;
TCGv_i32 tmp_0 = tcg_const_i32(qemu_tmp_2);
gen_write_new_pc(tmp_0);
tcg_temp_free_i32(tmp_0);
}

That doesn't look too bad (:

