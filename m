Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61183FCC3C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:21:36 +0200 (CEST)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7Rw-00064M-5H
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL6y1-0007LH-Gv; Tue, 31 Aug 2021 12:50:33 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mL6xz-0005RW-N5; Tue, 31 Aug 2021 12:50:33 -0400
Received: by mail-qv1-xf34.google.com with SMTP id e18so10791515qvo.1;
 Tue, 31 Aug 2021 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d7gWlG2jrqTaKfKtQ7cgmiLBbVCcFP+SmyvRo7UtMs=;
 b=ObHDRh1HxxiFUXbFHCNmoai++VVThiEv1NmXgS4V0FnAESzNTIdT/YdX/jNB9RVrv7
 jIL/WKFJJPmOOHyqY8H99OqhRsJZb9bZ1Umq3wGTVQGdRlSH4LHGsdhZzHz9lnq4SCby
 UoW9CTnO7UUEqLCtix76in6t+jCQNGiOUhlD9gOHTzJ5lM3zO6jdQ2k6rEjy1Z8nTUpS
 a1DjEoL+yJO3wtxXmCGq5ERoItTTHW/uDMEvnPmHPoJ3Df2cLZbql2zPch4QJARllxvl
 sdZeOEUMpmH1Gv/umhsCU5YFOFi87KZxdAUs34Z8TnzubZYz/ztEpXtOvoRPBAXkbE72
 HMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d7gWlG2jrqTaKfKtQ7cgmiLBbVCcFP+SmyvRo7UtMs=;
 b=XVqkXRqqWgyc4lFtzPKVgOtaPhH9actDiWHRaIaghDB5XBeGSxYTaw8a5fztIiOi82
 LYfo92/FLfRnzOqWHluPuTMi//TPFy+rpH4DgPijxfMyc5rDHrLnJ9tPMHg4heV5Y19c
 +Ay5Wk/I7vcztL3oT9hEhUn+Ufc7FLbEe5RjkNtdFtIoPzhaAz9iXz+WHgS7+RM0I/a+
 gM5qItsJdCg1vrqOQwNzGasa1/0jo1HIOPa5G4VB7JxXP4Tcarbz83NurZHIQnCkG9y6
 7qHqe3siLENyOP0DIq0dPLqQb6Kfzj1KzuJm4DOqW7yC2cbHnx7lER50ubLH4C3Z5vzm
 areg==
X-Gm-Message-State: AOAM5308uVv0tKwwUTmOUn8lypbWVHHCsmKihblBAdc/wGqxczPHNmCY
 7HgFgJM1+SOYMJOZCZ8F7Uk=
X-Google-Smtp-Source: ABdhPJzxv34zFPdVnp1D1FM5y61BPVT/93umC4ClzWlfsoPCGx9nUbAByhLfkMiLhYR1kq0YXorkCg==
X-Received: by 2002:a0c:d801:: with SMTP id h1mr29900297qvj.60.1630428630314; 
 Tue, 31 Aug 2021 09:50:30 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id t28sm10624494qkt.70.2021.08.31.09.50.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:50:29 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: peter.maydell@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, hsp.cat7@gmail.com,
 balaton@eik.bme.hu, mark.cave-ayland@ilande.co.uk
Subject: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
Date: Tue, 31 Aug 2021 12:50:20 -0400
Message-Id: <20210831165020.84855-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios folder. This makes all video resolution choices disappear from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-bios folder giving users back their video resolution choices.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9a79a004d7..281577e46f 100755
--- a/configure
+++ b/configure
@@ -5056,7 +5056,9 @@ for bios_file in \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/edk2-*.fd.bz2 \
-    $source_path/pc-bios/palcode-*
+    $source_path/pc-bios/palcode-* \
+    $source_path/pc-bios/qemu_vga.ndrv
+
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
 done
-- 
2.24.3 (Apple Git-128)


