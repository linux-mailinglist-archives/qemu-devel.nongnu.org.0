Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DBB3E3B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:57:36 +0200 (CEST)
Received: from localhost ([::1]:36326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9tNf-0007U7-DO
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sD6-0006ev-4x
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sD4-0007XR-KV
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sD3-0007Wq-V2
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b9so5596908wrs.0
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOoruMaTeCNDoafHm9yLjtEQ2dgmSuxRKdw4PApSxEU=;
 b=mWPXKb9UZOsYDYsQLg4seRhbOR4KHg9FYhcDN++F6fBtqgEIZxPLIq+7fGSABD0I+D
 7bgLi5b2TvWx1h351IovjH35KeN7GdQiKrMs/KwqUfWymlj3YEoNvPhDCJ4yxyllXESa
 kmpOzjMmiiDO//pLHrn8CuRJ6p1i8jSs3rX4GJgY4GfTCaKNFkfXKG1r7SyB/lT/QzBn
 TkBel88Uj3fe+6q00bpryCsaKsvhgMa21KkjWMYwzn9nPg2u5Jrk43YPhZoQNMNCtVeg
 jFueUPlV7RjOLxXlmrpbwZQphz1Zek796pEiTWafdF3Zz0zoe1VXJpdXl6Umh/UFqZS7
 zBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jOoruMaTeCNDoafHm9yLjtEQ2dgmSuxRKdw4PApSxEU=;
 b=hZpS9Ywv9Y85pQIPzrrYADZMctFykxLk+iSnOVFlYeDRsjSjbIj6Mqv/R6UnD8zeFJ
 cIdEqzq9sZzME0dHc6Jra9TaSpmU70MBgqaFMfiKX/BCLSg1yhc8qNYoN7RtfhLCGnW8
 s6Ga7uhEJTO1n0IRdrW+LyHOm06xmYtQS/gPwcV4cf4S5kYsS99nIF1azlnBza+x079c
 Lw+WkL/9zyA7/AMS91RdeT5GpHTYA3XtIkcOoDyHwr+iDAnhxxFCpMtmMl8xjoSQQ3Cx
 whRez1Wq1Il4vayEm1jotOZs9DtyGefaIPFTMcVhd5q4DC+SINjkTVXzrabEfp4n6tFq
 9f+Q==
X-Gm-Message-State: APjAAAXQ2/3wLXrbCV+pQ02A8vY3FpyLdVxSNrhHiborlageJ6u3Zg0l
 7w0Su4OZ5JsaKzDrmpoVdM7RtjPf
X-Google-Smtp-Source: APXvYqwy9Ht7NTtK6Np+Pla70MO4cpb1omyo6b1TBXeWeSSQpWrmaRBJv0Hhi2ZICPMzmhfp6rbJVA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr113707wrl.254.1568644952411;
 Mon, 16 Sep 2019 07:42:32 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:59 +0200
Message-Id: <1568644929-9124-20-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-devel] [PULL 19/29] hw/i386/pc: Pass the boot_cpus value by
 argument
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The boot_cpus is used once. Pass it by argument, this will
allow us to remove the PCMachineState argument later.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190818225414.22590-6-philmd@redhat.com>
---
 hw/i386/pc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b15af77..dc2ae6d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -936,7 +936,8 @@ static void pc_build_smbios(PCMachineState *pcms)
     }
 }
 
-static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms)
+static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms,
+                                      uint16_t boot_cpus)
 {
     FWCfgState *fw_cfg;
     uint64_t *numa_fw_cfg;
@@ -948,7 +949,7 @@ static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms)
 
     fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
 
     /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
      *
@@ -1869,7 +1870,7 @@ void pc_memory_init(PCMachineState *pcms,
                                         option_rom_mr,
                                         1);
 
-    fw_cfg = fw_cfg_arch_create(pcms);
+    fw_cfg = fw_cfg_arch_create(pcms, pcms->boot_cpus);
 
     rom_set_fw(fw_cfg);
 
-- 
1.8.3.1



