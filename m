Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BBF4191FE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:08:27 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnYg-0004kv-HD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnUy-00028y-8R
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:04:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnUv-00055G-Ta
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:04:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so50846047wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzzInOH14HdkZekRsj7WhVgnO6Qo2PAhBOzk5bdzoZ8=;
 b=L+CsVLDvc3aRXOy3d7A6CIxMsdL5jx5WTuFHy8G/dIHu7MmTv2qdRl8RIpyz+gHPhV
 VX+8pnITKPhWw2cQuEpPV+wi2A59nZR0EGqQlYUX7PN86s7hTNt152UtW/FUA4GFYzRA
 7VYjAjV1aI4bvHDWDrFpa8LLwvccFNMBEERJGkhoIxLHPmoGiqK5rh9L/P22BFeqToAS
 p+L0dOxST8Lc1L4MEvPwZV1BA2j05qHTDJW52219wIoQbn5nCWNjTppFe+0R/mHiHJ1j
 Y13RzFO50izm1aiJsiUhd05lUFf+UG6j4tVbZITVCv3mOH38215Y4coeRJgB2u9ekwj/
 YY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzzInOH14HdkZekRsj7WhVgnO6Qo2PAhBOzk5bdzoZ8=;
 b=g4weAPrU0GpjE1LDbP0yGjhbwvhkuGXgCmyKQa1760X5lxsfJKtK9nY+PZJjY/53NN
 jaPutVhmEidfv1yHAi7GgZ+dTSX4YVfZKvBj9JxVIpZBMsKq5c9Q5G2CcvXijZxgosun
 pWfPxjV3O2dtpViFvlVjIepFTh1NJooVHUfRkoyn5CQaSfDDwOX+YNHTrRUdi1w4GaIy
 MnYu+VfILbWWUYK/TfJ3b1WNG6LMUGzfG9lPysGZKb0zh25EWv/kxAj5bu74KKVfu1vk
 veqZJCD3YSr6+gXDNmqvTv1NlKM9lBnhfWJH4JaE3IoPLYWa7Jp7KSLE/bKuEn/b9XFu
 W7+Q==
X-Gm-Message-State: AOAM532eOxJELqmMl/EQkdnPw6Wi0ETe2KIIQTXjQ7TKoKZX2ogKi4mQ
 em70vqgRAwrfs/RizqO9TBXAW65v3a6mgDO6GG1Nc47Rh0Q=
X-Google-Smtp-Source: ABdhPJys/K6vp+NG9mALMo0rIw5LVJ77TWBNWKq7AUuIRzI0zWtSN4T/Tfj9jSr0vJX1Ie6by0rpXgak4g7z/Iq9ptA=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr18146594wrn.275.1632737071917; 
 Mon, 27 Sep 2021 03:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210901141008.17203-1-peter.maydell@linaro.org>
 <CAFEAcA_Jn_y0i5W2zdM+hEFmciu-q=EK3EXQgQateU2r2uAXWw@mail.gmail.com>
In-Reply-To: <CAFEAcA_Jn_y0i5W2zdM+hEFmciu-q=EK3EXQgQateU2r2uAXWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:03:38 +0100
Message-ID: <CAFEAcA_h2-CPvMmC4C_sxng+_KExRn9So0E1pXm5R53XGk_4=A@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE
 decode
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping^2 !

thanks
-- PMM

On Mon, 13 Sept 2021 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping? (this has been reviewed)
>
> thanks
> -- PMM
>
> On Wed, 1 Sept 2021 at 15:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > In the SSE decode function gen_sse(), we combine a byte
> > 'b' and a value 'b1' which can be [0..3], and switch on them:
> >    b |= (b1 << 8);
> >    switch (b) {
> >    ...
> >    default:
> >    unknown_op:
> >        gen_unknown_opcode(env, s);
> >        return;
> >    }
> >
> > In three cases inside this switch, we were then also checking for
> >  "if (b1 >= 2) { goto unknown_op; }".
> > However, this can never happen, because the 'case' values in each place
> > are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> > cases to the default already.
> >
> > This check was added in commit c045af25a52e9 in 2010; the added code
> > was unnecessary then as well, and was apparently intended only to
> > ensure that we never accidentally ended up indexing off the end
> > of an sse_op_table with only 2 entries as a result of future bugs
> > in the decode logic.
> >
> > Change the checks to assert() instead, and make sure they're always
> > immediately before the array access they are protecting.
> >
> > Fixes: Coverity CID 1460207
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > v1->v2: use assert() rather than just deleting the if()s
> >
> >  target/i386/tcg/translate.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >
> > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > index aacb605eee4..a4fee5e445d 100644
> > --- a/target/i386/tcg/translate.c
> > +++ b/target/i386/tcg/translate.c
> > @@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >          case 0x171: /* shift xmm, im */
> >          case 0x172:
> >          case 0x173:
> > -            if (b1 >= 2) {
> > -                goto unknown_op;
> > -            }
> >              val = x86_ldub_code(env, s);
> >              if (is_xmm) {
> >                  tcg_gen_movi_tl(s->T0, val);
> > @@ -3542,6 +3539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >                                  offsetof(CPUX86State, mmx_t0.MMX_L(1)));
> >                  op1_offset = offsetof(CPUX86State,mmx_t0);
> >              }
> > +            assert(b1 < 2);
> >              sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
> >                                         (((modrm >> 3)) & 7)][b1];
> >              if (!sse_fn_epp) {
> > @@ -3772,10 +3770,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >              rm = modrm & 7;
> >              reg = ((modrm >> 3) & 7) | REX_R(s);
> >              mod = (modrm >> 6) & 3;
> > -            if (b1 >= 2) {
> > -                goto unknown_op;
> > -            }
> >
> > +            assert(b1 < 2);
> >              sse_fn_epp = sse_op_table6[b].op[b1];
> >              if (!sse_fn_epp) {
> >                  goto unknown_op;
> > @@ -4202,10 +4198,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> >              rm = modrm & 7;
> >              reg = ((modrm >> 3) & 7) | REX_R(s);
> >              mod = (modrm >> 6) & 3;
> > -            if (b1 >= 2) {
> > -                goto unknown_op;
> > -            }
> >
> > +            assert(b1 < 2);
> >              sse_fn_eppi = sse_op_table7[b].op[b1];
> >              if (!sse_fn_eppi) {
> >                  goto unknown_op;
> > --
> > 2.20.1

