Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C61EBF53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 17:48:28 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg99P-0005Qo-Bt
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 11:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg97a-0003ZC-0O
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:46:34 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg97Z-0007dB-4W
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:46:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id v19so3420726wmj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6KWkQ7GMCxDwtP2C3gX6zvZP7J6EFfLnh9MNnF4sLE=;
 b=ziPpwH0s3ebzUfIhuKb5CsAVmdk8rBX6MMMIjVM6YD8ntQrPgieRjf9l8i+TzP/ule
 oDdZf3MTjWSd7kIyNVgoJxihPQfvPW3Dz2CfbBpL5Ufgts9aOxDIHoGwEuht4FBaC4l1
 8KT22PrqSIl7LHNsogDN/rSceH/8LqvULD7K94WbHLXwNCvPrm939Sfs9PVddjNY2Ufu
 yfWIwJ/XtWWLG6CqvkUpsq6GXIftWzjCbX48VTSubeAlokL/gXmsN3IRpBMN1ma1fLYb
 VoRLTh0DEkblEi0/cW+c3j/DuZG1TNpQrFeEx6E3Iq/FEaLoMTImnje0MCSX8wSeQicO
 ihqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6KWkQ7GMCxDwtP2C3gX6zvZP7J6EFfLnh9MNnF4sLE=;
 b=TbE4Dz3pAuD1QD/ysK3cmkYptjQxF0oswG/DFEzUuhsO/slHgvORoaelCSBdcF64MB
 8D24GKuLRCHdMntnXPH5KlkNunAyRJ9LItcGgrI3Gn4kYcg6uTWA3OHwnbXDkrVSvwnQ
 b6HNhpC6gyGS7I4jbOSVr8cEy/IETo3jx9DL6fAwWadLhu06OWrK62Lt7yKuKcuKeFGy
 wZR20/O2nn2ubhK+OoduQt1zZr12VFRgv6+c3x/xmTZSymG1g5Ryc8KyERb1mjTYcWaI
 qCNIP6Y/mspyNImcEVkbsDg3p+ZP4mJxexEyXWY7Kcua2h/hXuPcos0LYJfTE0FNTurF
 qAUg==
X-Gm-Message-State: AOAM530y6y4UPv6lPovtMe20CAahkMbwMrxNJ4AOVtKt4V94UCsFe0MB
 GBmD6afP9445MpcsApDMAAS89g==
X-Google-Smtp-Source: ABdhPJylbmdkbKVM3xGQUCwu1QmzsiSrXWsPiOIzkAN0vCW43h4rfRcaThGq2yI266Lr71i8mN6vbA==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr4331087wmj.143.1591112791778; 
 Tue, 02 Jun 2020 08:46:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o15sm148556wmm.31.2020.06.02.08.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 08:46:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96EE81FF90;
 Tue,  2 Jun 2020 16:46:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/9] tests/plugin: correctly honour io_count
Date: Tue,  2 Jun 2020 16:46:19 +0100
Message-Id: <20200602154624.4460-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602154624.4460-1-alex.bennee@linaro.org>
References: <20200602154624.4460-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 peter.puhov@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index 878abf09d19..4725bd851d8 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -28,7 +28,7 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 
     g_string_printf(out, "mem accesses: %" PRIu64 "\n", mem_count);
     if (do_haddr) {
-        g_string_append_printf(out, "io accesses: %" PRIu64 "\n", mem_count);
+        g_string_append_printf(out, "io accesses: %" PRIu64 "\n", io_count);
     }
     qemu_plugin_outs(out->str);
 }
-- 
2.20.1


