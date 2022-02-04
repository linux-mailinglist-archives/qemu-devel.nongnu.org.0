Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7C4AA31A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:23:17 +0100 (CET)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6z6-0004mf-4d
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG6wS-00025h-AQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:20:34 -0500
Received: from [2a00:1450:4864:20::32f] (port=40873
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG6wQ-0006DE-5Y
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:20:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 s22-20020a1ca916000000b0037b91599cd0so1862622wme.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 14:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mnBXHHbPtjJQsSPpKuXG3d0SJ7rkeE/PmiVU9oyitSY=;
 b=V1xRNn1Y5aUSQ8I/LqRprziydBe1gYX8uAdDqMldKl95F+aNxvoY015o88AReWjFO7
 gUf8CaFNu4lEgxIeIEjjC6wonpLcSrWhPFmkeLyIkslDgOEWtOKezTiYcX+hqSb4w3uM
 ZZebv9vPs86iwE1KR9zGs6EbSK9aSLWpXcU+U+uM/QNaxFKEbyhe5ItqILGFD7wdN7N9
 vV7NJD3pnbOI0oxB31RrxI+mb1yuzf6vCraopFk/BhkrhdK6V7uqUP+wCoEwVxJ7Fa6+
 7bXjASF7y0E2Mqz1B7E42s8nVyCGEMqrajA4iUsGP3XnDXxneYLUFSS/iHEGMLAt8W2G
 Ugng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mnBXHHbPtjJQsSPpKuXG3d0SJ7rkeE/PmiVU9oyitSY=;
 b=KYaedq5QBBMrJCQywH3GiOburgJcdtXhG/X4EZMT/vmKXWIhXgPj/jlXoDTmIR3aW5
 Z+X23un9iK/J9Nqjp79UyJJAwoydMxX4NOLC0nVxpvH/TGBcO3WpwZv1w9ADmFMGh27e
 T9nPdAQoYrgWJZWNYKFtN/7HEDOqa8vDjLnzSvFl2rrFeESncnsXKl3bQL0u5/KjMGYM
 dg5aRRPbaNafavxH/xmHTtrAoDVtitsbJJ5pPPOZ8qUXyVRNLWy3J43tY8Cvei/Ia7EL
 l10TE/swulUXMT/y6JF7ynIsMFPZkwPVbDByqO7ayOdlrDbLqqXcS2G7l8RSzr/1dbQ0
 V/wQ==
X-Gm-Message-State: AOAM5321eLErOP5KfEA0wO+ChOnEmK7S+c8kVDdHdxko8e5vuyUw65Yu
 KcuEnBLbSs/eAvHnFTzllLrf5DYM265eHyDTnBMoEA==
X-Google-Smtp-Source: ABdhPJzjqct7gaZGySSlIxWMaHLJtqJzzG3ffLaxOjJfSN5TtsfSPTEnMwj4V8UzX2hu/oZ3+T+kRiz5Y5sNjsTvQX8=
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr684940wmk.32.1644013227047;
 Fri, 04 Feb 2022 14:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-4-richard.henderson@linaro.org>
 <CAFEAcA8YyrASZw7Wj1c5fLg-60KUKPsC7eVA8+YhNTsVM4t2kg@mail.gmail.com>
 <0c47260f-7ecc-7b67-4d29-4e9b8c3cdabc@linaro.org>
In-Reply-To: <0c47260f-7ecc-7b67-4d29-4e9b8c3cdabc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 22:20:15 +0000
Message-ID: <CAFEAcA-mGymG5pBsXKhtvKSuTkV4bYQ1bxktyEPipH453QTvMA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] tcg/sparc: Use the constant pool for 64-bit
 constants
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 20:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/5/22 05:18, Peter Maydell wrote:
> > On Fri, 4 Feb 2022 at 07:53, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> >> index 6349f750cc..47bdf314a0 100644
> >> --- a/tcg/sparc/tcg-target.c.inc
> >> +++ b/tcg/sparc/tcg-target.c.inc
> >> @@ -332,6 +332,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
> >>           insn &= ~INSN_OFF19(-1);
> >>           insn |= INSN_OFF19(pcrel);
> >>           break;
> >> +    case R_SPARC_13:
> >> +        if (!check_fit_ptr(value, 13)) {
> >> +            return false;
> >> +        }
> >
> > This code seems to contemplate that the offset might not fit
> > into the 13-bit immediate field (unlike the other two reloc
> > cases in this function, which just assert() that it fits)...
>
> Ooo, thanks for noticing.  The other entries have not been updated for changes to tcg
> relocations.  They should be returning false instead of asserting.
>
> Returning false here tells generic code the relocation didn't fit, and to restart the TB
> with half of the number of guest instructions.
>
> >> +    /* Use the constant pool, if possible. */
> >> +    if (!in_prologue && USE_REG_TB) {
> >> +        new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
> >> +                       tcg_tbrel_diff(s, NULL));
> >> +        tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
> >> +        return;
> >> +    }
> >
> > ...but this code doesn't seem to have any mechanism for
> > falling back to something else if it won't fit.
>
> It will fit, because we'll keep trying with smaller TBs until it does.  If for some reason
> a target generates more than 8k for a single guest insn... it will go boom.

Ah, I see. Then for this patch
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

