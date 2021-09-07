Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0340299D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:20:59 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb22-0004cU-6S
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaa7-0000U3-1r
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNaa4-0001RU-E3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:52:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so1733722wmn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wovuk/YJ4ZzxTgEM/WTOLuXvX25Yjntehj+QQBKkeck=;
 b=K76J8SyL+1jOA8UfApaeCDLxztO+LZ8h4Nx9PbBNYsr+paYOiEqK9OIn2ldFs+7jzC
 YEttCcgHMvN3u1/0AVrT+pgr4UyIN1fY0TWDjPrCpijQjVadGHS6qCJxNRMRydMpbkpe
 vklWQApsPXT85SJjEbrr4whDc3f1MVpzfNFQ7ks6sAhOJgokRCkk4axYWPqo9Gq8UOEF
 jTjR2dGFy5N5XLZ6yElzSZACsjQFOUeQqAW9Htb6vbipQslVAql4L3mbDnFLy8aIY//W
 PjA+HrI7kjxQ45KDdftoS1ecm4AaCZ37azSPgx8Nz0Y44zMdL0lD1CCofVVAd3cPXEKz
 fYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wovuk/YJ4ZzxTgEM/WTOLuXvX25Yjntehj+QQBKkeck=;
 b=FnZVdSGXssf1W1xdEs3XGodBVKLwVO84Bo1yjUT0qJCQbipmJhRWr/1eI77fSRINDT
 MDNvm2aEtcDU7Q2luPKV8yWiv/sXQ3Ftjw47NVgp6SNzDPWvc5bUmwqSKVcFtPqvrJVW
 SQWt/du1o88DwNl2EDoVm+k3qaFX+5CImT4C1b1MiZx7NfRxdDCndQkshNF5xUbD1mgc
 HHDTEN+B9AMYYoi4+twabTw6GyD/J2kYcaTSb82s13nmiiFZXbLlGbHDODYoJIvDIYyO
 IoBt238Dv2XUWzUIb9twVhwHDL4ogMKU6kRtwnaMBqBhyTTS2njiWOPvaefuddGM9j3U
 DETw==
X-Gm-Message-State: AOAM531JZl4aNs9ycKQVRZV23DDiOE5iy/yKYSeJVAzru+512dHalVqu
 yJUrOC78WtCjMF/Kw6EAJFSS2zeYktVPhc0rtbLQfw==
X-Google-Smtp-Source: ABdhPJzN1k5vdacf8pXMz+PcUOlliO8oElhlm9+Wxx2tO4deEucQ0q5nA8yws4gRRyTPG0HwiEfKkeMxeGbJ78NSUUM=
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr3850083wmq.32.1631019122955; 
 Tue, 07 Sep 2021 05:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-4-maz@kernel.org>
In-Reply-To: <20210822144441.1290891-4-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:51:13 +0100
Message-ID: <CAFEAcA_J5W6kaaZ-oYtcRcQ5=z5nFv6bOVVu5n_ad0N8-NGzpg@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/system/arm/virt: Fix documentation for the
 'highmem' option
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
>
> The documentation for the 'highmem' option indicates that it controls
> the placement of both devices and RAM. The actual behaviour of QEMU
> seems to be that RAM is allowed to go beyond the 4GiB limit, and
> that only devices are constraint by this option.
>
> Align the documentation with the actual behaviour.

I think it would be better to align the behaviour with the documentation.

The intent of 'highmem' is to allow a configuration for use with guests
that can't address more than 32 bits (originally, 32-bit guests without
LPAE support compiled in). It seems like a bug that we allow the user
to specify more RAM than will fit into that 32-bit range. We should
instead make QEMU exit with an error if the user tries to specify
both highmem=off and a memory size that's too big to fit.

thanks
-- PMM

