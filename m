Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7A4BD0F4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:30:56 +0100 (CET)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrv5-0002ao-Ga
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLrrR-0000Cf-U4
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:12 -0500
Received: from [2607:f8b0:4864:20::112d] (port=36561
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLrrP-0006Jh-Mj
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:09 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2d310db3812so116834847b3.3
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 11:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d2IKh9bfRS8H8vkf8ALRtx3REhAQvi8nYe04Kl4R7Mg=;
 b=D7VSaZ2rAW4uhEzovttr8aUab0vcVQvHKzLp1GnbycNArXw3oTIq4RJvqZNxEZVc4N
 AmCAOaWIi95mJFA+aYjmJ8HntJCDqfOpz/fXMPRCSSjsR+Ol1KNZyfSnOG07jeWn4gbL
 ZvkOl6yRxVt/kQIq9BgOTUv6xcJRVEkMCdLxvy4Rv8nckP5AORbnhCK0zBDKbJElEMJe
 EM+IPhiqn/7FRzE1P97892j7jKlOKqzusRdF0vOZC/lqT49s4lDSc0+eC7PFTmICnRD6
 okBN7s/yd4RUlEchCSEAV1HTFVoPsngJq8j5Pc+JaiLZhomCgWUeuWXpSKwRdbMgpC1W
 yxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d2IKh9bfRS8H8vkf8ALRtx3REhAQvi8nYe04Kl4R7Mg=;
 b=qmEgFIkmjro9hvJoE8u7G7RAQjMCVQ1PJO76NUAyCwf46TmQxCQnw+eHl+FcgcQB3R
 8KmjJFGLBTLQgEaoMcEAJ2dPp4umgoqC5kgXm56/a3hY8dY/wgmXfqiNymIFHcjKZNtB
 oFtT8bzChJbUoEPicVdx4RqOzGbcUB8lT++n7g83erOSzHP0RkBm2ALkKriU6YkM8c1v
 kayTrN1Df8+jlczRuuelh4MxvtIae9d1qeZpeikeODC6lTgnEb0S/PNarfagskfisDgN
 CGW6Dgtl0Z1xWKy3S5GkF9/YnWcIItiIvIDor8zTrY4Y/v/71H8dLaSvKfWb1kNHeH42
 qLfQ==
X-Gm-Message-State: AOAM533EdcVMss0zR/AYyeKhh56Ptn0EcbtvWx+nSFiSqgWit/HhmsPs
 y3LV51HlLUgo2zhwVrteQfExJockusCAe3ONkDFXPCaIHgMPow==
X-Google-Smtp-Source: ABdhPJy953Ad4NPyxK4N7udABUNdHFHKigh54CwMQCeC1nkSBGpc+qayKpfUljhLMaSzcPi0aFV2t7BrF0QxesvlbOg=
X-Received: by 2002:a81:3907:0:b0:2d2:dc34:44ee with SMTP id
 g7-20020a813907000000b002d2dc3444eemr17393791ywa.347.1645385226407; Sun, 20
 Feb 2022 11:27:06 -0800 (PST)
MIME-Version: 1.0
References: <a0b237cd-8351-4389-bd7a-450586323e7a@VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com>
 <CAFEAcA_iv9Xm0c_CNzez4fQmXfWaA_dMjUOsgxqx9JoKFj_HGg@mail.gmail.com>
 <PA4PR09MB488001469F85B1B615B8864AEB399@PA4PR09MB4880.eurprd09.prod.outlook.com>
In-Reply-To: <PA4PR09MB488001469F85B1B615B8864AEB399@PA4PR09MB4880.eurprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Feb 2022 19:26:55 +0000
Message-ID: <CAFEAcA9okpY5YnegunPs_Mu5mxa0CHaz54ED8rJHHjT_ymGOQQ@mail.gmail.com>
Subject: Re: [PATCH] target/nios2: Shadow register set, EIC and VIC
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Feb 2022 at 15:37, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
> I can split the VIC from the core+EIC changes, although the core+EIC changes make little sense without a VIC to interact with them.
> However, I'm not sure how to split the changes to the nios2 core into multiple patches.
> The shadow register set, together with the EIC interface and interrupt handling are very much tied together.
>
> Regarding the "fixed eret" - perhaps I didn't phrase it right. What I meant is that eret was changed to work correctly in the presence of a shadow register set.
> So, the changes to eret are part of the shadow register set support on the core and cannot exist on their own.

> > https://www.qemu.org/docs/master/devel/submitting-a-patch.html
> > is our guidelines on patch formatting.
>
> In fact, I tried to follow them. I've also run checkpatch.pl, etc.
> Could you please point out where I failed to follow them or what I'm missing?

Mostly it was the combination of two things:
 (1) a large patch that touches both device and cpu code
 (2) a commit message that lists half a dozen things with very
     low level of detail

This triggers my "probably needs to be split" heuristic, and
also "probably somebody's first patch". So I mentioned the URL in
case you hadn't seen it yet.

> I tested this on Neuroblade board with JUART. I did not wire it to an existing demo board.

I think we'd like an upstream board that uses this. Otherwise it's
dead code, from our point of view.

That said, my suggested split would be something like:
 * VIC device model
 * CPU changes, in digestible chunks
    -- these should all be conditional on the "behave the same as
    the old code" default value of intc_present, I assume, so it
    doesn't matter if they don't all arrive in the codebase in the
    same commit. If there are any changes which *do* change behaviour
    even for intc_present=true, they definitely need to be split
    out, anyway.
 * board changes to use the new device

thanks
-- PMM

