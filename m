Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A46D7D9F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk34w-0007Cx-0l; Wed, 05 Apr 2023 09:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pk0Mx-0000Fw-1M
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:27:59 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pk0Mu-0004Pa-Hh
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:27:58 -0400
Received: by mail-pg1-x532.google.com with SMTP id z10so21397160pgr.8
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680690471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XdQm+7ejU5W3ZiYW2kITWuF4BnboMdtjnWMQZ1zoLuE=;
 b=p7kqE4dXfcsReP2L4GVuvJxuNmIEOb8H460SfvUY+AXKAypXa4g7JOE8USHH66ZHjD
 YYpYkKpNpoNPDY2N6bimKmhuC3ODjH1IUPChwLTtPxyLsTAKgx+o8oqkOzFRCGjfy8OO
 eZhFXBjBLO+dUfOeRB8PGpcFFQ3LITwlXHibo1+MJ0uD9MxOp0RkLUxMGTdjuC6PfFRs
 suOgFSgxJOFs0hyz1PnQswXTBCFjXiqD7HcGdXWzdihoWx41w+/5cBnKqAWCQOGooOEL
 tJLyZDzauEPIz0IBR3cm96MrOrtjAp4B1pQ43aXQIhtBPfXcPZeDeKKEBItLVvJOfyH1
 h75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690471;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XdQm+7ejU5W3ZiYW2kITWuF4BnboMdtjnWMQZ1zoLuE=;
 b=D4z2brM3bTkWyO+hhsPxkgG3ROUtkyI+sn0HN81huGF469XbVZwfDDmsqCNSP6rHa9
 uw41/pxSmRFlBzpUOc62oDs8ahO2wRsK1HYBOto3+wknulIVrz68wTNqIYsKKMTFxz/+
 9PbQCr9tXzP1QAjVxvZV5KMfKSBMfVVHQJie+5oePl8TL3LqYC9luU0GLfXR9YkqYQMd
 +vBMtcPzahXBPOQ98mvOjn7DPYVwTIho+SJnLqlYk9PeGSLn+vVywK8p7G0CqY99gzGK
 1/MU99zvj5YliiyMJTLPeiOR8Yh3/fKuNSumnFQWMdxYC7fKqR+LVIDQdAZpog2TtTmd
 WV6w==
X-Gm-Message-State: AAQBX9ex2bfFcWcmImkmjxLfgPDMioMG/eg7jf2oZjWMOstt52j/2PGF
 PZYUyd5/30/dkKxkTt844ys=
X-Google-Smtp-Source: AKy350bU3LXZrgVAk4T/GI7cITLXQhOv/+63Ip+JOh3OtKU1Z4vJbPg7TP6bGcP8RUg8E5fjWg73wA==
X-Received: by 2002:a62:3885:0:b0:626:26f:5e4b with SMTP id
 f127-20020a623885000000b00626026f5e4bmr5052134pfa.1.1680690471514; 
 Wed, 05 Apr 2023 03:27:51 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:a6be:1cbb:af02:2769])
 by smtp.gmail.com with ESMTPSA id
 d3-20020aa78683000000b0062e024b5584sm7375186pfo.34.2023.04.05.03.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:27:51 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: 
Cc: maverickk1778@gmail.com, Raghu H <raghuhack78@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] docs:remove cxl3 device size
Date: Wed,  5 Apr 2023 15:57:38 +0530
Message-Id: <20230405102738.2062169-1-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=raghuhack78@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Apr 2023 09:21:30 -0400
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

cxl device typ3 size is read from the memory backend device, removing the
size option specified in cxl sample command.

Updating sample command to reflect target architecture as x86_64.

Signed-off-by: Raghu H <raghuhack78@gmail.com>
---
 docs/system/devices/cxl.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..b228146cec 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -302,7 +302,7 @@ Example command lines
 ---------------------
 A very simple setup with just one directly attached CXL Type 3 device::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
@@ -315,7 +315,7 @@ A setup suitable for 4 way interleave. Only one fixed window provided, to enable
 interleave across 2 CXL host bridges.  Each host bridge has 2 CXL Root Ports, with
 the CXL Type3 device directly attached (no switches).::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
@@ -339,7 +339,7 @@ the CXL Type3 device directly attached (no switches).::
 
 An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
 
-  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  qemu-system-x86_64 -m 4G,slots=8,maxmem=8G -smp 4 -machine type=q35,accel=kvm,nvdimm=on,cxl=on -enable-kvm \
   ...
   -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
   -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
@@ -354,13 +354,13 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
   -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
   -device cxl-upstream,bus=root_port0,id=us0 \
   -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
-  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
+  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0 \
   -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
-  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
+  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1 \
   -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
-  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
+  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2 \
   -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
-  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
+  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
 
 Kernel Configuration Options
-- 
2.34.1


