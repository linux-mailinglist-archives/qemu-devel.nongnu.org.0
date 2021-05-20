Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB1C38B98B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:40:20 +0200 (CEST)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrL1-00072e-0F
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljrK1-0005yL-8X
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:39:18 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljrJy-00037o-Qi
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:39:17 -0400
Received: by mail-io1-xd2a.google.com with SMTP id r4so17524372iol.6
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7sL8H539peXFHcryqbIxEKFfvniYTC+qvVI0/RO2BN0=;
 b=jX7YU3CFfT3Jtwv5uIRsnz0NYGXMkyzn3hrjE8YPBPadOWOSdHBgXPkhtyZkT4Y2K4
 9scumoguqL7df6RLQOhV2ZwDZdAqFb9+Db3SfaVdUbxWvDP/JNaTzQKqgOQYqME10FG5
 SfS38lpqt3NVz+Rf27fWulrrfhlKYX9BHjEZWfuCmAmuPcmhKrwe+MQOkjB9onR3Dhw1
 qnwPwkm6Aje34Tk4uslS0FxBcR5BQ7KD7lriJbl2Rcj2Xx8DvuKcurTVOTxVCGa31EUF
 NGpqHBNaWBOVFgkyniDMtw0U2qU5vqGoyZA+WgACdi8fNNQrA42VnSxu1alZTWIu7w1Z
 QxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sL8H539peXFHcryqbIxEKFfvniYTC+qvVI0/RO2BN0=;
 b=lRm6JxsV7qoxTynQ8+YgIWEAv7nHKUBkliWwo3nOvSXhOqzrNERb42OxoqafFaczcc
 ASr9NQQL3ZRPXIVaKSN5qhdglrwTiEGsnVAgi/QOohqMf61l5FB8Ulya9OrVOW0Xdi8c
 WwMZNMLZKRxLnOJUdka3weUiU9KkhBDwCbBzXBv2JhJ4pcptPn/9rAKX8N2VFBmk3p3J
 a17q5DDdKFLCwQrjQ2hVol4ZU1FMoCjWGUGTbiz5++/+k+/CpeDxA1OY0AIU9poj342l
 nOJbOIOs9p/oAkPIoveAeK/D7mNi2Oh9K7ToalSGgr89414PaFw/4Omz/vZ1HRDByU/k
 uLow==
X-Gm-Message-State: AOAM532UHVn7owsPI24CHQ9byUWY7f6al7MX24I5WOh8IpO3FKCyVJ5t
 g0zzXyugj2woX/X4sTfU7oYr0QGyCG7baoJ7rjQ=
X-Google-Smtp-Source: ABdhPJxFL2oqZRS0EDeYBmsUOcU6wFshx7Xw07g4IWTTG2qiLyPE7wb/Fa0ycdlqtgm9GbJFaxKZ9fT9X04d5rlrP30=
X-Received: by 2002:a05:6638:37a6:: with SMTP id
 w38mr8926701jal.106.1621550353688; 
 Thu, 20 May 2021 15:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-25-alistair.francis@wdc.com>
 <CAFEAcA_J739jGEGLTAo+JEqRDyWcuCMZicT1tpxPQY26N5h2SA@mail.gmail.com>
In-Reply-To: <CAFEAcA_J739jGEGLTAo+JEqRDyWcuCMZicT1tpxPQY26N5h2SA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 May 2021 08:38:47 +1000
Message-ID: <CAKmqyKO7OMFA_pnie8NfbP3hb=Tp-70P-kOFJyefaJgxyzOYvw@mail.gmail.com>
Subject: Re: [PULL v3 24/42] target/riscv: Implementation of enhanced PMP
 (ePMP)
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 11:51 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 May 2021 at 11:21, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > From: Hou Weiying <weiying_hou@outlook.com>
> >
> > This commit adds support for ePMP v0.9.1.
> >
> > The ePMP spec can be found in:
> > https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
> >
> > Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> > Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> > Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Message-id: fef23b885f9649a4d54e7c98b168bdec5d297bb1.1618812899.git.alistair.francis@wdc.com
> > [ Changes by AF:
> >  - Rebase on master
> >  - Update to latest spec
> >  - Use a switch case to handle ePMP MML permissions
> >  - Fix a few bugs
> > ]
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Hi; this code confuses Coverity into thinking that the pmp_hart_has_privs()
> function might read the value pointed to by 'allowed_privs' when
> it is uninitialized (CID 1453108):
>
>
> > @@ -294,13 +351,94 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> >              pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
> >
> >          /*
> > -         * If the PMP entry is not off and the address is in range, do the priv
> > -         * check
> > +         * Convert the PMP permissions to match the truth table in the
> > +         * ePMP spec.
> >           */
> > +        const uint8_t epmp_operation =
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> > +            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> > +            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
>
> Here we construct a value which can only be in the range [0,15],
> but we do it in a way that Coverity isn't clever enough to figure out...
>
> > +
> >          if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
> > -            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > -            if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> > -                *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> > +            /*
> > +             * If the PMP entry is not off and the address is in range,
> > +             * do the priv check
> > +             */
> > +            if (!MSECCFG_MML_ISSET(env)) {
> > +                /*
> > +                 * If mseccfg.MML Bit is not set, do pmp priv check
> > +                 * This will always apply to regular PMP.
> > +                 */
> > +                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > +                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> > +                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> > +                }
> > +            } else {
> > +                /*
> > +                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> > +                 */
> > +                if (mode == PRV_M) {
> > +                    switch (epmp_operation) {
> > +                    case 0:
> > +                    case 1:
> > +                    case 4:
> > +                    case 5:
> > +                    case 6:
> > +                    case 7:
> > +                    case 8:
> > +                        *allowed_privs = 0;
> > +                        break;
> > +                    case 2:
> > +                    case 3:
> > +                    case 14:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE;
> > +                        break;
> > +                    case 9:
> > +                    case 10:
> > +                        *allowed_privs = PMP_EXEC;
> > +                        break;
> > +                    case 11:
> > +                    case 13:
> > +                        *allowed_privs = PMP_READ | PMP_EXEC;
> > +                        break;
> > +                    case 12:
> > +                    case 15:
> > +                        *allowed_privs = PMP_READ;
> > +                        break;
>
> ...so coverity thinks that "via the 'default' case" is a valid flow
> of control in these switch() statements...
>
> > +                    }
> > +                } else {
> > +                    switch (epmp_operation) {
> > +                    case 0:
> > +                    case 8:
> > +                    case 9:
> > +                    case 12:
> > +                    case 13:
> > +                    case 14:
> > +                        *allowed_privs = 0;
> > +                        break;
> > +                    case 1:
> > +                    case 10:
> > +                    case 11:
> > +                        *allowed_privs = PMP_EXEC;
> > +                        break;
> > +                    case 2:
> > +                    case 4:
> > +                    case 15:
> > +                        *allowed_privs = PMP_READ;
> > +                        break;
> > +                    case 3:
> > +                    case 6:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE;
> > +                        break;
> > +                    case 5:
> > +                        *allowed_privs = PMP_READ | PMP_EXEC;
> > +                        break;
> > +                    case 7:
> > +                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> > +                        break;
> > +                    }
> > +                }
> >              }
> >
> >              ret = ((privs & *allowed_privs) == privs);
>
> ...and that we can get to here without having ever set *allowed_privs.
>
>
> Adding
>    default:
>        g_assert_not_reached();
>
> to both switches should clarify to both Coverity and human readers that
> the cases in the switch are a complete enumeration of the possibilities.

Thanks Peter, I'll send a fix.

Alistair

>
> thanks
> -- PMM

