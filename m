Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475C13C24
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 23:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hN1s3-0006Sg-Ja
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 17:06:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1hN1oJ-0003tZ-Oj
	for qemu-devel@nongnu.org; Sat, 04 May 2019 17:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1hN1oI-0004dw-PH
	for qemu-devel@nongnu.org; Sat, 04 May 2019 17:03:07 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
	id 1hN1oI-0004d8-JW; Sat, 04 May 2019 17:03:06 -0400
Received: by mail-wr1-x443.google.com with SMTP id e28so12211776wra.0;
	Sat, 04 May 2019 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Yjawb15ilcgBDz3rr0CkGUbs4QxWlVrQBeuf1ek1VNA=;
	b=L7w8RtS5d1HSXcKSoAYq2jtc1aPMkU3zl4j5gPuP84F4YQBfgO3PBYqHivfmG9Cj0N
	VthgyJjKr5VXUchlNw12yBWUFfHaaQvxunweu68eITskG5pzo7K/ygVe24crBXQgMsQr
	KDPnmYlBMchIoZEHvzyvToh/JjNYznhpqAbrCBk/0V2Cr7Ek/cbha3uwwrQ31+SlR+Th
	+6Yf1CJCDA17Z/FDjjxr/OnDJEmevcYnSj/rX9bzQf4rML2vIkUNDQMhCOlhUu29e0sO
	FOuxsnEmH3iFfLeTMhLCD7bzoLnEWlTHINPyVlYxSVX7Tb/ayeVCC+gCfVRJ9qdFfQNT
	r0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Yjawb15ilcgBDz3rr0CkGUbs4QxWlVrQBeuf1ek1VNA=;
	b=qjJCn+BUONJqmX5YipHQR06k+/3Y/kydsFQpaLxsbPCsrYLpl9aKoBxIVneN8EI4RJ
	LwLXTKa9jOjiNEmwvVxW2ohFFTdIJ34fwxvMYo0/fBU0RmoLPYq337GKYLUuuJqWvcOo
	WtoApGhQIW8SGm6BsH4m+nDyEX0dF8hHjBnp9V60RSsm/9NyWzWjjx52/Pm5SAxcOeOh
	y454yvb8CQ/63lug3uWikA/oOumZh0r9J0bZ8lY2Vdk62CsD7XmcKVmbe0gO7V2WJw3k
	N02yvbuMK6h+VKArTKN9ZI0VUSpkmC//UhF4wBVmQN+ZkhE+SIQd2KEZHkKRo8+6LsHv
	Glwg==
X-Gm-Message-State: APjAAAXxoaXe8jAaDMqsCHFyFnLVbxOwJZsqXS2hEN0FdlyAOO1ygTeO
	SFlSHCbXFZ1PS0qT7X3ug7XQOrdC
X-Google-Smtp-Source: APXvYqzyaD2WuOegJroeaVNSqkzOSiGv5b6YX4R2hRTuTgjLYIrrrHEYUMJ25cKW0iNm5hhaFxGtsQ==
X-Received: by 2002:adf:f051:: with SMTP id t17mr11507304wro.73.1557003785613; 
	Sat, 04 May 2019 14:03:05 -0700 (PDT)
Received: from localhost ([46.114.6.7]) by smtp.gmail.com with ESMTPSA id
	t24sm14856936wra.58.2019.05.04.14.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 14:03:04 -0700 (PDT)
From: Artyom Tarasenko <atar4qemu@gmail.com>
To: qemu-devel@nongnu.org,
	hpoussin@reactos.org
Date: Sat,  4 May 2019 23:02:34 +0200
Message-Id: <1557003754-26473-4-git-send-email-atar4qemu@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1557003754-26473-1-git-send-email-atar4qemu@gmail.com>
References: <1557003754-26473-1-git-send-email-atar4qemu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v2 3/3] hw/isa/i82378.c: use 1900 as a base year
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
Cc: "open list:PReP" <qemu-ppc@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AIX 5.1 expects the base year to be 1900. Adjust accordingly.

Signed-off-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 hw/isa/i82378.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index a5d67bc..546c928 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -107,7 +107,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     isa = isa_create_simple(isabus, "i82374");
 
     /* timer */
-    isa_create_simple(isabus, TYPE_MC146818_RTC);
+    isa = isa_create(isabus, TYPE_MC146818_RTC);
+    qdev_prop_set_int32(DEVICE(isa), "base_year", 1900);
+    qdev_init_nofail(DEVICE(isa));
 }
 
 static void i82378_init(Object *obj)
-- 
2.7.2


