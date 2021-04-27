Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C136C205
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:46:47 +0200 (CEST)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKIo-0007DD-TJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKFX-0005n2-UJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:43:24 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKFS-0003sL-8e
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:43:23 -0400
Received: by mail-ej1-x62a.google.com with SMTP id zg3so6994681ejb.8
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tZRjbUP0WYjN89PnE7p3uYzofbPvoxLzp2E2WJcMXQ=;
 b=gvbM+oklVwBTeNJYHKovRABrzgUUobjl4fuqRialwb5cJ0NfoIEU4FAjEZ01JtJX5X
 KjCm7agMP0hR1aeEXla5nVu0fN1PTo9MY/Ou9hP9rAoFePLTNgdmRoc92enILy4+bZoK
 pSvtfXU51os5XnqSNyLKrrJZxWKGHs2qC1/Pz1vnHENMN9gGXS3IZnbgQEy4AaENhq7v
 pFmBpwcSIDUZah+s/yR8Ypks4vTGvs1ovepueJQjoGB2mA/R51cFErl+E7B10y133GOf
 0KGBVs7IHszJVUSMnLzOtximsPx3Nj3FIpCuNdH9RZ0Kx9LwaXi2voiy48yL1y5XWkt/
 L++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tZRjbUP0WYjN89PnE7p3uYzofbPvoxLzp2E2WJcMXQ=;
 b=uf1G677MO2O9v9tPxHB0rzyPCssddI+DMpLMiV35/pa4+7h6OAHBmzTSrQ1LYp/w3p
 X1+01pEf2faFlcKOYHrw3Q1oL+tES58jnvotlvIo2gIFM2dNzVFh291iJhPbzrk9Fh4S
 +LXFYaJ826Ut3NO4ybHExCG9yy3ulLBNMQTQ/25brbQfXoy7W08x+cUs4nCI4Q4mVX02
 xX5we215tiU1pefbERlvp0ON1uxQ1qXy78G9u0Tlu7VSV2VLNTLimw5eBzuO6zilP+LO
 JaJ0hInTa5DoXWNBmwayodFob8GwDNYzJRDrYYcbC2bE/bvQUjUUSaDVSP9FCl1fGVwi
 EW/w==
X-Gm-Message-State: AOAM530yxOa1WYBcmOqwjHZzH+tZPJsyiPEGf8GgKMaI0FAFF8b8Tc07
 CPwWxnwsyaHQOLgYgAm+7Alqk9tWIE8uwnfMZ+CSIw==
X-Google-Smtp-Source: ABdhPJyjXrhKV+F2UdzJ/R+s2i7hjHh5QOvxo8/VKXWnZRLU6LBXvUl6dDWh2CpE2hPrGlencsdE61oyW4eTKS4kzGo=
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr22727676ejd.56.1619516596772; 
 Tue, 27 Apr 2021 02:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 10:42:18 +0100
Message-ID: <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Haibo Xu <haibo.xu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 13:55, Haibo Xu <haibo.xu@linaro.org> wrote:
> This series add support for ARMv8.3/8.4 nested virtualization support
> in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> has been tested on a FVP model to run a L2 guest with Qemu. Now the
> feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
> starting a VM.

Why are we making the UI for "enable EL2 guest with KVM" different
from that for "enable EL2 guest with TCG" ? Currently an EL2
TCG guest is set up with "-M virt,virtualization=on", which then
does everything it needs to enable virtualization on all the
components on the board including the CPU.

Unless there's a strong technical reason why KVM EL2 has to
be different, I think we should use the same switch.

thanks
-- PMM

