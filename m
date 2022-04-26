Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D065101F4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:33:23 +0200 (CEST)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNBq-0001SR-AJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNAp-0000Rt-Fl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:32:19 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNAl-0002Cj-Pj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:32:18 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f7d621d1caso74951947b3.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQDxV9rI0+Uz+mlIReO5AmMv5klPYv/zeLKWV5mz5hc=;
 b=iOz3Y/fN97aNRSmrBemTg/kTJL7dszJgF9p3t1mjrDcSO2ogUuYrseBowN164JcG2A
 3bPBBSry2pNNdTd3hyqSM7pqfb4W06VBtUFzMeHA4PNlAOdfcBbuvziBjuovPO5q/rS3
 hdMQyBxJcNEsZSepT8omlLp3psyYlkhmLuNZhcN8CWyL/lMRRoaEiqGmQWTiICJKO6Aa
 rJywIrWDq5hQjwa9DBIDRf4oVXvTVSa8eJCKh9xEC7QoQ4f45ZzzXfPfIasjcYHGy724
 /bQ170/K2mzud57pcdk9zuzZDNbBxK6uLxYVfAYHgTfYYiRTs2ZxfsEID7THeZSLownU
 ynqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQDxV9rI0+Uz+mlIReO5AmMv5klPYv/zeLKWV5mz5hc=;
 b=rsmvyEDqHXOgE+Vnt+Vt/0zf6fTjb2G1viEN0jjYP5bWKCQMdBurk9pnpzOHqK+Vjh
 CpZtkcLnym4HT6nFoqKT+w/terBpmq54o/4V79rIk5/PbJJWiG5Ly70R7mC40sy+1TF4
 2fVPtkzWZiHOy/2gqUJeFN9G5EItMN53OyHWEQ5BUpWSSVQiUE4Oi6chaxazreiIw7fI
 TRmzND+Ygme2jwyeHdXiMuRGOdTJ3o5QtKd5XgFG+9v0vBNLWjaOEmnVkpgOdtIeybxM
 mnObMEGGlKhOyOJCSzytiCQeKKd7HNj4xmgrPD+Gq8cTLQg9BN7/iyJeQABstXqPq7YI
 hvqg==
X-Gm-Message-State: AOAM530iJaEtAlM95OoRR8m18FPJY8C9F9AVJnc4UvrU66pr85XekVh6
 Cv5kMfsDmlEutfs+1vStLF08LbPdyeiUWtRi8atylA==
X-Google-Smtp-Source: ABdhPJwuAafYU5vZPuiIvqqdLpZXWJL/lcrXuoZF9vKicTep/r8wqFeHt3AA4lUR63xDofEwEfneEVcBm9hhRr5TumM=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr22782956ywt.10.1650987127669; Tue, 26
 Apr 2022 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
 <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
In-Reply-To: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 16:31:56 +0100
Message-ID: <CAFEAcA_P9gxqKxVaKUbuHq6M5GQRmyRObnFfeq7CJ11LFkSEdg@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 17 Apr 2022 at 19:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > More gracefully handle cpregs when EL2 and/or EL3 are missing.
> > If the reg is entirely inaccessible, do not register it at all.
> > If the reg is for EL2, and EL3 is present but EL2 is not,
> > squash to ARM_CP_CONST.
>
> I don't think we should do this unconditionally. Just because
> the architecture usually defines that an _EL2 register is
> RES0 if EL2 is not present doesn't mean that it does so for
> every register or that it guarantees that it will continue
> to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
> don't have that statement in their documentation, which might or
> might not be an oversight.) You could add an ARM_CP_ flag for
> "RES0 if no EL2" or something I guess?

I've just found rule R_RJFFP in section D1.1.3 of DDI0487H.a,
which explicitly documents that if EL2 is not implemented and
EL3 is, then "every accessible register associated with EL2 is
RES0" except for an enumerated list of six registers which are
not. So I'm more open to "default to RES0, with a flag to
suppress that default" than I was when I first reviewed this
patchset.

thanks
-- PMM

