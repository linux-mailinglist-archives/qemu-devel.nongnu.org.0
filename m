Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6720E3562
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 16:18:46 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNdwq-0002Z4-Nf
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 10:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdjA-0008Ek-Qi
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdj9-0007s8-M0
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iNdj9-0007rq-Ey
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id c22so2747571wmd.1
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDYGyaLmE3BDNJATtq1uXRqF7WOHQrSKzbLNf8DRnU4=;
 b=KSPjoF7YphRGHDA5M4aW1CfRFb8rv6dWweYc9JOWBBKCkAs31ZKSn054FG/fYFgTuE
 DlUfqzNZ/e39poNqYpd857b+ZgF1XCj6obY/Em4tYMBIN7U/HYJti18BCkFVUNNN8rhv
 5MgEqNG6M2Fgjryc+8oknarMM1X9RzEeYNQdcgR4jm97Gnfv0Eqp8yTT7EkI+9My5UZm
 YDLQRYRMd4OD2d7hWHmrfXMHiJNhCqqJuQu7n2fjo3Nkji6axAweG9eeQywRwvwZCgvF
 2/X2Y4d7VTw0YO0vBM6vi0ywUvd86H6oylSP4M5VRJgkMw9ulGOv+rhpFWUYAUS2GFBQ
 v1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DDYGyaLmE3BDNJATtq1uXRqF7WOHQrSKzbLNf8DRnU4=;
 b=dgdqlh9DabXp7RkhHc13fE7Nn71p7pk+llhQ6rKyWT50l8Hzy4WQF6UcLYaa9aGZN4
 8B5uHd0n4zeXP+t8/WrnuhGWLQRyF39pVp/WIgFa6QvhV3CFL3s8XZSJlJ8Sat4znu4d
 aapfpSY6ltWBqyy6j26p/Y03XtJXCHz38i7un3Ta3IatWJrHjVXSpdlMHY1rNV2sp67z
 eBxfm5F2rXexhj3da70f3za6Ntbl0FAkqKJvhmkaArRn2FbK7QlRtSz3hqcZk4pqzbO0
 fP4tHOmZQH6D1AM6C3cpCLbQEJa1UmAwaamWjX4x5PNgE3XirtZsZZKRHqlRAnmJZ7MU
 Jm1g==
X-Gm-Message-State: APjAAAWff9kYlFcJDF1R9s/56VBpZ9pq41dAtN7WvvxCgwjBd0+61c8d
 xVD9C3gLxOggEtZX6PpPaQVG7JuL
X-Google-Smtp-Source: APXvYqwgGiMGlJmNFlJBQhO0bNHC3eFg2SEGufh6lb2pmsiHD6kTZV0CwThuqVQWkR+S9GmvOBWumA==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr5469199wma.44.1571925874184; 
 Thu, 24 Oct 2019 07:04:34 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b7sm10610155wrn.53.2019.10.24.07.04.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 07:04:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/39] mc146818rtc: Include mc146818rtc_regs.h directly in
 mc146818rtc.c
Date: Thu, 24 Oct 2019 16:03:49 +0200
Message-Id: <1571925835-31930-34-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Devices/boards wanting to use the MC146818 RTC don't need
the knowledge its internal registers. Move the "mc146818rtc_regs.h"
inclusion to mc146818rtc.c where it is required.

We can not move this file from include/hw/timer/ to hw/timer/ for
local inclusion because the ACPI FADT table use the RTC_CENTURY
register address.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191018133547.10936-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/mc146818rtc.c         | 1 +
 include/hw/timer/mc146818rtc.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 09edb93..dce4dae 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -40,6 +40,7 @@
 #include "qapi/qapi-events-misc-target.h"
 #include "qapi/visitor.h"
 #include "exec/address-spaces.h"
+#include "hw/timer/mc146818rtc_regs.h"
 
 #ifdef TARGET_I386
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/mc146818rtc.h
index 17761cf..a857dcd 100644
--- a/include/hw/timer/mc146818rtc.h
+++ b/include/hw/timer/mc146818rtc.h
@@ -5,7 +5,6 @@
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 #include "hw/isa/isa.h"
-#include "hw/timer/mc146818rtc_regs.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
 #define MC146818_RTC(obj) OBJECT_CHECK(RTCState, (obj), TYPE_MC146818_RTC)
-- 
1.8.3.1



