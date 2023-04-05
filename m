Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B06D84C8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 19:22:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6pB-0004k7-L0; Wed, 05 Apr 2023 13:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GK4tZAUKClMy313E19916z.x97Bz7F-yzGz689818F.9C1@flex--digit.bounces.google.com>)
 id 1pk6pA-0004iF-42
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GK4tZAUKClMy313E19916z.x97Bz7F-yzGz689818F.9C1@flex--digit.bounces.google.com>)
 id 1pk6p8-0004ng-Ik
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:31 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3-20020a250b03000000b00b5f1fab9897so36290139ybl.19
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680715289;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aPZnSmUoFakrcaZGaUb56diGDq0a+dfVZtvtkIIV5dM=;
 b=YhpmWexSse86X9JvAu7U222Hh2hASGM9RIRKWykfwXx7qVhJ2QV7gJfoXWZ2+tWnvI
 dN20J722MtlkbDTzu/t+YcvqdWwySQTyStS6WV6bfkzmZWD6YhU2R/5URtcmMC09tDHF
 HGKAU5IPOr9QQyHBkT0rvy4W0rIafyeVeWB4KB3z226BDt0SgOLWNlyhSZQRB4g50LlU
 RiyFlOXf8m2HDZKW6nl0wycVg+WeRi4knzuXrlqyQ/qoXhHnvmbA15bXc8hLX5ESl+NI
 rrtywP3F7GOeILt+k0sKkOZyQ53IY0+k/rk/7AA7T0QvfhJXkMRTOAOjWfNkUIfVJ5g5
 homQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680715289;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aPZnSmUoFakrcaZGaUb56diGDq0a+dfVZtvtkIIV5dM=;
 b=dE5SVemovCyWp22AYk1MvVO20mnjkPsFUV1+dyy0+fJMzA04QhgM4Mq+ZWzyeLHTuK
 2r9k6CvfjxVZDLGCgcC/8rgPKiXAzeqMyhgeTLG+Oik5sD4qSNC5q3w8DEe+hz0ixUoD
 Cjh4EGOIxihdGgjg7EH08XCicohosFQo2EQR1Umq42FQwQ+1LIJPREZcrfyUJiMD/qj5
 SqBLHuBKRvGCA8aF5JLftgAcBPNknnZW0P4/wppUndN4Pm53gP4qAPutg45ZBWdDNDXU
 PHF17mAVCroOuxTUfsJJKrSDSJB7TZyTuSPEXD2pIuE2nmQ8RRQ+OuVrEh6EXywNYS35
 PrWw==
X-Gm-Message-State: AAQBX9fkr97hrNKBlTl5RJ1fGkoTIwQ+IhvlGzWFkxJ0T1CCgKBtFrYG
 2ewFz1cEGTE7QimYfQBAogyN/NIzgCo86w1NEsjEGMe58IorbvWDbd2Arm4G14ZwTGc4tCNGApU
 ePNKOR/hZKtauBZGqgxCm7Mhwn1WDhveU7uZyZCw6F/2D3C+tsevgEdo9BQ==
X-Google-Smtp-Source: AKy350YvChQASNMI2T5PFBb9LCIy3MbNMjy8k60YR643Jeud5i5+zGVQcVVyLKnxfm9YreiuYJINfATo5g==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a81:4304:0:b0:541:7f69:aa9b with SMTP id
 q4-20020a814304000000b005417f69aa9bmr4104942ywa.4.1680715288758; Wed, 05 Apr
 2023 10:21:28 -0700 (PDT)
Date: Wed,  5 Apr 2023 19:21:08 +0200
In-Reply-To: <20230405172109.3081788-1-digit@google.com>
Mime-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405172109.3081788-3-digit@google.com>
Subject: [PATCH 2/3] update-linux-headers.sh: Add missing kernel headers.
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3GK4tZAUKClMy313E19916z.x97Bz7F-yzGz689818F.9C1@flex--digit.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add <linux/memfd.h>, used by hw/display/virtio-gpu-udmabuf.c
Add <linux/nvme_ioctl.h>, used by qga/commands-posix.c
Add <linux/const.h> used by kvm-all.c, which requires
the _BITUL() macro definition to be available.

Without these, QEMU will not compile on Debian 10 systems.

Signed-off-by: David 'Digit' Turner <digit@google.com>
---
 scripts/update-linux-headers.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index b1ad99cba8..e21225baf3 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -160,8 +160,8 @@ done
 
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
-              psci.h psp-sev.h userfaultfd.h mman.h vduse.h; do
+for header in const.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
+              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h vduse.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
 
-- 
2.40.0.348.gf938b09366-goog


