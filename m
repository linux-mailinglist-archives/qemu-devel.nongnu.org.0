Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67A3CD51E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:51:44 +0200 (CEST)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SkJ-0005Dh-MY
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sih-0003iU-1s
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:50:03 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sif-0001iE-8U
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:50:02 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x17so23734973edd.12
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HVFJE+IsSHhCFx9VZ3vRJrvdZmS+EASlcH48heScO8=;
 b=fD2AKY0T4r5wZf5w10kTN0rexWx7phlKLUIH2yP36tGoZuwVa4eH7Wa93XldYNd2c9
 UeBhqrTZyHhCaC5HyNEeDXH/bgeXHgq5QdWJr/ttj1BsK8sIYVozSNCJhG1QtZm5pP/3
 wvYwwFVXSH+lkJqqbGHdzvvpvFi402BU2K7V2/6Qivh4Jht+LAzGjhcmD7H8roAwybUo
 2pAmEwV7BbVhzEXtgJMxzy2vXMOe/UAbpcu3fWiuGiI6YwKOJLk+9Vg6EBWh7/1USamB
 ZWakke2lwwd0a7baCJFWV27UCnuuw+e0hTRZJQQO9DM1PVZPFFzBIbJRFCy2JgNyv/BN
 5CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HVFJE+IsSHhCFx9VZ3vRJrvdZmS+EASlcH48heScO8=;
 b=egiIsIdPha/daTfZ+WN/I1qKuPL7Ercqv0g3tKBA6S4xfyVdEfgZ3pD90bGZ5I6Ta4
 cQu03u3/v6PvXjjazLg9aErn71nU7a1wlhnFrpGg7wSPghsUo42fChBfefTGjhRe3XCi
 iG50/qLQDB/6l3/CaWnlakCOb1ObZoJB1yCyssDadLymcHPp9QAMxCwXHU8zgDClpzU1
 eQvkcBg0JN+ufCPspuscW2t+XOASFQGHFJ0+5+NJHin4cEJGgNneNeOBjpT1oUjxY5uR
 stsH1xSwm/k+5Ug2/NdMhl9Ypv8ALDwULVjIx4Pw/HxyIpsMc7gk+9A8hGCbDqsgRDhS
 FDzg==
X-Gm-Message-State: AOAM532b5T1iwQ5NAOeQ3eXkxUO7zSVw6XmyEtS/nJQm+hXN7B7VzKtp
 lDSZlahV0gCy9Xe405F8aNp28dGNwX6meAXPmekTnQ==
X-Google-Smtp-Source: ABdhPJwQ8iFJooDAGdyIZZuvEYHIT5duDrg/WGIJ0KQ934wT7oWA0T0AzkfrIAME25q383nsFTIxRs2zNB/qlfScZM8=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr33704942edy.44.1626698999391; 
 Mon, 19 Jul 2021 05:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:49:18 +0100
Message-ID: <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hello, everyone.

Hi; it looks like something with your outgoing email setup still disagrees
with QEMU's mailing list server :-(  As far as I can tell these emails didn't
make it to the list, so only people on the direct-cc list will have
seen them :-(

> These are a series of patches to enable the Fujitsu A64FX processor[1] in "machine virt".
>
> [1]
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitecture_Manual_en_1.4.pdf
>
>
> The motivation for creating these patches was previously discussed in the following RFC.
>
> https://lore.kernel.org/qemu-devel/a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org/
>
> This patch series is a fix to enable the A64FX processor by specifying "-cpu a64fx" in "-M virt".
> In the future, we plan to implement the implementation defined register group of the HPC
> (High Performance Computing) function[2] which is implemented specific to the A64FX processor,
> but since the A64FX-related functions are not implemented in QEMU at present,
> we will first implement the minimum necessary functions.
> However, since the A64FX-related functions are currently not implemented in QEMU,
> we will first implement the minimum necessary functions.
>
> [2]
> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HPC_Extension_v1_EN.pdf
>
> Since this is the first time for us to contribute patches to qemu,
> we are sure that there will be some incompetence,
> but if there are any problems, we would appreciate your comments.
>
> Best regards
>
> Shuuichirou Ishii (4):
>   target-arm: Introduce ARM_FEATURE_A64FX
>   target-arm: cpu64: Add support for Fujitsu A64FX
>   tests/arm-cpu-features: Add A64FX processor related tests
>   docs/system: Add a64fx(Fujitsu A64FX processor) to supported guest CPU
>     type
>
>  docs/system/arm/virt.rst       |  1 +
>  hw/arm/virt.c                  |  1 +
>  target/arm/cpu.h               |  1 +
>  target/arm/cpu64.c             | 49 ++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/arm-cpu-features.c |  3 +++
>  5 files changed, 55 insertions(+)

thanks
-- PMM

