Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FA4BFA0A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:59:07 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVh4-0006om-7J
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <706701795@qq.com>) id 1nMVYL-0008G7-L4
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:50:06 -0500
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242]:44454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <706701795@qq.com>) id 1nMVYC-0002iS-1B
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1645537780; bh=N4XNwG42FuvEmUN28f5Y1WsMzkGnWU4j4KevTAHecUs=;
 h=From:To:Cc:Subject:Date;
 b=isdOwCguDGFDVLtpkn9NnwYZ4anfYn3/mS1JkAMjfoO6Oc0/jrl7kYYwKSLeMoDkw
 xUNfLoz1Yj8r7XKgVIy5aQrc/Hdyg9QSiyHrZQ4fPNYiBr27MkDic8EUUFikw5acwh
 /VGBcSgHjPEFaMfLnIntKVhCByACublLCfwsNQ10=
Received: from MiWiFi-R1CM-srv.. ([112.49.235.25])
 by newxmesmtplogicsvrszc11.qq.com (NewEsmtp) with SMTP
 id 9FB818B5; Tue, 22 Feb 2022 21:39:59 +0800
X-QQ-mid: xmsmtpt1645537199t46ggu53c
Message-ID: <tencent_126A74BD1A371588D4A638DE700FA8844406@qq.com>
X-QQ-XMAILINFO: N9C/Vpkk5whXs5l/EbXOBHSvr+DA6vUG1D+lXBIHskv3o6UVMVRMWOzAV1cjpI
 upzY0xMlhYmE3MqJh7zT6v2ZHK5xDxJtk44UVS3xV7XZyFrRz499j5wnULcL9N71UglpkcFeR48S
 2EJK2vdFRupAdtzaC/2ZiMSSxLxZ56gsolFEshjTkhFTfBGApstzizeAcR4WUaaDK3zi6ctfcAk0
 +7kUYbJu3S1cp8MgZm1VlDn2zB/ERTp7jXE9jDlIrCCO5sPQmOil/+35FMDUhySFGCjEjsK/TsbV
 HmIU6Cme2SSHugR3yfkVtf13cN4Z/vZNG4zEh9JNCqN7kX2MMAoCicOlkwep+l7M/sl27bbZ/h5I
 N/bYzfymd93y6kz56B/gFOTfEMZR7d9eI6REz9xciDuwrBSYQAw0Nvm6rleKVHROCgFOnkK6U0Tf
 wWBZCShHrxGJsRsJf2FwiNa+oHPkPq2vymSBynAeL+scJ139GW+Kw8Cu3Y0nHNU6sTvCe2Q4E0jT
 1Zshw3l6wdX/PfYoqUlf0IxpGdbw/Fhve1Jc/1ozlIO4gR0tINZ60WEU1PIMoAl0zTTWFlNjZqwJ
 Pka8PZinkvQaE9nGN/0xPGg0QzEWemFarxpvvQpw9oNvw9lh6TaSXd+5p5z78W27wM5dEpI+0pUt
 R7U1iZJBd/YAqilmFHWFafWrs6aNFQ3U6Wq3HxDMPvswaUV5ecsH3RqQ0vsX32AX1c1Hm6nfNvrs
 rwIMBRgfli6gjrvlBdGg+AaWbtG23Wuv5piN1rbGbnRqyyVC/cK8Gs/KZJLy5i58Ucoef/XpfaZu
 3nA1EV2z8tEsihYsFEMFv6oh+BJneYcHGDGVMl6TFxBmiZ61XzMbS8Sjf3XLSOlC+tZshio7tm4w
 ==
From: lichun <706701795@qq.com>
To: qemu-devel@nongnu.org
Cc: lichun@ruijie.com.cn,
	pbonzini@redhat.com,
	lichun <706701795@qq.com>
Subject: [PATCH] vl: Fixup mismatching ram size
Date: Tue, 22 Feb 2022 21:39:57 +0800
X-OQ-MSGID: <20220222133957.74042-1-706701795@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.205.221.242; envelope-from=706701795@qq.com;
 helo=out203-205-221-242.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

There is a mismatch between 'memory-backend' and '-m 0'(implicitly).

Signed-off-by: lichun <706701795@qq.com>
---
 softmmu/vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800f..70eb2e53e9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2110,6 +2110,8 @@ static void set_memory_options(MachineClass *mc)
         exit(EXIT_FAILURE);
     }
 
+    /* store value for have_custom_ram_size() */
+    qemu_opt_set_number(opts, "size", ram_size, &error_abort);
     maxram_size = ram_size;
 
     if (qemu_opt_get(opts, "maxmem")) {
-- 
2.35.1


