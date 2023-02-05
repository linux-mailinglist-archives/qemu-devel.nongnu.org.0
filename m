Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F168AE4B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWgE-0007YE-Lm; Sat, 04 Feb 2023 23:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfl-0007G3-JD
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:59 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfj-0006DL-DU
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:36 -0500
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 255542418
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mi13jKkBZVx9EhtzBnCQVVbo5gw/JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDzrQOPmDamTyc40jaYy29UhT65SEz4VgQFM/rnw0Fy4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5gBmPpingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eDNZC++0vLUB13
 t82KylcahKNt+Ok3+fuIgVsrpxLwMjDOYoevjR5zmicA693HtbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1Nk6GOkwQUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjeWwbICJI4ziqcN9xl/fv
 2bfwkfCKy4eKdyjzzO63DXzibqa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37U/yC9ekDkL+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIVOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:x5QQBKog9kcIv7NnJkJN1hQaV5r9eYIsimQD101hICG9vPbo8/
 xG+85rqSMc7Qx6ZJhOo6HnBEDtewK/yXcx2/hrAV7AZniahILXFvAa0WKK+VSJcFycygce79
 YbT0EXMr3N5DNB/KHHCWeDYrMd6ejC2oyTwcnl81dRYTdDV5xAhj0JdTpz0XcbeOCFP/cE/V
 aniPav3wDQAUj/p/7VZ0U4Yw==
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:33 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so5947000qkn.0
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPLwRp0eM/LFolqH3GE0hF96aOq+D5Pu3Y0AZre9qhI=;
 b=LUiC6esaIUqXC/Cl8vei0QbmEDvR+9LIPJU0o3eNR2SJVtpEDjJbBhFp0MHW2xrbny
 MKcBWwSWE1rEXR+Nw99RdpdxuIQr+gEqQHT1CosaCcZFp85wDE/8KFBz5LXM/R09yEq0
 t/aLh90dpjIvNmmlWdRyIcXzmcfslZWvViVmifMzHtJcS7WkuYnI1qC4opnVcyojMI/J
 qQxkw9NKGNKgghClSQ5vlz4Od71dMgLk7HC5klJk2cDUIS+/NIdISUD85CP4zJTFtIyj
 kE8ydcQbQsdk5z7gjCczABPHv1wDdmxInmr8F1IgdeMGw13O0R0IGfohRcp8Jevy+J94
 uuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPLwRp0eM/LFolqH3GE0hF96aOq+D5Pu3Y0AZre9qhI=;
 b=Ni24iyOBYB8TtjUyW7r396Y7GadY31SqZDaDTPO+MnM0ew8ff0mtdlc3Fs6mx6YdhE
 AefPVG23xSYIdnzQn4OZbLad/SXLtnPwbtFgMh+MA+V8+wUX82oTqjX8aN2MhY2SIP+i
 Wjti8OHUuiPMNdi8DwPhoFyJncIYMvVfcTRkZpHrMjgB+twNB0gnf0jdGwoWRBJub0C5
 jGpJgfmBlil4W6Q2L2M9qrk4go30yLuHH6Zn8KE6NL3RvlG4wuAKoZZWJOTlmKItyQf3
 2nCvpWldwvxyG9U6aASg6isJTcyN34ROp54cvif8kGJ5uJ28D3Sly9Twu2uxMGftZ7o2
 /tHg==
X-Gm-Message-State: AO0yUKXkZ3DlSUQsVqt+03zi0+vldiiKMHAM2nADfmjYm/tq1W/wi3IF
 +Vf8oTmbo33wS+vaUsBNi0VU4Y7zvGU8fq9/O5TGAXoAnc2UTd5wID5SgUVgsL4TjOb7ZqlHEBv
 zRlvluUKAgx7FF/iuszNkU7EvNwf9EA==
X-Received: by 2002:a05:622a:413:b0:3b8:6ae9:b10d with SMTP id
 n19-20020a05622a041300b003b86ae9b10dmr28973503qtx.2.1675571432030; 
 Sat, 04 Feb 2023 20:30:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8kVWTqmQ1LV8Yi++F9p4rthtuvQFKMeS33YnlSIenbeuojMDRbMDMvJed2KNuOGnt4Ko53IQ==
X-Received: by 2002:a05:622a:413:b0:3b8:6ae9:b10d with SMTP id
 n19-20020a05622a041300b003b86ae9b10dmr28973483qtx.2.1675571431754; 
 Sat, 04 Feb 2023 20:30:31 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05622a005500b003b9bb59543fsm4757218qtw.61.2023.02.04.20.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:31 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PATCH 10/10] docs/fuzz: remove mentions of fork-based fuzzing
Date: Sat,  4 Feb 2023 23:29:51 -0500
Message-Id: <20230205042951.3570008-11-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 715330c856..3bfcb33fc4 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -19,11 +19,6 @@ responsibility to ensure that state is reset between fuzzing-runs.
 Building the fuzzers
 --------------------
 
-*NOTE*: If possible, build a 32-bit binary. When forking, the 32-bit fuzzer is
-much faster, since the page-map has a smaller size. This is due to the fact that
-AddressSanitizer maps ~20TB of memory, as part of its detection. This results
-in a large page-map, and a much slower ``fork()``.
-
 To build the fuzzers, install a recent version of clang:
 Configure with (substitute the clang binaries with the version you installed).
 Here, enable-sanitizers, is optional but it allows us to reliably detect bugs
@@ -296,10 +291,9 @@ input. It is also responsible for manually calling ``main_loop_wait`` to ensure
 that bottom halves are executed and any cleanup required before the next input.
 
 Since the same process is reused for many fuzzing runs, QEMU state needs to
-be reset at the end of each run. There are currently two implemented
-options for resetting state:
+be reset at the end of each run. For example, this can be done by rebooting the
+VM, after each run.
 
-- Reboot the guest between runs.
   - *Pros*: Straightforward and fast for simple fuzz targets.
 
   - *Cons*: Depending on the device, does not reset all device state. If the
@@ -308,15 +302,3 @@ options for resetting state:
     reboot.
 
   - *Example target*: ``i440fx-qtest-reboot-fuzz``
-
-- Run each test case in a separate forked process and copy the coverage
-   information back to the parent. This is fairly similar to AFL's "deferred"
-   fork-server mode [3]
-
-  - *Pros*: Relatively fast. Devices only need to be initialized once. No need to
-    do slow reboots or vmloads.
-
-  - *Cons*: Not officially supported by libfuzzer. Does not work well for
-     devices that rely on dedicated threads.
-
-  - *Example target*: ``virtio-net-fork-fuzz``
-- 
2.39.0


