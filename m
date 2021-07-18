Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018D3CCA3E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 20:18:10 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5BMf-0007S6-Iq
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 14:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5BLb-0006eT-F9
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:17:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5BLZ-0001sh-UK
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:17:03 -0400
Received: by mail-ed1-x536.google.com with SMTP id t2so20079945edd.13
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 11:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYCSFReA21GOP7a7keor3JvgcDAtYpXKJfqz18HrBfg=;
 b=X3nAbOURObsmVr/smwZB0HY+eFUZsZa0UTCn3kGtdtLURcjs1E9aTaevBXpqKQkxvG
 fvcWv7K0noQJlFLR1H5YX58EFZBlxfQ9l5RrsjHPHX3nET3lUqBgpBeQ7yISgIwolFHZ
 kNjx5T14h1xAsG0I18jUzOSNZwYF1CFMm4ITvF36rXuZmxAPQc2Gp1EbLj1aaVGp7uKT
 fZVVawk+8QK0FUGxytMo3kc6+ykezJDh6cUhIlOVvIknSeIs7EpvTj8F35dBk61FY3w5
 VrmK5uMwklw6mSlugNPj1rqQckEYAqR1zbr+W/PIGQbq1yxLjOcL11NXprSMTylK81fw
 TrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYCSFReA21GOP7a7keor3JvgcDAtYpXKJfqz18HrBfg=;
 b=tpIKUP0XMibkzOLDfhQbTUb5BtuK+OxHKs3ptxs62bBBcAMpBLnKgk5PqpUZzCfDPS
 tZ0cLIaZVLi3Mhmna7v0ZKvIXJXDXUgM5jC+uMrtYQUYykwXLbOeBi9Fpo3uq3R8zkA+
 M0lIYLucT4Jk7p2ebxF5OrcaxGjgEG1CGUoPMfc6rSand34OzbenN2p8qtIHn0kcsrV3
 NdqdfbmnFAjlZE64NJJcdtrAsqrz3Pb0XngfBnKjgFmd9fKRFI0vB55fBI1R8A40e3jd
 tMbd3LHLZmIuqwxyo1OCToe3c9Bi9QkW3BlL4fBruXvJmQvt+DJEciOUdllRs7unBg/H
 t4Sw==
X-Gm-Message-State: AOAM530qJ5D7fPiIMGGAmEpQ4DwtBFJtnyELLcCZCnFHIq6mAbmO/Hfr
 WDVtma4+Lhwlys7BDYm0VLv1nDV8fCqWPxGT2soe4g==
X-Google-Smtp-Source: ABdhPJwNud3714mSWAN4FHR3Zn5noD13+9Whg0/Py2bYN7PgNpJoKxavRfS5tUMQfjF3i1at1MhELvukjwHUuCLW3jw=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr30235742edq.146.1626632218839; 
 Sun, 18 Jul 2021 11:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-11-richard.henderson@linaro.org>
 <CAFEAcA8C=8kAdsYeKqVwH=qeaWy3yoh+YgKm2Qi+SGcV7XWMtA@mail.gmail.com>
 <4d959bff-8c6b-e01b-a23b-6e17c062f85a@linaro.org>
In-Reply-To: <4d959bff-8c6b-e01b-a23b-6e17c062f85a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 19:16:18 +0100
Message-ID: <CAFEAcA_EUx8T0bCLb4a-N7QSUqR00WZrtt=nrdMNQMnKRUin1Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] target/riscv: Reduce riscv_tr_breakpoint_check
 pc advance to 2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 19:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/17/21 1:35 PM, Peter Maydell wrote:
> > (What goes wrong if we just say "always use a TB size of 1 regardless
> > of target arch" rather than having the arch return the worst case
> > minimum insn length?)
>
> Hmm, possibly nothing.  Perhaps I should try that and see what happens...

Some of the comments in these patches suggest it might trigger
the warning in the disassembler about length mismatches; possibly
also you might get duff (truncated) disassembly output? I suspect
that's probably the extent of the problem. I guess these days the
plugin API might get confused -- does it treat one of these
nothing-there TBs as "nothing there" or does it try to work with
the possibly-half-an-insn ?

-- PMM

