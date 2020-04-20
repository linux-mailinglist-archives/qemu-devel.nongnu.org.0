Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E01B093E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 14:22:01 +0200 (CEST)
Received: from localhost ([::1]:34546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQVR2-0003TS-4A
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 08:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPY-0001m2-En
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:20:28 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPX-000137-CC
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:20:28 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41127)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome@forissier.org>)
 id 1jQVPW-0000yf-Q2
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:20:27 -0400
Received: by mail-wr1-x444.google.com with SMTP id g13so9839737wrb.8
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4UmDdI61L8uOPFBQLI+IE+1VpgKE5K/n1C5kplmea8=;
 b=BxnsgXhry1QYBAHpnkj133orLLZc9q0FtASFreF6xv0j5mAvks4FCVlzmc5Zi94ptf
 N6+mHIGf6ZRT3eH+t5deFhPygStbMmym0itosTGnxEm8w63lnjLUVup+tIYB5GJHixSY
 N8Rojg2NHobMHZLyPswWkMWzV+heFQ0v1AIOWC7sLDZmsYZJ269BlWVkrbngvhM4ENHz
 8cdgRTgQL/nop9dmUf5DmQ5Bau9QYCG/f8VSH9SmGokhOqbIQcpO+MCo0febpFKm8JFB
 xQ3G8PIJzQetT+8YFdwhlCy38B8hTmvwV9eAy7U0F4Nz3p2nZJhZojyigyZDTxhKSZc0
 mapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4UmDdI61L8uOPFBQLI+IE+1VpgKE5K/n1C5kplmea8=;
 b=VmCPn1E464kaiPw3kf0D3D9fwBflgw8lXEOWw086sYad1JggH1HAFN5Gnnv/JnnjRM
 HbXBtjW/HGfCCE81eIaIq5DuAspKxpwt2CZxgQ4w4b725HrzMdBbz3FMaO7SstgaKUrm
 CUp3l55WSYf3iNqkhgdzL6+PCJQG7wlxmPjOetVCU+2ZlrdTqQhES5CmwBsFwf08CMlE
 R4jH3eV7HCwkRZQtwpZNP7jvK1JS7M6QnBiHKf8vGeMbDIimN6/z+xNjjvSQLAC2Z5Qu
 BYrtWhQhKBsaG7t3W61y0l0Es90dm3XdCu9HGHyhr77Rrv00K2NH0sO9VdqMHc9TRcPp
 higA==
X-Gm-Message-State: AGi0PuZtzoLRC7PK9QNPEEZaWTLFJygXUFqqYpe77MTzJseJgYhJNsDB
 fms0g3Mry4U+dQpxcbjOgjDwHg==
X-Google-Smtp-Source: APiQypId1zOJNb0RSGryjnoqCcmmBOiRWQUEL32B6uw2qktzIoejLsARC4D62Bpp9Y3ghJbvET+sBw==
X-Received: by 2002:adf:e681:: with SMTP id r1mr20205694wrm.213.1587385224102; 
 Mon, 20 Apr 2020 05:20:24 -0700 (PDT)
Received: from matebook.home ([2a01:e0a:3cb:7bb0:4826:2464:6688:71f6])
 by smtp.gmail.com with ESMTPSA id v16sm1127132wml.30.2020.04.20.05.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 05:20:23 -0700 (PDT)
From: Jerome Forissier <jerome@forissier.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/virt: dt: move creation of /secure-chosen to
 create_fdt()
Date: Mon, 20 Apr 2020 14:18:06 +0200
Message-Id: <20200420121807.8204-2-jerome@forissier.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200420121807.8204-1-jerome@forissier.org>
References: <20200420121807.8204-1-jerome@forissier.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::444;
 envelope-from=jerome@forissier.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: tee-dev@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The /secure-chosen node is currently used only by create_uart(), but
this will change. Therefore move the creation of this node to
create_fdt().

Signed-off-by: Jerome Forissier <jerome@forissier.org>
---
 hw/arm/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96abf72c..c3073b7cf19 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -234,6 +234,10 @@ static void create_fdt(VirtMachineState *vms)
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
 
+    if (vms->secure) {
+        qemu_fdt_add_subnode(fdt, "/secure-chosen");
+    }
+
     /* Clock node, for the benefit of the UART. The kernel device tree
      * binding documentation claims the PL011 node clock properties are
      * optional but in practice if you omit them the kernel refuses to
@@ -761,7 +765,6 @@ static void create_uart(const VirtMachineState *vms, int uart,
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
 
-        qemu_fdt_add_subnode(vms->fdt, "/secure-chosen");
         qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
                                 nodename);
     }
-- 
2.20.1


