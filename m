Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2256E4407B5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 08:23:52 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mghmQ-0000Xc-N4
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 02:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1mghkq-00078j-Ps
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 02:22:12 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1mghko-0003m4-E3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 02:22:12 -0400
Received: by mail-wm1-f42.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso5222582wmd.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 23:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/al4NZWbzfsrCOvBzgv5aUvtnfNnLELuLAECWnkY7k=;
 b=3JyIZpAy5LCiPtqUsOEJ88B7rjR4MChpIwWiwCjRV/kHSOxDDviZmhlvUjw5Xfwf2q
 my7TFNYQ8Chi+eGP2YxQZOwDTuI4gNzpkhQaLGg3CU2BlsZbIL/fkusNlYTAVdLqGqWF
 MWrR7lpaQpY+W0OIEPl8oDYQ309fX+ReRjOhzJjSyBmJRydTJgLw7EDPQYCShO3uWiku
 O2PXVbD9LCgH3eCZGH5BulHC4pT7xtp2U1cfoOt4iUH+4bwxjfATuyUzM7UfuBgwG6aM
 +/V+Fxf8ShJhPwT7m/HG/D6VpxFPBori2VNNCXF6S9r7wwnA5RDV2HxIW58FoYJR4/Yk
 5yng==
X-Gm-Message-State: AOAM5319ZDA+lwEj643wADO/0zaC2eUw7ejudFiiIYFsw0EXjTvvD2jS
 uo9akoZOf1qanoRXAoCWxBCnOYh0/Tw=
X-Google-Smtp-Source: ABdhPJyMzy6M2G0N3f43GcKnPySJHib7uC6Ugeg37zJ8wmUSZoUWm53JVnFP3DCuDoaqQ0qDjah7QQ==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr25262059wmc.141.1635574927555; 
 Fri, 29 Oct 2021 23:22:07 -0700 (PDT)
Received: from localhost.localdomain (tmo-096-150.customers.d1-online.com.
 [80.187.96.150])
 by smtp.gmail.com with ESMTPSA id n25sm7995621wms.10.2021.10.29.23.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 23:22:06 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for SDL audio
Date: Sat, 30 Oct 2021 08:21:06 +0200
Message-Id: <20211030062106.46024-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.42; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've got some experience with the SDL library, so I can help
reviewing patches here.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc43105..a24dfbfd32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2313,6 +2313,7 @@ F: audio/paaudio.c
 
 SDL Audio backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+R: Thomas Huth <huth@tuxfamily.org>
 S: Odd Fixes
 F: audio/sdlaudio.c
 
-- 
2.31.1


