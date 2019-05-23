Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08127F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 16:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTog9-00045d-6I
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 10:26:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodr-0002rB-1O
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTodp-00074D-9U
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTodn-0006uR-6S
	for qemu-devel@nongnu.org; Thu, 23 May 2019 10:24:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id 198so6061130wme.3
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mSpvfYP0iVrT7e/S7QFK2UnkxPjj61LdvYVxaZGAQEM=;
	b=C+QdGa0+FkUpBMlH/yrjt0Dfh40SrN66t4GZhH+9LAXnWVOt9S0veY6v2CdXpsLfm1
	xY++Wu2955TorW0QwYkbkfiMA22QRSccs6l3ZksIA/hkzAiNsxb+5aBJjYPDhiGmXbH3
	/DvqdzH2CyAGbBwXhYOMw3AzE2MdU/tI//a7CLtXJjPclwCrWP6BEFidrg8zs39Qy4GJ
	siYKsy/CeElUHnmi1T2Wo8Oy/sltR5KLRqS2ogkDX6vNSYVHurVd9tL38Em/YpzR2v+d
	TmZhjvGDLfgaW+gHgnKhMZOiyU40TeN/ZA2ckaGkeyIwD8QWEtYjlyd5v+ONd/mF2wIh
	eTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mSpvfYP0iVrT7e/S7QFK2UnkxPjj61LdvYVxaZGAQEM=;
	b=LzjuUl7ojYr7p1YY/sEkGoUSFG49b5YzRFi5BIRVeUOndUT/qicuJOFwQ6jwwEAzJ1
	qwhHnYQmKPSaHNsmsd07p90HksNwvTEx4cTpNzylcKgnrZ10bKOmhoSaZf+pUwzeDUrA
	BfLuL+87fyFHdSp8KOLvJFdc8dxUtKrv/XJK1aw5q/1e6PQgJZgc7qC1b0ICfADRPzZb
	K/Q5xqW0NyYPW+boLr4kOqh88B/SuKEhF69KvdHHkK1xUmQvt3SvuPz3sKc+NAuHL/sj
	47rLgRmINLwJ+Nni7aAPjl4FWIbxO5CE7bP5L60hT4xowSxh6lvLHUFBYnHNI8b5KuRC
	giOA==
X-Gm-Message-State: APjAAAWOm9PYhLb3ZeLI7250Sulo+lwpQsj0qWL/djxlN/Z0kqZhEwg1
	onXu/SIDnIlrfxJ8zrsk9rnDKLxWguT3AA==
X-Google-Smtp-Source: APXvYqwmbUC/SISXpSy70jIsOuyoZHz6MSNCdtBkFEbirutlANT5Ql9xco4HyFlD5mVcz50bEQaDKQ==
X-Received: by 2002:a7b:c762:: with SMTP id x2mr2874806wmk.144.1558621447659; 
	Thu, 23 May 2019 07:24:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id z5sm9700617wmi.34.2019.05.23.07.24.06
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 07:24:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 15:23:52 +0100
Message-Id: <20190523142357.5175-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523142357.5175-1-peter.maydell@linaro.org>
References: <20190523142357.5175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::334
Subject: [Qemu-devel] [PULL 07/12] hw/intc/arm_gicv3: Fix write of
 ICH_VMCR_EL2.{VBPR0, VBPR1}
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ich_vmcr_write() we enforce "writes of BPR fields to less than
their minimum sets them to the minimum" by doing a "read vbpr and
write it back" operation.  A typo here meant that we weren't handling
writes to these fields correctly, because we were reading from VBPR0
but writing to VBPR1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190520162809.2677-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index cbad6037f19..000bdbd6247 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2366,7 +2366,7 @@ static void ich_vmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* Enforce "writing BPRs to less than minimum sets them to the minimum"
      * by reading and writing back the fields.
      */
-    write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G0));
+    write_vbpr(cs, GICV3_G0, read_vbpr(cs, GICV3_G0));
     write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G1));
 
     gicv3_cpuif_virt_update(cs);
-- 
2.20.1


