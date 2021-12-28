Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CC480CE7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:58:05 +0100 (CET)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Ibj-0006z6-Hg
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:58:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJS-0003tm-Jf; Tue, 28 Dec 2021 14:39:12 -0500
Received: from [2607:f8b0:4864:20::734] (port=43695
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ4-000473-Un; Tue, 28 Dec 2021 14:39:05 -0500
Received: by mail-qk1-x734.google.com with SMTP id f138so18017216qke.10;
 Tue, 28 Dec 2021 11:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/1oOrn19Qq5V7IB3zLGoiPnWM8P3PNbcnKYmFkDvzEs=;
 b=WqImzzBW1ZB7tzjrHHskpS0sbkjWn3XnALYFQFfrCJQ4DvJSjMA7/ZpqW/So5guaP3
 eC6gW5AprY80l1LjnfQFEmnj6lBXDKaEOIQHSsR4yN24Io/MxcbqABozdsR6vcFCR8hK
 /HnslhySnlSNQqaxtBSadQVNOJAkXO8Uj1XU+R9PjIJpKxXl7rt2hWrQaI5yRrRMSHui
 dbJzrZah87DoY66v2D6k5AlxiC9z3fVeZtNen218q49Gbs9UNtzJy4TFGuaCRBe9MTZA
 4tnggNVaHJIUJiuc7yJgcPWmO2E10cpUkWGy2+6Di/rYZDP7zz6bQHYz/cfsWE4mHpmf
 TAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/1oOrn19Qq5V7IB3zLGoiPnWM8P3PNbcnKYmFkDvzEs=;
 b=3DC2ZOQjfuf8mKSjzY42ybky75MtY3uUR/fvjuUjDeNt6+ePgZtS8oIubsCAAtC1x2
 /ERrcL94jZSw/i8tfCSt1txe0slMg7ThWxC+wAv8/O5s75LIh8L3lwaliMqVbmPiwUtD
 6KwcLWj7ZC7obwLKBIwx7Gp4LxqwTUuBp189h0JdzNUeLb/XADyOeFSi+gZJb+tVZwwg
 ASPAT5DulWy0oKynH0QLlG1F2vfLJitO9oZnPBcENtoREeCy6f3ld4biz2LZMZxEsB02
 4QM3bl1cmgef4jn5iDg3XFm4IX3h++2cws0nkeCP5SzHwEdnJ8uSnxeTVCF/jShjSuHv
 2Tlg==
X-Gm-Message-State: AOAM533GbdsYHr20pjbmi6Kf9ZG7AXQSj9ghp6FLW/+sJa5MOAuPkV8S
 4MKhx2W5MCx3kpm99ni0ySvZQAJRIjM=
X-Google-Smtp-Source: ABdhPJxz/hQ+sWKudY5oMdf1Xg2XnXcA9ofemfYUEh0KfCwNIMQsn6WGOpaBsHUcQM2zSoA5sVl51g==
X-Received: by 2002:a05:620a:3195:: with SMTP id
 bi21mr16108241qkb.547.1640720324601; 
 Tue, 28 Dec 2021 11:38:44 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:44 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] Revert "ppc/pnv: Introduce support for user created
 PHB4 devices"
Date: Tue, 28 Dec 2021 16:38:03 -0300
Message-Id: <20211228193806.1198496-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The upcoming code that allows for user creatable pnv-phb4 devices relies
on finding the correct pnv-phb4-pec controller to associate with. At
this moment the code that added support for user creatable pnv-phb4-pec
devices does not update chip9->pecs[] and pec->chip->num_pecs after
pnv_pec_realize(). This is not trivial to do because chip9-pecs[] is an
array of PEC devices, not an array of pointers to PEC devices.

All of this wasn't a problem back when this commit was introduced
because the pnv-phb4 devices of each pnv-phb4-pec were being created
automatically.  We had a change of heart since then, realizing that
dealing with pnv-phb4-pec is too complicated from the user standpoint.

In theory we could work the code to change chip9->pecs[] to be an array
of pointers and go from there, but in reality this will be a wasted
effort since we're going to backtrack on the user-creatable
pnv-phb4-pec. All PCI Express controllers of all chips will be created
by default. When running with default settings all pnv-phb4 PHBs will be
created, as usual. When running with '-nodefaults' the PECs will be
created without the PHBs, and then the user will be responsible for
adding them by hand in the command line.

Instead of fixing this situation with chip9->pecs[] not being up to date
with each user created pnv-phb4-pec, then work on user creatable pnv-phb4
support, then removing the support for user pnv-phb4-pec, let's remove
user-creatable pnv-phb4-pec right now and spare the extra code.

This reverts commit 7a221a8f6eb04d3e03081b06a89896803554e37d.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 19 +------------------
 hw/ppc/pnv.c               |  5 ++---
 2 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 3797696e8f..aa93ad3f10 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -382,17 +382,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     char name[64];
     int i;
 
-    /* User created devices */
-    if (!pec->chip) {
-        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
-
-        pec->chip = pnv_get_chip(pnv, pec->chip_id);
-        if (!pec->chip) {
-            error_setg(errp, "invalid chip id: %d", pec->chip_id);
-            return;
-        }
-    }
-
     if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
         error_setg(errp, "invalid PEC index: %d", pec->index);
         return;
@@ -400,12 +389,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
     pec->num_stacks = pecc->num_stacks[pec->index];
 
-    /*
-     * Reparent user created devices to the chip to build correctly
-     * the device tree.
-     */
-    pnv_chip_parent_fixup(pec->chip, OBJECT(pec), pec->index);
-
     /* Create stacks */
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
@@ -538,7 +521,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
 
     dc->realize = pnv_pec_realize;
     device_class_set_props(dc, pnv_pec_properties);
-    dc->user_creatable = true;
+    dc->user_creatable = false;
 
     pecc->xscom_nest_base = pnv_pec_xscom_nest_base;
     pecc->xscom_pci_base  = pnv_pec_xscom_pci_base;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c88fef26cf..bf2607446a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1426,9 +1426,8 @@ static void pnv_chip_power9_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
 
-    if (defaults_enabled()) {
-        chip->num_pecs = pcc->num_pecs;
-    }
+    /* Number of PECs is the chip default */
+    chip->num_pecs = pcc->num_pecs;
 
     for (i = 0; i < chip->num_pecs; i++) {
         object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
-- 
2.33.1


