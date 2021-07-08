Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEFC3C1A26
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:51:26 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a3R-0001fi-FE
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWQ-0002Be-AO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWN-0007Ti-9O
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id r11so3614020wro.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRi7K6m52E48PuR0TYg29XhKTFnAlwfy+AuYcl9pk14=;
 b=Wk74hF96FRpnkw6ok/mjGQ8a5LQMVJda4afHFAjCDghlFRnSHMm6e6FKNc1vjxlDJc
 HRaWBgRhygr+ddoSK0pcloPEpn4T/vkij+3rL+YxWf29PnKHJAQtjCmTHYZ+JZLoVgVT
 BO5w4qxW4ing87jeEtCjHNbT8fhd+uRjbk2FzDbbZ9pgnLu3F/ID5FIO1tFKX2GjE65O
 NM03lcOdzmACmWbJBaVGfUotm1e0zAdWjU4dszsNH5Mhu904fgG2J7AHxgY5t4FBTaEL
 SUoxDzHHZz7w4R/EJPu6z3wwtKheUJpMs1ZaLUwEUpkHuz3TjttxPp7NCJZws2RfevMN
 NgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRi7K6m52E48PuR0TYg29XhKTFnAlwfy+AuYcl9pk14=;
 b=UQ0i6L8I6AkhRsvAubsfAx8HMQKMci5efD287+0l02m54PfdEH/L1qbjMhIpEUZ6JR
 XdrWTh/lWUM1AeO0tujv8hN2Row+hGr1lsJqIGL/e2yBwnwUareVVo8hQe0U5Tq1XMVA
 F4Zjymy91OCnODzdJigg/yp9YwmtF7K+7k/0V7QOtTRY6wEEpHA2HYx6I37ycAkVBs2N
 wVqDxtKPxOel46kN1vpwblxROSY+WOdBWKGYdCAbod0c8/0kvExm7MPpQhpWv4zl7U1c
 m8eYYx/TWr6ak1tStEkW+zhWg88TlD/gBal3p2phDpnJoX69ktupVnxKL5N8aB2etr//
 Uv/A==
X-Gm-Message-State: AOAM530G+0ifY1xVZK3BZIjZXPFY351CIbijzHK6NHArcamlyqliB1Vq
 S5jSbG+t8fbGHmijmviXlmVywg==
X-Google-Smtp-Source: ABdhPJwiWodqW33KqBeSS3ATMRN4+lrXCRh4SVSOhlMOdB1ZlhiOxYsUV5n9xm/rmnalhMD08oSztw==
X-Received: by 2002:a5d:58d6:: with SMTP id o22mr5767562wrf.48.1625771833522; 
 Thu, 08 Jul 2021 12:17:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm3122589wra.41.2021.07.08.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68A391FFB8;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 32/39] contrib/plugins: enable -Wall for building plugins
Date: Thu,  8 Jul 2021 20:09:34 +0100
Message-Id: <20210708190941.16980-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets spot the obvious errors.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - also $(filter -W%, $(QEMU_CFLAGS)) from the main build
---
 contrib/plugins/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..3431bc1ce9 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -24,7 +24,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS = $(GLIB_CFLAGS)
-CFLAGS += -fPIC
+CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
-- 
2.20.1


