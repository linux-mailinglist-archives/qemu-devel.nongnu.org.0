Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B74B3AF4
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 11:48:32 +0100 (CET)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJCQh-0001Sm-RU
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 05:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJCOL-0000gK-24
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 05:46:07 -0500
Received: from [2a00:1450:4864:20::436] (port=43606
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJCOI-0003qR-RE
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 05:46:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id i14so22347898wrc.10
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 02:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PQcF8Y+i7eV4kkrW2kf6trBLdlKoGxKPY/8Iaq1QQj4=;
 b=ecFXnrWY3adlMoX/kiqi9gvnmpbdmuDKmYvskGDXFo65y6coRh75wuFfZ0jVKJpeTo
 Xly8qDiRP2rzciOZEsD5CXU+3bYqfg3dXJBZT29arqtSrAXd0xyhT6b1d+DyW0/w5Njc
 1qsPzNoaYLqfVSkhCj7BVQFPJ0W9U0ug6rDn/VieJSBS2vCiihQpvqZeM7Kiw0a4ldhV
 VsK/3Po+9waC/y+qqk+Hp9zRT0u7s6d/kw0iSyDkF6oNwlwOMGOVI+IMNKRiJOUgudBK
 veLvX5PS0pxfMqVbFHpbDkb/oFhI+XWf8KOXMIut1esDuAoKOcGaNEz8J+Unb4zskHzP
 l0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PQcF8Y+i7eV4kkrW2kf6trBLdlKoGxKPY/8Iaq1QQj4=;
 b=L8a6qacpItzMMuONEvkholETdVt50hgHLda1w3N/UBKNnXTnNvYcCTMRHVBx3d2EM9
 T3RnW7sIeLCibt0LXC2DidguocAUz2OJrLNvorhnQ4xxNg+cOntwj2cg5H9Z5Lfb32gm
 oGMW9ZLUAMSJmjfEgOcg/0esJshyIasFRII+JYQZuXUh6FbTYAT6zqrD+0mGV9gwfkrK
 TJkPeu2oXD5ZVjDQTDOeFqohVP6tYBpMFxfzcifdIO7N4E/mLfa/0IgTZoTQCy62g3nF
 dDk4I45cVe+32mLlJ5fNqhwI6RR/6OXXDOzlSbss52vd0dZliW1OmovTXk43MExmzBek
 r/ZA==
X-Gm-Message-State: AOAM532Fca8BAfutYfBJ4daRqn4zWjN42dpNyaV+QjdE0fznJBlDx/Yp
 Ygpvcj7UeqAfpYEO38BtQmxO/Vg+KPCOdzsyXP6TQg==
X-Google-Smtp-Source: ABdhPJyNontRdkRP4Jo3hktzFuN0UpoTAZKFoEiu6aBmNtZv1VP2RcJJIIDNzITalzofGnN/carqm1dtedUo76JYQgA=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr7463092wrv.319.1644749161346; 
 Sun, 13 Feb 2022 02:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20220120123630.267975-1-peter.maydell@linaro.org>
 <20220120123630.267975-19-peter.maydell@linaro.org>
 <3f4f5e98-fcb8-bf4d-e464-6ad365af92f8@gmail.com>
 <87iltjxdz6.wl-maz@kernel.org>
In-Reply-To: <87iltjxdz6.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Feb 2022 10:45:50 +0000
Message-ID: <CAFEAcA9yR4=PNCGJk6iMEq0EHejwwt-gQJfvByEk-EN6ER5o_g@mail.gmail.com>
Subject: Re: [PULL 18/38] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022 at 10:22, Marc Zyngier <maz@kernel.org> wrote:
>
> [+ Alex for HVF]
>
> On Sun, 13 Feb 2022 05:05:33 +0000,
> Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > Hi,
> > This breaks in a case where highmem is disabled but can have more than
> > 4 GiB of RAM. M1 (Apple Silicon) actually can have 36-bit PA with HVF,
> > which is not enough for highmem MMIO but is enough to contain 32 GiB
> > of RAM.
>
> Funny. The whole point of this series is to make it all work correctly
> on M1.
>
> > Where the magic number of 4 GiB / 32-bit came from?
>
> Not exactly a magic number. From QEMU's docs/system/arm/virt.rst:
>
> <quote>
> highmem
>   Set ``on``/``off`` to enable/disable placing devices and RAM in physical
>   address space above 32 bits. The default is ``on`` for machine types
>   later than ``virt-2.12``.
> </quote>
>
> TL;DR: Removing the bogus 'highmem=off' option from your command-line
> should get you going with large memory spaces, up to the IPA limit.

Yep. I've tested this with hvf, and we now correctly:
 * refuse to put RAM above 32-bits if you asked for a 32-bit
   IPA space with highmem=off
 * use the full 36-bit address space if you don't say highmem=off
   on an M1

Note that there is a macos bug where if you don't say highmem=off
on an M1 Pro then you'll get a macos kernel panic. M1 non-Pro is fine.

thanks
-- PMM

