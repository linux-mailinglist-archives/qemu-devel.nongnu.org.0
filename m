Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AD5A0246
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:49:39 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwNe-0006Ad-KL
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwJx-0003GK-ND
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:45:49 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:33711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwJw-0008QW-0V
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:45:49 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32a09b909f6so488263197b3.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=B82TO1hTveMJiaR0bcz6clQVHDfpyBNs0EFwsMsV0Ck=;
 b=MTeV6rONS3Mzk4p1uKlZifokkkuB+wKgNahEKLIaYaTfiZmQWJuVstRa4cW5ituhy6
 u1gxuAvgOSH/6F5AoTmBG4Qe8Jpv1JzVRvH0+UJRJaXAGWyNQ958ICSHDBqe2yFVyvw5
 6P+0UNJsDZecsYa34SEXkdRklUZwMQjfOEXvFg867d9/txjpLHUumUCufIp0V0R6cwsO
 7FuEijs2eZiYX/d506ie2T8Q2FzzFrWvCm6o7HPQOHhoKVpwwTefkQuzKVskGE2nlFV8
 dMAWmgu4ww8HeLkZQgxT188aavrK16XVVpPWlpXTxQvz06LR4uejEJZh7WK0c7Ao7uxw
 AVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=B82TO1hTveMJiaR0bcz6clQVHDfpyBNs0EFwsMsV0Ck=;
 b=bMRmcFaOyZ/b2frA2OBq3rmy6DbWtiC4U51GIVTZBDCD7sSpmT9lgics7PO80gdTON
 jk545TSfOydnUN/DrC6nP5DWvMy+Ep9yAJ/vd87pxvwGFD69r3cAPXmOSH32DHo+CM9A
 gvB0kAjXytvuSnVSSKBYvYzYxgpt2xwijjVFMJMzevuMekzihjQSBvdcpzBb//t2LSIr
 ZgqJoT3W/nixcVCm1pIY1lAjo0TNzLFts0cPSQzSAW2wVrUyUzutXW3Yfn2tANV0M4B0
 0fFf/yCOSuMgVj91/dkgzlCZiui6wA71Toe8wBeQgBOW0rOdUmzurFPa4IovkopEFXpf
 i4aA==
X-Gm-Message-State: ACgBeo3NezQP+eb/hIcgbo+soTNBIOzXOxWh7AtoGVKORzsATTANDL64
 TPXeLK5TP88XFLFVgjmTQ+uipNFxbNgrWJS8i3QTSg==
X-Google-Smtp-Source: AA6agR41ItSP9ejXMtM46RRlwwAmN1tijL2CE2EIGNHOhyBy3ggreJX7ZaePX+WjJLZMp+r8Awxms0DJTMk+FgS9wAU=
X-Received: by 2002:a81:5a56:0:b0:33b:52a8:c360 with SMTP id
 o83-20020a815a56000000b0033b52a8c360mr740384ywb.329.1661370346904; Wed, 24
 Aug 2022 12:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-10-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-10-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:45:05 +0100
Message-ID: <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the SMMU
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> dt-validate reports three issues in the SMMU device-tree node:
>
>   smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
>   smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
>         ['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
>         'combined' was expected
>         'gerror' was expected
>         'gerror' is not one of ['cmdq-sync', 'priq']
>   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>
> Fix them by:
> * changing the node name
> * reordering the IRQs
> * removing the clock properties which are not expected for the SMMU node

Why does dt-validate insist on a fixed interrupt order here?

thanks
-- PMM

