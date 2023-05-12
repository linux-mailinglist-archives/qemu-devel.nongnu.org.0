Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB3700AAB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:50:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxU6Q-0007j0-Dh; Fri, 12 May 2023 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU6M-0007aC-ED
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:50:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU6G-0006wt-Ol
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:50:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so18815048a12.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683903027; x=1686495027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4qnti8siutSgVf30v9QlmjlzOkQl22orD0PbS3NH+ZE=;
 b=I5p+rxRTHPOIP/UwWPqyEleHcruPYz34omiH4e5IbBwVkGwcQuAvDqoYdav5yI8gQL
 NA7OYutt/bISFFcQPyi5uP/fsU99xu3WKzy23uf3tWLJOT2jxM97Gepyarh/PWZGMdPw
 vupMinE/+3Gtw9MneGottjIER8JtDGkcW+xsI9gsh8ucvWZwWMdQySecaQ93ThlZF1dY
 J9bfEyiejEqPHbqU909eIP+RZOfu837qCkJ2/YvarQW2SmQiXmlAhnz5+PG73ObqntZi
 +deb+aHKmrIPWAoB22co+vsl6LSclFTMthEWdBZEqEV6nhWbAAquQz3nQLMB8AOO5TD8
 8V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683903027; x=1686495027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4qnti8siutSgVf30v9QlmjlzOkQl22orD0PbS3NH+ZE=;
 b=PcuHJNZgWxPZUxkI3WT60y3wxyN27th96Mr5h+VxH1biPVuB3LCGJwXHT7mNa+Svtr
 nehkMOAoHMnmDd8rYjSE9cbhx48OdEHH1HD6vB1n6o7vlm4Smjqv9gnMEzX7K/8rYO4I
 jFfzPCXrykkyy2TOQ1NGL5QqAEKKFzqRG1IAUMAdj9OIwdlrXD7o3w85A6X32sXlGLto
 Cr2DanGcNy5BVGVtlPLGVaqpyyf8AIjl23nZu2lJ4S1DgVhtEuvWekLp7EgioGELJ1UP
 wfODmDOpuF5LmgHNUpFvMqZWxclebcZ98hppP9MotbmOgPjKs2j8r3yHyi2XlF0UhB/W
 buCA==
X-Gm-Message-State: AC+VfDyVHdsqa6FU4NczwO28e8o/4CKp2j//gES3OWEYA25xFPVfB9em
 tFpBbHZUKia0tZzoqW1ydHwv0nwi3cNFdLbsx3VFGw==
X-Google-Smtp-Source: ACHHUZ5dKmykGj2CR494/5IXlpuCRQN7DRH0bm4qQ/IT4yo9m43A4+UsnFXHuCJDpdGpdut0AoueGTE9tET/LAT5xso=
X-Received: by 2002:a05:6402:1492:b0:500:50f6:dd34 with SMTP id
 e18-20020a056402149200b0050050f6dd34mr23988955edv.1.1683903027288; Fri, 12
 May 2023 07:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:50:16 +0100
Message-ID: <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 6 May 2023 at 19:34, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> The world outside moves to newer and newer cpu cores. Let move SBSA
> Reference Platform to something newer as well.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 0b93558dde..a1562f944a 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>
>      mc->init = sbsa_ref_init;
>      mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
>      mc->max_cpus = 512;
>      mc->pci_allow_0_address = true;
>      mc->minimum_page_bits = 12;

Seems reasonable; Leif, any objection?

thanks
-- PMM

