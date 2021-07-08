Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786573C15E5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:24:34 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VtB-00061o-FP
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-00009I-IB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:03 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-0008AK-Dp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:02 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hc16so10252262ejc.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRYvhCnNfbDNuk04TeO5gzhkfXV3oKmDwmOyqqHq4kk=;
 b=kOXfzzJRRAh4DAyf12b7t5Vtx5qJ6Ifi2zeORfYXrwCb4X8Qs3TtoIuesp0XHg1NHN
 RF058EIeBRmHcqeojxxEl10TdRCX6vn0xAz04xjGdaKWHaQ216kN1zmNrCHRfd83S++Y
 AgIbtiQuxQ3xrU0M5KfSDAo12kL7ETvomjvChw7plAlJYDWWhQo13QegVwjrVlkw0juv
 lNtOAcK3h1Yin0IKUPyDCqUlFjKOJCz/zhsgbMgOKtHK9OlNMypZDeveoLrfmLJbtpwn
 z6LCLldZlqUOGhhBGFe1yPrgOumgd4nQt1+KbEySY6Bp8pPOBLt1SQXTKhDhkdofqngw
 a9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pRYvhCnNfbDNuk04TeO5gzhkfXV3oKmDwmOyqqHq4kk=;
 b=d0PJVBSi4nDqMd8BdN9d0wHV247JOX23biv8lZJg9vNp6hSIy5vgCQFi88lWnIHiPb
 iY/WkdSQJ8SZ0K86rTZg5ddxZJpzKnyGgtg62yce9LnRG44+Ol95QlfQKU9f9UkPFIiE
 Pt+7svyKg09FRNBVJ0pzNI4kGaawVV5p4IN6vZxhRdgf44d6iyIK6Ju3O4i9xnM/T4/D
 YZ7WZl/d10HlTqPeFka6Q6B045lnZGglrEB3VzHof5W+3b7T+U+PgF1oR/7NQ7Yf15Tu
 eKZRhpFZSKRBexn8ix7vjFm9L0vUWBmkSyD0Dd9+5UjcG8LUGFKc2C4KRmrQ+Dn1bZRZ
 LTBw==
X-Gm-Message-State: AOAM530rFTCUcUNTTKWlFsQbnRAyfM8HOM7G0zVKUyHIGX+Zjm3RQT07
 piCPqGoNQkj4RegpDXFqDm2YwSCwPLk=
X-Google-Smtp-Source: ABdhPJxgtn6BqeCVSqM7WleXzI0A/Bt+KSOePsRyWnA9QfvN6d61I6RfeY7ggoCzl54+LZWRUj2BYQ==
X-Received: by 2002:a17:906:b0c8:: with SMTP id
 bk8mr31791860ejb.412.1625757477777; 
 Thu, 08 Jul 2021 08:17:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/48] modules: add chardev module annotations
Date: Thu,  8 Jul 2021 17:17:11 +0200
Message-Id: <20210708151748.408754-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Message-Id: <20210624103836.2382472-8-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/baum.c  | 1 +
 chardev/spice.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/chardev/baum.c b/chardev/baum.c
index 5deca778bc..79d618e350 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -680,6 +680,7 @@ static const TypeInfo char_braille_type_info = {
     .instance_finalize = char_braille_finalize,
     .class_init = char_braille_class_init,
 };
+module_obj(TYPE_CHARDEV_BRAILLE);
 
 static void register_types(void)
 {
diff --git a/chardev/spice.c b/chardev/spice.c
index 1104426e3a..3ffb3fdc0d 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -366,6 +366,7 @@ static const TypeInfo char_spice_type_info = {
     .class_init = char_spice_class_init,
     .abstract = true,
 };
+module_obj(TYPE_CHARDEV_SPICE);
 
 static void char_spicevmc_class_init(ObjectClass *oc, void *data)
 {
@@ -396,6 +397,7 @@ static const TypeInfo char_spiceport_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spiceport_class_init,
 };
+module_obj(TYPE_CHARDEV_SPICEPORT);
 
 static void register_types(void)
 {
@@ -405,3 +407,5 @@ static void register_types(void)
 }
 
 type_init(register_types);
+
+module_dep("ui-spice-core");
-- 
2.31.1



