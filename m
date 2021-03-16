Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B287633D266
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:05:21 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7Vo-0003vY-P0
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM7UV-0003MY-Gi
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:03:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM7UU-0000y2-2g
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:03:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id l11so10216764wrp.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISneqGSMsxbWHG/Kio+CQ5cuLJpxwgtIymNRH+OAHgw=;
 b=IulU9SVUk2OdpfxhTmgCmTxCkCMpjP6VxEd+KYUeyesdONgXmHoXr1O/VWdeBouL6t
 SrP2OzwLiN81c1sYTXZe903qS0pMw21gKYfiR0YrdiwkjpSacTcxjm1twSWyOrZpFbwN
 GZJFh6Wj60zsQ7OWO3NyrRk5wiosnTtfZUMoDpaMmz6TBN0UUN8N21fTeaexvTH3o7W3
 ZCzfm0aB2X6yRp7XOEj2ZNSxajYIPyOS1QMCwgNlymcix8XPxNXsALTXSOejGsyWCIMT
 jq5e4RPs3FSwEspdLfcLstdLC7TAU7HDvANLWs+1/M1hDvzfM+PnvabohnsT7wkBihHh
 ghLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ISneqGSMsxbWHG/Kio+CQ5cuLJpxwgtIymNRH+OAHgw=;
 b=R/crl3XKqIGLbAkzPX85xk6BVxvjvvCmLmmcUqfz5et5bcDs1GL7fhk/ZXSiztoGXz
 S9tCYYM5SQKc9wC8ddJUMruN2Kw00s3FlYW71oGN401mtAbVs2EJXYq2SXWIKKepadtn
 xG3Ca+4//5eq1TUfwo2KyzP30dvrJbSVE6Je8pFBS89pGlUUil2zE6CdWGFKjm11XsS5
 qdn5wwr0aB2hw3xxXqK3MjB65vMskQ2JOuFkoIZle6pPeAgQgeRX6XywSEareaiZcwlX
 4NhhT+6QAj3xVPANlEz2p7B7Aq/rjqNByh5yLlUeNkdoINXvUYodn6IjRQ03UVpeHxpt
 tgoA==
X-Gm-Message-State: AOAM533CYvD/iHlWtGETy89pJqCFaTp+IkhNqHqb4WlZx5J19o5CnSDq
 NRF0lErfjDr+kezA5lXcDfVQiUMA5lJtDg==
X-Google-Smtp-Source: ABdhPJynOBrDA2BjOHLetLK0US01LIgjZVB5xf+U08CpvxSZGSX5KZUjs/edx/Ts17soV4xnKvL4ag==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr4278872wrx.23.1615892636364; 
 Tue, 16 Mar 2021 04:03:56 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm21891990wrr.78.2021.03.16.04.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 04:03:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
Date: Tue, 16 Mar 2021 12:03:53 +0100
Message-Id: <20210316110353.3051738-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
requires APM to be selected.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Rebased on usb-20210315-pull-request
Based-on: <20210315180240.1597240-1-kraxel@redhat.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 2691eae2f0c..55e0003ce40 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -48,6 +48,7 @@ config VT82C686
     select SERIAL_ISA
     select FDC
     select USB_UHCI
+    select APM
 
 config SMC37C669
     bool
-- 
2.26.2


