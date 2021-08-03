Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD93DF40B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:44:10 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAySX-0005le-2b
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyO8-00086b-B2; Tue, 03 Aug 2021 13:39:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyO3-00038h-Sl; Tue, 03 Aug 2021 13:39:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id c9so5903864wri.8;
 Tue, 03 Aug 2021 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFf2qcjEfdFMWv2xh4aRIcDPkZAgwxI41MK2knDnsfI=;
 b=D4sZLWLMnSlHl5v/Eqnl0EmQsipy2xzws1A9bbAfOtDIe+c8fqBpiBJkOCnyIDL38J
 l1tTsC2OxyGm7z4+CjeI57s5vs2pygA4T7SVzZ0/RY9umL+a+BXjduTqbyI9dl6qELEh
 9EC2V6QWLTApNJZIcmx6ganRr/Y8BXDI/j12G46QuJdDnlClOd5/cR2V47IaLn62uJug
 NozdcqlRmiJFlvlkLvReHGZkvZfobYmVvD/Yu53LsGjaE62PbiDG5Le8VLoDTxRzhxDb
 jjJP1j6HoI7BnaoYw8qYdKGmyekZrt0OFQPyatdKO79Hfqu2N9RuSrJwq4CIDCXm4UeD
 7kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VFf2qcjEfdFMWv2xh4aRIcDPkZAgwxI41MK2knDnsfI=;
 b=W7aVnaJ4KTe8Qr4Wr1n0sSknNP7ttK4UXH3HC4jlnE0a/EfX5fle8HTcFUSuueRcLN
 cH6xt2wRh+Gfyiy+SC78hlpnLwQ3LX2Dwl7Y7+uVIiLbAwIbHzFY9LtKU5skFARNYuHh
 1WQmV398RT/ZYj8YwAGjMgdZvjwt+iQn4H01MEDdIUChFxhDlxiSBUzrJdgcLwNBo8Cj
 BhtGh1DRrS3suQOZeNUOWVdc/rWHyDEw2CB1KJ+5gGL21QAXCqKuvuBF/6STm5+Ae+vG
 lJgPtHEVj3rl2kfT5sb5PGyeLJXGyW5gmT7FGkSZEAj2XW+fxKtrtcuZcboXUcirpAUY
 ekyw==
X-Gm-Message-State: AOAM5316QcTO56wuHBHUsAV/1v/3kpa9vwHFYTKWOQ81U9vpIi/UXqnj
 cRSPcJfeI7fnh8ERgoSRTehgSK3uczCCNw==
X-Google-Smtp-Source: ABdhPJyw9XUWVeC4MGnrEODN3GerQyLSqh8cuz2VymyLAJtZk3yK3s1slp+aO3hiPMATIC08k2excA==
X-Received: by 2002:a5d:5685:: with SMTP id f5mr23887661wrv.369.1628012369774; 
 Tue, 03 Aug 2021 10:39:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m32sm2445142wms.2.2021.08.03.10.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:39:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/sd/sdcard: Document out-of-range addresses for
 SEND_WRITE_PROT
Date: Tue,  3 Aug 2021 19:39:21 +0200
Message-Id: <20210803173922.3599280-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803173922.3599280-1-f4bug@amsat.org>
References: <20210803173922.3599280-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the 'Physical Layer Simplified Specification Version 3.01',
Table 4-22: 'Block Oriented Write Protection Commands'

  SEND_WRITE_PROT (CMD30)

  If the card provides write protection features, this command asks
  the card to send the status of the write protection bits [1].

  [1] 32 write protection bits (representing 32 write protect groups
  starting at the specified address) [...]
  The last (least significant) bit of the protection bits corresponds
  to the first addressed group. If the addresses of the last groups
  are outside the valid range, then the corresponding write protection
  bits shall be set to 0.

Split the if() statement (without changing the behaviour of the code)
to better position the description comment.

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210802235524.3417739-2-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/sd/sd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1f964e022b1..707dcc12a14 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (addr >= sd->size) {
+            /*
+             * If the addresses of the last groups are outside the valid range,
+             * then the corresponding write protection bits shall be set to 0.
+             */
+            continue;
+        }
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
     }
-- 
2.31.1


