Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1A30ADEA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:33:02 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6d4Q-0007JL-0J
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6cvG-0008PN-Ti
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:23:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6cvF-0002Pz-2k
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:23:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c4so14761968wru.9
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ucsvOyKHI+j26d1+CCymR51CUFNgYRXthquyKWI9Qpo=;
 b=QJtyUOJLHrWfcXzoFmh9ZJaP2+QypJrswtnJF+QFICsC/koCEHML57IN3oHC0W4/PC
 UPCsE3NDEUbOQe14tOF5VQIGHJpS75kjFcujixlCIOPYlOa0fvUqT8mS/EPJqfmaqi2o
 jky/rKVM6XtIR+2qY3jo16QA2ATZpZANEad/pYX9t7BIQxFU6yfCddgXAQEQQeKXwWx6
 06U2isp8ecUdy6P/wiKMTOl9/tEjciI71QDO+7Hm1GTfx8YW9HgAqDndLLF7Qp5cKPu6
 Ij2mhffUsuPrhl7WCzVwQ+OqgHOiP4bpaXvEyduraJOJlcwDSHfFFZCPsWCbVhSzEzxp
 cQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ucsvOyKHI+j26d1+CCymR51CUFNgYRXthquyKWI9Qpo=;
 b=VIqt75/fOi7euuPLrhmUJk0JuK+NGUmLOA/4ay8FT24fqQcEzi99JgXRx9IGjhEukl
 cL7Rh8inXlbLVnqpF76PKAewlLlmNwsl/C4+k9GxSTmabID+X1g5FusjfIdGVelBziqk
 9KuUrxLtTDraRtZBH0MLWyebzXymJDZToejwVx9KqyI8T9qoGTfPPIRy3BhQCpLsQA60
 o/PfoVeVKCxqWVNOTZK+i88uPleplW9O8aLGFc9DiNejh6ozpFpn/HOxtkZFhSypxwGO
 +MjW3puYo0Jt0MJE9TXk5CNqK+LWvJYOHahWy8NwLOjtNq498gcc5ksD8AYVZ216D9uB
 fCSg==
X-Gm-Message-State: AOAM531zz44zhO1bFBJI3wy9NsV+oavoxU/ug6xTwMNpxwrxW+vbnvr6
 gOPLo6ifJpZPEBt3hcAjix+25Q==
X-Google-Smtp-Source: ABdhPJwjXhuymWPBu9w7pMkUStNsTqsql1I38VMvdViw3X/SZ+v0JHnQDqk2NLIEDLRdRpn/ybKk8g==
X-Received: by 2002:adf:f512:: with SMTP id q18mr19318659wro.55.1612200211410; 
 Mon, 01 Feb 2021 09:23:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm27127413wrp.40.2021.02.01.09.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 09:23:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C6931FF7E;
 Mon,  1 Feb 2021 17:23:29 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-6-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Mon, 01 Feb 2021 17:18:59 +0000
In-reply-to: <20210131115022.242570-6-f4bug@amsat.org>
Message-ID: <87a6snvh0u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> Only enable the following ARMv6 CPUs when TCG is available:
>
>   - ARM1136
>   - ARM1176
>   - ARM11MPCore
>   - Cortex-M0
>
> The following machines are no more built when TCG is disabled:
>
>   - kzm                  ARM KZM Emulation Baseboard (ARM1136)
>   - microbit             BBC micro:bit (Cortex-M0)
>   - n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
>   - n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
>   - realview-eb-mpcore   ARM RealView Emulation Baseboard (ARM11MPCore)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/realview.c                       | 2 +-
>  tests/qtest/cdrom-test.c                | 2 +-
>  hw/arm/Kconfig                          | 6 ++++++
>  target/arm/Kconfig                      | 4 ++++
>  5 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0aad35da0c4..175530595ce 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -10,9 +10,7 @@ CONFIG_ARM_VIRT=3Dy
>  CONFIG_CUBIEBOARD=3Dy
>  CONFIG_EXYNOS4=3Dy
>  CONFIG_HIGHBANK=3Dy
> -CONFIG_FSL_IMX31=3Dy
>  CONFIG_MUSCA=3Dy
> -CONFIG_NSERIES=3Dy
>  CONFIG_STELLARIS=3Dy
>  CONFIG_REALVIEW=3Dy
>  CONFIG_VEXPRESS=3Dy
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 2dcf0a4c23e..0606d22da14 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -463,8 +463,8 @@ static void realview_machine_init(void)
>  {
>      if (tcg_builtin()) {
>          type_register_static(&realview_eb_type);
> +        type_register_static(&realview_eb_mpcore_type);
>      }
> -    type_register_static(&realview_eb_mpcore_type);
>      type_register_static(&realview_pb_a8_type);
>      type_register_static(&realview_pbx_a9_type);
>  }

This confuses me - are we even able to run a realview image under KVM?
Surely the whole of realview should be TCG only?

The rest looks fine to me though:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

