Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9224A4C27
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:31:03 +0100 (CET)
Received: from localhost ([::1]:36526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZa2-0006CR-L6
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:31:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEZBp-0000T7-Er
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:06:03 -0500
Received: from [2a00:1450:4864:20::42b] (port=40534
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEZBh-0005Gb-4Z
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:05:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s18so26337239wrv.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEfn2pojLozNmUMOwDvm6c+bChdP10HVlHqV/ePIIis=;
 b=UIEW2nm5uDaHCbWYLNTF1bOI7+8HyoKZBqfNzjTpFnPyxbb4ivL6HLxDopwCfZvH+S
 lab8pwBSaPGWqM5BwYn6sCjT5NUwtbtDsvjduccYojLpkbGlMwwyBgi5RSTMe303a4Q9
 eiinGJQzQ33vwWa+2HOW3zG821V/YwyC9mXl/tljo0dvUqP4zo8ssVUNoRTaxHu3IDq8
 wKyG6cmSVW7S5vaV8AficqPWRgzslRzQlDLfwQETpqh+HgzA22hORRUwCQhfYmW6fvBd
 FXVN8PUbgtoyXW+Ov8eDSyEB9h9RGPYD9FFPB81tFsCrltRUwoSScBEQKEdY0BsGJP3+
 g3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEfn2pojLozNmUMOwDvm6c+bChdP10HVlHqV/ePIIis=;
 b=jG3QhHCx5ykUmriyKYwLaX1FBW0q6TmAtzRR/BmqX5XdiqcVDIaIvycMd1BcwEI19V
 ObYGZViBjAEYpt5g1jO95L1aBbIhXalHwJhQ2etctjT5mlFHA1Wet+bhm7+q68hmHyoG
 xgcaLW7hM8WqjAhAuig8YzTi7fLaZHv3X9xqfu0vljDFPHfzoXwpMuOEgWFpgPDzVQN2
 RGwIC164/oM6VRHyY2rUP69HHv+jwiUu2oDOxKtB2bzmBsv8d6THzdt8EwM0Vr71B8Ti
 6p70K6KP51anN+DP/rgDlrhB3rYQT5EAB4vsXKozWWs157FlRAb+tvB/4iXabYE5Xi9P
 +x+A==
X-Gm-Message-State: AOAM5317RXfK8bG+Znh++Sj/eZtfArezik8uICn4qiVGIT2+VfW9plJJ
 zTRutpCI/uEXnbOhIg0MdCfSDXeufwMKRVdxQz+Ahw==
X-Google-Smtp-Source: ABdhPJxf+pl1nPPiVuFFJmXaMR2+JbOiNUq0hv7KFgm2cb4SPtRoJV2IFa0rhrptzTKPFVFTOFrwoiExsEIAggCDsOI=
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr18463071wry.172.1643645117182; 
 Mon, 31 Jan 2022 08:05:17 -0800 (PST)
MIME-Version: 1.0
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
 <20220131155936.lm7jn32ihb2ndsf7@gator>
In-Reply-To: <20220131155936.lm7jn32ihb2ndsf7@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 16:05:06 +0000
Message-ID: <CAFEAcA-K3cAPMiAfHNCOaceRN2csH26W4w9RDOUUVhpKPMNh2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: lvivier@redhat.com, thuth@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 15:59, Andrew Jones <drjones@redhat.com> wrote:
> Hmm, if these machine types completely depend on userspace gicv3
> emulation, i.e. no way to use in-kernel gic or another tcg gic
> model, then I guess they shouldn't be built at all when ARM_GIC_TCG
> isn't configured. I.e.
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d6c..d7cc028b049d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -209,6 +209,7 @@ config REALVIEW
>
>  config SBSA_REF
>      bool
> +    depends on ARM_GIC_TCG
>      imply PCI_DEVICES
>      select AHCI
>      select ARM_SMMUV3
> @@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
>
>  config XLNX_VERSAL
>      bool
> +    depends on ARM_GIC_TCG
>      select ARM_GIC
>      select PL011
>      select CADENCE

I kind of agree, but isn't this kind of mixing two things?

(1) Both these machines require a GICv3 and a GICv2 won't do,
so they should do something that says "if you want this
machine type, you need a GICv3 device"

(2) Both these machines don't work with KVM or hvf, so if we're
not building TCG then there's no point configuring in these
machine models (a property they share with every other arm
machine type except "virt", currently)

thanks
-- PMM

