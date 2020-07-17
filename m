Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E192E2239C1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 12:53:17 +0200 (CEST)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwNzQ-0005tq-Uv
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 06:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jwNy5-0004c3-Nr
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:51:53 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jwNy0-0003rL-Pu
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 06:51:53 -0400
Received: by mail-wr1-x441.google.com with SMTP id a6so10518589wrm.4
 for <qemu-devel@nongnu.org>; Fri, 17 Jul 2020 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9slN1O2papsPKJQx1hZlMQQQGQ7xlVdARzuD4a81gdY=;
 b=D71HrpPVovQLHADlFAVOR8oAkxnw+Xbap74WtFNwb3jxuPIHQ+r82MpSMPVmdCLQTe
 ExQEFIjSN6xf+LeSXEk9yhDSiZo8WfkVIieJyIh9+/NZBz/NHYkQR6YS/N1U9lCt5x8f
 a3V1XkRRwZalyPTG69QVfuEtHNfkwpZBxvkycPLIMHp2Aqkl70c/FHO07ePSBKbRwjbg
 TcECQEs0Iy7nJqLf0f6kEDQIJjSRmBBm3CNfoIeRwjNHkKB7DUbEk6LHJnkN2i5ayXrg
 1nkHiznWWLIL/uMNTU36izMGqBKGN8reKC1efN4vDsx8ZclT9KAQR3MHFJNn6aSy+zLG
 b+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9slN1O2papsPKJQx1hZlMQQQGQ7xlVdARzuD4a81gdY=;
 b=IsMdSwie0j/lgJpEIaDdkrLXbwOnBBzJfNlfzsL3Qju9Yl+uRN9cuGvjg9Kmuhno1E
 zz180//mize/RDpWU4NcENelBVcy0nWQznfrZLTA3TSEJqqcYF5eqJ5bdZgO6uwWjNVO
 eBhIDiIKvQZh5Xe5HKEjfAYxSlF7Pbg2MHhx0hkcVbC4nGAotaAAn7nX56nYCqTYGw2c
 O+qKRh3GzXiEWbM1pKSTA/vfHm7h1FUAYvjrnbc5r0CeEAxX0X3c0/JD00AWAuo0+0tt
 82JlT8ISZ+2KJbeUjdQ0BpQh8ImZvNddzMQv3PtbYu8zFrTqdnzmV24Zv+HmEXfvR6QO
 hpJg==
X-Gm-Message-State: AOAM532E2HR9tgw4fZuYEWs65vbnfDca7EJPJizUZDdY8yAewev12f+x
 NfKumyeu/DxLnYm+ulcMiI8yzw==
X-Google-Smtp-Source: ABdhPJz7dL6fTElluDQ3aZyYE0DjPygeznw2ul6bEAPaRr6p5mJeDP6XIl+K5xwOcZgtzFy07k0IeA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr10371245wrw.25.1594983103877; 
 Fri, 17 Jul 2020 03:51:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 59sm14542265wrj.37.2020.07.17.03.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 03:51:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE0E51FF8C;
 Fri, 17 Jul 2020 11:51:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/5] semihosting: defer connect_chardevs a little more to
 use serialx
Date: Fri, 17 Jul 2020 11:51:36 +0100
Message-Id: <20200717105139.25293-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200717105139.25293-1-alex.bennee@linaro.org>
References: <20200717105139.25293-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 KONRAD Frederic <frederic.konrad@adacore.com>, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: KONRAD Frederic <frederic.konrad@adacore.com>

With that we can just use -semihosting-config chardev=serial0.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <1592215252-26742-1-git-send-email-frederic.konrad@adacore.com>
[AJB: tweak commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 softmmu/vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f476ef89edb..4fedbe60c39 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4131,8 +4131,6 @@ void qemu_init(int argc, char **argv, char **envp)
 
     qemu_opts_foreach(qemu_find_opts("chardev"),
                       chardev_init_func, NULL, &error_fatal);
-    /* now chardevs have been created we may have semihosting to connect */
-    qemu_semihosting_connect_chardevs();
 
 #ifdef CONFIG_VIRTFS
     qemu_opts_foreach(qemu_find_opts("fsdev"),
@@ -4281,6 +4279,9 @@ void qemu_init(int argc, char **argv, char **envp)
     if (foreach_device_config(DEV_DEBUGCON, debugcon_parse) < 0)
         exit(1);
 
+    /* now chardevs have been created we may have semihosting to connect */
+    qemu_semihosting_connect_chardevs();
+
     /* If no default VGA is requested, the default is "none".  */
     if (default_vga) {
         vga_model = get_default_vga_model(machine_class);
-- 
2.20.1


