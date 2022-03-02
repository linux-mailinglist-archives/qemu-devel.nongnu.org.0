Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99E4C9EC3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 08:57:21 +0100 (CET)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPJrM-0003SY-Q2
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 02:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPJoI-0002SD-3m
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:54:11 -0500
Received: from [2607:f8b0:4864:20::12c] (port=39832
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPJoF-0008QV-TB
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:54:09 -0500
Received: by mail-il1-x12c.google.com with SMTP id i1so775188ilu.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fyzsTTW1kgWlQ9QqD/sqdVNyyAxaP8R3I2ZSPecllY=;
 b=OVTDVcjww+GRYo/KiopKxjduDkVoTVHMSOStt1HLYOvTDRFYCEzI0kduD3C6cWAqtR
 TI5ZxFvcMqur2sECw8YHUOSFY8CBqUNUJPPn05ztrL5hRP5pwVFIu/C56jFv45L01qCA
 DOguNbv2XxTJId1bLUEtr3wDMXHth4r339lWVLzZ2Q1v1xTp4CYfg/kt622DRI4T+v7x
 oQTcI03rI7K/8vuS6hS8fvplducYs+E2MC4uLW7o7MZT8K3OhgP2TEWiq+w7HH7m7T1v
 eSk886r1DiPNvWYOLXseEO5QzD3ncDIvPllpU99raVKoElJaYDHYS+ENK1Y/oj1Y6l9n
 Zmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fyzsTTW1kgWlQ9QqD/sqdVNyyAxaP8R3I2ZSPecllY=;
 b=7ZWJvPtj1YWMdtPoJG8AMAjQBnJKnB1WTRU0unPqal0xymvKjjVxCMZoySL8mi5Z4u
 HMqnX8NSaSS3+Zl35wD+jfSQj8pftRbPcPNBqOwEDAv+l+G2/14nf/oi/Jz0afGVQ1rC
 bDJiifhmxkBsk3P8rfD7WdRmtlX3yAgK9rqKoMI6cVg7UDA7Zi/IPi2Yp2XnR55QccLd
 xcVZdlgoDqIErGfYQCcpw9/3rE3deuLoaRUCuzpw9i/98b+Nsq3wfjUZOp7QRmwl7C5v
 QKngABrAX2Nferd+IPMN5rYMTVOGClIKsfgl1zpP/Fb/5SKx3XW8NHOJCjSxTKwST8bQ
 Zu6w==
X-Gm-Message-State: AOAM5329l6sAdRenEQRDUno+/uPVPJp8yCQCSfajajRWumk4iPdMnAym
 AOqDkzm7ZvfO0dckdCddk++0K4395FyWaEwvSMo=
X-Google-Smtp-Source: ABdhPJyAmMz5xqMVA4Ykryq+njVGhr1AaSbVe5CIIF937BoTuafzLW4Q9Cy1MyaYdHm57Ff31l/go6yff0qALHsCMVs=
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id
 y12-20020a92d80c000000b002c2c40c7bd4mr18017698ilm.310.1646207645294; Tue, 01
 Mar 2022 23:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
 <CAKmqyKOLO7VdSPsXmeqQN-z3a2bKZQ3yeQqCmjt-SBpT9MfcgA@mail.gmail.com>
 <b7676252-781d-a7c6-6172-09dd319ef744@linux.dev>
In-Reply-To: <b7676252-781d-a7c6-6172-09dd319ef744@linux.dev>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Mar 2022 17:53:39 +1000
Message-ID: <CAKmqyKOwM8ai7JE3i4_bm2rgsG4AP9MxMKAJse-dkgJ3s+71Kw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix inverted checks for ext_zb[abcs]
To: Vineet Gupta <vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 gnu-toolchain <gnu-toolchain@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 1, 2022 at 11:28 AM Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
> Hi Alistair,
>
> On 2/3/22 16:59, Alistair Francis wrote:
> > On Fri, Feb 4, 2022 at 1:42 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
> >>
> >> While changing to the use of cfg_ptr, the conditions for REQUIRE_ZB[ABCS]
> >> inadvertently became inverted and slipped through the initial testing (which
> >> used RV64GC_XVentanaCondOps as a target).
> >> This fixes the regression.
> >>
> >> Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_zbc_zbs.
> >>
> >> Fixes: 718143c126 ("target/riscv: add a MAINTAINERS entry for XVentanaCondOps")
> >>
> >> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> >>
> >> ---
> >> We may want to squash this onto the affected commit, if it hasn't made
> >> it beyond the next-tree, yet.
> >
> > Yeah, agreed. I'll squash it in
> >
> > Alistair
>
> Has this already been committed upstream. I was running into weird issue
> related to bitmanip and seems this was missing in my local tree.
>
> Also the "Fixes: " entry in changelog doesn't seem OK; the issue seems
> to have been introduced in f2a32bec8f0da99 ("target/riscv: access cfg
> structure through DisasContext")

Thanks, I have fixed the fixes tag and the indentation, I'll try and
send a PR this week or early next week.

Alistair

>
> Thx,
> -Vineet
>
> >
> >>
> >>   target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> >> index f9bd3b7ec4..e3c6b459d6 100644
> >> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> >> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> >> @@ -19,25 +19,25 @@
> >>    */
> >>
> >>   #define REQUIRE_ZBA(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zba) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zba) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBB(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbb) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbb) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBC(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbc) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbc) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >>
> >>   #define REQUIRE_ZBS(ctx) do {                    \
> >> -    if (ctx->cfg_ptr->ext_zbs) {                 \
> >> +    if (!ctx->cfg_ptr->ext_zbs) {                 \
> >>           return false;                            \
> >>       }                                            \
> >>   } while (0)
> >> --
> >> 2.34.1
> >>
> >>
> >
> >
>

