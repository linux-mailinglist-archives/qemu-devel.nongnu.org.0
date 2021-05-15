Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F63381A3C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:44:51 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyLK-0004h8-V2
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEw-0001YC-NG
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEs-0006V4-L2
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1x0uvyxiT8wyEBGvclqUmai2RCxtpbNXg1x32V8Mlyo=;
 b=aObJ1AsFSPI8jNeVaaXQBjDgxGil1HxigG6Px0uv7w1pUXRDU0xh5uJuc9pv+Z1CjxjYdu
 hNX1eRBRiXp/XsjkMEQGayHgPNkfS4wxvqk6GMiTv1p+o3f8hAjuMk8H/FwZbJxE6G+MRc
 TZRl1ghRocMb4kmIS1CG4bjf0reqJZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-UFHv3pd5MmifhtvfZ2vR_A-1; Sat, 15 May 2021 13:38:08 -0400
X-MC-Unique: UFHv3pd5MmifhtvfZ2vR_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 n24-20020a7bcbd80000b029014287841063so451402wmi.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1x0uvyxiT8wyEBGvclqUmai2RCxtpbNXg1x32V8Mlyo=;
 b=aC+0fmxyszv2j8GTIkGOUGWrENHu+fo7fL56LFqaPkpKZ9zVo/KRMgpz10X8TN7Wq8
 iHaO8AzDfzaXyV9Ho/6/G3u7w6SeCnW+lVFjpJBBmu3Zm1NQXZOxgub13b1WzZy3MH2i
 4u2yVrIl/tRNj5g+eTtbOu9wOCJbEVtIPWIn+VuimonExvPxE7Loc35rFWJDvxGZxlPq
 D9SmYtaug5ZFlQOuEegBy4KE25INtV+Baqf7/GBn3r/NYw/mhnheIpvBcPCpmXc19Bav
 X8bVz6mYqYD+4hxr2tXzT2cDup97TnlHm6+khjvP8X2F/WiRApbI1xpoQd//YCgaYtGB
 bbDA==
X-Gm-Message-State: AOAM531Ed0sRt7VpmJmB9hzpF0bvgRuHphng9r5xQLDGhWa5raizs/SC
 Oaptt1Tf8/pTs/SuRJIQWQf0tcusFROamt6ol6vx/9e+X/Xm/uREO9W+3mAeGS4n8rguN/QyE+M
 6C85ORDAMxEeleaPrMqWAbdc5P0aJeXxupT3N+HTQZESVNudCUOLpwOMigaMConry
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8049133wmn.34.1621100286192; 
 Sat, 15 May 2021 10:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMTrQfpdVRUBxDdDTshuD8xC/K1JOLeK8ZGZcE4rK22H2ZM89m7JZ4Xv21inLYBWjycqc9PA==
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8049108wmn.34.1621100286043; 
 Sat, 15 May 2021 10:38:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j14sm10847304wmj.19.2021.05.15.10.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] hw/isa/vt82c686: Add missing Kconfig dependencies
 (build error)
Date: Sat, 15 May 2021 19:37:14 +0200
Message-Id: <20210515173716.358295-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The VT82C686 device model misses various dependencies:

  /usr/bin/ld: libcommon.fa.p/hw_isa_vt82c686.c.o: in function `vt82c686b_realize':
  hw/isa/vt82c686.c:622: undefined reference to `i8259_init'
  /usr/bin/ld: hw/isa/vt82c686.c:624: undefined reference to `i8257_dma_init'
  /usr/bin/ld: hw/isa/vt82c686.c:627: undefined reference to `mc146818_rtc_init'

Add them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 55e0003ce40..0703512209a 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -49,6 +49,9 @@ config VT82C686
     select FDC
     select USB_UHCI
     select APM
+    select I8257
+    select I8259
+    select MC146818RTC
 
 config SMC37C669
     bool
-- 
2.26.3


