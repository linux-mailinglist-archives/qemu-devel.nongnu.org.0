Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB862DFEB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovgsW-0008Kg-Ma; Thu, 17 Nov 2022 10:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgsT-0008GO-MZ; Thu, 17 Nov 2022 10:32:33 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgsP-0008IJ-Ir; Thu, 17 Nov 2022 10:32:30 -0500
Received: by mail-oi1-x232.google.com with SMTP id v81so2228212oie.5;
 Thu, 17 Nov 2022 07:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNqpua9R0OBNt+rcCWjGPp8woJ9ev2EZpj/FO2ZChaQ=;
 b=mWe/iJLDF2p03AAPRJozuOHUsHLp4JDfEklZ6LtnwL+EAryOVuu3A6oq2rstGm6X4d
 TrcsBVnSBIbADoQHBfneu2llEjrMe0IgrUXgxqqhOefOnf68f0fy1TuaruPApxqIzUTZ
 uwByAa6ToYmh+/xtGb7mYpffBJSUPa8GgYUAYMoHYXjQS0LVFD2Ii5NHZfln17RN42EG
 1QQpn0VB/bPmuBq+JRIc+c4OqGcdsU2QkrCNWYG9I44Qf1LWNax5IMLaCuZANng7iFRb
 gDoGhiJb222coO3nzf+ScgEPUeSRrYxF4AaWRIhXtagwj51UQ4F5Vd4qnZ9o6zhvhaLY
 n+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNqpua9R0OBNt+rcCWjGPp8woJ9ev2EZpj/FO2ZChaQ=;
 b=zZy3LgTX80LD6jtoUB/AiuNlCc8WdjqTLVhHoetjHL0h2Yn+haWZg8Kt8xFr1JNym7
 q6RMZWIn7Yu8qy6ax0Ux2jIT7ADtpFoy7nK3muahOTEEiKaC6agreVKTXyBp9++6T05w
 dn9/9TpA+AXnRvjHB4Rd/DxPfjpNWdBURhAHMaZJ5jAcX8xM65yrWNbKCeWoR/oQmZNt
 kT32d59F7COFn0tMF6x3nzUbKHI9UQNk4UEyFq6ZlMADHfkSQub/kPKtljfV3WrFM49u
 ya2KKr2xRS/XZt6aK+TQfluwsxUIoxbtuxEdE6FL3/HrMHzgp4glXd9ZlC0ATx+5dKIx
 KAvw==
X-Gm-Message-State: ANoB5plyNvpoi7fPYFLvddzZt0T19BId3qEZDH809fc9VD5gWJOFD7JQ
 Yv6MVL/tpEhX5u/Eu6+VMNuG/Of5WWk=
X-Google-Smtp-Source: AA0mqf69OAnYuye18DDwqBo9wwgRClbOQzDSUSKUkyZq4c8dlwQm+8wMs5TnjqodrZfD0mp5ikMPIQ==
X-Received: by 2002:aca:6546:0:b0:35a:2d32:8442 with SMTP id
 j6-20020aca6546000000b0035a2d328442mr4343013oiw.88.1668699147566; 
 Thu, 17 Nov 2022 07:32:27 -0800 (PST)
Received: from balboa.ibmuc.com ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 bd32-20020a056870d7a000b0013d6d924995sm548850oab.19.2022.11.17.07.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:32:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH for-8.0] MAINTAINERS: downgrade PPC KVM/TCG CPUs and pSeries
 to 'Odd Fixes'
Date: Thu, 17 Nov 2022 12:32:18 -0300
Message-Id: <20221117153218.182835-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The maintainer is no longer being paid to maintain these components. All
maintainership work is being done in his personal time since the middle
of the 7.2 development cycle.

Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
time to dedicate to them. It'll also (hopefully) keep expectations under
check when/if these components are used in a customer product.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be151f0024..1d43153e5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -264,7 +264,7 @@ R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: target/ppc/
 F: hw/ppc/ppc.c
 F: hw/ppc/ppc_booke.c
@@ -389,7 +389,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
-S: Maintained
+S: Odd Fixes
 F: target/ppc/kvm.c
 
 S390 KVM CPUs
@@ -1367,7 +1367,7 @@ R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: hw/*/spapr*
 F: include/hw/*/spapr*
 F: hw/*/xics*
-- 
2.38.1


