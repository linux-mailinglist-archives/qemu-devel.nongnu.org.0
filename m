Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D519A3A6D03
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:19:12 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqEx-0002bb-C8
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqDg-0001jO-Pm
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:17:52 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqDe-00034y-Ku
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:17:52 -0400
Received: by mail-ed1-x530.google.com with SMTP id f5so42520755eds.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6JwgpiyD4ciFifob5L4pR32YKZ0jguYL6EIHRqdYJY=;
 b=ZwtAnFoXIru6GLOoZAuNx8dL0/VnlBZ6ewoUsuYJLED/+z6inemsCWlzOSjinIwx5I
 2dxcRyMrJM7Rg8xZyvWr7hmIKlg2bNiF3cr3tGxPVxs1C1eRmbxcJjzGYcgsunxaFs07
 zvCUSzMn+Oy15dZkBpxulejPgLU1aelFDvT17YlJiAVJEtDTnFYkv1NgSFDD0fnlS4OQ
 etUeO2UA+FjKmqy/u/hFqTpdzd075bRHXO3WhaSqNNG2oSOiPuxozFumeJN6L/PnXNvq
 rebi6JKr/tayrTtUcDogRLZQvwMXKhTGk8g1ktIwCXyC2P+nDsMrmYiJO7XktrODk1Lq
 Qlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6JwgpiyD4ciFifob5L4pR32YKZ0jguYL6EIHRqdYJY=;
 b=mOKGRLgoTaVUtZZJS65nohEtnJ931GIp3whgE7wUSb6Ewc2DBzTQMZKAXcheeA9mvi
 97cGizojUVimlFO10GVdQU/UpKe+pUCLC4UIw4O+Ca9GYRyNF4vara9uRU5zgLFyq/xv
 1/t83qeyKG17yDszFHGCUvaz6UG8gErQ5m+ZQt/rVzdCdZzFyn6DLXFqkj4qn7Rl8VY7
 U41BfLJhZt9l9ScUtG2X/ScPHWpTA0pUska91eB8OuL7W339AGxAjXse7oNH/xz9ZPky
 4dSHpwR2LEncROysR2O+iyyXpSyhor2hyVbeXckA8LJX245j5vaVZv30S3RpQbgTCvKS
 cZtw==
X-Gm-Message-State: AOAM533T2bw2QKu2LJ7QFRA+Uu0R/Rru+2w7gw4/GQsogcgztTXpyEP5
 37lG4MslLcSu5bRUFpQjOw+U3eFoojHJEUGS4n99oA==
X-Google-Smtp-Source: ABdhPJxu4uIp1sg78ttxGbIqe1jHZDY3bVLPhi7lGlxIzJJz58eQLEZvQqswxs0jNeF2Ina72s2SEGBqdhNAnjFs1yI=
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr18075290edc.44.1623691068647; 
 Mon, 14 Jun 2021 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
 <87im2kzwj8.fsf@redhat.com>
 <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
 <c6e20262-9602-6bab-9458-9a9b11633b2b@gmx.de>
In-Reply-To: <c6e20262-9602-6bab-9458-9a9b11633b2b@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 18:17:13 +0100
Message-ID: <CAFEAcA_=6RL3t2h5dZcDoqw_0U-C22B=53JamPVk5aHx0u+sJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 17:25, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> File MAINTAINERS does not indicate for section "Virt" where the relevant
> git repository is located.
>
> I assume that you relate to
> https://git.linaro.org/people/pmaydell/qemu-arm.git
> But I can't find the patch there. Do you still have to push?
>
> Please, add 'T:' entries in MAINTAINERS for the sub-systems that you
> maintain.

I don't maintain the target-arm tree like that. I accumulate
patches locally, and only push the git branch to a publicly
visible location at the point where I've finalised what's going
in my next pullrequest and I'm sending out the pullreq emails.
So providing a T: location would be of no use to anybody, as the
tree would always be stale.

-- PMM

