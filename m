Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28CB192B28
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 15:31:15 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH73q-0002w4-Lx
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 10:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <npiggin@gmail.com>) id 1jH72c-000216-6w
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <npiggin@gmail.com>) id 1jH72b-0002YT-Bc
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 10:29:58 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39127)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <npiggin@gmail.com>)
 id 1jH72Z-0002V0-9y; Wed, 25 Mar 2020 10:29:55 -0400
Received: by mail-pl1-x641.google.com with SMTP id m1so860216pll.6;
 Wed, 25 Mar 2020 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1xKeu6VimaRYn7jXQ77APordIWRNgRgDtrBRj3LPFg=;
 b=LrHtlOXl7Ij3zRT7frslaNeGonaFX7lB2Q5imbdYkTvwjmZSNtvxrFd+7pcW1jonS6
 Ye3rS0dLtTSOEr+6LacECq4NbxHlsBBWPq89vBS1PFNAR79coL6Tzfm8Ncf/1QDHTx6V
 Ls5zi7snsS9xdmNEyMekU2rbJDusy76lqiBfiPbnNt9+F1H2YG+ftkrsWIV6PZY49SEz
 TURBZiuGsb26TYGP4xjXBt0vEPiFzx6oAecuuNRd52+9xXOqKvDq/ExSKroKNal7K6ps
 +G643YR5rq6QWIK4hr/57hTrE9Vz2KJdY5CwOohtZfHVSoFwfyvd/hVdvib+m/3q9s+h
 linQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1xKeu6VimaRYn7jXQ77APordIWRNgRgDtrBRj3LPFg=;
 b=oD4vdCi49Z0/DxeJ1YwYKYLS14pn2eXdANV6fD5zceOJI6NrDu0Rx0/Y+kr3vuVs0h
 lLo/2H1DJIi+Osyr4g6t6nkVdpFHyDM4ERvplG8vXjc49lnj3igEBVRH43PXgNYLIF2Q
 slNENx4YnH613lAPKN12PGDxt16vef+nWrqjGD5w+Blz3ESqLUJUfqLMFmcO7jUTBMZ3
 vYoKLpuTEEptwYBT0bZTVJgpaC57wdLeQZryGU9vMZsFuUK/S32rhGZTBD/hEvpQ1YEv
 j5v6nmxe3GcedYVYbU0z3WMn3AHi0Wj2/crAz+bMdKFgzeAcbAMq8dreRM38XBUwrMaZ
 SERA==
X-Gm-Message-State: ANhLgQ0allYG37mdgD6GC1pGW74Umsvjc2jIPnPENROCuHtsaCiF+CL1
 nUmfUDBzFptGW0Nm5X8BorVDq7bC
X-Google-Smtp-Source: ADFU+vsu4eeSQvR7jpvcBWVl6gqXcdDRsByoiGlUpeWWKEgiTxZra6gGrN0JgW29iArxXvXUfhx2EA==
X-Received: by 2002:a17:90a:840a:: with SMTP id
 j10mr3967492pjn.37.1585146593386; 
 Wed, 25 Mar 2020 07:29:53 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id i20sm10609622pfd.89.2020.03.25.07.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 07:29:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 0/4] FWNMI follow up patches
Date: Thu, 26 Mar 2020 00:29:02 +1000
Message-Id: <20200325142906.221248-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1, I addressed Greg's review comments, and took the mce
injection patch out of this series.

Thanks,
Nick

Nicholas Piggin (4):
  ppc/spapr: KVM FWNMI should not be enabled until guest requests it
  ppc/spapr: Improve FWNMI machine check delivery corner case comments
  ppc/spapr: Add FWNMI machine check delivery warnings
  ppc/spapr: Don't kill the guest if a recovered FWNMI machine check
    delivery fails

 hw/ppc/spapr_caps.c   |  7 ++++---
 hw/ppc/spapr_events.c | 46 ++++++++++++++++++++++++++++++++-----------
 hw/ppc/spapr_rtas.c   | 10 ++++++++++
 target/ppc/kvm.c      |  7 +++++++
 target/ppc/kvm_ppc.h  |  6 ++++++
 5 files changed, 62 insertions(+), 14 deletions(-)

-- 
2.23.0


