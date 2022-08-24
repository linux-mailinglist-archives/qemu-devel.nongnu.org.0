Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FE59FEDD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:54:07 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQshi-0007Yn-4D
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf6-00027q-5o
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002EP-Hp
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so1162034wma.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NpegIO2Jl3sr8Km87JjPhZQlLX1Qk+YO5jDOzfLx2hw=;
 b=ImZHoHjzOyzVyLeHhuEIRhHqG1E9uBUE1rKCUuNIadRsTuK6qQc2WlXEh6coAxlzEz
 mQVTJAjRW3ntRgRiHb0GZrP/mmGibcJ+vlNQ1WZyDPiy1dYovX2wyu+7FvDqy4JjXQ6I
 sLke2qEVNvl155+E2OWdZSQSvIryndGl7LZZ859jNR+eWcBhy0v1qlexTM+JoZ5FUlNh
 fXLHzYxSbYOgYFQjE/6Knyt3dyGwnbNcl2J8TqXNi86hqA2jeiEXN7YMLsnjhVwSDgRS
 qUWWKBkpTzQjyWAoYGEMTqxAgsOonngFMEkQ6tz4hrMLlpIlp6Z6+PYUtj8S4n4qUeTZ
 fS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NpegIO2Jl3sr8Km87JjPhZQlLX1Qk+YO5jDOzfLx2hw=;
 b=XnPTwwRT0nP5crCn4+auGlEvl/of7hdbBE4G454+FZoCNs6QHHhGFzBdd4Bs7WYn/W
 w9kWN1vmnaoCoVOkGXAlFKjAA+y9mfB8HiAUJNdtQqFskZofC14QZsfFhJ64qbA6D/at
 uR0o7LBUOj0wqV8kKitBm5qPNONB8QOvzcEHY8rcMG8gMyv6gebtPNLH6KCuPHyGyLO2
 ofe5XnfaK0P6YpHv5ZfdBSgfCV3NLyPsqh1YQTAeOMrYOcoaUN0YVyxx/SFdhdDW3HTq
 Q4+W+BrY4IoSYZvKy0WE3XJZuEiq6XB2lhJ/Npsa+TdUacPgFoxOGXSsGJHjR/bka5p2
 AGsA==
X-Gm-Message-State: ACgBeo1LmGGrwhvmri9RCn9XAaUrjpY04vN2i/cx+5tWl8VkhC5sV7lx
 LW6Fed0aJSFbiwl+qeNlMBtajg==
X-Google-Smtp-Source: AA6agR74vawTrupP+Ev9wfyOBTO8k98qOGaml7yWPueRMcCN21yAnBlPJ7fDhpY2WGbSayNR/gXGsg==
X-Received: by 2002:a05:600c:4f90:b0:3a6:2bda:dc19 with SMTP id
 n16-20020a05600c4f9000b003a62bdadc19mr5524308wmq.17.1661356278159; 
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 00/10] hw/arm/virt: Fix dt-schema warnings
Date: Wed, 24 Aug 2022 16:51:04 +0100
Message-Id: <20220824155113.286730-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
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

dt-validate throws a few warnings when checking the aarch64 virt DTB.
Ensure that the virt DTB conforms to devicetree schema.

Some schema changes were needed, and should be in next Linux version [1]

I'm testing by running various virt machine configurations with -M
dumpdtb=qemu.dtb, then running dt-validate [1] and dtc:

  dt-validate -s linux/Documentation/devicetree/bindings/ qemu.dtb
  dtc -O dts qemu.dtb -o qemu.dts

[1] https://lore.kernel.org/linux-devicetree/20220822152224.507497-1-jean-philippe@linaro.org/
[2] https://github.com/devicetree-org/dt-schema

Jean-Philippe Brucker (10):
  hw/arm/virt: Fix devicetree warning about the root node
  hw/arm/boot: Fix devicetree warning about the PSCI node
  hw/arm/virt: Fix devicetree warnings about the GIC node
  hw/arm/virt: Use "msi-map" devicetree property for PCI
  hw/arm/virt: Fix devicetree warning about the timer node
  hw/arm/virt: Fix devicetree warning about the gpio-key node
  hw/arm/virt: Fix devicetree warnings about node names
  hw/arm/virt: Fix devicetree warnings about the GPIO node
  hw/arm/virt: Fix devicetree warnings about the SMMU node
  hw/arm/virt: Fix devicetree warnings about the virtio-iommu node

 hw/arm/boot.c |  2 +-
 hw/arm/virt.c | 53 ++++++++++++++++++++++++++++-----------------------
 2 files changed, 30 insertions(+), 25 deletions(-)

-- 
2.37.1


