Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AF36D7DB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:59:07 +0200 (CEST)
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjmU-0002wT-Vb
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbjg0-0003Bg-OO
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:52:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbjfv-0002L2-0q
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:52:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id i24so14473258edy.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjDLXuGyetDGwyIe0noYk/mKSS1P9LrAldo3ar7wLqs=;
 b=yYlvcVCnAs13ORClWcAZHrhmcq2WuTHHU1T/ntRQQwSusqSe7DexfyZ3ykbIQCGO2U
 ug7lF/1UhptIdgt8IvGiS5dr64jdoqe9Lx2bNOtLSlRxibaaOp1n1K9iJjS4KD9gmAW9
 lAwjOXgKbiM0ZcSIiWNR2X509zHQcsr9YSacDfZ7LHL79mr2Jgm0qrHnyWwgK0XFpslz
 LIyFFViCo4makswZIiIqjWqZjBykEFeF9JS9ZLcXK5P7AhPC2dLT69AIudTGIJmajD6B
 3kKQOvBOQMnBYz7AvUtBGw/dMx9CnumhP0EUa1zNazBPI5z8e2zyx8QAm5BbKSQ2dYLa
 7NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjDLXuGyetDGwyIe0noYk/mKSS1P9LrAldo3ar7wLqs=;
 b=itpOphdvk8aqq8nAIu8QZhLXMkXl6rXdIQegDADg/EPQClhHyapgQKcfiFtJiGkFaZ
 EfBQCXBFZd5uhVsz6lGCNZTtQ2wsjgVfhjx55N+fULPfR/0c1D37g0EkFlLTfwflMd+y
 c0XRc67gg9Y1HvKEgtKny45yyK4ih2Pc1z1dc4NlDU8eB95bswidHQWw5hi4daS7SXnn
 FruLOcZNlSi/mbQ3PFoyphHDgr3B/rihXOrpMqHZiwYR4bkMK1+B0Yce7TcrQUWUm9kH
 v3hs4GVMsfvPt+50bsszfJ9Hw6aAUeayy3uj1tqoW36ZXOZBKUnJvtS3qvOziYvUmAlQ
 Evqw==
X-Gm-Message-State: AOAM532ZsEKDrfn5KTX8zs7byyuCS5kjQAiJ58p4m3+L56ug19VSfH1H
 Lpqn/0ZBdkBSfewIF+ZKw2sXoK7cWbjdVl9uxBF/QQ==
X-Google-Smtp-Source: ABdhPJxNtW/upSxBbEjZa20ktFi9Bt/KLuOyE1PpIt6QXzh3K8opS8cNaok4YEuZ3ONe64ynzt69/dYeUjJk9+GFYmA=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr10958919edv.204.1619614337128; 
 Wed, 28 Apr 2021 05:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
 <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
 <20210427212707.3tckau5r3kraciam@habkost.net>
 <87lf93q9ul.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf93q9ul.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Apr 2021 13:51:17 +0100
Message-ID: <CAFEAcA9u1ftq94B1HQhAb0=909VfvcU1d5FVUwkbJ9orexBt=Q@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Edgar Iglesias <edgari@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 06:03, Markus Armbruster <armbru@redhat.com> wrote:
> For what it's worth, Damien further explained the two helpers in
> docs/devel/reset.rst:
>
>     For Devices and Buses, the following helper functions exist:
>
>     - ``device_cold_reset()``
>     - ``bus_cold_reset()``
>
>     These are simple wrappers around resettable_reset() function; they only cast the
>     Device or Bus into an Object and pass the cold reset type. When possible
>     prefer to use these functions instead of ``resettable_reset()``.
>
> I figure what's missing is guidance on how to transition code from
> legacy reset to multi-phase reset.  Ideally with a working example
> people can study.  Damien, can you help us out?

These are two separate things:
 1) callsites which want to reset some other device, and currently
    mostly use eg device_legacy_reset() -- the transition to be done
    is to move them to use device_cold_reset(). Similarly, callsites
    which currently reset a bus with qbus_reset_all() and should move
    to bus_cold_reset().
 2) devices which implement reset and currently do so with a
    single reset method -- the transition to be done is to have
    them implement however many phases of 3-phase reset they need

(1) is easier than (2) because there are many fewer callsites
trying to manually reset devices or buses than there are
devices that implement reset.

thanks
-- PMM

