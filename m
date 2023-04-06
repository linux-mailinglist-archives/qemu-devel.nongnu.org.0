Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1936D97B4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:15:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPRZ-0004sy-QB; Thu, 06 Apr 2023 09:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPRY-0004sk-6m
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:14:24 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPRW-0008FA-MJ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:14:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id kc4so37446958plb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680786861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjOK+tBjt0Y5rlqq1jyo1reCaE99Updmk/TbhFmql3A=;
 b=VifbmWaTVw9L9jvQFjk3Rq/zXwnCU0LD8bltMWXcwymnNNgQtIGuboA/JVHdQ8WwRd
 BhitIQPHVvn4CSZfQ8W3GN2HpnobZrvsZKoTMd59hRpKPUE98kdU+eJfEkG9flyx5u3d
 iIIj5W/b3tsfxDsfQsFfof26FZampvYeToL1VVDofba08hvZziZtfthQXNkIUgwXFH7h
 HMN7NP2bNln9ME+l88hp2Poo6/tOKeXRlWTicwg4E6X2TDYvJkCBxlNNlL/EW5Cs4Xs1
 OphfPkZR5lAeP7LKlcvtLgybWQhxDbzKQUaQelnxNdOg27u+oM/qs98tUaEiHsP+8uv/
 QABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680786861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjOK+tBjt0Y5rlqq1jyo1reCaE99Updmk/TbhFmql3A=;
 b=nEZmEGD69SmPfJxsOV5B/prRnIA5b9FIwn4hcQ9MbfXrrsZplpAbAJCbpeIzPxwKiu
 5r1OpkChMe4KF/IBAtHWZBdw3tyb3PDNvKwmh/F2P3XQulcTLVCOkLW5D5+/KLEAENVm
 YWSBwnGY2N60nlstUM4B9Ncg6DZXAQhjrQq2AxGXrKXNsxULmu/8fW/eSit0a8hov1UP
 rITyYDkcQnhqoxV+h4cCX5EWjwxdECx6u2ustG4KiwD2/nHHQkpVCKqQ4U0x+6Rfo5Ss
 4oBKZQV7mVJAXuIQ5+LvkgxcBeA1ivpzkqy06haMp1MG7RvQd66OvvJsNzNC08MWzEX/
 CGBA==
X-Gm-Message-State: AAQBX9f+5CLBsE5IEqkUEWo5EPy28knHhn1DGRLmhpRklOLb+2Emu+8t
 8M6b0PElTnPK+lO+pTZKcER1TVYaLyY=
X-Google-Smtp-Source: AKy350Z2emKHp7+xLkHIfkWMsOKsUAb/ZkKUD3dNxjpj6/0TIQHg6MJdpA8EkrXIvorwgUVnLTxpQA==
X-Received: by 2002:a05:6a20:a89c:b0:c2:f930:45e8 with SMTP id
 ca28-20020a056a20a89c00b000c2f93045e8mr2752130pzb.46.1680786861114; 
 Thu, 06 Apr 2023 06:14:21 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:5697:bbf2:968:7051])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a631820000000b00513b3ea831esm1088326pgl.29.2023.04.06.06.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:14:20 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: maverickk1778@gmail.com, Jonathan.Cameron@huawei.com, qemu-devel@nongnu.org
Cc: Raghu H <raghuhack78@gmail.com>
Subject: [PATCH v1 2/2] docs/cxl: Replace unsupported AARCH64 with x86_64
Date: Thu,  6 Apr 2023 18:43:25 +0530
Message-Id: <20230406131325.3329590-3-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406131325.3329590-1-raghuhack78@gmail.com>
References: <20230406113640.0000277c@Huawei.com>
 <20230406131325.3329590-1-raghuhack78@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=raghuhack78@gmail.com; helo=mail-pl1-x62a.google.com
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
 docs/system/devices/cxl.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index 46f9ae9bf1..c786f0f312 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -302,7 +302,8 @@ Example command lines
 ---------------------
 A very simple setup with just one directly attached CXL Type 3 device::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 \
+  -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
@@ -315,7 +316,8 @@ A setup suitable for 4 way interleave. Only one fixed window provided, to enable
 interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
 the CXL Type3 device directly attached (no switches).::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 \
+  -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
@@ -339,7 +341,8 @@ the CXL Type3 device directly attached (no switches).::
 
 An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 \
+  -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
-- 
2.34.1


