Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601BA6E94A2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTY0-0004Ca-Cc; Thu, 20 Apr 2023 08:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1ppTXw-00048U-Ay
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:37:56 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghuhack78@gmail.com>)
 id 1ppTXt-0005Yc-4Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:37:55 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54fe3cd445aso39051577b3.5
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681994271; x=1684586271;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ll+OOqP9UTs6KODp2qTkwH7mO4ZYdASH+Er+VNj9PrM=;
 b=W2S5ukKJh+PHElNJw7wMq3M+AQ4eRHkB1OQnKSVOozBLl6TYYtknfzV801tBZo2PBe
 lGo6ucF2Q2SbHsqAnJs3HHVJgoFazSJDDQ2JIqOPGL46W/NfptsHKtPVhx8i89XY8D/C
 IsEMcc17JmX55AWvO/rLb7951mSbN3Da1QSKtNSIQMQXqvvUIwWdmq+EuRzIce5N/dU9
 mjDs45TcXSl7wlYqdioW1euoXNA8tHj6LSjV7I8IxyHe1nhGvCxQ7nv8085fm7TRT16N
 h6oxVJITM3rZUPdkS/bW3977z58k7bh8GzupISs7l0Ps1LWQRIJLNE0dB9R7HpaPnb5X
 LESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681994271; x=1684586271;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ll+OOqP9UTs6KODp2qTkwH7mO4ZYdASH+Er+VNj9PrM=;
 b=PgMeL7dRSaAmjaoSMAkzWSr/c3e0O519oyBEJ+io28Tg4kUXjL3EwLu5XG6T3n6qFR
 cqlet7l2EyqFn4mQBaieG8x32UZWRFhFbat5sfcqf88Q0OOSKvtX1trwZ54jWDZJtXyD
 2fqWBrjp0nttfOHY/E9Rv9xiV+tCN+sj4owCddq0UG5X4UsM8pMshLuGiSwZe+vgWpNx
 e+lgilxwlNpiF5v8YicS9r09XXRfLidJjRdlgt+wzMUwQ7RMTrrzV9kE6zyC2Rud3NAN
 t509YFHya2GjNF/BpgMf+UPcFe2X4a/t5RW/fDLNaZWleYxQbWKt3t1VFYVD08pfkxwi
 Zd2g==
X-Gm-Message-State: AAQBX9eHozJ/HfsG+g0OPQMa8x35Uzo+KsNpjvsbzTbZLWXZYjInwqb1
 87Gcs1jW8hhCUPoGk/FIg+HGmtZ4LsEjIo3MSHdiQRbsIFY=
X-Google-Smtp-Source: AKy350YntJDfsOjUzRHPW4x14deXZ01uIpZuv3aFdNPKOTOIg/jE3pbLIJEJl7n6z8Pwx9Pzf5uQp1UwDndIqtAnEjM=
X-Received: by 2002:a0d:f3c7:0:b0:550:c7cb:55ce with SMTP id
 c190-20020a0df3c7000000b00550c7cb55cemr637469ywf.30.1681994271272; Thu, 20
 Apr 2023 05:37:51 -0700 (PDT)
MIME-Version: 1.0
From: RAGHU H <raghuhack78@gmail.com>
Date: Thu, 20 Apr 2023 18:07:40 +0530
Message-ID: <CAGWUp4oHxtj69B=gCtUAS_Fp0p6=wBjK_gViYKRqwkVBteCdeQ@mail.gmail.com>
Subject: Error : "cxl_pci 0000:0d:00.0: Failed to get interrupt for event Info
 log"
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=raghuhack78@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello,

I am using qemu config listed in CXL documentation to emulate CXL device


-object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest.raw,size=256M
\
-object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M
\
-object memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M
\
-object memory-backend-file,id=cxl-mem4,share=on,mem-path=/tmp/cxltest4.raw,size=256M
\
-object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M
\
-object memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M
\
-object memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M
\
-object memory-backend-file,id=cxl-lsa4,share=on,mem-path=/tmp/lsa4.raw,size=256M
\
-device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
-device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2 \
-device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
-device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
-device cxl-rp,port=1,bus=cxl.1,id=root_port14,chassis=0,slot=3 \
-device cxl-type3,bus=root_port14,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem1 \
-device cxl-rp,port=0,bus=cxl.2,id=root_port15,chassis=0,slot=5 \
-device cxl-type3,bus=root_port15,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem2 \
-device cxl-rp,port=1,bus=cxl.2,id=root_port16,chassis=0,slot=6 \
-device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
-M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.targets.1=cxl.2,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k

Kernel logs show cxl_pci module error while setting up irq
(cxl_event_irqsetup in drivers/cxl/pci.c)

cxl_pci 0000:0d:00.0: Failed to get interrupt for event Info log
[    3.984800] cxl_pci 0000:e0:00.0: Failed to get interrupt for event Info log
[    3.984841] cxl_pci 0000:df:00.0: Failed to get interrupt for event Info log


Is this expected in an emulated environment?

Regards
Raghu

