Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A360307A3C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:03:18 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59lN-0006t0-2Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59j4-0005zR-7P
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:00:54 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59j0-00034M-3U
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:00:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id w1so8493819ejf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kwg4gdbZspXmiJL8+f2EgzLJGp2DZkO3F/HF0QXW/Q=;
 b=fgRNa1rjv2U/gthbSs4rF0jQTm9MGsr1//6c+rxFLLYK0MtqRZIkCaYk21xAldFxuH
 qSd0DkRIzuRhSX+YEkuaEE0z2qrlv2XMGjUUysvnJX+C4yMtMQm81CSuWxk+YGXCMCB5
 VjjP7+deTeG7RK7hwSe8lUOgS8wGZTdszASImkTKX7GxpwasVhfqpKwa34TttzW5a3n8
 pdlJS/A2D9SV602tv6lH1pucd17IC2o2RHLUIdpiip0ihHDluzjzC7je26jsmx6gcIeS
 sTAEV4FtcNhVbHiM+AanozzurlZsvdd+NKLRDul7W6SoFxO8C/x92JiBo3jwj4MQuCyN
 EdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kwg4gdbZspXmiJL8+f2EgzLJGp2DZkO3F/HF0QXW/Q=;
 b=nPraDtBc0GX2pKR50jtZAbKb985ve3PgNqpkeaErX6G7Ibbg6XirOrCXiMuTXa+zHQ
 Z+dIZfpfpzMjXwV/nz81cSDa1lHVKBkvKbslrX+fg6Coe3NpxpJX37MgSWDGLz7tjQH7
 4POG7Mq/m2BIOY8G6NALP2S7C/EB28q6poLY8JlRDZsxp5UiYCGg7Iqhb+kaP6Yue3yr
 LS+IZ22iM/0gGZ8jKKtYQ6DQyvCqCKe6GjnOnQMRE4Bm0Pf081qwzcDehaw7iQD8oScS
 zn3yLf0QdcuuKwukxKg+p6U0y21fmRtiTLySa8FSM6+YA6o0ypE87jpIyI7qNNlaaTla
 khXg==
X-Gm-Message-State: AOAM5312Y8ZaC13/GPuoy6UauLR/tIxbSGJTZe3GciCVmBfXM5I2uZEO
 //prYAYxP/w39khV6V+0VUvVRu2W7+ZYsFI+gvZ4CQ==
X-Google-Smtp-Source: ABdhPJwjOmuLzUTVIiaHaLFlRleMBpdpZLG3r4bY+rVWUMYxIIdLVoGbOAQQ8+r+bZlaWAuHMM8iw37D9XfjPiNW9BM=
X-Received: by 2002:a17:906:3603:: with SMTP id q3mr47871ejb.382.1611849647601; 
 Thu, 28 Jan 2021 08:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-9-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-9-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 16:00:35 +0000
Message-ID: <CAFEAcA_MPkZ_5k=erNdh68wg4WWN2R71s4y9UKhbvQdWa_Pzcw@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
>
> ---
>
> v1 -> v2:
>
>   - Fix build on 32bit arm
>
> v3 -> v4:
>
>   - Remove i386-softmmu target
> ---
>  meson.build                | 11 ++++++++++-
>  target/arm/hvf/meson.build |  3 +++
>  target/arm/meson.build     |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/meson.build
>
> diff --git a/meson.build b/meson.build
> index c667d64498..8302fcbd90 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,25 @@ else
>  endif
>
>  accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']

We don't support 32-bit x86 hosts so I don't think you need the 'x86' here.

> +  hvf_targets = ['x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets = ['aarch64-softmmu']
> +else
> +  hvf_targets = []
> +endif
> +
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets += {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,

This 'if' is specific to the weird Xen thing where for
arm hosts we build the Xen code into a qemu-system-i386/qemu-system-x86_64,
so it's the wrong place to add HVF stuff.


I think what you want is to follow the same pattern
as the KVM stuff, so just

accelerator_targets += { 'CONFIG_HVF': hvf_targets }

after the if-ladder where you're setting hvf_targets.

thanks
-- PMM

