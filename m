Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F159B3CE
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 14:48:21 +0200 (CEST)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPkNF-0006e9-Qx
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 08:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1oPkJ2-0004uB-Mi
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 08:43:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1oPkJ1-0002Rq-1z
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 08:43:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo11486226pjd.3
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 05:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ox236dA9L1+MGYx/c6ncoVVJN1eypG62H3vEwUOZzTs=;
 b=UPDQsKB7HIWo2Ap6ipQ2McJ/sGqZB4wqIPtbCoeySBwW/uGGp0GpyZyp52VpVZU6cj
 4qsBwuCb6ZU/lhXsuNJcfnUJynX8tkhkd5Alm/aF7cjLRkKx90JmshOl9oKe0zmT93fN
 JrXxUqeuo9cg6jY266ZnnqdqHiaI5BOTc/WEKYsp++0L37qisPbOMk/oW0A99JQpGahT
 NrTiA1OKk5hrRwmQ9Yj4w7r/5Rs19ThcgVbl1JekWdr5q0+6r7vRf1HbvJx1Mq/rjMWk
 QSW1qZJEUpyXw7fl0sakYror67TGjNMOq+KdIq12+UX0UeSTk0FwbEeYvJt0TroLyBKC
 +AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ox236dA9L1+MGYx/c6ncoVVJN1eypG62H3vEwUOZzTs=;
 b=inhKL2WRYApNIiC+W4TMS938GhQ7c8P01g+Z6c9oLyDQFP/VckqECMb5J5fawlOc3y
 LssYQznLqpb3MrFguWe+L5dyLb9jRtMPnGXaexJDOvH8Jlr1HZJ5qjk4vNUA8heTfnJP
 +ZBYyikadEvf/wSfNmG4Cjd7jAgNAhUznUyM0utvP35xzDZ1wuj87mtSkT7MVHMZAbNQ
 yNUzOsafbnrwyxGyJgQKhTre38s76RpAe526V4tcq6lqDW9I9l5p1uKZ8i1Ck4DqWX52
 1LxIvsMYYJBLestDU9Vh0Lb02uhnvF0gwlgwxlosUt/G4CQGD76uxO4pFGz1vh6f8/Vv
 +/1A==
X-Gm-Message-State: ACgBeo1eS1MP5VAU4uTnBs8PWKofNYr94Q84h0i06Xs/GfV+oEseZnkR
 8tni+QZ/sq4ZImfFaFq9Iw==
X-Google-Smtp-Source: AA6agR5xXu+LtwbqU+MoXnFBHeBCJXYgz0Mb6amyiR1tPP/h6s+iBzuPMtrDs3fVjrQJndWV7pP2qw==
X-Received: by 2002:a17:902:e945:b0:16b:f802:1660 with SMTP id
 b5-20020a170902e94500b0016bf8021660mr16073520pll.7.1661085833524; 
 Sun, 21 Aug 2022 05:43:53 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090264d700b0016b81679c1fsm6374429pli.216.2022.08.21.05.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 05:43:53 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: svens@stackframe.org,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org,
	Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v2] net: tulip: Restrict DMA engine to memories
Date: Sun, 21 Aug 2022 20:43:43 +0800
Message-Id: <20220821124343.1336880-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=zheyuma97@gmail.com; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DMA engine is started by I/O access and then itself accesses the
I/O registers, triggering a reentrancy bug.

The following log can reveal it:
==5637==ERROR: AddressSanitizer: stack-overflow
    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
    #8 0x5595435fb082 in dma_memory_rw_relaxed qemu/include/sysemu/dma.h:87:12
    #9 0x5595435fb082 in dma_memory_rw qemu/include/sysemu/dma.h:130:12
    #10 0x5595435fb082 in dma_memory_write qemu/include/sysemu/dma.h:171:12
    #11 0x5595435fb082 in stl_le_dma qemu/include/sysemu/dma.h:272:1
    #12 0x5595435fb082 in stl_le_pci_dma qemu/include/hw/pci/pci.h:910:1
    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13

Fix this bug by restricting the DMA engine to memories regions.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
Changes in v2:
    - Remove irrelevant relative paths in the asan log
---
 hw/net/tulip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 097e905bec..b9e42c322a 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
 static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
-- 
2.25.1


