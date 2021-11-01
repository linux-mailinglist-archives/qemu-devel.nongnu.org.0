Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFE441DFB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:20:04 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mha2V-00034C-Dh
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mha1M-0002MH-99
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:18:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mha1J-00046Y-RJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:18:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d27so10916412wrb.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z38a1y9OsNYFt797TU3g8R9tU9sKmeaey+7l4lJG3tA=;
 b=Z3M3hr90PRBke2G6+sXih33ir05hRp7WZs0ZbIa7YrMufqA+amep0xsjm7GWYB7lH+
 GgfnI0b3ERQ8IKxKM5RI8Cl9BAt4O5SygQ8+Tqw7QgVzNjB/e8RJsq3AoiCjxupctpy+
 ksAqoCFT1DY333EBiwUSoXe9m7cAx/smSTLAnNRbFvN7DQozcJ6G7wQPMUWGX6hiRTn3
 i4fhXjeu//rIYNSLh8pKcUAe6cNP5LKGMSwED+jQ6QhciTcKRsQkdMAIEC8lHZCu26wz
 o/af463vaqxoFldt1jP7S6k6gqrG/fF7gG3fkjHtXu1Rsk8ENGTfOwi4+IgY2eGmBfqT
 gDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z38a1y9OsNYFt797TU3g8R9tU9sKmeaey+7l4lJG3tA=;
 b=VIdFpuh3uCYHn7dDNjVDwerxyi5y4uW1i9PAuqmyqjvvMhjBZuX3hZBgvk5rTJz+rh
 AEFjuSRnwZHQjQyWWMSSCLE+gm8+M9Y8Mwp3OLM4abDHpNzvNtpDOO8gT125Mk/WoVQH
 wR+hm3+ldN2/zrGhmhMRsnHsBV0fru4TPOdYsxAgzlbUhpx3PPC+KbIcoOv/9VK4sv3t
 c+9+4HzUmqEB3fgmLb4hvtjwOqefj1TuL3EWi1OM9FceRHXedX/DFqUaDjsur7wqSzGG
 Wr9gN8bc4wj9TVhVe6KInWm/RTNzS9gIhauOTjU3kw2I2e72z+6K/NuZXGzpJ9uRw/py
 S1uA==
X-Gm-Message-State: AOAM531KH+wthCiwVq6xfuUgKTK6R21J14wipR7UhUg7bd63bEM/zBfB
 JDpEPFhLHuedYEzdea6vklqmIKKG3qIxLTwqluAb+oCo9S0=
X-Google-Smtp-Source: ABdhPJy6VD0f+ol18AG7lF5YOWF+PYMLSScDT/TlvMH6Y21sxACaw+JPK0CCeAN3zFdgXGPj//xRAAUyhFP7GPOIsfE=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr39239899wri.376.1635783528125; 
 Mon, 01 Nov 2021 09:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210901141008.17203-1-peter.maydell@linaro.org>
 <CAFEAcA_Jn_y0i5W2zdM+hEFmciu-q=EK3EXQgQateU2r2uAXWw@mail.gmail.com>
 <CAFEAcA_h2-CPvMmC4C_sxng+_KExRn9So0E1pXm5R53XGk_4=A@mail.gmail.com>
In-Reply-To: <CAFEAcA_h2-CPvMmC4C_sxng+_KExRn9So0E1pXm5R53XGk_4=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 16:18:37 +0000
Message-ID: <CAFEAcA_B7MtcFY4cpLD6DZPqiTp1Msh-tD6HBNcD-3KDZ0owJg@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE
 decode
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping^3, now 2 months after patch posted and reviewed...

-- PMM

On Mon, 27 Sept 2021 at 11:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping^2 !
>
> thanks
> -- PMM
>
> On Mon, 13 Sept 2021 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Ping? (this has been reviewed)
> >
> > thanks
> > -- PMM
> >
> > On Wed, 1 Sept 2021 at 15:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > In the SSE decode function gen_sse(), we combine a byte
> > > 'b' and a value 'b1' which can be [0..3], and switch on them:
> > >    b |= (b1 << 8);
> > >    switch (b) {
> > >    ...
> > >    default:
> > >    unknown_op:
> > >        gen_unknown_opcode(env, s);
> > >        return;
> > >    }
> > >
> > > In three cases inside this switch, we were then also checking for
> > >  "if (b1 >= 2) { goto unknown_op; }".
> > > However, this can never happen, because the 'case' values in each place
> > > are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> > > cases to the default already.
> > >
> > > This check was added in commit c045af25a52e9 in 2010; the added code
> > > was unnecessary then as well, and was apparently intended only to
> > > ensure that we never accidentally ended up indexing off the end
> > > of an sse_op_table with only 2 entries as a result of future bugs
> > > in the decode logic.
> > >
> > > Change the checks to assert() instead, and make sure they're always
> > > immediately before the array access they are protecting.
> > >
> > > Fixes: Coverity CID 1460207
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > v1->v2: use assert() rather than just deleting the if()s
> > >
> > >  target/i386/tcg/translate.c | 12 +++---------
> > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > > index aacb605eee4..a4fee5e445d 100644
> > > --- a/target/i386/tcg/translate.c
> > > +++ b/target/i386/tcg/translate.c
> > > @@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > >          case 0x171: /* shift xmm, im */
> > >          case 0x172:
> > >          case 0x173:
> > > -            if (b1 >= 2) {
> > > -                goto unknown_op;
> > > -            }
> > >              val = x86_ldub_code(env, s);
> > >              if (is_xmm) {
> > >                  tcg_gen_movi_tl(s->T0, val);
> > > @@ -3542,6 +3539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > >                                  offsetof(CPUX86State, mmx_t0.MMX_L(1)));
> > >                  op1_offset = offsetof(CPUX86State,mmx_t0);
> > >              }
> > > +            assert(b1 < 2);
> > >              sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
> > >                                         (((modrm >> 3)) & 7)][b1];
> > >              if (!sse_fn_epp) {
> > > @@ -3772,10 +3770,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > >              rm = modrm & 7;
> > >              reg = ((modrm >> 3) & 7) | REX_R(s);
> > >              mod = (modrm >> 6) & 3;
> > > -            if (b1 >= 2) {
> > > -                goto unknown_op;
> > > -            }
> > >
> > > +            assert(b1 < 2);
> > >              sse_fn_epp = sse_op_table6[b].op[b1];
> > >              if (!sse_fn_epp) {
> > >                  goto unknown_op;
> > > @@ -4202,10 +4198,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > >              rm = modrm & 7;
> > >              reg = ((modrm >> 3) & 7) | REX_R(s);
> > >              mod = (modrm >> 6) & 3;
> > > -            if (b1 >= 2) {
> > > -                goto unknown_op;
> > > -            }
> > >
> > > +            assert(b1 < 2);
> > >              sse_fn_eppi = sse_op_table7[b].op[b1];
> > >              if (!sse_fn_eppi) {
> > >                  goto unknown_op;
> > > --
> > > 2.20.1

