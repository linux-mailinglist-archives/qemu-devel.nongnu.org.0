Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F51A253F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 17:34:06 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMCiL-0008Ld-PL
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 11:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jMCfP-0005rC-IK
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jMCfO-0008AN-FA
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:03 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jMCfO-00089t-5E
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 11:31:02 -0400
Received: by mail-pl1-x630.google.com with SMTP id d24so2622052pll.8
 for <qemu-devel@nongnu.org>; Wed, 08 Apr 2020 08:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRqPfQVK9oNMM3W5CDGD4wVvhIQLDrf+AGj7yaUQMxM=;
 b=eizOq+AAKb2mNjeeJTaoLXqH9LTIiLcftxoDi8O4r9osA2PsmkVis4Xz329+Y+tKLA
 dNS101Wnq1DgZxe9hGrHC2dXvK2G4R+v+NCwIYEx+6EtjRIgVtMcjM92WxHCSZFnGRSL
 V/VNAWRq8ML0nDUdotpW1iKMzeh7/CoX+582XAGBDOWd8+f58eMeceO7zbFVJAElgN4r
 fxKpuDT2XOQyF6HlSSuQgn2TBM2PjLYOFa34O1qzelx3fDjtRhrAqbkpgLvLmg6bDTl5
 Wb4HAYF1DCfBt+IyApQCelrtHv+SDj7zv3Cm6iyElIY56KnWaeK51pPrlQZNjrMUKIsa
 5Akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XRqPfQVK9oNMM3W5CDGD4wVvhIQLDrf+AGj7yaUQMxM=;
 b=azca0XVbo2CInqxh6S++eYIDMP4y1w4NJUy+EDsWYg5sSot/8i6QI3/RJmX90NCvaJ
 anLpHvRQ2x1WhQcIdJwdIt96JWbOX5rkJxEqx3inh87WS825ThAMOGKRXNwGxDzWfkOt
 +YW7C7Entf1LQdoNNxkx8T6HokSQrW0o3j2nQ50NWabvv0zy3DAz1yNWq+bpKUB2Y5xo
 ZTTggnR+MrdRnJhcmfL2W8x9iMSKScmQIzes4zeyg9SzXoEY8dA5Hezb1Ph/4oxvkeF1
 abZBX3UF3SgWyG9TFDKT61Jhojzl3oBshwsBfiwPed/EjwQUNlCCkMFKBoEjHUc7eo66
 Mp4Q==
X-Gm-Message-State: AGi0PuYPgSRtwXEQEclqPhTbrNUn3O37g4tI/LwJCrY66CwCa0XiI3V3
 sorxmbfBklqyS4uy70AbbuXSoyDuuzg=
X-Google-Smtp-Source: APiQypLoFONIo5XcHkpSPBNZdfKa1K32zCdyG+SOdz6xsvKbWWBLMZTcfr7c5gABiL8nTe+cK8z++g==
X-Received: by 2002:a17:90b:368e:: with SMTP id
 mj14mr6290758pjb.107.1586359859502; 
 Wed, 08 Apr 2020 08:30:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t4sm16920454pfb.156.2020.04.08.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 08:30:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 0/1] target/rx update for coverity warning
Date: Wed,  8 Apr 2020 08:30:55 -0700
Message-Id: <20200408153057.31794-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::630
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f3bac27cc1e303e1860cc55b9b6889ba39dee587:

  Update version for v5.0.0-rc2 release (2020-04-07 23:13:37 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-rx-20200408

for you to fetch changes up to 40bd0502dbee3ca1a9a481dd32dabe9230b8a37f:

  target/rx/translate: Add missing fall through comment (2020-04-07 18:45:54 -0700)

----------------------------------------------------------------
Add fall through comment for Coverity.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      target/rx/translate: Add missing fall through comment

 target/rx/translate.c | 1 +
 1 file changed, 1 insertion(+)

