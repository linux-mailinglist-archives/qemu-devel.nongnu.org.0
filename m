Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6D19FC56
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 20:00:43 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLW38-00074F-C1
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 14:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr6-00022p-8G
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr5-0002r3-4a
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36678)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr4-0002nm-QM; Mon, 06 Apr 2020 13:48:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k1so525916wrm.3;
 Mon, 06 Apr 2020 10:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8mojAlRUdlR/2NknA9ZDyMqw2xlNW4cv+f7vBTxHaE=;
 b=hJoJZxcd34zsuU0v1gVS9Y4MNUJa2LMTMLbZkQUitYNiXClddzjmaHoY3wWLgi3IKe
 EH7pj29KBqzD2wKlnxefJMIekbas+uPO7e0MVEiN1T185ILeEP4gmriiRLRBzrxLvu1N
 dUjr51JddnjczJbzdZKGToKm8DV8OkeD8QosXTIVCglyHUU5oC2D/xBjKj4P56Td8Fa3
 g8FZ3Yh6YBKtv1ypknakKKOCnM6QsbxXMW+PdsZNGuBh5L/MbY4cg2H22dC+4xBxzfIZ
 wWu/x75aIPjerF0Qixo6LU9L//3zaLDKpQeYksRLl+zyOOkFRchiUwSiRJE4DJSW4/7t
 mkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f8mojAlRUdlR/2NknA9ZDyMqw2xlNW4cv+f7vBTxHaE=;
 b=eJCZTsSJ3hYp6nY1upR0xffKAlOBJsx7Md8bkEf7rz/98IVVXdugkrgEQi/tsezAiw
 qQLt0Qq4f9ld+UWRw0QmLk7rXu/I/RLTu7An/ebkKRZ/4mjmplJhHiZsYzHGd3k8qaFB
 Z9/liEKqPeK3/7r3vnK+va+3Oi6lTVx+5RIYLfeik18YUilNzo+rwNM9738+shs0IweV
 SEoo+mkOUyOJGpj3aQ2ZiaFuegQcmORmq/kysFNoeo9cFyyF6RYZjaneyDJZ4/hCUkVt
 FotlKZGcSvFaKk1snTLKXlgnd9Fjwpj6ORo5gG4pkKsgqMhkUUP1fsjFev/fv2NOEcCV
 53Uw==
X-Gm-Message-State: AGi0PuZ/gPpaxvYGBRy9KunWE2NfJe8bewGe9rOkzyzTYCFoqgGQUubF
 KdUOq6/6aNPUYwQ5Bo/5PFRCbd1HAt4=
X-Google-Smtp-Source: APiQypJqBpOi+9r+z/9YPYz9GQ1Rwl65GmEs2BgPB5b+NSkST2noha/gz7EIEWRs7pUFNVLeGBOccg==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr316382wrp.355.1586195293285; 
 Mon, 06 Apr 2020 10:48:13 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 20/54] hw/riscv/sifive_u: Use single type_init()
Date: Mon,  6 Apr 2020 19:47:09 +0200
Message-Id: <20200406174743.16956-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use a single type_init() to call multiple type_register*().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/riscv/sifive_u.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 998666c91f..9c90c94c33 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -601,13 +601,6 @@ static const TypeInfo riscv_sifive_u_soc_type_info = {
     .class_init = riscv_sifive_u_soc_class_init,
 };
 
-static void riscv_sifive_u_soc_register_types(void)
-{
-    type_register_static(&riscv_sifive_u_soc_type_info);
-}
-
-type_init(riscv_sifive_u_soc_register_types)
-
 static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -627,9 +620,10 @@ static const TypeInfo riscv_sifive_u_machine_typeinfo = {
     .instance_size = sizeof(SiFiveUState),
 };
 
-static void riscv_sifive_u_machine_init_register_types(void)
+static void riscv_sifive_u_register_types(void)
 {
+    type_register_static(&riscv_sifive_u_soc_type_info);
     type_register_static(&riscv_sifive_u_machine_typeinfo);
 }
 
-type_init(riscv_sifive_u_machine_init_register_types)
+type_init(riscv_sifive_u_register_types)
-- 
2.21.1


