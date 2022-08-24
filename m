Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2C5A0234
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:40:53 +0200 (CEST)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwFA-00010v-GY
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwBh-00071R-TV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:37:18 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:44560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwBg-0006u5-FF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:37:17 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-33387bf0c4aso486680417b3.11
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SKhuTriS+Iho+YNBSyx6qBvwjxOiPiAbNzZxNQt3Z2E=;
 b=d2PiyLTOVtIubKwZT/GwvQQKslbAYqBKGj38R7Ym50mgYNiZxxxk1OgLwyLeSzp5aR
 PTkt5emw1A8FqKureq/dRlrPmWJCK1xPqD6F05+SJMhX8h6yL1hFyhrWayVI95QJdCp9
 zUCLByfdksi5Nlb7agNSTSZKa1AwLdtKz9URIdIm5xQtFMjkaFkoej9mLyoU7705WR/1
 ejXKc8ntYi577Lm9sYBOBFGTva1eWwynZXUyHUec2XNcuDFoG8VZR+wiqbwRFOsEWZG2
 d5Cr+tEY0ROd1HDdiU9IZQD+orqvnRv5XfsN6ZVrMTQ1CPrjDiIVweHpziEOwY8gTT6M
 yH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SKhuTriS+Iho+YNBSyx6qBvwjxOiPiAbNzZxNQt3Z2E=;
 b=EqRl7B0NGYNBsiGnVcTS5ZyvlcXQnXX5ndg4lRdCJBjzoo4Oi/eaEtkoRVRtCfYyvT
 sq71Vvv5EHUGzMkYX7eqz20GXwa6oMGcpW2YaI2O5+G2eqTzOiZHTbfbngG2uk2fCq5D
 gSA7cmGP/J6tlA5RvoQvMCeQIDzqOY3eXebbqx+8Z3ciOYKvuUwaAta4+IqmNFwgsILF
 YDgkm2MghPM9mL2S8HDTJ/8G8zfnDCETy5y0HjbRdSFL18r9+ROxKAc/VuJVBq/aNhso
 20uFmN7++WwIg1wRPPxETAegUz6DLlPwkdgRs+KoknWD+y42Mxgoyw+VOOLyDT6vaEnd
 5Sfw==
X-Gm-Message-State: ACgBeo2d7RoL2SfUMfSnyCRGKCPaJdXBjjO2G50X1l+WKFXYZppMsbKs
 1xTKGAs0F4Jc+hbHZrSctozkrE2Fu0A90YGKMF9Dpg==
X-Google-Smtp-Source: AA6agR525BciTGA9Z0u5EjMgFxa5hrnfO1hcT1QPUVwRNuf9i6se1vZWDnsFPV3DewqtaGcTYTJ84BU53q210rVSfvE=
X-Received: by 2002:a25:6d88:0:b0:695:9728:f253 with SMTP id
 i130-20020a256d88000000b006959728f253mr647372ybc.39.1661369835367; Wed, 24
 Aug 2022 12:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-4-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-4-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:36:33 +0100
Message-ID: <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Fix three dt-validate warnings about the GIC node due to invalid names
> and missing property:
>
>   intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
>   intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Why is dt-validate complaining about the node names? Surely
anything looking for the ITS in the DT should be looking for
it by the "compatible" string ?

thanks
-- PMM

