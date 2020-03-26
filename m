Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6D194864
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:10:03 +0100 (CET)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYpG-0004jt-NK
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYL5-0007pO-Ts
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYL4-00024G-UR
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:51 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:40359)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYL4-000244-QH
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:50 -0400
Received: by mail-qk1-x729.google.com with SMTP id l25so8188309qki.7
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TvYnAkjAppdRPxTCTiIdH7gnvDHcZXb4SiVpZ+2G8IY=;
 b=bXLf9wvEJz0IcaMKjjb0mg2gM+JQyhks7b5zuDie1CxSdf0R+VjMTEIgRFrjSxWpmP
 FpgJN+MW6wBRShptt1fcLP5yJqtkPUSHYByn9t3z9UzSjNf5sOkKmfBtHPA/fcxlhBMR
 aLo8NAZCgpEtZOj1rDuSlj1gUP+KeVg09eF9XmE8QOWOqAJXaF7+VdV+X/hrtnyHZEzU
 ZV3CI+nM4WDVhoG9m/Kd2kjb1XQliPwY2Zbxr3PTnWG6iN2/knwGg4rGT84gL/3HhfnI
 eAp7mEKwo+AYzbv5SVzk25oZkklPQGvLYEthUM60HfRjD51xpJ50usLvo4oLhUVmUe1H
 FoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TvYnAkjAppdRPxTCTiIdH7gnvDHcZXb4SiVpZ+2G8IY=;
 b=Vl9ww/YfyuIO/Itfs95C8EwpNRl/C7LE+otcE8QKeKOA2GUMW4fgSvAZXtP6aCUa3q
 sHZxmaqb3pSwQoaPExr1vMmbdCmhLFuH01OeY5WV5RhN1QVX0B1HdfHMNKMqm88WH7Mw
 +q2ZYeEN+HQujLEDXmvZhlSN/24poUmoQ2L1a8rAwsvcq28E0r4z3qLp4OuhMp+pG7xD
 YsE3xhJMiOJYWH0x9hMFChjB7kOSK6lIrGaYFFIr4ZE/69gMx7HvOJw0T/Xt9xOBH/8H
 y7JMC8be1imLZwus41a0r84uoaO647KU3/rMyKDIAXbOM2Am12CR7zbJ4lINpNBjC2Wr
 O8TA==
X-Gm-Message-State: ANhLgQ2lsftAHC+fdYxxtI+h9ro9P7lKsenZQ36/BnNaSgj8yNFBQJGY
 VYt0P7XiXXKRgFvBMVl5H8OO290DP9uBrw==
X-Google-Smtp-Source: ADFU+vvA/pjE2XRzg6uaJMRI5KfHbI9Q397XtWceEcBPUetaIYUdkYSrI1sC6rWdtD08FNTljZ3N9A==
X-Received: by 2002:a37:b986:: with SMTP id
 j128mr10015811qkf.109.1585251530037; 
 Thu, 26 Mar 2020 12:38:50 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:49 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 55/74] moxie: convert to cpu_interrupt_request
Date: Thu, 26 Mar 2020 15:31:37 -0400
Message-Id: <20200326193156.4322-56-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::729
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
Cc: robert.foley@linaro.org, Anthony Green <green@moxielogic.com>,
 richard.henderson@linaro.org, "Emilio G. Cota" <cota@braap.org>,
 peter.puhov@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Anthony Green <green@moxielogic.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/moxie/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 6e0443ccb7..f823eb234d 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -32,7 +32,7 @@ static void moxie_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool moxie_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
 }
 
 static void moxie_cpu_reset(DeviceState *dev)
-- 
2.17.1


