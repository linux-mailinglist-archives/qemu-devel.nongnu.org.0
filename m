Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2355A3D8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:43:44 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4r5b-0006Md-L4
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4r1Y-0001Oa-O1
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:39:33 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4r1X-0006D5-53
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:39:32 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-318889e6a2cso36604227b3.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTdpvC51yempUAHC2edj1BajcdeqB+w+icd8GhZQLfk=;
 b=VPlBH/+RlULFaX+NYjCGxHc2skcJx6fWcx5cUa8cqNSTdWEU390B0k5qMq2pqOFIY6
 Ll3xKD4GLKDKPIw226Yv8Fw7hJviYT5K5kRorbvB0vtiQkPJ4QhUmu72Zl7zqs7doSoW
 P5mKWdHodlqJtJSCjOGEULuZAtXhs55F2Ii8COrOIdRTUwM2mInQjiaJah5PmGcz0Pl+
 zBCCm55jc9HHB4RlAjcNB20qYgY/Q5uohyFkTZr1y+o4T32jGAm4oeMzavmazCFtRq41
 ADXT5zu+sBO5JUD52jtbaS6naF+EV30Vjjcbmjvn/JVEdTbsifzQ+fBjRoVSwJR/8gIE
 ngDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTdpvC51yempUAHC2edj1BajcdeqB+w+icd8GhZQLfk=;
 b=sklPy9EI+EUm0HfZNu6BbkfWXQvZ8MyqHuvLAaSitbDFtTqPUo04MUXof9zyn5sG6o
 DS3LCKOx46oOne2BIRiGohFLWDuju7rrwd1CRksksB6vuI4GR3KOLk+Hut2ZYKYljHGg
 RDhb+OaCSx62FYMOfU0ltkMMstifnsOmrprFI/tsvwMRYbP4Acxl9rsLnaeH2Tk8kqMD
 5gigMqjJ3j9lj2Jeh+9zWXqmPoRcDBxOgEJ8bptfzoUJd+nqt9FLMRd9Dt+WFfgBQP/7
 4kxG7Ey3hhUtUbdXSmWLfRSxU3YG4gs+250JFIeZskj8IQQv6w5GrsKcwRRVyT5dUbEx
 jPIg==
X-Gm-Message-State: AJIora8AedXaANBfsT/dATOECkIbMYe1kIMgz9k2O2C+aai0QJbzRpIt
 +IOGU5g/JDGwE7f2paVcZWosJRUJGcfi9ATEw3T/vg==
X-Google-Smtp-Source: AGRyM1tpgiE6pVReGt/PBkmHLQAMuQZkUkAWd76+v1Ep/a4daMY9d007XDxS47ZGuZqf5BZDbkNdsG7621arz3P2IW4=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr1161071ywd.64.1656106768278; Fri, 24
 Jun 2022 14:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
 <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
In-Reply-To: <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 22:38:50 +0100
Message-ID: <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 24 Jun 2022 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/24/22 08:30, Peter Maydell wrote:
> > So the thing that worries me about structuring this this way
> > is that the SME supplement appendix includes this caution:
> >
> > # The instruction encoding tables in this section [...] will
> > # require correction if subsequent versions of the A64 ISA
> > # add new instructions which overlap with these encodings.
> >
> > My guess (based on how the H.a Arm ARM has incorporated
> > SME) is that these tables aren't going to be included
> > in the Arm ARM and updated going forward. Instead the
> > behaviour will be documented based on whether (existing
> > and new) instructions call CheckNonStreamingSVEEnabled()
> > or CheckSVEEnabled() in their pseudocode.
>
> I agree that this would be cleaner and more correct long-term.
>
> > So I'm a bit uncertain about how awkward it's going to be
> > in future to maintain this transliteration of the SME
> > supplement tables into decodetree: we might find that
> > we have to look at new instructions and kind of
> > reverse-engineer back out any required changes to the
> > tables here, rather than simply "write the trans_ function
> > for the new insn, looking at the pseudocode to see which
> > _access_check() function it should be calling"...
>
> I thought about this, and if it were simply a matter of annotating the trans_* functions
> within translate-sve.c, I would have done it.  But I would need to adjust A64 AdvSIMD as
> well, which is still done with the by-hand decoder.
>
> Can we use this solution in the short term, and fix up advsimd while coverting it to
> decodetree?  I'm more and more convinced we'll want this sooner than later.

Yeah, I guess so. Is it possible to do the SVE stuff the right
long-term way and have the short-term fix only for the A64 AdvSIMD,
or do we need to do both the same way ?

-- PMM

