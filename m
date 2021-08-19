Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B53F1F4C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:43:09 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm4L-0005om-17
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0f-00039m-Nx
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0e-0000cx-4A
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id c4so4327539plh.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YsaEKAl33eCFR1bSTiVOxhOZ86zefKNazCSX24D4aT0=;
 b=jpKFGSqLcNqUWyCfAcwkZibJ0JsdxdE2CifIUuV2m6Sg2QZOrCOVdPCvgeJM5eytCe
 qYTiuamAw3bBMsLDgWye/R/abgk5o4XZAliOytWIOiJlltjtRRgVV38WgdpILgY3nVYQ
 gGxnYD+eXs544BKV2L4tQLU4jihW6mhHDcR7jB2ahEf9dFptLhj5X6CPKddyLobSdLti
 aDlHb0scD+/oAGdyENfDy+TaKLiG4IlgACUnnr5z7ayGScrYhNSNBZzxZ23Q01GDEcTd
 tZeD6iFnV9kkDTgyf0zgXuX12liX9WoryEAWMh0MtkUF4Zq8v3W0ASQ8ZYfBMzcmYIkW
 mclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YsaEKAl33eCFR1bSTiVOxhOZ86zefKNazCSX24D4aT0=;
 b=sW0LSdupG2gQNAXbMzfl0U0/ArOAPk7x1qhoiz5DqP3pwkuARkcCH2jpF3bBDhCfqG
 KV+wR6DrjAPWB0Rwn0ajXFIXXfrfwOmsMyD0mfG7xAdRDF0SJ7pp1hRyKS6dpmmwz4xH
 64S+OOFnM1RpkLoohkeZchQxY1qHbTtAE/k5EqkODpW6MMr7cPTIC77BhR78cCw6i1/L
 XQYyQpmvaIHDvuGAJ7mfFL0HWbcK/fhauLq/aDU6XsPw361UarnjsxWijnMalo9DImHf
 HpgvI9H+lrjGmqv+Lo7O0tk67iYCIFtLrFshCOUhShkgk6bSLY3HFlv2srobzNj1xacj
 OZqA==
X-Gm-Message-State: AOAM532PdCFgbE9ucOhYDv45ODvfMkc1iZ5zok+SoE2mT4QHhyhBiK9K
 tdNSQ3x0lW2fwE+M/yjA31J+alJ7rxE=
X-Google-Smtp-Source: ABdhPJxFqQ5webvTCUrCazdICjuRvPWkf4vh0qYPWsbh1CTVWfxy88yiMX4AJbW8oBvIW/SXdOtogw==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr16127271pjv.38.1629394758660; 
 Thu, 19 Aug 2021 10:39:18 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:18 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] python: disable pylint errors for aqmp-tui
Date: Thu, 19 Aug 2021 23:08:25 +0530
Message-Id: <20210819173831.23515-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable missing-docstring and fixme pylint warnings.
This is because since the AQMP is just a prototype
it is currently not documented properly and lot
of todo and fixme's are still in place.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 077395f96e..e83c88db2c 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -90,6 +90,8 @@ ignore_missing_imports = True
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
         no-member,  # mypy also handles this better.
+        missing-docstring, # FIXME
+        fixme, # FIXME
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.17.1


