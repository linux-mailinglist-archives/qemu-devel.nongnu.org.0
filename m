Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F55EFCFC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:24:59 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyDR-0008R2-LW
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwn9-0003n6-F5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:53:45 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwn6-0006xT-SE
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:53:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nb11so4044082ejc.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cqQBTOYNa/mf3P3HSzg6fb00V0GJS8bk5eliMmLjCBU=;
 b=ybP3VqQFrFP+rEMHM8p7SkNTbgQpKc9hO3jekPy9SgAb+T3NbsIhOQXSn8Nk7mIOhC
 jjql4f/80b8RuppxAx0CSNibKVrRpKvjowjQisSh+ZL7/FDDsGvkN0ip45t9WgdaWMXl
 kuJRtw7geK4DE7UffUJYtB3oGjwblB1SaQubsa8dFR1dURGv0G8iWKU1oKdltMLZsW3L
 g/7cReLz1+4wOYsYqFo9+HG/ONZuhOn871Rw511yC/aOXqsSTXOJR4pWhnCFr7YG2+2x
 /YP5IR2JHxu2OMHrwoFWshCCWthe8kHPeFyXwmf6x/tVG8gvpfuZRtIC+po7zv5ew1o2
 aG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cqQBTOYNa/mf3P3HSzg6fb00V0GJS8bk5eliMmLjCBU=;
 b=yMCPIWKywomkP5GYr9iIDPw+MU5JAdnVxybsv+0BLcha/IU4Zl0ALl9m8KGHC702/7
 0tUNz7BWWwznNye6FUszE386CulAvhzoJNavAwSQD7JZZgEfdlGK2LyVXIrvmCTr3KgX
 VuroERs7L56UXoSHayGw2dTZq0wy9beBsJZo+A+NMN/UqtdwTa8G+i0GuIIuLJrnajAu
 X0CwpIjcCpnMTacujvhiVrUwIZFGlhDF3Llz6QLAMN2hpnwR7lINntxdk4JpJaqoui/z
 C8zHZnCYjgag96MNs0nMc248Et2mrrDCB4KkbWPRdFMRDIgR+xbUgBa0Z/ZQFcwKeegO
 OOew==
X-Gm-Message-State: ACrzQf3UZGo0iebg1u0EMxpfAEgvOelZTmDxkUPj8frPj9r7bAZghhtI
 5jYquMySwrQTnVjTLEp97oy0UaddEMO5f6Ur/n4HbQ==
X-Google-Smtp-Source: AMsMyM5QtVTpe1e3smsvCph85EWA9iq/wwg2CHU0E1+4pCC3Tjb65XnGqiRiQA4xYCYsBSlpRHuTgmP8Mzb9ekgAW0E=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr3323068ejc.619.1664470419015; Thu, 29
 Sep 2022 09:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 17:53:28 +0100
Message-ID: <CAFEAcA-X=rm6xB9kp7u7UPudTZQEUGskwSaUD8y+tKGx9QRsiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] hw/arm/virt: Fix dt-schema warnings
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
> Fix some warnings thrown by dt-validate for the aarch64 virt devicetree.
>
> Since v1 [1]:
> * Submitted more DT bindings changes where appropriate [2]. All of them
>   applied for Linux v6.1 so I dropped the related QEMU changes.
> * Grouped all node name changes into patch 8
> * Improved commit messages
>
> I'm testing by running various virt machine configurations with -M
> dumpdtb=qemu.dtb, then running dt-validate [3] and dtc:
>
>   dt-validate -s linux/Documentation/devicetree/bindings/ qemu.dtb
>   dtc -O dts qemu.dtb -o qemu.dts
>
> [1] https://lore.kernel.org/all/20220824155113.286730-1-jean-philippe@linaro.org/
> [2] SMMU interrupt order https://lore.kernel.org/all/20220916133145.1910549-1-jean-philippe@linaro.org/
>     arch-timer compatible https://lore.kernel.org/all/20220922161149.371565-1-jean-philippe@linaro.org/
>     virtio-iommu https://lore.kernel.org/all/20220923074435.420531-1-jean-philippe@linaro.org/
> [3] https://github.com/devicetree-org/dt-schema
>
> Jean-Philippe Brucker (8):
>   hw/arm/virt: Fix devicetree warning about the root node
>   hw/arm/virt: Fix devicetree warning about the GIC node
>   hw/arm/virt: Use "msi-map" devicetree property for PCI
>   hw/arm/virt: Fix devicetree warning about the gpio-key node
>   hw/arm/virt: Fix devicetree warnings about the GPIO node
>   hw/arm/virt: Fix devicetree warning about the SMMU node
>   hw/arm/virt: Fix devicetree warnings about the virtio-iommu node
>   hw/arm/virt: Fix devicetree warnings about node names

I have applied patches 1, 2, 3, and 6 to target-arm.next.

thanks
-- PMM

