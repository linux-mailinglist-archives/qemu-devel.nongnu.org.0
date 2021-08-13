Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020573EBBD9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 20:08:53 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEbbv-0001a4-Jq
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 14:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEbau-0000u6-1A
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:07:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEbas-0002G6-Dx
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 14:07:47 -0400
Received: by mail-ej1-x633.google.com with SMTP id u3so19804426ejz.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciiWu2d/8SMs6AauhvP/j8S4M2iBfjS0tpPHCQy+8vc=;
 b=t+bdjtbMVUAjpu4tOAU591cE+TJDqU00/MWOELhUn10sIOMqyGix6EI2gLG+Tx6gVX
 m5NaNDyyWCX3c7jrVQZUv2Y4oCcDRjobV7AFfMb969wIBJr3OeZfoy4OE/7pdAGyZVQP
 SKFUz85CeQ4dcMINK/MQPub0oMcMll+8QwdpEOtYuEahH0ZdbYgbzI7KryzJxsOJz4Ri
 YtshxYPrGH3YHuM13gN632PRoiHeTwHWp3MWJZ2ss5566EgOKyY3VRQhvl8QWs2yuna1
 IJLa8sqYDJzHzcrKnqDpM2JrKMDzo7pvQc8VAQOw+W24OpHVxjaPiIVlfkT4BcakcFh9
 fYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciiWu2d/8SMs6AauhvP/j8S4M2iBfjS0tpPHCQy+8vc=;
 b=ev9qmpf14V1VwwgO+jZwOMXU+g/SG4oFGyR4PbYxojS9717Lrak/A0i7b+j5rcrzqW
 su7+Ds1K3yfKuMIPgGQGTSxiWQ02KWvCrZbzRNfNxF029/dRUW7PEvpiz/o/xK83a3Vw
 pYUVTMDX32OWPxqwoA+Wy3TYGmeg22hxQ5jOumyHRhN/dAiOn+9LTUMlGBonqTdH4diz
 P9QgqO275VefFcw5hbERjFDuIhmRXFwu7JXKNiiADfgwYR0faMLguMW4cf3HAeBg/+f8
 H6G7Xzan+5qMrVzY8pIxT2Z+8q/uULvHffXCDlmFuOguIW/G2kV4+jwgmin/WjiH5BYb
 D8iQ==
X-Gm-Message-State: AOAM532DactBNXMfBWKA/HyXifxIQiNtHY6GrgWLkJuHgz7Zs+3GnKve
 a5rJL5Q63L+Oy9G4WLAyuuFdws2gui5NtxjL0ICpRw==
X-Google-Smtp-Source: ABdhPJyGFSDgNESy2BUIHkQuf2Yd7rXcNcirDWfiIBIYnM1QyFdfg/Q5PWpoKzqzLT7kG9MrR07TLwreRxhzLFt7sPk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3714391ejy.407.1628878064467; 
 Fri, 13 Aug 2021 11:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
 <CAFEAcA8J4WBFiLUTJAXduST4v+cz7-5s3KPJJY05LVizN_9PcA@mail.gmail.com>
 <184409c8-a983-8581-d263-9119607dc55d@linaro.org>
In-Reply-To: <184409c8-a983-8581-d263-9119607dc55d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 19:06:59 +0100
Message-ID: <CAFEAcA-XY0zL84oh8gP_kw-PKsB=Ggf7sf4O7ON67ijy_AAUHQ@mail.gmail.com>
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/13/21 12:37 AM, Peter Maydell wrote:
> > These changes look OK as far as they go, but it's not clear to
> > me why the other places that set P_REXW are all OK to use P_REXW
> > and not P_VEXW. For instance tcg_out_mov() sets rexw = P_REXW
> > and some of the codepaths there will then pass that into
> > tcg_out_vex_modrm() which ends up in tcg_out_vex_opc().
>
> This distinguishes between 32-bit and 64-bit transfer between vector and general register.
>   Which of course doesn't make sense for i386.
>
> > More generally, is there somewhere we can assert that we
> > didn't try to use a REXW prefix for i386 codegen rather
> > than just silently ignoring it ?
>
> I guess tcg_out_opc might be a place.  But mostly we try to avoid generating those places
> in the first place.  E.g.
>
> #if TCG_TARGET_REG_BITS == 64
> # define OP_32_64(x) \
>          case glue(glue(INDEX_op_, x), _i64): \
>              rexw = P_REXW; /* FALLTHRU */    \
>          case glue(glue(INDEX_op_, x), _i32)
> #else
> # define OP_32_64(x) \
>          case glue(glue(INDEX_op_, x), _i32)
> #endif

Right, if we do that everywhere we could make P_REXW the same value
on 32 bit and 64 bit hosts and assert that P_REXW doesn't ever actually
get passed to the functions where we look at it to generate
code. It's only if there's codepaths which rely on P_REXW being 0
on i386 in order to not generate invalid code that an assert would
get awkward...

-- PMM

