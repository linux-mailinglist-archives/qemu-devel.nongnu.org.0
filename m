Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1863611ACF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrD-0001ho-5n; Fri, 28 Oct 2022 15:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr7-0001g3-F9
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:26 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr5-00031p-F0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:25 -0400
X-IronPort-RemoteIP: 209.85.166.198
X-IronPort-MID: 234246930
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JnEU26PxoXkXPcTvrR0XlcFynXyQoLVcMsEvi/4bfWQNrUog3jIFy
 WFODW7VPK6OZGajc9l1Od6z9UlV6JOAydVlHAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOZTdJ5xYuajhOsvrZ+Es01BjPkGhwUmIWNKgjUGD2yiF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56iGqE4aue60Tum0xK6b5Ofbi1q/UTe5Eqa2M00Mi+7gx3R9zx4J
 U4kWZaYEG/FNYWV8AgRvoUx/4iT8sSq9ZeeSUVTv/B/wGWWf2v37u10FHgzfrci975IXG5u+
 N8xfWVlghCr34pawZq+Q+how8UndYzlZdJP/H5nyj7dALAtRpWrr6fiv4cJmmdtwJkQQ7CHN
 ppxhTlHNXwsZzVGPkcRBIgWlvrui3XiG9FdgAjO+fBrvTmIlGSd1pDVc8CEY8Clfv9qsWKCj
 0jbvG3gCEgVYYn3JT2ttyjEavX0tTr2XZ9XGLCm+/pChlqVyWoOThoMWjOGTeKRj0e/X5deL
 xVR9HN//e4980ukStS7VBq9yJKZgiMhtxNrO7VSwGmwJmD8v2512kBsouZ9VeEb
IronPort-HdrOrdr: A9a23:EsfiiKjutIjifXZ6+51bOlKCQXBQXuAji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQ2TXeNfBODZsl7d8kPFh4lg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeVvJprY4dvj8w==
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:19 -0400
Received: by mail-il1-f198.google.com with SMTP id
 s2-20020a056e021a0200b0030087a59cf9so1900573ild.11
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zccmR32lXEF/vauFBFHowkJOCOp1zoL6e7IhPGS3/PQ=;
 b=lAUZpichTNkFUi46vz5yGuN53yia6fGE2M4bd34AxqMGCUiZ20zjzjEAI4HQMbdCvp
 B2R+mzHCTQUCnCX1bOg6NXB3j9H7zsGWRCBH7tAr4n0wWN43rvTFoUHXFXbLnXxsqm0/
 opNYH9U1gdBGWCrFDH0D9di6hRMq3SMKLvUqKOq+bE90a0r9VBdoDks051qvKERLVNUD
 CiyFgm6tmQMvnddp6wk4CHh38tH8ZKIkFIXlVwm6IQsNVkWpNS5PbEV29Zp5LuULRSCJ
 zrhOy9ti9Jd8jR5r0iUIgUrU+/mrdepzpO8ewUs/EzWXficunRR8AEvcZ5m2pxkWD7ft
 0LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zccmR32lXEF/vauFBFHowkJOCOp1zoL6e7IhPGS3/PQ=;
 b=wNskX3eNsaIbjFEFvhbVsBZN6fkUWxcB+HRPqbCegYIpiLI0WxRtWkKH6ZTPqzX/fc
 7uhSj82GC3gJlAaWsJE7hrprGe6hbODnq6vSaP5qVpk8+byPHfnotycuiyrnwMG5Inqz
 jb0TxXxYfdvPZ634pwxAsZlB/r/kzh+r29+6cta63orCnBLxWkVX3aO4a6bEVmllJHVd
 9KTjP1CNA4Ytm4sjXM9Zs+dAb/zVf4enA01y33JOfh4gSV0R646+i4a8cXOrRslAnUkN
 DHWxlIdbu4uCKUY9pO81UFdAoZeZOJZ9S4KakN0zlBeBfgnzlNgjQ5oDMLZYt/rDk8yH
 UBng==
X-Gm-Message-State: ACrzQf3VIIHBEHbHdeTGg6gxFjVINm1nyqRtVnviCi7HpQhAC3Iz5LFW
 2mOJRsbB5VNSXfpkv4Jis6o9qlNJWULiRMbe8FpgI/r9zJGi0o2r8D+5Mi65WfesGsLOoNqxlW1
 6RQKQ4P3IINGbltQBWzsBlf+Xb9oMQA==
X-Received: by 2002:a5d:8d87:0:b0:6bb:bd2a:7535 with SMTP id
 b7-20020a5d8d87000000b006bbbd2a7535mr565318ioj.36.1666984639338; 
 Fri, 28 Oct 2022 12:17:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7IREEdw5zsHIjadNYdBgV/Br+jc6myAyCC1z9eBmw7K8xzJVFpbVJNm7PqIzLb6fviud7vIA==
X-Received: by 2002:a5d:8d87:0:b0:6bb:bd2a:7535 with SMTP id
 b7-20020a5d8d87000000b006bbbd2a7535mr565297ioj.36.1666984639141; 
 Fri, 28 Oct 2022 12:17:19 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:18 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 3/7] ahci: switch to guarded DMA acccesses
Date: Fri, 28 Oct 2022 15:16:44 -0400
Message-Id: <20221028191648.964076-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/62
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/ide/ahci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..ffa817eebe 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -240,19 +240,21 @@ static void ahci_trigger_irq(AHCIState *s, AHCIDevice *d,
     ahci_check_irq(s);
 }
 
-static void map_page(AddressSpace *as, uint8_t **ptr, uint64_t addr,
+static void map_page(AHCIDevice *ad, uint8_t **ptr, uint64_t addr,
                      uint32_t wanted)
 {
     hwaddr len = wanted;
 
     if (*ptr) {
-        dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
+        dma_memory_unmap_guarded(DEVICE(ad), ad->hba->as,
+                *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
     }
 
-    *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE,
-                          MEMTXATTRS_UNSPECIFIED);
+    *ptr = dma_memory_map_guarded(DEVICE(ad), ad->hba->as, addr, &len,
+                DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
     if (len < wanted && *ptr) {
-        dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
+        dma_memory_unmap_guarded(DEVICE(ad), ad->hba->as, *ptr, len,
+                DMA_DIRECTION_FROM_DEVICE, len);
         *ptr = NULL;
     }
 }
@@ -720,7 +722,7 @@ static char *ahci_pretty_buffer_fis(const uint8_t *fis, int cmd_len)
 static bool ahci_map_fis_address(AHCIDevice *ad)
 {
     AHCIPortRegs *pr = &ad->port_regs;
-    map_page(ad->hba->as, &ad->res_fis,
+    map_page(ad, &ad->res_fis,
              ((uint64_t)pr->fis_addr_hi << 32) | pr->fis_addr, 256);
     if (ad->res_fis != NULL) {
         pr->cmd |= PORT_CMD_FIS_ON;
@@ -747,7 +749,7 @@ static bool ahci_map_clb_address(AHCIDevice *ad)
 {
     AHCIPortRegs *pr = &ad->port_regs;
     ad->cur_cmd = NULL;
-    map_page(ad->hba->as, &ad->lst,
+    map_page(ad, &ad->lst,
              ((uint64_t)pr->lst_addr_hi << 32) | pr->lst_addr, 1024);
     if (ad->lst != NULL) {
         pr->cmd |= PORT_CMD_LIST_ON;
-- 
2.27.0


