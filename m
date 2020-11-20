Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C32BB1AB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:47:37 +0100 (CET)
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAVU-00081N-J9
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOS-0001mv-6C; Fri, 20 Nov 2020 12:40:20 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOQ-0004BY-Ph; Fri, 20 Nov 2020 12:40:19 -0500
Received: by mail-wr1-x442.google.com with SMTP id b6so10882029wrt.4;
 Fri, 20 Nov 2020 09:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkxHOgTteXA0+1hQ2yOKGKV/pKGNAeZCrtQVYkWVp0g=;
 b=c3tIhg0fs1pRd7YxiKqrlQSaiA8FBicYXjcLO+ylOaIQhEqW1ErI3fS09tBSkpZnHr
 AJy0n6DdgU2WU1MxfXTwnhmjpGHQzA8ccnWNMZQUnXOC79xSEKzZyrNDOHudmZKbWBdD
 oF9Ou9zrjZRNzQKWlw3/qfVX3ejjZSsAGJQqv2E1pG8umLUXubwmfkbd3CPdjNfqCEcF
 3cL5RsdnyWUd4pluKqJIjhkXLkQsoDZ4Hza4rqdQtCqoOdZPMWFR1v24wZG4RMekpFaI
 eKaGybs95u0rvmu4DzarFDA4Zl8jC2rAf1QMKSe7X5YEphlFzuJXcDeaSm5awajIfBEM
 n8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tkxHOgTteXA0+1hQ2yOKGKV/pKGNAeZCrtQVYkWVp0g=;
 b=hA6q8xXZXQ004Hq/iytsEkBveAJkwjC+csKX6/D9yZEtBf+KOg2CQpt+7CiG5za5B1
 WWJi8N/TlgGZuNmPkO/RSA4ZSArrgu6SgOGsMJXkgBG99LPE+nBpeD5fZn31Bm3zM4Uy
 a8bzs2KSmz3qpp+6GylGV6yBKoi/ER0XcWcE1pqeO2UbmaDZOMVYwwqWcFR7umVbOJmq
 b9xxberrDFsKecwhaD1NJz8KdIvJzbmVC8+hIkLik/lSnPk7Frb+yGCSjduv1hOgzsfl
 3Xs2tHnNs8muCOfFSNRE8gon3pcmgsD6N/BxNyMZGgWFpfUIrsUAaL5kj4ngKJd+bOUT
 9KbQ==
X-Gm-Message-State: AOAM5308X7pyUebjaj701fBudrx0s8c5Zbs+cgj827gWtP1K1W8prUP1
 gSA1oVCAFIz+E12LjQXgSnQMYl8rwdU=
X-Google-Smtp-Source: ABdhPJwUm642kSGL9+bQAJRT8ab6LnAuU1jDX1DCyLPJf9efOvl7JK+/eSzbKSf/yVDEI1WwR9+D8Q==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr17261616wrw.221.1605894016091; 
 Fri, 20 Nov 2020 09:40:16 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j127sm5375036wma.31.2020.11.20.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:40:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 v2 4/4] docs/system/arm: Document the Sharp Zaurus
 SL-6000
Date: Fri, 20 Nov 2020 18:39:53 +0100
Message-Id: <20201120173953.2539469-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
References: <20201120173953.2539469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List the 'tosa' machine with the XScale-based PDAs models.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/arm/xscale.rst | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
index 89ec93e904e..d2d5949e102 100644
--- a/docs/system/arm/xscale.rst
+++ b/docs/system/arm/xscale.rst
@@ -1,16 +1,22 @@
-Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``)
-=============================================================================
+Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``, ``tosa``)
+=======================================================================================
 
-The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
-and \"Terrier\") emulation includes the following peripherals:
+The Sharp Zaurus are PDAs based on XScale, able to run Linux ('SL series').
 
--  Intel PXA270 System-on-chip (ARMv5TE core)
+The SL-6000 (\"Tosa\"), released in 2005, uses a PXA255 System-on-chip.
 
--  NAND Flash memory
+The SL-C3000 (\"Spitz\"), SL-C1000 (\"Akita\"), SL-C3100 (\"Borzoi\") and
+SL-C3200 (\"Terrier\") use a PXA270.
+
+The clamshell PDA models emulation includes the following peripherals:
+
+-  Intel PXA255/PXA270 System-on-chip (ARMv5TE core)
+
+-  NAND Flash memory - not in \"Tosa\"
 
 -  IBM/Hitachi DSCM microdrive in a PXA PCMCIA slot - not in \"Akita\"
 
--  On-chip OHCI USB controller
+-  On-chip OHCI USB controller - not in \"Tosa\"
 
 -  On-chip LCD controller
 
-- 
2.26.2


