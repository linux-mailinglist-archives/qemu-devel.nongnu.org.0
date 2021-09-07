Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59301402CD1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:26:11 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdvG-00053P-Ev
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdtq-0004AL-Dn
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:24:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdto-0008Fg-Ok
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:24:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so2289654wmn.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4Ax+9/C1uve8mvUty6BQyV5S5Qa2H10nELZRpJzD9E=;
 b=D/vDkWN9uE+c65lbnU9z4sa5sUtWlMCg0FLbe1cSx2UqqqVNrD13EZ6d4pmsbVR3le
 IElboXbizu9BR/1HADCALgP9hY28+hQDe++W+9ZND89UCoocvc2PbfivsO7RXK3xbbEk
 Y4MLohInbeAenJpR2DHmdsoz+jlIDgIfjsf/dSnrbWPlAcijOPfXHcIfhxvL7BLHjrye
 o1/yrQSzbcEJlSp7s6bzx5lwZUTurMpcp36jvN3iuc19uDU1xjrhoePZ+yCJyzL62rFn
 PRJ/gMQEssW07Rsw0cijqta6LtMNfA6nfdtwiVu5CUwGLCrKVoRQjxRCdZYnlamuRE3N
 Zb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4Ax+9/C1uve8mvUty6BQyV5S5Qa2H10nELZRpJzD9E=;
 b=PXEyboqjRcEteuH4eWO/Asi7Rnzv/MLurwR7OjFVsjhcUQCtT7wsOOL0LRPCCv7OoU
 3A+nxf4x7fQG79ZYUfstw35WuaayQ5lrQnsyldGSgf/uIKQgIx2hvuNPvqbEX5mkgfnP
 42Zg+nZwZ93K5nS/8CKXKrkrVAkquFRZcI+l8E4mv/MqRP+WWn/O6pc+/dch92rKqD7t
 C+VNBL8ICSdIcEfX+GNx3xU3bFwSEVSpv74rad4hdzhJNkT7ja3VILaLapfMujgRHyTc
 WJkt6hQJVafndFYDmuqdk7kbbCMBMB70h+7zHb4ZyDkdPS0K+rnw2JCFF+3tIyY0dtZU
 nkrQ==
X-Gm-Message-State: AOAM531Vivi32QBZ8saxsZ/QE6WBAfR+74tMm4LfVSUF/t99wga2YbAl
 D+4UMz+evWhxJiU+/ZT7TaL/szoIKswq9ZGosbvN6g==
X-Google-Smtp-Source: ABdhPJxM7XHYu/D4TMi/UN5+/68cJp4ORvrY65FJPypIlpy7BrIFJIusrHDzqnTj+bkRTqcTWwmwRdkAoWV5ejjfB4g=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr4876017wmj.37.1631031879123;
 Tue, 07 Sep 2021 09:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210907155641.197844-1-pbonzini@redhat.com>
 <20210907155641.197844-5-pbonzini@redhat.com>
In-Reply-To: <20210907155641.197844-5-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:23:49 +0100
Message-ID: <CAFEAcA9qx95dEcYh10Z5wnJ=kazaJwJOq7_1Czq=yPV+yimkCg@mail.gmail.com>
Subject: Re: [PATCH 4/5] docs/system: move x86 CPU configuration to a separate
 document
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 16:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Currently, cpu-models-x86.rst.inc is included in target-i386.rst directly.
> To make the toctree more homogeneous when adding more documentation,
> include it through a first-class .rst file.
>
> Together with the previous changes to the man page skeletons, this also
> frees "===" for the headings, so that cpu-models-x86.rst.inc need not
> assume anything about the headings used by target-i386.rst.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/cpu-models-x86.rst.inc | 4 ++--
>  docs/system/i386/cpu.rst           | 1 +
>  docs/system/target-i386.rst        | 8 +++++++-
>  3 files changed, 10 insertions(+), 3 deletions(-)
>  create mode 100644 docs/system/i386/cpu.rst
>
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
> index 9119f5dff5..6e8be7d79b 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -1,5 +1,5 @@
>  Recommendations for KVM CPU model configuration on x86 hosts
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +============================================================
>
>  The information that follows provides recommendations for configuring
>  CPU models on x86 hosts. The goals are to maximise performance, while
> @@ -368,7 +368,7 @@ featureset, which prevents guests having optimal performance.
>
>
>  Syntax for configuring CPU models
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +=================================
>
>  The examples below illustrate the approach to configuring the various
>  CPU models / features in QEMU and libvirt.
> diff --git a/docs/system/i386/cpu.rst b/docs/system/i386/cpu.rst
> new file mode 100644
> index 0000000000..738719da9a
> --- /dev/null
> +++ b/docs/system/i386/cpu.rst
> @@ -0,0 +1 @@
> +.. include:: ../cpu-models-x86.rst.inc
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 22ba5ce2c0..c9720a8cd1 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -19,7 +19,13 @@ Board-specific documentation
>     i386/microvm
>     i386/pc
>
> -.. include:: cpu-models-x86.rst.inc
> +Architectural features
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   i386/cpu

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

>  .. _pcsys_005freq:

This reminds me that we probably ought to clean up these weirdly
named labels that we inherited from the texinfo-to-rst conversion
unless we're actually using them.

thanks
-- PMM

