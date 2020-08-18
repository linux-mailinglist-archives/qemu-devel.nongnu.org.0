Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4F24835F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 12:51:53 +0200 (CEST)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7zDc-00048x-FW
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 06:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k7zCb-0003iF-Vg; Tue, 18 Aug 2020 06:50:50 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rohit.shinde12194@gmail.com>)
 id 1k7zCa-0004l8-E8; Tue, 18 Aug 2020 06:50:49 -0400
Received: by mail-qt1-x842.google.com with SMTP id e5so14722969qth.5;
 Tue, 18 Aug 2020 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJeXa4xshRm0XRedcyxbgmkCf7n945QiNwMEsbMDNJA=;
 b=MCjs9+P4U2kRGgnEhUCoaTPk/kwhlp7VfGiYlNc9ki4MwUzCOG7bh0hV5giUcG5KlM
 dFyTE7HeSNGdcZzHKPKmQg2yHpZjHzQyU/9uq1+V19ozLbsopAAqhmXOXr982CpM8cKD
 OwwLVIBQ1fMDJ+XJ3+YZHPlvBBOeLWIths3CmVI2DDqRyUS+1/8jd52lD70KsENolMxL
 2Alye9kTJGHFBE99Ty5yBuex2s26rRy3EITOfWSzB5I7WRxuycLM/6caL/yVUVVBgdjl
 pxbo1RX2CRdsVh3UyxPmd+mrxTjLKGdUttkLA1g5vkRMNy5RX/OGjBFv4V2nTRDF0jCz
 SMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJeXa4xshRm0XRedcyxbgmkCf7n945QiNwMEsbMDNJA=;
 b=TA9ZsWr1AgSUD65F646wbQz+AQRxUmJwl8df2mzTV1McLIhgR52x1OFyCpH/Hmonms
 ycsOCnZvDMRQWU4KgbFKwUFCUzM9tDTWhFcA18hk5ilWlQLWnx6zKvqLZ+HvyaPk3YBT
 Rm0DE08VvSG/LbtVnGlthV5k2/Twg7OIKv4GVp0P9sUL9CBwGEiDMyD0Knpe9O+gM3kM
 yu7dmzFHP+wo53Ad0kGg2RNZH2DGJ83JYLWt33fP4L7OF2oNuHnAGCL28Pt50wYC83UJ
 x5XwR8yDly8Q5M7SrayVoQ9a2PNSfKTQl0UhrRltAHLXC3gTXKPddevVgeAGzdR7hkRt
 ub0A==
X-Gm-Message-State: AOAM533yiCaq9DbK9me3zU8mV9UtK9WPcM5UbbTcIr/SbnLnOcszcuhc
 EYWT8ShmFLg8T7+tcuBan0UamSy6iPjl/g==
X-Google-Smtp-Source: ABdhPJzfKzDvkj4tn4MeQFMzVP41rL9AGcSuI9W0YrtKW1R8sFJ6w/IJwYIHS/5TAEmKbqtfR8U6eA==
X-Received: by 2002:ac8:550f:: with SMTP id j15mr17341209qtq.26.1597747846455; 
 Tue, 18 Aug 2020 03:50:46 -0700 (PDT)
Received: from ubuntu.localdomain (pool-108-35-56-31.nwrknj.fios.verizon.net.
 [108.35.56.31])
 by smtp.gmail.com with ESMTPSA id c205sm20098998qkg.98.2020.08.18.03.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 03:50:45 -0700 (PDT)
From: Rohit Shinde <rohit.shinde12194@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] qapi/opts-visitor: Added missing fallthrough annotations
Date: Tue, 18 Aug 2020 06:50:21 -0400
Message-Id: <20200818105021.4998-1-rohit.shinde12194@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=rohit.shinde12194@gmail.com; helo=mail-qt1-x842.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-trivial@nongnu.org, Rohit Shinde <rohit.shinde12194@gmail.com>,
 armbru@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added fallthrough comment on line 270 to prevent the compiler from
throwing an error while compiling with the -Wimplicit-fallthrough flag

Signed-off-by: Rohit Shinde <rohit.shinde12194@gmail.com>
---
 qapi/opts-visitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 7781c23a42..3422ff265e 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -266,6 +266,7 @@ opts_next_list(Visitor *v, GenericList *tail, size_t size)
         }
         ov->list_mode = LM_IN_PROGRESS;
         /* range has been completed, fall through in order to pop option */
+        /* fallthrough */
 
     case LM_IN_PROGRESS: {
         const QemuOpt *opt;
-- 
2.25.1


