Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CD5132D5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:51:23 +0200 (CEST)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2g6-0000d4-Tk
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk2Ri-0002qT-SL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:36:30 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk2Rg-0003Ar-TX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:36:30 -0400
Received: by mail-ed1-x52c.google.com with SMTP id e23so5160282eda.11
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Z2lAV8XUq26RWLstBeOLrZrv/JHK2RrtngbM1gCM3M=;
 b=dYb4pEuZrRC/Ed1L39Hvsw1iftYwPnw5l+O7zJ4/iRwh+BTb6/i2sI/w9relh2iMB3
 urMdIBOJHZBqs5PAjP/U6iqKAcQvbupE724E+IkuzInazpf1KWB3W5c95RNX9YeZUzr6
 CRaewG0G8ZrpKf04NOLRir5NzleTKJN5fbiyA2SUlWNHQ6MYH9jznaE9/8lKCIywudNB
 +lLcrdwQqb9sf/rhQvzzdzDQcXsE2MwsUEktqOVTDIULnLPwlRNG9lu2NT6GTZF8W73U
 x/2CmtonO1KF4exW0/CK9xGGf5v274lbkF2bu68vWVQ6KuKWvbXPgNfWGqITOUDOVVr8
 Y9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Z2lAV8XUq26RWLstBeOLrZrv/JHK2RrtngbM1gCM3M=;
 b=l9LZnB+hZfpMTFS5jMfocuZGz0Ymek6VWAeWYlOL5aJgaFvpTMzXmsu5/qA3Eva+6h
 C+CkJHpr6KMfkbQSYbAzZ7f/PYJibY83RLNDGW/hdjpppIb/UdqrGBiqdnco28m/JZYn
 OeuUgTAO5HNv8rgAQXsHZzCmDBVbkTfqQDttQyuUAV9iEyrWGnMYVE3vMtrZXZh9DMkq
 xnAjBwxu+ExiTf4tH4RuGr52Dql9LTT7pTOTeEAbE8q809d0eomg0YDol4QdJUpSkvNU
 tQzQ8nbJDlrhvqWDUw3Kfv8CZC/Djc44A8RI67U18qPh8FkiDpHVaeg5OE+pVoFB7rP+
 iUDA==
X-Gm-Message-State: AOAM531U12Vm9RSnuGsXMXQ6VEbgu85iteF0E/I/YcbOd6bs03gJZWQM
 DM4NL+N8I2a8/euT3cJaMjdOVg==
X-Google-Smtp-Source: ABdhPJxls/WINbPM3kXOI7DMfgIIW/mi4kSmtLJfE5y0ObxWASchSGE9VresL/q0MbCln42Hqg0+rw==
X-Received: by 2002:a05:6402:26c6:b0:425:f86e:77e1 with SMTP id
 x6-20020a05640226c600b00425f86e77e1mr15419225edd.400.1651145785980; 
 Thu, 28 Apr 2022 04:36:25 -0700 (PDT)
Received: from jwang-Latitude-5491.fritz.box
 (200116b8450f1a00a07040ca0a463b97.dip.versatel-1u1.de.
 [2001:16b8:450f:1a00:a070:40ca:a46:3b97])
 by smtp.gmail.com with ESMTPSA id
 j37-20020a05640223a500b0042617ba637asm1445036eda.4.2022.04.28.04.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:36:25 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: pbonzini@redhat.com, mtosatti@redhat.com, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH] doc: Adapt example to for numa setting.
Date: Thu, 28 Apr 2022 13:36:24 +0200
Message-Id: <20220428113624.68414-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=2a00:1450:4864:20::52c;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Yu Zhang <yu.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add numa sgx setting in one leftover example, without
numa setting qemu will error out with message below:
qemu-7.0: Parameter 'sgx-epc.0.node' is missing

Fixes: d1889b36098c ("doc: Add the SGX numa description")
Cc: Yu Zhang <yu.zhang@ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 docs/system/i386/sgx.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index 0f0a73f7587c..86fa70ec2a30 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -45,7 +45,7 @@ to the VM and an additional 28M mapped but not allocated::
 
  -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
  -object memory-backend-epc,id=mem2,size=28M \
- -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
+ -M sgx-epc.0.memdev=mem1,sgx-epc.0.node=0,sgx-epc.1.memdev=mem2,sgx-epc.1.node=0
 
 Note:
 
-- 
2.25.1


