Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28531574916
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:32:13 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvCd-0005FC-AR
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukK-0005Qj-N9
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukF-00062N-Dh
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtsR/tM7k67a4bE2GsvxVx53jg+bM1PYQJk4fjczQuA=;
 b=cAyUonPskaXbumjAYhGuML6lqJhgl2SFvqkUg+DmeFQZmz4lWYXqRqDTt0gOvqZ/1rE2Cw
 xc9JM3WC6nJ7uXg7+95ccODWaNvnO/JBDMmvDHLLNgqeQoIq/UDn0cZfF11I/nWKi4pqcH
 gQ3rYnLhe8TWN/SZptqMy2dCb0g+Fwg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-uWStmG0wMD2soZHh-e8ISQ-1; Thu, 14 Jul 2022 05:02:49 -0400
X-MC-Unique: uWStmG0wMD2soZHh-e8ISQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v19-20020a056402349300b0043b0f690cbaso1102319edc.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtsR/tM7k67a4bE2GsvxVx53jg+bM1PYQJk4fjczQuA=;
 b=LG2b732PbxeTIprEDXZpA7EP5YOBh/77JtZHuI6fBMijcz0jT1tlvzGLQ8/dUSE/Lm
 VPmwIusUuM6cNytZS1G9z4HsdZAN8qxsCNlPhqHQizuv4VzcUFvkcuO4YC6GIQroTMRN
 TBp7c1IHjFbmXGjyi/EsF9MsE7cTER5yVGmV43U+ppfJ2OY4bI2YmJRlHLF5NdrvfMOL
 w8rQXh1CFYoU2GmIfZqGP3puZj6bnNfn/Tuh++IGKKK1nfgHZjNhMT8RB2HLfdjPTOVL
 FXZbdKsYkDIlAzq6aC7J0F/Op7AJyM69ISACXAICdEiD22Ej5rbyeKxBHQPO2sStlU94
 5Cww==
X-Gm-Message-State: AJIora+GQwQaafGttbNta5HW3RYzwxLxdj5Y4hW4iwIE6z9VahMZJiBi
 WEn6hqvhaPDlLFET2DvhOON5k5UF2e2WjTSr7CKbjkgrucN1U1TnwyneuguwFdqCoo0uIjKZeZx
 lc9CbvW7yMwg0bnjv/dOX2WcaFHoFTwmSB6MmFY0WVM+wM6FIa/yB32TnHMr6Cx6dJlQ=
X-Received: by 2002:a17:907:6e13:b0:72b:509e:bd6b with SMTP id
 sd19-20020a1709076e1300b0072b509ebd6bmr7828987ejc.202.1657789367853; 
 Thu, 14 Jul 2022 02:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1ovsObNJD5PFYsrI5l4Oq0feVgFC7el0HTWE/ZD4KyerGOf5YiwXP5cu5qfhjvxhpCwTu7g==
X-Received: by 2002:a17:907:6e13:b0:72b:509e:bd6b with SMTP id
 sd19-20020a1709076e1300b0072b509ebd6bmr7828969ejc.202.1657789367571; 
 Thu, 14 Jul 2022 02:02:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 i20-20020aa7c9d4000000b004358f6e0570sm685734edt.17.2022.07.14.02.02.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] pc-bios/s390-ccw: add -Wno-array-bounds
Date: Thu, 14 Jul 2022 11:02:11 +0200
Message-Id: <20220714090211.304305-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The option generates a lot of warnings for integers casted to pointers,
for example:

/home/pbonzini/work/upstream/qemu/pc-bios/s390-ccw/dasd-ipl.c:174:19: warning: array subscript 0 is outside array bounds of ‘CcwSeekData[0]’ [-Warray-bounds]
  174 |     seekData->cyl = 0x00;
      |     ~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 26ad40f94e..c8784c2a08 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -35,6 +35,7 @@ EXTRA_CFLAGS += $(call cc-option,-Werror $(EXTRA_CFLAGS),-Wno-stringop-overflow)
 EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -fno-stack-protector)
+EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -Wno-array-bounds)
 EXTRA_CFLAGS += -msoft-float
 EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS),-march=z900,-march=z10)
 EXTRA_CFLAGS += -std=gnu99
-- 
2.36.1


