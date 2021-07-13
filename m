Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391E3C7819
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:39:12 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PBO-0005tM-Px
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3PAE-0004NS-SA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:37:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3PAD-0003Ia-93
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:37:58 -0400
Received: by mail-ej1-x629.google.com with SMTP id c17so43774335ejk.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 13:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRs39ah8rWPoM3QIbY4d+LDTieewALTKnCdivHb9Y28=;
 b=lVJN+QjEzmc3+nGVIBjLWLnvszB0+HCfryIGWjDG2oJS2tRfu7/RcOpLv7TDyrzxm5
 0XxvNahS6JPW2L/ORb/797abrnBW+yowL9jc1O3/lPRfS5ieXiTpud6sqfdcOJvrtNfg
 6V81UCX3zngHxtH+bTTk3PIId5eoJ9N5pPRU85hyw+o9K+Que+wpj6Uwbvc3vF5zp0Qa
 qznxS+3iniv/Ka5ygnaSwAvpsf5mEls3apqJ5LcvD0u8mXHBEISYZ7TGaAOoC+F0UH0o
 hGXvQEWCxZFtZcBKAT3UOf3Nf4Ha662WWdFZ/0tlQkVYlFjfTHXCGrLWSr3dQFL17M6R
 Gw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRs39ah8rWPoM3QIbY4d+LDTieewALTKnCdivHb9Y28=;
 b=rkw5aooGSef5E7y9WcbBpu3yYIObNZJe0GgPgiivSBJA2U2l6HipI5ZM5VndqjyJ5R
 CaOC2UZsULWgwysnF4rXam61cYoKV6pafcUzBB+2y2VkCanjzSi3nkWUz8WvwHgdPsS7
 Le8m3Rlcl9+2jPxPwuKXeukWzz64/77Ym1SUMFLDoV16pYH9kKtkFdmaRdmyqFo3fN/o
 bkpOYavi9yoTiUQ7UvYwG+SFkP34Eum4JiDbOirMKl1buqoGgnDZbsHRYkG/s+MNpGkC
 CbkCknBSzABFOwsOAmACS0ttO/izggQGvX0zDL3f0U6QZrbLjo7O6E3qd4Im3Lpci4m3
 rCmQ==
X-Gm-Message-State: AOAM5324GoQ28kkzrO5lEPHwr2P03i6gq2V7J7GWmCs0CW1xeIRe6nX2
 tsM1uyxoHzkg3VcocuPrp6z3LkG+FlLn8cToQixBRw==
X-Google-Smtp-Source: ABdhPJxsh6E7wuEP+BAvPV3+9Q9s1l1570Vu9U11sP4wjbw+RNcXTCbASihh7jPFI6sJcmtxTVtFdDZ+sXzpzRRaF/o=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr7942228ejx.85.1626208674934; 
 Tue, 13 Jul 2021 13:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210713020736.28960-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 21:37:15 +0100
Message-ID: <CAFEAcA-11JbzDYY81jpSvqtmoWo3kL575xF11-XGxjLgYpscKQ@mail.gmail.com>
Subject: Re: [PULL 0/3] ppc-for-6.1 queue 20210713
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 03:07, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713
>
> for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:
>
>   mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-07-13
>
> I thought I'd sent the last PR before the 6.1 soft freeze, but
> unfortunately I need one more.  This last minute one puts in a SLOF
> update, along with a couple of bugfixes.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

