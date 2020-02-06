Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AAB153C8A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 02:21:25 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izVr9-0003FQ-6t
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 20:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo1-00007c-Hp
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001bO-HY
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001UC-Af; Wed, 05 Feb 2020 20:18:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t2so5155344wrr.1;
 Wed, 05 Feb 2020 17:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVyn7DVfh5CLRBiwnsBkNYjNqPu43cXEQWrJu301xpo=;
 b=AUfo/W9thrhMxSoZJdlgMGst/XPuRov6AzY03twTPbptlnh83vKxw7aXmVjSc7HfA0
 8rPqSC+jXwvq77ejRibs8QAYj7qdp9E9Ba7aEjyCbtvcjAeb5UiEdrk2hmZxtdueavWH
 xDUQAqWsubgJMeOGZf7VNneqpPrQTERrZBHN7Iw+01OKutZKrMuDbiTA/yI5YkCldFkq
 7SgHeDDasfqD0atmxfdIwfzOYfBwwQRVVxZHIFE+sZYPl0619ZxgCdHQpGALYOKR8HuY
 bJbK/MSeDRZXgMCTsv2abPaQ+1WfY9VJAULlx4UrR7R6/+OrloLWHbKvB0/ec9OLZF/I
 3ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UVyn7DVfh5CLRBiwnsBkNYjNqPu43cXEQWrJu301xpo=;
 b=JywsU4aloe7b35++OV8LRJbuesfdnONZsC/QYPKgu8LVQU/8FXumbkw+6GN4rcPNk4
 ixWF5i+B8zsftFkPKE0OXqYC9CIDnu0Fk0kt+QgGyYOUiMOju6t3buU+Mk8Hyp5YbY10
 9bTHomLs0Vkwv37M68D9iuXedFnV2KsAN6xrvxfJS8tXD6t6Vnpc3pPojwR4qBAtOyR0
 Q58DqziHRlTuTNvh1ennknZD4QD4vLJkO8IwufCr2KpTIWT0elmUS1ifFE34m6YA1AMX
 ERneah34a4rR28AHYnrapXSO217Z5OkR1GELuHLv9ntlqtE5RxZmsnyNu7/gT5FXgjTA
 ahtA==
X-Gm-Message-State: APjAAAWrNzwbKyumFirg4NyOuhBoovYK5RCvuaAGdpT06kmgObI0RTlD
 7O5AzMdUJ4beKbnRHeB/LAoH4isK
X-Google-Smtp-Source: APXvYqwfZc1fTlxtSggonIYkMiSRBJV6aRbTUpDWgwWH+TwS+SI9jIJkRIgkMzucZebKHERgWN579g==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr363985wrq.176.1580951884832;
 Wed, 05 Feb 2020 17:18:04 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] hw/arm/raspi: Correct the board descriptions
Date: Thu,  6 Feb 2020 02:17:28 +0100
Message-Id: <20200206011756.2413-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We hardcode the board revision as 0xa21041 for the raspi2, and
0xa02082 for the raspi3:

  166 static void raspi_init(MachineState *machine, int version)
  167 {
  ...
  194     int board_rev = version == 3 ? 0xa02082 : 0xa21041;

These revision codes are for the 2B and 3B models, see:
https://www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/README.md

Correct the board description.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index ef76a27f33..3b892bb509 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -220,7 +220,7 @@ static void raspi2_init(MachineState *machine)
 
 static void raspi2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 2";
+    mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
@@ -242,7 +242,7 @@ static void raspi3_init(MachineState *machine)
 
 static void raspi3_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 3";
+    mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.21.1


