Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4151C32E833
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:25:55 +0100 (CET)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9Wk-0004Co-Bk
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI9VK-0003lS-6P
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:24:26 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI9VI-0006v2-Ba
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:24:25 -0500
Received: by mail-ed1-x535.google.com with SMTP id d13so2318760edp.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HU93SaiFSr3EDy+loYe3i4eJMORclCvJSkwllDMb3To=;
 b=iHJrTRAKsSDKdHEY9sVmztNY+TRWc4iA5yPqpwgduhkvMYYaSqiHhY+B5RA35Pymn6
 D8Sl5L2m9+UTAcCYMcljVPwT2qHSNX51voFnX0X7kbUzkXgFEq3Z5QfmDL3gEIFV6dFr
 eChBpHl5lSki1p53Uoh8Ufg+6ty9OpFFFTqqp77WuRq6sNcIY4VJa7Fivoc4M0m4/1E7
 2EHfk5Gh+6NpbBK6QSKkEUyHiCCYcD/fQJsZ+tQ1UdWaQSfUPtyGHawsBJElen2aVdXn
 pOUOsXLs8bN2fcfgi6yyD4PsVMsyXIfALHoO/oBwTKSxiMS5k6xcEWpBqcwifn+ZUNAN
 BsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HU93SaiFSr3EDy+loYe3i4eJMORclCvJSkwllDMb3To=;
 b=icEnCLOHiROtXRtNuDAoJqCVZqnkKv3Obaa+uspiVygf7XGINkxUtzbmpwxNJA0miu
 wbE8I3Fx/eAn7/6FNNP0Pt5CvyaOYgaFqndhWAhPg3ULiCRprQNyVvP9iF1GuUWU7ayc
 5+2LFLqL0Iwp6B58jIgHHONTUzTe+21ZgrtUQXbzr4GMih95KJVP/bHJVdqRLZfNT/G8
 TRvNJVrbHnaEOn+4fUqvo+RNHsnopVhVeyWckb9asS5ZOFlEqAs1vsn3TCiOvFgSc5Zb
 fzBsr5n12L67V3JkFv6/N2voMNrvwN0cPlu3G8rh+Wn9CC/tDsoS3e/Y9yyF/t7Phebf
 rQyg==
X-Gm-Message-State: AOAM533U5xvXph/FYdQ7FETN0tgpqKDfi4LBmcOvlm52C9DWZxhRtYiu
 SMe1N7ojWF8Fmcdm2/UOYjIQyvf2a2GfllSN7gavHg==
X-Google-Smtp-Source: ABdhPJwwRLVya/X3RcKHfW4P6I5oWNiPcOmksVnO7/Dee2crOWOCff+v6f9xnIHI2ACxInxzn4YBC2tZ5AgI02UfaeI=
X-Received: by 2002:a05:6402:40b:: with SMTP id
 q11mr8805940edv.36.1614947060397; 
 Fri, 05 Mar 2021 04:24:20 -0800 (PST)
MIME-Version: 1.0
References: <20210219201820.2672077-1-pcc@google.com>
 <7f891cc6-33ff-bd87-e1a5-98c874326be5@linaro.org>
In-Reply-To: <7f891cc6-33ff-bd87-e1a5-98c874326be5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 12:24:04 +0000
Message-ID: <CAFEAcA-3oX2-QDsBW3YLfiKzZzL5p+VDCnDL3fn_3jd-Gh9a+g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use TCF0 and TFSRE0 for unprivileged tag
 checks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: mitchp@google.com, QEMU Developers <qemu-devel@nongnu.org>,
 serbanc@google.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Peter Collingbourne <pcc@google.com>, eugenis@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Feb 2021 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/19/21 12:18 PM, Peter Collingbourne wrote:
> > Section D6.7 of the ARM ARM states:
> >
> > For the purpose of determining Tag Check Fault handling, unprivileged
> > load and store instructions are treated as if executed at EL0 when
> > executed at either:
> > - EL1, when the Effective value of PSTATE.UAO is 0.
> > - EL2, when both the Effective value of HCR_EL2.{E2H, TGE} is {1, 1}
> >   and the Effective value of PSTATE.UAO is 0.
> >
> > ARM has confirmed a defect in the pseudocode function
> > AArch64.TagCheckFault that makes it inconsistent with the above
> > wording. The remedy is to adjust references to PSTATE.EL in that
> > function to instead refer to AArch64.AccessUsesEL(acctype), so
> > that unprivileged instructions use SCTLR_EL1.TCF0 and TFSRE0_EL1.
> > The exception type for synchronous tag check faults remains unchanged.
> >
> > This patch implements the described change by partially reverting
> > commits 50244cc76abc and cc97b0019bb5.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> >  target/arm/helper.c     |  2 +-
> >  target/arm/mte_helper.c | 13 +++++++++----
> >  2 files changed, 10 insertions(+), 5 deletions(-)
>
> Interesting.  When the the 50244cc bug was reported, I had wondered if this
> were intentional.  The reversions, with the additional change to the el for the
> syndrome, looks correct based on the described change to TagCheckFault.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

