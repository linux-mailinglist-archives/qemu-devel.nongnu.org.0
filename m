Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCCA43C13D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:19:03 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaP0-0001n5-Dt
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKY-0004RZ-Rt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKX-0003gT-AX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso5046765wmd.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDM0lgYWgrRxIig92VwVxQ5l6+lgRxIeI1FuXQJgf+M=;
 b=IlX+ATn3haXEGgp1tekjlptSVE5zI5IkCyjjbuzrvgrMjKeaXOMhuXUWAgGxIpKOkE
 MCxHvKZNNkD41dvYXS2+/miZs5SKk9BSj05o7K8aqvjMq8s5W6PkIJtnEdY8HD6g53l9
 kdfcl1aI4Yv/rIONwi2hqJJvASNFe3fxCSI2CSMSEUPJaX9zwQ4T92dDdFvV2Mn2/ovL
 tykx0KZUPwrwPQYxSea1IcvjReucfiuG523A4tw5qm1F2xA1DkVDAwsoePq2ev8xx2Ta
 ZW/kHSt1nd4t21EBLM093xti/eRNNt3R54zPh6QEitSEVhNzLcSMusY/gcs1qdBBIoIj
 TTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZDM0lgYWgrRxIig92VwVxQ5l6+lgRxIeI1FuXQJgf+M=;
 b=uwijSke829OMpDdKYiKKymPpOWTV9N64NKCIMxjPXo70yZ+5z18D60FvsPJC3QANZF
 sZ5RNwhw0I+12tgdQXDdXO8IvZvm8aDjcnfqzTXNvnEEwTx/d8f4SBw1tRMtSHBM4qrV
 kzbZNB2Iw2mjxhYs32jL9KlY/vTqhE2uzJ3bZq1peKLLSxehJK9WOStVAtS4j6MqW1/l
 9O+E/NDQKQOupyimEzDd+MnTP7uUgGY9GEE7Xn0o56VA3Z3TXkNqssTNIWwzOCya4aCf
 IDbRQkc0qiLnDCpHBFbPUw5gaOfa6Pvcr7MQlTitjI+VJWgBheDdPXBbjCuELwuS/x31
 XwKA==
X-Gm-Message-State: AOAM530MiB42w5h8kjQVh+CWAizheTPc+Lmjmwk9vZlmPI8s93uqe1Xq
 J9hnfGGd0UKP5UAW07N8uxLWMwyTxvk=
X-Google-Smtp-Source: ABdhPJz83fFgwwyM0hYwXDRCPlDQDkE79b+wyZ5uO3yNS6CdKF4/M9dJ2yRfx9j5Xg5FUBLq73mhYA==
X-Received: by 2002:a1c:f:: with SMTP id 15mr3287700wma.66.1635308063889;
 Tue, 26 Oct 2021 21:14:23 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a2sm20498963wru.82.2021.10.26.21.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:14:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] MAINTAINERS: Add MIPS general architecture support
 entry
Date: Wed, 27 Oct 2021 06:14:13 +0200
Message-Id: <20211027041416.1237433-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027041416.1237433-1-f4bug@amsat.org>
References: <20211027041416.1237433-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The architecture is covered in TCG (frontend and backend)
and hardware models. Add a generic section matching the
'mips' word in patch subjects.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211004092515.3819836-2-f4bug@amsat.org>
---
 MAINTAINERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc431052..5369fe2a129 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -109,6 +109,12 @@ K: ^Subject:.*(?i)s390x?
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
+MIPS general architecture support
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Odd Fixes
+K: ^Subject:.*(?i)mips
+
 Guest CPU cores (TCG)
 ---------------------
 Overall TCG CPUs
@@ -242,7 +248,6 @@ F: include/hw/mips/
 F: include/hw/misc/mips_*
 F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
-K: ^Subject:.*(?i)mips
 
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
-- 
2.31.1


