Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B091C450748
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:40:22 +0100 (CET)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd9h-0003pq-Rm
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:40:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmd8A-0002Sc-Fo
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:38:46 -0500
Received: from [2a00:1450:4864:20::435] (port=34477
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmd87-0005Zt-FL
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:38:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id d5so31175601wrc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FPkNGiB4R/RrFVaMHVDSXTbMaBdh0+1Jsm18qvBfx0g=;
 b=lGk2P2C0counM9BEg8R4T4Q6OZtupb1KnegW78+VosDEGghkBGeen5LjzMWUcRzayw
 pf6gmOHLJShngF02g+T2ZNxuX068RpS64DOc+jwXCrVI83e5c3Lf+LYoJEids16iD7cz
 rMCKggK8FxUFG92dOx9X/juSzzcMc0l0s9SHzgIgrFmMWxW67x3nB6F7ZbYHCnOnAKGX
 /hycYOj1SDGTIG6bzi0AfsPvTI+yQUobTuK60UOPkfiOMG3g6wIWeNBp/jSgL1pQ4qQH
 M+ShgiYDw9sbatKCZWhi1nnB2Igqvqzngd4Wo2R92hMKbOWAP8psdRPEzikAX9pPtCJE
 wSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FPkNGiB4R/RrFVaMHVDSXTbMaBdh0+1Jsm18qvBfx0g=;
 b=ZtRPQvGTvsqCmuSb+l8kMV6V5EEX/Ekvgr5nBy1z03dbqyWAgxSsl7ngXX5c3BkbnQ
 WbFCoETFEM9I6ojZLPkckcNpW7CH1Ze/qU4+W4vc/cUYK6x13s2e4IzRWvZWa7D2jyQc
 h+B1PcUHyOtf1iromfjwXW9+oLn+HA3gTrtIjyAhKAp/qJABbZfTKx4y29OW1GIlHQn6
 dp5pA4+AXYy3H7NcyR2F9J01KzXBzRtdGEuJ1BZny6wrd0eMgpqsJMS+YcvQPke2+Dgr
 10YM7qLNSAAlZ5kAK8LBidJaQV2e/227Y34a4O9QjQtmEui6s0qUYP8bZCAi9KszoZo7
 XRzw==
X-Gm-Message-State: AOAM531IEioRoZtXMII/vnIV6nvFPzz7gtxh4NZ1U6ZsYxt+NoS8+bTh
 +d0HgOKFAOmaDkuohxvgsAdWIyqhvQ18nKYFI+hluY8f7NY=
X-Google-Smtp-Source: ABdhPJy+iqIloBw/a7q8b89zg0cJHkf29sHrAY5NI5W2Ydcf33GGUnjC+aHaRR3u9BOSdHGDVMjeqKxyVemYr/SZWck=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr47324159wri.376.1636987121741; 
 Mon, 15 Nov 2021 06:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20210901141008.17203-1-peter.maydell@linaro.org>
 <CAFEAcA_Jn_y0i5W2zdM+hEFmciu-q=EK3EXQgQateU2r2uAXWw@mail.gmail.com>
 <CAFEAcA_h2-CPvMmC4C_sxng+_KExRn9So0E1pXm5R53XGk_4=A@mail.gmail.com>
 <CAFEAcA_B7MtcFY4cpLD6DZPqiTp1Msh-tD6HBNcD-3KDZ0owJg@mail.gmail.com>
In-Reply-To: <CAFEAcA_B7MtcFY4cpLD6DZPqiTp1Msh-tD6HBNcD-3KDZ0owJg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 14:38:30 +0000
Message-ID: <CAFEAcA84UnQTM=XzyX+6j6Zy_f_hZS5+QLTTU6UZYFT+b9BGXg@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: Use assert() to sanity-check b1 in SSE
 decode
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Ping^4. Who is collecting target/i386 patches these days ?

-- PMM

On Mon, 1 Nov 2021 at 16:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping^3, now 2 months after patch posted and reviewed...
>
> -- PMM
>
> On Mon, 27 Sept 2021 at 11:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Ping^2 !
> >
> > thanks
> > -- PMM
> >
> > On Mon, 13 Sept 2021 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > Ping? (this has been reviewed)
> > >
> > > thanks
> > > -- PMM
> > >
> > > On Wed, 1 Sept 2021 at 15:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > In the SSE decode function gen_sse(), we combine a byte
> > > > 'b' and a value 'b1' which can be [0..3], and switch on them:
> > > >    b |= (b1 << 8);
> > > >    switch (b) {
> > > >    ...
> > > >    default:
> > > >    unknown_op:
> > > >        gen_unknown_opcode(env, s);
> > > >        return;
> > > >    }
> > > >
> > > > In three cases inside this switch, we were then also checking for
> > > >  "if (b1 >= 2) { goto unknown_op; }".
> > > > However, this can never happen, because the 'case' values in each place
> > > > are 0x0nn or 0x1nn and the switch will have directed the b1 == (2, 3)
> > > > cases to the default already.
> > > >
> > > > This check was added in commit c045af25a52e9 in 2010; the added code
> > > > was unnecessary then as well, and was apparently intended only to
> > > > ensure that we never accidentally ended up indexing off the end
> > > > of an sse_op_table with only 2 entries as a result of future bugs
> > > > in the decode logic.
> > > >
> > > > Change the checks to assert() instead, and make sure they're always
> > > > immediately before the array access they are protecting.
> > > >
> > > > Fixes: Coverity CID 1460207
> > > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > > v1->v2: use assert() rather than just deleting the if()s
> > > >
> > > >  target/i386/tcg/translate.c | 12 +++---------
> > > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> > > > index aacb605eee4..a4fee5e445d 100644
> > > > --- a/target/i386/tcg/translate.c
> > > > +++ b/target/i386/tcg/translate.c
> > > > @@ -3521,9 +3521,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > > >          case 0x171: /* shift xmm, im */
> > > >          case 0x172:
> > > >          case 0x173:
> > > > -            if (b1 >= 2) {
> > > > -                goto unknown_op;
> > > > -            }
> > > >              val = x86_ldub_code(env, s);
> > > >              if (is_xmm) {
> > > >                  tcg_gen_movi_tl(s->T0, val);
> > > > @@ -3542,6 +3539,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > > >                                  offsetof(CPUX86State, mmx_t0.MMX_L(1)));
> > > >                  op1_offset = offsetof(CPUX86State,mmx_t0);
> > > >              }
> > > > +            assert(b1 < 2);
> > > >              sse_fn_epp = sse_op_table2[((b - 1) & 3) * 8 +
> > > >                                         (((modrm >> 3)) & 7)][b1];
> > > >              if (!sse_fn_epp) {
> > > > @@ -3772,10 +3770,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > > >              rm = modrm & 7;
> > > >              reg = ((modrm >> 3) & 7) | REX_R(s);
> > > >              mod = (modrm >> 6) & 3;
> > > > -            if (b1 >= 2) {
> > > > -                goto unknown_op;
> > > > -            }
> > > >
> > > > +            assert(b1 < 2);
> > > >              sse_fn_epp = sse_op_table6[b].op[b1];
> > > >              if (!sse_fn_epp) {
> > > >                  goto unknown_op;
> > > > @@ -4202,10 +4198,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> > > >              rm = modrm & 7;
> > > >              reg = ((modrm >> 3) & 7) | REX_R(s);
> > > >              mod = (modrm >> 6) & 3;
> > > > -            if (b1 >= 2) {
> > > > -                goto unknown_op;
> > > > -            }
> > > >
> > > > +            assert(b1 < 2);
> > > >              sse_fn_eppi = sse_op_table7[b].op[b1];
> > > >              if (!sse_fn_eppi) {
> > > >                  goto unknown_op;
> > > > --
> > > > 2.20.1

