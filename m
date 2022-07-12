Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2EE5716D9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCs0-0002UH-1d
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfe-00066C-SY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBCfd-0001H3-9B
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:59:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 5so6817818plk.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+zk4e7nGXqIpQzs6kqTdGEgkXv3sWKgChB7M+Y0Q7Y=;
 b=MzZDaEqm7BuHRhOWuLPZqYc5l9dvXiusrpovgBZJE1NHqmlbL+vzdhbYAnZEe9SNNr
 2qz24eDcdgDrOM4FXV+NzKQq+ze/7KZ9uT335KBDaeDkky1FvdshkWTolVJxXYLoPvwW
 CcZ61r18BsRGEKGKqBEULgAd2+hDPfPL7nG512gwLDhgbv44o7Fgx7/pPplEcjXXTFIo
 6PRQGXuBL488c8+Fi+5kQu7BBUSv7022/fKmfCpb4Tmtqh4lYjevxmHxD2FiWaxCRsaJ
 5N3aOPBOJllciDU9E4wU6MEEeHKcPLt97gIyA+nKDrmKCW5BAvRQrhLsXPIacxbg7vNX
 613w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F+zk4e7nGXqIpQzs6kqTdGEgkXv3sWKgChB7M+Y0Q7Y=;
 b=Dc2e7X4Jkcu+AB2aGQofoJVeR8slVzggG7eEiTdp/lx9WOrmlybvneOzonbFga6rdg
 3uWcC1Nybq93yqWfKx73e4p4DwYysg13qGERx/bT8KSTo8EzVdfBT1ZEMJUhAUeGoSNx
 2lNyfRpgnN75IqQ1dQu3Hkr1gbZhEFsBKNa0BpNO/JOdX5mQeZXCONzelB11aFtWPjdu
 o763lPieGFtz8ygbTthcopfUfsB2dooQRPXu1mXowv9dBok3hSnkfs2kEUj/CDGWntHY
 Vqtmx/MGR5iO8UvFZy8f6aS/JpGSwNY0amrIXe0+gW6y72knFYoe/A1lOPccSpWPK0sL
 JFlw==
X-Gm-Message-State: AJIora8Z2eWOIMKQ2Y7maiU5A4zMURWI4RHEb+04QTUJMIeJ4pbX+PFm
 g95O2h60aVJRPPWXSSed0wX0u39dD7z4n0Ot
X-Google-Smtp-Source: AGRyM1sldBW2Tl0AFBDHd6LStFAW0eD5f/sOYcDcuFxrJT8V+9pdk2+X/tGKrvN/eKBFOkZe+1jy+Q==
X-Received: by 2002:a17:902:db12:b0:16c:3273:c7b1 with SMTP id
 m18-20020a170902db1200b0016c3273c7b1mr16808735plx.172.1657619946751; 
 Tue, 12 Jul 2022 02:59:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b0016bdb5a3e37sm6348990plg.250.2022.07.12.02.59.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 02:59:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [COMMITTED 0/3] build fixes
Date: Tue, 12 Jul 2022 15:28:58 +0530
Message-Id: <20220712095901.212353-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

This is a collection of fixes required to get CI back to green.
Given that 2 of 3 apply to cirrus, I had to push them to staging to
even try them.  Since it worked, I've now pushed them to master.


r~


Richard Henderson (1):
  gitlab-ci/cirrus: Update freebsd to python 3.9 packages

Vladimir Sementsov-Ogievskiy (2):
  iotests: fix copy-before-write for macOS and FreeBSD
  iotests/copy-before-write: specify required_fmts

 .gitlab-ci.d/cirrus/freebsd-12.vars        | 3 ++-
 .gitlab-ci.d/cirrus/freebsd-13.vars        | 3 ++-
 tests/qemu-iotests/tests/copy-before-write | 8 +++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1


