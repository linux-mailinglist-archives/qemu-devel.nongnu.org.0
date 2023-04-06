Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D255F6D97B5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 15:15:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkPRU-0004sf-8Q; Thu, 06 Apr 2023 09:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPRR-0004s8-9q
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:14:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1pkPRP-0008EE-PK
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 09:14:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id q102so37191149pjq.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680786854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPXFEUFf25Y21YGkG2dEE4rWjH8ObY0y16yXPeKRivo=;
 b=T39qrST12+srTg1aI6pWBa8piEcMPHyJ9gPY4gW3zGsfA/up7Vdbp5+wvE3fAZKPAL
 kZLFRgMf6NWYU2OagqGrgXOVem+UsTrQxPEo+Uppb2o4hPHRSXBZRxfBZwyjYppNPSR6
 8Odgu11+PtcuXZJirtnSVWCHOuikL1bZkR08iyFC+YKPmmFkZyyHMZhwXFZeMxitbJPx
 3UsmBjjGQC4hF6aSSJu+MR+MtG+U5Ty7IwXybZBd2sMJG/UoU4IiKHKPIwhtnPYuBSa1
 14VIpng53cQz9kXQkpxCgNkU4i/LyV4K1IQ3oW7zly/FzyG3N+c9yELzJ/S2OJxFd/T0
 DK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680786854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPXFEUFf25Y21YGkG2dEE4rWjH8ObY0y16yXPeKRivo=;
 b=DZB3e+rOpSDZomWLSf3XtcihreE0ZcDqy3d66h4OzeZWq37EKOmIMEZfJDZXSeqQny
 R4SuSnlhkgNsE4DYg4Vd3T1rVAdfceOdLLnF546Hg/rTfwA+KbL/EZxex9oOkX+Y8O9g
 opKUSjXWP7yrS8XbAHAeRnnDBSoRCQxktWaVVwT82TsafbBXi0o0C59FVS1ZNdImTgry
 s5Meuh7zmg6JdGO1GyqnjUmbVAyidsJgJEVo7ECjIeA600saZRI9fIckqVWRGkg0b23Y
 qSeV654A1B93lT6SVmhoOAqAOfbQO2OOFhfWyZmKcZGC0WDJaYfik+zsAHVRgCJoWx2R
 +gYQ==
X-Gm-Message-State: AAQBX9cuPT3j6okj1cvR8lMpPjHptV3iMQx2P6G9LpNdvFUPseeMEr9e
 fwMel5OshcX0lqsOYdknyPw=
X-Google-Smtp-Source: AKy350ZhWtOLlLstW/zqKMezTn3w/0EZUT7xAWzIJcc4T9PJquDtaQUWQKd/uqQJi0RHAEJ0HaHUAg==
X-Received: by 2002:a17:902:dac1:b0:19c:f80c:df90 with SMTP id
 q1-20020a170902dac100b0019cf80cdf90mr13131260plx.45.1680786854357; 
 Thu, 06 Apr 2023 06:14:14 -0700 (PDT)
Received: from raghuh-elastics.. ([2406:7400:56:45c3:5697:bbf2:968:7051])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a631820000000b00513b3ea831esm1088326pgl.29.2023.04.06.06.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:14:13 -0700 (PDT)
From: Raghu H <raghuhack78@gmail.com>
To: maverickk1778@gmail.com, Jonathan.Cameron@huawei.com, qemu-devel@nongnu.org
Cc: Raghu H <raghuhack78@gmail.com>
Subject: [PATCH v1 1/2] docs/cxl: Remove incorrect CXL type 3 size parameter
Date: Thu,  6 Apr 2023 18:43:24 +0530
Message-Id: <20230406131325.3329590-2-raghuhack78@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406131325.3329590-1-raghuhack78@gmail.com>
References: <20230406113640.0000277c@Huawei.com>
 <20230406131325.3329590-1-raghuhack78@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=raghuhack78@gmail.com; helo=mail-pj1-x1032.google.com
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

cxl-type3 memory size is read directly from the provided memory backed end
device. Remove non existent size option

Signed-off-by: Raghu H <raghuhack78@gmail.com>
---
 docs/system/devices/cxl.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..46f9ae9bf1 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
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


