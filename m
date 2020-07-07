Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B844216653
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:24:06 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsh1R-0005Vq-F0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsh0c-0004xY-Ej; Tue, 07 Jul 2020 02:23:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsh0a-0005Ok-Ul; Tue, 07 Jul 2020 02:23:14 -0400
Received: by mail-wm1-x342.google.com with SMTP id f139so45216907wmf.5;
 Mon, 06 Jul 2020 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwMl8vysdrK8IlFWcENFsp/LshAOHF4ix0mG4WX1FoI=;
 b=h/nFjY+3cMz5v0FC7Wl/iJvg9upeYg31vHY8BAweZkbsTwXo18oJSQAUjEMjoemOgr
 BNwZeKZsMM9OrYltPAALvomjxCP9OAm6YH6XO9kQmi2CncgLyQlHVqMhzObNp9ccpeKy
 WgecPR8B5DlMywtBK0AKTPXSPSF6KrDxVj5MECoj06ruxADOZEAe2WF4gfZRew4Kprb6
 CT7Zd0u5Wj1tNCYrMvE1CMIybMb+qYUh8e9iPQ6leTxOxjZobw1UWCbYnuC0bUWWOcpT
 9vuhDBSDg+uaysbPRetQn+Lx51JHaTa8qTobr/vH8Eu7h3OOY5KYFG2oeDXccwUXFce+
 LH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jwMl8vysdrK8IlFWcENFsp/LshAOHF4ix0mG4WX1FoI=;
 b=aU80Vs12I6c/8tAbg+AVN0Pg8w7RDHEAa9kwy8POzvnh8D+7QHvNK/JRxsTRPC2zXO
 7i9YDx8rppwFU8AYhcvkZMbTHW4ojF+Z+xxp/5LswhZmnZuPeZAI8jW4M+NXrS3QokL5
 gb6fw+1lX42lTjGX0Nk0qfrIjBzm6DHjiKsnSpnF0CYU0/zqnMrbHpgKzPJNftbc0mWP
 3ZCZ6MvHWK4GYBK7mmHIkKqHjT5RwmmfVdYy993gXmIMBo0IkWql4cLMSSk8BOzU1NUl
 R1lXgSMSVcklmUbdZGkVMAt77zjUPuC1i2VjvkQTsqPUc/B8fLpLLfT81hj8zU7cuaPI
 pKCA==
X-Gm-Message-State: AOAM5318qN+Dlzq9JeOLbBZqaUnr8xrJxcupx+9aX0l4hMIV6ya6EOUa
 TuHnM3oT0EuQmyb+g4HKydZ6pj/k
X-Google-Smtp-Source: ABdhPJxXKIBW5/HB3CX8UMeQLWohmsIAXJY1Wtr7eAeqCJ+fk4bgMdATH4PNIl0tPYm0C3l3LKRXww==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr2504643wmg.93.1594102990653; 
 Mon, 06 Jul 2020 23:23:10 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id m10sm26864645wru.4.2020.07.06.23.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 23:23:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/register: Document register_init_block @memory_size
Date: Tue,  7 Jul 2020 08:23:08 +0200
Message-Id: <20200707062308.4531-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the 'memory_size' argument of register_init_block().

Fixes: a74229597e ("register: Add block initialise helper")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/register.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/register.h b/include/hw/register.h
index 5d2c565ae0..fdac5e69b5 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -181,6 +181,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr, unsigned size);
  * @data: Array to use for register data, must already be allocated
  * @ops: Memory region ops to access registers.
  * @debug enabled: turn on/off verbose debug information
+ * @memory_size: Size of the memory region
  * returns: A structure containing all of the registers and an initialized
  *          memory region (r_array->mem) the caller should add to a container.
  */
-- 
2.21.3


