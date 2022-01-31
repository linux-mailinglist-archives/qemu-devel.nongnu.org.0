Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805B4A46FC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:26:33 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVlQ-0005oJ-2C
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:26:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEVd2-00046X-Uq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:17:53 -0500
Received: from [2607:f8b0:4864:20::1031] (port=52908
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEVd1-0007sG-6s
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:17:52 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o64so13871964pjo.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/XNKxeF00uqVNsLza0DKaiGEocIMr5Wd2WewbAq4Hg=;
 b=sGLzD2c8ThaiEzqlDIl7dwwtQY2zWhuVX/E2iyTko3CtqMLtou+JMgIVAnDVbE7GXt
 a64C7c+AI7cZei+PQU5QrePL3ClfpX+p8GDUebptbmQA0jMTuEIKSGVRJ6uiIbv/o/ZB
 KUWQY8pD0TQFrfvkXvq5ual5NvtdYyWwnUt7wrJLkbl1qXJgP4MpdjAvDdkSorYKAXhk
 uPrmmUknGQCF2g4LihzfI+BRkY0pic1IlCRJhaY59smKXmas+trQFG/D85zIPn1Uug+o
 ffYBbOX6K7a8nXvJAmFyE+MsK6y5Z5U2qZmgRuMj/i1S6TQ54R2CI9dAzKaL3mIfodl8
 GyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/XNKxeF00uqVNsLza0DKaiGEocIMr5Wd2WewbAq4Hg=;
 b=HqTV6sPgDjAlay1x1vqeg+cSk6JykVYaXpaqsSroOgY1qc165Q7dYtRu5HP8L9J6Az
 UqkPrbxoraat/8w1l6ZQqEdqDNeiVnF6gC2aucPIjDnVcxShI6IXyk+DKN4K7jAQEGYW
 DQj14+NBEl0UhWHiKszCVKMXvuw4THx3tlp5P0laUeYSAJnZlN8+X7CTrNWFhL9KIWzG
 p37WYcpw1/WUDXuK5NetPbc9DZ4Sd/w0KHz8dbl9WK7cpT2q77h015TGrHSk6W92/eXT
 kiE2XokXKykITqbMSMhwq5YHSL9E2NPPON8mLKmnfr/aNSvmK8qG11eqRzWIUpmAETk1
 G+1Q==
X-Gm-Message-State: AOAM533dVdc8cejYFB6lUoIYBFAYZe6nMkdQjU/pEjVtNCEN+l9n+Vzd
 BvE3jetw6VnVlFcGMcmNoswN4O2ESssvfBDF
X-Google-Smtp-Source: ABdhPJxrKuulo3+NJhgxU5g4+FJGDf7pDEfQQP6BtvkRr6r8q1Ofq+kEmYKqIUMyJElRSj04P0Y1lw==
X-Received: by 2002:a17:90b:4ad1:: with SMTP id
 mh17mr24004410pjb.135.1643631469301; 
 Mon, 31 Jan 2022 04:17:49 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.234.212])
 by smtp.googlemail.com with ESMTPSA id
 a14sm19588989pfv.212.2022.01.31.04.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 04:17:48 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Adding myself as a reviewer of some components
Date: Mon, 31 Jan 2022 17:47:29 +0530
Message-Id: <20220131121729.1475789-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added myself as a reviewer of vmgenid, unimplemented device and empty slot.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b43344fa98..fed31a5eb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2182,6 +2182,7 @@ F: tests/qtest/prom-env-test.c
 
 VM Generation ID
 S: Orphan
+R: Ani Sinha <ani@anisinha.ca>
 F: hw/acpi/vmgenid.c
 F: include/hw/acpi/vmgenid.h
 F: docs/specs/vmgenid.txt
@@ -2197,6 +2198,7 @@ F: hw/misc/led.c
 Unimplemented device
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/unimp.h
 F: hw/misc/unimp.c
@@ -2204,6 +2206,7 @@ F: hw/misc/unimp.c
 Empty slot
 M: Artyom Tarasenko <atar4qemu@gmail.com>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/empty_slot.h
 F: hw/misc/empty_slot.c
-- 
2.25.1


