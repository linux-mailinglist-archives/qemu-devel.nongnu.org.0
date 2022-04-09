Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC74FA78B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 14:13:14 +0200 (CEST)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nd9xp-0002j7-P6
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 08:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nd9ud-0000Dq-V9; Sat, 09 Apr 2022 08:09:58 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nd9uc-0005Rg-JG; Sat, 09 Apr 2022 08:09:55 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 p10-20020a056820044a00b00320d7d4af22so1936258oou.4; 
 Sat, 09 Apr 2022 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZB+NAl/2RAHlVzCkyaNJO8uJxeA8ba7I+7zknXaYBA=;
 b=QdxDyQe9GTUulay6Y5lOH+Mw0C25YkKSMhPPw3rrlbKSLx5kZqRSJo1fwIcsP0XxbK
 i8qSNO4YblSTecLaxYuQryCWd9opnF8q9tJDO0H8dTvr8aw1dU//Y7SUrywehCS7ijx6
 xjJEZSj9rLV34sSdHYJUXL0g4uab4z0LAATO3XO5cxn8utcUN8fb23We1qJtuXYb61dS
 wc1ofEE2ELDo2MItYjCkVkj6yMIeYEE6G9TUWUguouUlRMBfvPVvwkLJaJa81t0Dlay3
 wEmLwt1Y89WjbOe305edcX7NghXXqtpRoYqkFZkVkG59Xl0q0RDvs20Uk1gUJ6Hj2uGE
 VuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZB+NAl/2RAHlVzCkyaNJO8uJxeA8ba7I+7zknXaYBA=;
 b=i2vd3s8uE13LqRE08kBDqVQ25GtvMFIcJmMYvuwFZEvH9ZQAd/EE4lQ8GTAuyUGXiU
 PIklit0CdbyQnD34CRpYwFxugJXaQPHQ+jjtXLoyTg60yCVCCW1xATE65DH6iuLXrNQn
 8nUiL9/6QVnPyL++KKKwDvWPJz6PMMgFHgJh/mssS0jcwL3MJ+ScNAqr/16Tz7S5DJmq
 TBkKbEpGHYdTBdethHg+ttc9GZVVcfT+HniWk05xwZJPzscGkEg49UI1/f8LhNVlEvhg
 KXrjbDWn5ZQfvGHAzC9ByWIbKO0U4wyz4udQxpgYwdCLozQZNsfyJ2dwYn8Zi7hhhFDN
 cqgw==
X-Gm-Message-State: AOAM533+D+2S03mkjXW/aQVsnlZMhOaXsbpIwuQeRntEpBeWFPyeycXA
 cO8wzHTY401TdvnGrNoBK3ax/JRVJGg=
X-Google-Smtp-Source: ABdhPJzLzVFzcvVWOQHkQUqQCryzB8l9NImkagWcgKIlZwXJXH1JtA0zqTFNZWnAVvulHGQQy/5rNQ==
X-Received: by 2002:a05:6820:218:b0:320:ed7b:a2f8 with SMTP id
 i24-20020a056820021800b00320ed7ba2f8mr7588047oob.32.1649506192974; 
 Sat, 09 Apr 2022 05:09:52 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm9677598oow.19.2022.04.09.05.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:09:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v2 1/1] hw/ppc: use qdev to register spapr_nvdimm vmsd
Date: Sat,  9 Apr 2022 09:09:40 -0300
Message-Id: <20220409120940.263369-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120940.263369-1-danielhb413@gmail.com>
References: <20220409120940.263369-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2e.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code a little more maintainable by using dc->vmsd to register
the vmstate instead of using vmstate_(un)register calls.

'instance_id' was being set to VMSTATE_INSTANCE_ID_ANY so there is no need
for qdev_set_legacy_instance_id() calls.

spapr_nvdimm_unrealize() was removed since it was only being used to
call vmstate_unregister().

Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..973e9d0fbe 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -866,14 +866,6 @@ static void spapr_nvdimm_realize(NVDIMMDevice *dimm, Error **errp)
     if (!is_pmem || pmem_override) {
         s_nvdimm->hcall_flush_required = true;
     }
-
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_spapr_nvdimm_states, dimm);
-}
-
-static void spapr_nvdimm_unrealize(NVDIMMDevice *dimm)
-{
-    vmstate_unregister(NULL, &vmstate_spapr_nvdimm_states, dimm);
 }
 
 static Property spapr_nvdimm_properties[] = {
@@ -888,8 +880,9 @@ static void spapr_nvdimm_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     NVDIMMClass *nvc = NVDIMM_CLASS(oc);
 
+    dc->vmsd = &vmstate_spapr_nvdimm_states;
+
     nvc->realize = spapr_nvdimm_realize;
-    nvc->unrealize = spapr_nvdimm_unrealize;
 
     device_class_set_props(dc, spapr_nvdimm_properties);
 }
-- 
2.35.1


