Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9B6D983A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:29:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPfl-0002yY-5q; Thu, 06 Apr 2023 09:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPfi-0002yN-U3
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:29:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPfh-0004hH-6X
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:29:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id y2so25776307pfw.9
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680787740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IbWi9AYylmMC6HKIK8ULl0MOrEJWIU17u5I5UW81oY=;
 b=dCel0PRKKWRsBStq5nu0oCMUtzZRbybsl6sKaSktPq6dH43fOOf39oDavjM866nUJS
 qykUWGjE4oBnTKuFnraJtyOzgaNlTHWXqbedI8r+sNncxKLgJVFVX3NfDHiHuSwhUhWl
 7FeEav0qC3urznQoC+yWb1FtNOoHMAVVTo50nj8mFYWvrploegaWPSwMQHR+gSof76II
 9AgFrR48gkQnBme+r0r1lLI/M5Jrup62JEn6yfHIoPM9OTxrhRoKE0N4qrWk16R6Zna7
 4PW+qMxQozgE/Qp/SPKmG8juxB8B+CUTGVyDBjZJMSorIF/gd36LFEXgAiYItEGSZd0I
 SQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680787740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IbWi9AYylmMC6HKIK8ULl0MOrEJWIU17u5I5UW81oY=;
 b=j4J2CrTvgqgvmoEK5nETIh3lVC/QSIw50aCyavnMQaj31UpR4XjFFpvm3Hgh4o+GvW
 GMrSKqvm/y2Jd3hIyBa5JVagOVr+x4HEi9I64vsCOjVU6Cpn0+/hOIwTyQ7f/c8nON+s
 NV0y54E/56Qflvs1bCl9ryevIeCm3XLoJic+R3NqRm50amsapNugZSr+9G9vOzC2HVo7
 3zi2kxbRKpHx+W4rxGfLFVHg2pYM0mXkjP4vqs/GcqxFt523Fwkn9N18068boaOREoDG
 bfqDQIuRnN7x2iIOESgi30TWB2QIvmgxjGRcYm4b034DEC8Sz9bNFZR4AktIxCjRIk54
 UCRg==
X-Gm-Message-State: AAQBX9e2WV00ACb6/ttxPIUH1Albx3K0WwBCfKlv958XpHBKep7NveNt
 UbOJlSsQqMG4H4zJAiiOGxI=
X-Google-Smtp-Source: AKy350buzdYHQ1MRFhyolDEYTpkyydZSQAQdlvnUvRaI+Y5i0pPYX1dSdPkLL4d7k1GgiZ0BX6El4A==
X-Received: by 2002:a05:6a00:4502:b0:594:1f1c:3d3b with SMTP id
 cw2-20020a056a00450200b005941f1c3d3bmr6148931pfb.16.1680787739742; 
 Thu, 06 Apr 2023 06:28:59 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:5697:bbf2:968:7051])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a62e814000000b005cdbd9c8825sm1349883pfi.195.2023.04.06.06.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:28:59 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: maverickk1778@gmail.com, Jonathan.Cameron@huawei.com, qemu-devel@nongnu.org
Cc: Raghu H <raghuhack78@gmail.com>
Subject: [PATCH v2 2/2] docs/cxl: Replace unsupported AARCH64 with x86_64
Date: Thu,  6 Apr 2023 18:58:39 +0530
Message-Id: <20230406132839.3357195-3-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406132839.3357195-1-raghuhack78@gmail.com>
References: <20230406113640.0000277c@Huawei.com>
 <20230406132839.3357195-1-raghuhack78@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=raghuhack78@gmail.com; helo=mail-pf1-x436.google.com
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

Currently Qemu CXL emulation support is not availabe on AARCH64 but its
available with qemu x86_64 architecture, updating the document to reflect
the supported platform.

Signed-off-by: Raghu H <raghuhack78@gmail.com>
---
 docs/system/devices/cxl.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index 46f9ae9bf1..2ca5a78c51 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -302,7 +302,7 @@ Example command lines
 ---------------------
 A very simple setup with just one directly attached CXL Type 3 device::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -M q35,cxl=on -m 4G,maxmem=8G,slots=8 -smp 4 \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
@@ -315,7 +315,7 @@ A setup suitable for 4 way interleave. Only one fixed window provided, to enable
 interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
 the CXL Type3 device directly attached (no switches).::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -M q35,cxl=on -m 4G,maxmem=8G,slots=8 -smp 4 \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
@@ -339,7 +339,7 @@ the CXL Type3 device directly attached (no switches).::
 
 An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -M q35,cxl=on -m 4G,maxmem=8G,slots=8 -smp 4 \
   ...
   -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
-- 
2.34.1


