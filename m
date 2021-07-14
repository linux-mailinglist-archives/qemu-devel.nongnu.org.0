Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946D3C824A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:59:44 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bg7-0000RW-H4
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKl-0003Kv-DO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKj-0004mE-M9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n4so1167911wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1e1YqeV5XOXZA0y11isaIRg/PKZ8B95bCMqrO9Bx/o=;
 b=avh2L+o0SlDATlwaVGmbMEVKRkEknHngoNfNvT6ZVKo+BrkSuFddTwRCmXBlU4xLwE
 39lxHaHlH2f9Rb8a8pghk8o8QdOLfNxA0OsWVcBs4LzfK9od44diuf9I0M6P0N4kVmLa
 dUOb+9INYkK2M+ADO8YzEhszExYVEmdP0jnkJ53+5vyfgIj/zcBL2YL9j56MyBg6v+dI
 +pAyNjO0ho55j5NNRvNuWuqLQ8Zbd1sDq7tkTR9EW2s8HQf2TSy4m6r3vQMgtK9eZIFB
 13SCbzJvBOZI0lHEVxIJMJmlFYwF/Zml6c1vOZHlr84y0JBf2h/lpL7Xg/zgAC7NZe5t
 vZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1e1YqeV5XOXZA0y11isaIRg/PKZ8B95bCMqrO9Bx/o=;
 b=VnntyogA93T5sHEpgRhYIh3gOf3EsejyE4M8lXT/thwmrDYOOtdFnL6piyptGtnAM3
 KYrIwKI0D1UJB3T/3rXCdXFtcBa2E/UvgK7Oc7/3p9hSV1Ox7T6H4aiQBFmtJFw6Wnfe
 PVivzyiECP4fnSLa3UPRKZ8Fey51gUdTJiwaNXnEX+DBWEFkcNasSmjkjn6OTVk9Wuf8
 i+qKRkk/nMU2lJne0k4hwWr2Bnej4hRbxuiUZ2ZYMCScaaXmSY3mt6YyQUfCpMp2DGZR
 FgCGPMvfH2llrymNHMzQYYSL2SA8A/GpLckQp7jq5/o7uHUoFxFjrgTL9CJNf7Z56dr5
 DAjQ==
X-Gm-Message-State: AOAM530yP6kBo89IZNE5y8bFlxSlIEN9kG847H/zZIl1LIdqZgK8Lw+L
 hSYXn8WxTkNd5H+REskjwBYTXg==
X-Google-Smtp-Source: ABdhPJwUFPSa830+7mNghvK01UKWcU/QZLuLHlEpw2grA8tGOImFq4XsbGX9DHxjX4NR+rHAifFE+Q==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr9844602wmq.54.1626255453381; 
 Wed, 14 Jul 2021 02:37:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a207sm5534960wme.27.2021.07.14.02.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A42111FFAA;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/21] contrib/gitdm: add domain-map for Eldorado
Date: Wed, 14 Jul 2021 10:37:09 +0100
Message-Id: <20210714093719.21429-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Cc: Luis Pires <luis.pires@eldorado.org.br>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index beeb24341e..41875c9e75 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
 greensocs.com   GreenSocs
-- 
2.20.1


