Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A876230CF68
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:54:09 +0100 (CET)
Received: from localhost ([::1]:38054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Yi-0000tD-NB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l74Sq-0001Cx-Vn
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:48:04 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l74So-0006pw-1C
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:48:04 -0500
Received: by mail-ed1-x529.google.com with SMTP id g10so6493539eds.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8p5/6UfE4UJbHAYjEmL3Zo+mFbvNGhGC8gLQUcocc4=;
 b=oNDoYWI3hNUTR50pR20MMlWSxuoNvM4rOSmiUT5wdtrvX9nWQdEWJKzqA0vcxiYHYG
 jEf0UHFgOYgqbJo9dry32BQdo0PhT+les1vmzAIoHzcyharoTYRMYpY6VKD0cx+39Jtm
 4VwxOBDkUBwm3wulO4XWQlNK79Rt5nclc8xQhUpgYySZa85dqzXqnlsETJRy4lZVugOI
 3unE4gHCV2ocPhuP5imk3jZjt72X4akpcuTZfO/fskR2xmFIz9WHIm66WORzDmiCWplL
 qQiIkw3XBibzRjWcApEAraMHFlM3JHTdfMI9Ew2cSeUpYphBVxvITNEKKb/CqnL/gnG1
 w6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8p5/6UfE4UJbHAYjEmL3Zo+mFbvNGhGC8gLQUcocc4=;
 b=Huju5Rx6nzTN6kVXyT0C6+krUDkYOY0m8vPfMbkC7a81yr1q/J30Ew1r553IJPdL0Q
 wi3HEjiWQditGA/HHWIs1NazADLnA0A3rY4x7pH5KM7CaVf4D3iM/Pxw/TVW3C3AHAqX
 T4WGliLvpkdLekaKzSQCqvxRAG/JMCe9Fs7q88dpIymxkN9ZpBb8LVn3AF/3QPveaz2Y
 uJhZJ2BD232Uu/FDy6Hlm2jWPR4fuoaiU1WYe4OOWQ43bNsF9n/dgCU7bZXlXsBag4JI
 CshAMNBN+SXRRHwkOBAnDRjPcBnCUslo6peNLvJBDJFbp8v1n4KIkMHiJc86p87clAFE
 KqQw==
X-Gm-Message-State: AOAM532wXcSE9yoAOr9n4bo5wtEFLi4AnUNQU8Nia2Tfj5xqy/PgfojI
 1wL6PSudxU9pZqgkie15xJD6sFB0AzcwotceP+yCyA==
X-Google-Smtp-Source: ABdhPJzJnpv9KaL0zlEtg2fBL0L7XMK68pEVs7fGN/yzWQyAEqEms+dUyM1kLlVw0tRaR6k4ZigLWviI2dMLNmNbku8=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr337660edd.52.1612306079546; 
 Tue, 02 Feb 2021 14:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
 <20210202162319.GG5184@merkur.fritz.box>
 <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
In-Reply-To: <4f3fcae0-49cb-a1fd-4878-118bcc15287a@virtuozzo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 22:47:48 +0000
Message-ID: <CAFEAcA-7AT1vXKTyc7hZG52gwUpRgAGqcmNTiQNjF2PtKf=4RA@mail.gmail.com>
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 17:09, Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
> Note that 30 is known to crash sometimes. Look at
>
> "[PATCH RFC 0/5] Fix accidental crash in iotest 30"
>
> https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/

It certainly seems to be the least reliable iotest in my experience.
For example it just fell over on ppc64 on MST's latest pullreq merge:

https://lore.kernel.org/qemu-devel/CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com/

thanks
-- PMM

