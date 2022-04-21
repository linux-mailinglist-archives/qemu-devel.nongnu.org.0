Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBC509C34
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:23:04 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhT1j-0000HU-8Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhSsp-0001VA-Mt
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:13:51 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:34017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhSso-00071g-3J
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:13:51 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f18982c255so45438057b3.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFA+gdl20drpRlJnZ1dXLvLZSuptaBV7rLuEHj7j7aE=;
 b=aZFsLTUd3RxzO/W1UhN9+rK58ETSR5AzZFgw7k0fnLmOkgvAPWdRidKQrbMwSDSuRs
 6zuQRBa6Y2IdpuPFuyzuhX4WxYO7PLnNpv91jobsY08ishpyK6dWlNjsD5ngbgb29PRN
 v55hfFBrfsDbJck4p4WHjhRbiBlwN6KWdVSWAkCJGNpokrkmCzi2bUcN6aM37WAfZw8t
 L5RFuiKnpyMVGmQ0oY4SVuu5TLJWp4S1apB6FDjKkTOnCrg3mxfy4LxvHTjWcRV7AMlQ
 DWH5puHtSXJ7ux5Jlm+tI/dDbfX56rMxExJcLH6BbGxrQKi16p7yKDXjFNSUtqPe9Jxn
 e8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFA+gdl20drpRlJnZ1dXLvLZSuptaBV7rLuEHj7j7aE=;
 b=DkOvMZ4Hx/uDA7rt8qv5rIaEmcL+tsaa0YiGgY9tnstFH/lOR7pTM/amMWdrClNw0f
 RPkY4+4NJArcpTOF4m87z0X29AhS5THZNK0/5Muzwm4F8ZDABuzztTG4yWQUSDvZW9C8
 KBiTT2xGdRc1eBOLxIPq73pvG2t7rEpLqpdXbasMEcdTtp3wASBo+cTdLC7QSwpYX2XA
 tWcS0KKOAPu4qrS2vzQooINA5zcue96eYXyL8dUPRQnU7Wkx/YhQ005mOsn7jh+ZUjua
 edrac4SQ5MYMgEJk1xAutbEB+EDFrk7qCKENkbVeUsp/GbHp/loDbkAz0uxMZOYfa/vO
 B/UQ==
X-Gm-Message-State: AOAM530bKiOLiUpn0+GslQcmQZFZMfqh/MzUERMq/+tmqvsSNN1+EWWj
 g0wXjOIXDKq36XpqC4QJd6YgI0BMEXnqnNpJfovkEQ==
X-Google-Smtp-Source: ABdhPJweSbF4PNHPAZ7pP+YgXjZ3Oln7pzOMlyFsQqi6pYey6InyPZhIhygc9gsDMhHGD2vtluft1BvIan3toaNtHeQ=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr24178250ywc.64.1650532428944; Thu, 21
 Apr 2022 02:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
 <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
In-Reply-To: <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 10:13:37 +0100
Message-ID: <CAFEAcA9HtPAydeC+C5fbCQCFxjhnV9_tbncRFsH51Mf2MeHQyw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 at 20:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/20/22 12:42, Peter Maydell wrote:
> > On Mon, 18 Apr 2022 at 20:19, Leandro Lupori
> > <leandro.lupori@eldorado.org.br> wrote:
> >>
> >> PPC64 CPUs can change its endian dynamically, so semihosting code
> >> must check its MSR at run time to determine if byte swapping is
> >> needed.
> >
> > Arm CPUs also change endianness dynamically, so why is this
> > change PPC-specific ?
>
> I'm reasonably certain that we simply don't test armbe or aarch64_be semihosting.  Leandro
> found this because qemu-system-ppc64 defaults to BE and qemu-system-aarch64 defaults to LE.

Right, so if there's an existing bug here on arm we should fix that,
and that probably means that the abstraction split between
"arch-specific thing" and "non-arch-specific code" is different
from "PPC just overrides the entire swap function".

-- PMM

