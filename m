Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED32C221B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:52:35 +0100 (CET)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUzy-0001tW-7J
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxI-0007Mf-Gw; Tue, 24 Nov 2020 04:49:49 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxG-0006Oa-5B; Tue, 24 Nov 2020 04:49:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x22so1821522wmc.5;
 Tue, 24 Nov 2020 01:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dvujg9sSr3DfwbrDHDhSVUiP9e16WmNzCtO83xzMjaI=;
 b=QoUUrwOEahDbGhWfpnnRQQLsi0p+AQzYPKdsEuw8/P+YkR7oKfwVXFqTdHBWwZP5kh
 E05bKaGVtu0ZFwdJSfQNZguTSL4Y0Hs3dgGnddxfqk9eokr0KE6Shrub4pEcFT+tbBPH
 9nCAXeq9mS6V9iVo85niX7SmzYta980P/SfMHeh7UX2KYkHtOH/podE1FRLgrVoEEJdV
 cig6EIYWNjXFQ3QVlrHxbEsnLbVBCIz0gwNHQeEofAg3KekbiC5xnF6fjxUvOK5uiWFs
 c//5kEtQGRi0IiGguE7j6YmCoobeFpBv75jLfaMWtCJJqH7Vl957g+OJCVsXh0zWVyjd
 C2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dvujg9sSr3DfwbrDHDhSVUiP9e16WmNzCtO83xzMjaI=;
 b=KE8PeFBc+VGkjidchUmAxwWzPaZOG5c+9Ub1naugjLqQMuUrGA8QimqkVwCCw21AYx
 skI45oecKSBpBndta1VygJMBMdlNGpUMd+AbwdkLcJ9mAE5xX+RRbcpG8F8jQVNJVWT+
 CE/ZSa3VI7mYBScAt1fEfdxD3thxwJ2BIIngj3NPIzpJRXGiL6DdMxDcaMtyHMLwu4FT
 qwerMr6qjEiVv1+8JuJKdVz6sEcbTM0i30m18YU4RJYBxZrKrLGc1JaY8sc9OU8HuoS3
 7GYTftJ3EXhx7su7O6ZXa5i3CoYgkseXR8EwON2B+k4ApMyaLCzc30MLbwv/rXfwSs2W
 utcA==
X-Gm-Message-State: AOAM531GpWPC/g/KyPcPrGA0JWb3UV2FIuVfutXv/d66OmSDnAggkSPL
 xUz2w3fUgtJcAS7GT2v1aBV1u8RhpBw=
X-Google-Smtp-Source: ABdhPJxMXYOz6dvYBeRt2afX9mxG8UA1yhoseJoFF9c4YQ1ytDQ3fuxOTDPZnyBNL4JFXFPxkR81qw==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr3465157wmg.165.1606211383791; 
 Tue, 24 Nov 2020 01:49:43 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id 71sm25744859wrm.20.2020.11.24.01.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 01:49:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? 0/4] hw/arm: Add SD bus QOM alias on the machine/soc
Date: Tue, 24 Nov 2020 10:49:37 +0100
Message-Id: <20201124094941.485767-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Easy fix for LP#1895895 suggested by Peter.=0D
=0D
As TYPE_ASPEED_SDHCI creates SDHCI inside a controller=0D
(not a SoC/machine) we don't bother modifying it yet.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/arm/fsl-imx: Add SD bus QOM alias on the SoC=0D
  hw/arm/exynos4210: Add SD bus QOM alias on the SoC=0D
  hw/arm/xlnx-versal: Add SD bus QOM alias on the SoC=0D
  hw/arm/xilinx_zynq: Add SD bus QOM alias on the machine=0D
=0D
 hw/arm/exynos4210.c  | 5 +++++=0D
 hw/arm/fsl-imx25.c   | 6 ++++++=0D
 hw/arm/fsl-imx6.c    | 6 ++++++=0D
 hw/arm/xilinx_zynq.c | 6 ++++++=0D
 hw/arm/xlnx-versal.c | 5 +++++=0D
 5 files changed, 28 insertions(+)=0D
=0D
-- =0D
2.26.2=0D
=0D

