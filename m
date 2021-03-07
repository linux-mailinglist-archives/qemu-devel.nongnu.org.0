Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E38A3304FE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 23:28:46 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ1tE-0007up-Ui
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 17:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1r6-0006VB-V0; Sun, 07 Mar 2021 17:26:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1r5-0006z9-FY; Sun, 07 Mar 2021 17:26:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id a18so9397184wrc.13;
 Sun, 07 Mar 2021 14:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MG38T2c0ah+ASOI2W2LgtqYlki8O07VU8DdrtJnD1+U=;
 b=EttU3y4RqXgiruFOPwDC0GnBvktMW+LHwSk2eE5kWFs0GVeVuOZ1utAfCnmKTxeXjO
 y15ZKF4OGZ5mTw/W6VimmTVDxsg6tPsJQnOMKx0z/Cj58THKTApl3NscRT05p88bkKHn
 /78cQrheMuFUibPq64eDXDExKz7NA4F2BbZ+45+FQUHLcmn6da+w9CTmvMq1zWW02+3x
 mTOY3wT4uDb0sIz4x9ZPWVxMFiUiY4Bny6EvA6Ypt09jW7Pcg1uBTUdWNPPjF5orOq80
 VDTvT/NPGGDBQkXvYlESYQyKGG/c9sCrFY985TMV2/vmXf9pEQfjg6QbH7hkI6NRIZYE
 /mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MG38T2c0ah+ASOI2W2LgtqYlki8O07VU8DdrtJnD1+U=;
 b=Y5KBCFoI89EMUdLuigN75VIw50LDo+Zp7fVSKuJtv3VCN/JmvtXXnNmzI1rDwanzP9
 81kHFVvS50SLGwL1gOIpKruDijw980iwKCrz3DleXrLoTIXMDlrkDWCzYtXeiOy2R+bu
 Nfr1acvzgvx9J5tfb1NydNblJARL/mhm5I1nxqN91aPg1TKP9y4GrH+XksSFmZNd2f1q
 6Se8yK8LtOnaKKBaleMa6jrixpNQ/NbcwdrnBwUtJxHvllrtb1EoYctNtwJVFTedzRIO
 ZTriZcakgVMuksvQhatP1xx6pCeU2XNnTNQnLw89D0T6R6bL5vsr0MAKkZr1sf8PQPS3
 z59A==
X-Gm-Message-State: AOAM533wJkvIn9/vwZT2mqb0brerfNjoPzAoROMop3LoLcfvy1YqowGd
 I2kDN5sY2WY+k6aJdhod7ObACJNw19M=
X-Google-Smtp-Source: ABdhPJzsRNu2EuRNnIlCClQwVyaAwzEcJWKi3txIlTbZGVIJT4vT9O6KYzxX4bIkNhpWQVsxSRWy7A==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr19324766wrq.339.1615155988705; 
 Sun, 07 Mar 2021 14:26:28 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v18sm11643832wrf.41.2021.03.07.14.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:26:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/block/pflash_cfi01: Remove pflash_cfi01_get_memory()
Date: Sun,  7 Mar 2021 23:26:21 +0100
Message-Id: <20210307222625.347268-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd=0D
MemoryRegion with sysbus_init_mmio(), so we can use the generic=0D
sysbus_mmio_get_region() to get the region, no need for a specific=0D
pflash_cfi01_get_memory() helper.=0D
=0D
First replace the few pflash_cfi01_get_memory() uses by=0D
sysbus_mmio_get_region(), then remove the now unused helper.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/i386/pc: Get pflash MemoryRegion with sysbus_mmio_get_region()=0D
  hw/mips/malta: Get pflash MemoryRegion with sysbus_mmio_get_region()=0D
  hw/xtensa/xtfpga: Get pflash MemoryRegion with=0D
    sysbus_mmio_get_region()=0D
  hw/block/pflash_cfi01: Remove pflash_cfi01_get_memory()=0D
=0D
 include/hw/block/flash.h | 1 -=0D
 hw/block/pflash_cfi01.c  | 5 -----=0D
 hw/i386/pc_sysfw.c       | 2 +-=0D
 hw/mips/malta.c          | 2 +-=0D
 hw/xtensa/xtfpga.c       | 3 ++-=0D
 5 files changed, 4 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

