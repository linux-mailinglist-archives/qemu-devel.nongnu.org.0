Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457C4A492E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:17:56 +0100 (CET)
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXVD-0007aj-FH
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEVgB-0007PP-06
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:21:07 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37584
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEVg9-0008Gm-Cd
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 07:21:06 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so18215862pju.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/XNKxeF00uqVNsLza0DKaiGEocIMr5Wd2WewbAq4Hg=;
 b=K+sN2/WOzQ1DFEOZY7Kj6ARb0GQ4pP4FMiQbgBLIVoeHVKWUP6Sd/WySHkv2yAvTH1
 eUrDTaJVQ8n4+T2Q6Any7fdClBD258VdmLnFL+a/5LBhrsyctsB+NWuwziCq811qwFib
 ENfT3KvgJk2wPDM9SYJuPwfqaUu3YJfREkUMje0F1xJzQZZ3YyoCq5mci9t2c73S6Sso
 FpW+SkCX2EUGC14FUzPWxeesz+V3rlqxdp4AgOI6FO9wonbfB2JFh1oEo8DUMNeWIlh/
 tgqnlNzAFn6c1luAGlth8zGGCAjBJDu1kfX6GsOb8T+/bEyGm4kKThYvn3Feyk3ceegj
 a10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/XNKxeF00uqVNsLza0DKaiGEocIMr5Wd2WewbAq4Hg=;
 b=1JFIXFLweTnk1c2dbnAWFsxrobrJhOTz1dpZr0onMqgF7ZcbmREJ7SIaBsBX6x/9vL
 EHKTs+BfkzDz/oRB45ilMZ6HxmIT8qArz2VAFRaejcDJ16I85rz/UwMY+qsTj1AisoX8
 ZM4SkslPr55opnlv0sZ449c28LtuE7SYVcaPBF34Vhqn7kkgumOt/eO0rmAbTZ487fkO
 dBmWn66tIiEF1t9gywSnVXn1M8L8F/hSy2k+UfQCF0i9k2ODt+eUwCzivmrVC84JsXZx
 s0874cEnsOSKFsWmIbEz4iWMtA3tymtp0B/1Wg9/juIwP7+LT+ddnChr9mHrU8Y0+769
 AdJw==
X-Gm-Message-State: AOAM533wk1dcXuTH7+v3/Factr07Wd9jvwYrHH1li4Wbjb1LseDqUPPg
 8NNWcBqdeh01IUQWh2cGywWB5cqmbXuNj9ga
X-Google-Smtp-Source: ABdhPJy3LGA3Uvq6Uz/GLV+a6lnBXKZE0UpzPx7MA7XDBShOrVnbpTt/SjAYt0ywmFA0B9W/Q+mPOA==
X-Received: by 2002:a17:902:7c15:: with SMTP id
 x21mr20910383pll.147.1643631615709; 
 Mon, 31 Jan 2022 04:20:15 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.234.212])
 by smtp.googlemail.com with ESMTPSA id mq15sm12810302pjb.8.2022.01.31.04.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 04:20:15 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Adding myself as a reviewer of some components
Date: Mon, 31 Jan 2022 17:50:01 +0530
Message-Id: <20220131122001.1476101-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, peter.maydell@linaro.org, f4bug@amsat.org,
 atar4qemu@gmail.com
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


