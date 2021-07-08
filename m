Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573A3C15EF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:26:41 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VvE-00041y-Af
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-00008z-Gq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:03 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-0008A4-CS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bg14so10233990ejb.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQffVvVB59UeRyQUK8M2cEfWg6p9T0ffIm57of2Eeho=;
 b=YYJrjzFfVyhg0RXKgHC72Vl9SgopQjKqKrIw1m3pKy2N04li7+C1/2dfh1qEfY/iUb
 c44xKVr1VpizFdgLtW0omztl5qFI1ImDrJ4EYcq/0LsntfFb6k4ockAVHPfTNaCTmM7v
 PL0Ko1d6Usq/aQPCCeRj5UTW+/7vpVUbE/PAMlhJXAU/yZpbtHA1snfo0SEBgLrmmuq+
 EiyddTJaGaFGgfc1kG2kwJPztOi8myY4IhVbae0DZSSyau6AnJev6E1tyuw59eZoFb8H
 gq/8WWuez59RyROS7frX8dOpLLu1FskkfU2xSj9h20Ji9bba6jBP/PwR2u86Apqqdmlm
 hzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OQffVvVB59UeRyQUK8M2cEfWg6p9T0ffIm57of2Eeho=;
 b=uQhTsqXLw5ceiVw0FpQ0bURJ5XqeilokmnGYlziph9POLtVCNqkTX6MJRYiAIkCfpL
 OgE+MmYpvE2URqfs3aYfNEuxk4M0gSaTyFkxYMHpDKogpmy0xgdzUA+9nrk9TN8zleCu
 1ruBPfSiunxna0k5GZYuwOYJir1No/DRok7sRdTF//mT+7e3vkVD8gS912fXUu86jLL1
 rKiZsnSzxoD16SnZVAHpUo3dLQV0OSJDGSw8gMjrDrmNzstFPFDq8e1xOUY5pP92N0jE
 voiOxS+TzDLOkxndZjH+mrBtAITpZTxkcfoxvGyRgR4YgZs0OFblMaMpFSQdkQdvc4Zr
 +Lcw==
X-Gm-Message-State: AOAM530Xgn0xt7bygVmhUwFk4WmNnRgD6pRmzsGtCilz0e2jgmmAPzdB
 nsALr9n3W7OYwtGSRtUeyY5ZxB/unCg=
X-Google-Smtp-Source: ABdhPJyCBLvvPr2wZ7zW63ipsD3ZGqIsUxQhrk5aAebipmM+JOBmSWay2qUJ0MzowuOtTxqwaJr4uQ==
X-Received: by 2002:a17:906:1dd2:: with SMTP id
 v18mr22743396ejh.322.1625757476279; 
 Thu, 08 Jul 2021 08:17:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/48] modules: add qxl module annotations
Date: Thu,  8 Jul 2021 17:17:09 +0200
Message-Id: <20210708151748.408754-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-6-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/qxl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6e1f8ff1b2..84f99088e0 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2522,6 +2522,7 @@ static const TypeInfo qxl_primary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_primary_class_init,
 };
+module_obj("qxl-vga");
 
 static void qxl_secondary_class_init(ObjectClass *klass, void *data)
 {
@@ -2538,6 +2539,7 @@ static const TypeInfo qxl_secondary_info = {
     .parent        = TYPE_PCI_QXL,
     .class_init    = qxl_secondary_class_init,
 };
+module_obj("qxl");
 
 static void qxl_register_types(void)
 {
@@ -2547,3 +2549,5 @@ static void qxl_register_types(void)
 }
 
 type_init(qxl_register_types)
+
+module_dep("ui-spice-core");
-- 
2.31.1



