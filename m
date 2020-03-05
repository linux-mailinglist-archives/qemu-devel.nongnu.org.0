Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909FC17AAFB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:55:03 +0100 (CET)
Received: from localhost ([::1]:53080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tm2-0000ig-J3
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tPO-0003qn-2T
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tPM-0002od-Nt
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:32903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tPM-0002nR-HO
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id x7so7822775wrr.0
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zeqkTd38/1Km3JJ/1quXA06O38++6T6yTayRGKMd5+E=;
 b=Uym/AUtm4iNRxyFZz+UtzokBaZE5LsiL2Sk7JE680gyEEuD1ID9HHV94mo87oBju2c
 u4OPBFKC1MJFMCF79WDdxBWWNWMX+wIqh5YiPCLOX5GtSkAx513vll3pqfiadjycwpCh
 imEqtO3k5KF4Ek7eJDOB69wVMZ/Mb47RdfYBmN3CSj/AObX+24kwQI/dOsmMAausBJiA
 PfwvF3d7tiB0BXXdVaUxTD2yw7ERZvytYZpbdJjoFYEVjTteYdpGpMe35pXW+TRt93oo
 h/FedA5kgmM7bGK7lVFUK0dj3nToTPTkDaMwK6iL0SAal/HmY2koISfbYShcMJiF7Y76
 HRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zeqkTd38/1Km3JJ/1quXA06O38++6T6yTayRGKMd5+E=;
 b=KA3jlWTQqr1YbWAjMXyzadNhvQ7tBmTueeZ31TV7FzPM8vWfctXMD6vl8vJjVwkyUi
 8BVTsO+QXSWgc/d+rfMVZLQaLN8xR+5zlbMZ/TG5cDI4VotiXXv7BnUKq6ekQzwBbUq2
 BwOsteJ8RyreM26Qfds2pVtbp7wMU/hhlFOMULXN4aNbgj6h/Hq7A8uwtTnKJNwQfGve
 V+ONMzS/CEsJqTzQLOFC6Q/S3SpZAqkeRgnR6TQK8CEWXPPHLpJjUeVfQ4KpDm4TBuy3
 5Gw0HpK1DfnIrYbvN4S3xqg4V6i1+MekVzlJYapG+IBJ3hXGde3hK05kc2VlC923dU7S
 QRaw==
X-Gm-Message-State: ANhLgQ1ot0VXgg39PdT5Lc5iIyntEygL49aVOaMhBC+Ri2hJ91tyAr9o
 gNvWgoL6i3KZB3qCXZjxV4MyOOofyS9NMA==
X-Google-Smtp-Source: ADFU+vvgJKycf8sC5QKVcUSLFRoCppIv7/mBDLLo97PpBmxXOYWLB4zWZAYOfvWygGplBmHcF+FZtw==
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr11176459wrh.359.1583425895083; 
 Thu, 05 Mar 2020 08:31:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/37] hw/arm/cubieboard: report error when using unsupported
 -bios argument
Date: Thu,  5 Mar 2020 16:30:53 +0000
Message-Id: <20200305163100.22912-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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

From: Niek Linnenbank <nieklinnenbank@gmail.com>

The Cubieboard machine does not support the -bios argument.
Report an error when -bios is used and exit immediately.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20200227220149.6845-5-nieklinnenbank@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/cubieboard.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 6c55d9056f5..871b1beef4c 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/arm/allwinner-a10.h"
@@ -33,6 +34,12 @@ static void cubieboard_init(MachineState *machine)
     AwA10State *a10;
     Error *err = NULL;
 
+    /* BIOS is not supported by this board */
+    if (bios_name) {
+        error_report("BIOS not supported for this machine");
+        exit(1);
+    }
+
     /* This board has fixed size RAM (512MiB or 1GiB) */
     if (machine->ram_size != 512 * MiB &&
         machine->ram_size != 1 * GiB) {
-- 
2.20.1


