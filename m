Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD235DE7B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:16:18 +0200 (CEST)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHxp-0005hV-To
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpp-0000U4-C8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:08:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpk-0004fh-PG
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:08:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so10511975wma.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gR3NggEWvwtgruchhxovTt2Vf7sHosJIaKlvGCmWoYU=;
 b=UO2lnV4zt1F/v+sCo/XVntd752G4VCHJ/6eVz+IXPo2zSajhLqzBoP3ZX2BtsOUTnE
 m75uXnoJyVXFVSA0L6cIrm3GdOcuQOajG1rjOYQQpa8E4Bykz9Fi8XSOjC0ffubUKau7
 kU/QOR5hIXgwcE/d/mp19DTgwsbZ46OYgQ+nIS2VG6oDQXzR0kKiBRbkVNZaopudVpRQ
 KcgU2nrNeqAraJRlS8c4jeOTYsYCyOrfPX+Y+vckPJrIU1BsTgoTXs9p6yC718dB5B+d
 SnI7XSGUcDaGelHtcL9F5r7Rkyfs+kRPMAzPUzf6rj0cTdFLFs3h1dEpaOuW9+vwFwoT
 K/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gR3NggEWvwtgruchhxovTt2Vf7sHosJIaKlvGCmWoYU=;
 b=CQQfGX5dStJF7NvC3SiHrau8bSpTHItvpwdyNvI6Fkt8tCdkYQmpN+CvfoO2mYHGtB
 CiGPyHHjdh2f1428XQzLUyGa6HgUFIE8f4BSCObCyrdXVlQ3/51ZwVTmmGKiO6Ir9SVB
 eEXJNGALW8WWPk9eto2JKcGClj5l4kEEaDYaShKMgJuG/405OWF8QGTwqN8Z7ERAjLNH
 jEtjkmqapteQTtoWe9mbTZLhjHiEOuCkYx0kVw4WK9EaHx21hV5ABihTUrP+2lbWBOJA
 VhygGGQGemN3hsBaWHD32iGCdYOnRKJU5ZRpt/0/wrUQm1fO7IhSVpMGryNbt1J2AJAS
 wdmQ==
X-Gm-Message-State: AOAM530LfQ9hnDCKOO7gYHszaw18knZnzeR98KK8NWz8QjNJm7Bcz9IO
 rv5hdPY3k6AhXpGQNF9jOicOXgAVJ2fg1xFm
X-Google-Smtp-Source: ABdhPJzvMQKTw3PKISFWHnwMDk0tPhTctAOkHywvKznUb3h09z+Kh9tF/9R88tY7sX/LdWZlKV51+w==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr3823798wma.164.1618315674822; 
 Tue, 13 Apr 2021 05:07:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm2245275wmc.23.2021.04.13.05.07.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:07:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] target-arm queue
Date: Tue, 13 Apr 2021 13:07:49 +0100
Message-Id: <20210413120752.18699-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few last patches to go in for rc3...

The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210413

for you to fetch changes up to 2d18b4ca023ca1a3aee18064251d6e6e1084f3eb:

  sphinx: qapidoc: Wrap "If" section body in a paragraph node (2021-04-13 10:14:58 +0100)

----------------------------------------------------------------
target-arm queue:
 * Fix MPC setting for AN524 SRAM block
 * sphinx: qapidoc: Wrap "If" section body in a paragraph node

----------------------------------------------------------------
John Snow (1):
      sphinx: qapidoc: Wrap "If" section body in a paragraph node

Peter Maydell (2):
      hw/arm/mps2-tz: Fix MPC setting for AN524 SRAM block
      hw/arm/mps2-tz: Assert if more than one RAM is attached to an MPC

 docs/sphinx/qapidoc.py |  4 +++-
 hw/arm/mps2-tz.c       | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

