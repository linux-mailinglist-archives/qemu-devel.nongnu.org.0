Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535475EC4D9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:46:31 +0200 (CEST)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAur-0003KX-OJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8qN-0003nI-Qp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:33:48 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8qK-0003i7-8Y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:33:41 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dv25so19985774ejb.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xOLYmcjbYK/sXr7E+L5WXykJniMAkmkPex513RoQQrw=;
 b=Vl6f14lnEOo95rOzL9beorLGm5Wf2CEcS9amaG6gth4zV2uM5xZNl7Ydk/Jzw2QdDS
 53uIanDez8tBt8bFVYwM0AcwKyRA8r5HM6YGY/VZlzBXR4VCJ2XETFcosWziqc2VMlZt
 +I6e7+SZ/M8B2p1ICEgB3+pvhx7C0gHBtKzGdlryI8fKL7tFNQuPGbfQyhmECis8rKCV
 Xvad6jt5i8cItE+Qgh+79sdPVFYbshwwjpQh6BExOG1V1Y7S2hcFl4Y3F/fSBFM1a7Pi
 KA8YYKOwmyUuELl+/DE4z8m/4gZeSAh1uYQiJRbfHELzYdrycovDO5HLuHFscDfXHyU7
 yHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xOLYmcjbYK/sXr7E+L5WXykJniMAkmkPex513RoQQrw=;
 b=aivQCjz8MRfcHVXwCgLTn25M7NcR/xeDvX0mAzzp1ef9wdzvqMPsJQabJ91MV6mgNL
 3ZHyPV0wV43kYGMgFWN3kls0capnMi1Iv3oEhORkx1vQJ1cI/juulSQ81nYIlzPMpu3p
 u+Ksi7Rb5xsJESfmR0DLlSEGFqwbbzO3tEeMJ3SEM/HF3abMtOmmdn0jI1Erzs1zRkN3
 Ss9aPCpfuowRh8AbLR0WHmgXrnr1om2EnWBfxRVP1fBn3BVrUD3pwPDvj59Ti10FVkM0
 zTteqUJp7YH8v2oTpyt+dwToJ74HPrJ585BNkMDAQ6oJLeMiO2Q1gqxQ7PoHK/29erxH
 CQWg==
X-Gm-Message-State: ACrzQf0oLhN9YDvRXQoHvQvzQQrUJdaFLX1GE/lALM4tpyeM8hTBvPmr
 BrPTBSTD4Oy/ZlGPK1HJx6M+MFewl5tAXEOkwCt/WQ==
X-Google-Smtp-Source: AMsMyM7v+bRylR9zJi1XmQ8bgxzcgBSoNkO/K/UJJhmfzUuL2hkabHI/J7Gwysoy6nBE8n/eOKKfK9iapscW7zyLutQ=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr21413204ejc.504.1664278418551; Tue, 27
 Sep 2022 04:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-3-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:33:27 +0100
Message-ID: <CAFEAcA_oe27kvXRmM8n1Aww-OREQx7yOYn0NsC=55R7YEGS0gw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
> the corresponding dt-validate warning:
>
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

