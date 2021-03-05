Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780932E4C1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:27:43 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6kI-0004vO-F2
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gM-00013v-Q9
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:38 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gI-0004IS-OE
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:38 -0500
Received: by mail-wm1-x333.google.com with SMTP id u125so798935wmg.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SI1BWVRHAX1ErzEiSC9pkD2SXvG3GEi5CNrymtvJHJ8=;
 b=mf6XOrUGS70exrv9Iu2BUc6AO0TYS7JQWfEEhEnudOhOQWz0t530NlVcce0SAnd2Il
 eBAfwSx8cVLkabE5LuqPqHSRO83tQtWXlHtam1Ihgvv3iIW7BNUiCLGGN1hcKdxeyd7W
 pwfT5Az2/dvqtyyyuX7cV0fA5H/ARKl/r8sxIOrzGv43wZJ3YeqwBbbs7CRnhKGy1jCw
 8K6wosyClvO2TKeeNSO8yCYSTNx2szbhyxOqQKbeNwSHT9NvK85Aag8GIR+WN27vVYSe
 xw5cVUER9bfYJVB7Pr+GvzCuvjgNgISa5vCv/ltBZul7TmtLJppKdZWEeoWkyEQB9TOo
 ElnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SI1BWVRHAX1ErzEiSC9pkD2SXvG3GEi5CNrymtvJHJ8=;
 b=blmPo6WF1DYzXjW6F2ZJPRvyYcufBi5faLxLTKbLtjpQJmxuiVqLkpPPCYqY20GxNa
 lk3TD42PyNEdmfbUOXE+LPMSVDQRiKRNgIi2TetSOVSBAG8w+r3T7a5W+9qwsiv3WIb5
 dYF8vGSOwK9sZ5BWgOTh1zMIYQMdqAKw28LfA7srxEt1JP2R3O6XoSV4YwfYsVTMyV7T
 JtsNDh0te8TCdInoWMZGBK5mGQxdwv5tuA7umCK18kXm3qZQuSx6n17eK56FKsCuaUUL
 APWq/6KGjmIrFXJx+aSVXOCHNei+cihRjs7QEy3PTq51GGtdbFaaPRJHTLEoK69urALn
 9I9g==
X-Gm-Message-State: AOAM533WraU0o3TYrScBuL17uCRGE2e+Jy/rZvBCZofaVUTBk8TTt6ld
 xm7G4TKE26+FxllmCTGGpC9Ffg==
X-Google-Smtp-Source: ABdhPJzu5EkTAg45oGkDPKBihNlnQDaay0SU5Byi1zoHNCIbK9PrCUWLWRy0ZVyPDLraf2t2NrwCSw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr7929445wmi.117.1614936213212; 
 Fri, 05 Mar 2021 01:23:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm3671116wre.25.2021.03.05.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 209BD1FF8C;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/9] docs/system: add a gentle prompt for the complexity to
 come
Date: Fri,  5 Mar 2021 09:23:21 +0000
Message-Id: <20210305092328.31792-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 John Snow <jsnow@redhat.com>, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We all know the QEMU command line can become a fiendishly complex
beast. Lets gently prepare our user for the horrors to come by
referencing where other example command lines can be found in the
manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210301112741.31047-1-alex.bennee@linaro.org>

---
v2
  - minor grammar tweaks suggested by Thomas and John
---
 docs/system/quickstart.rst | 8 ++++++++
 docs/system/targets.rst    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
index 3a3acab5e7..681678c86e 100644
--- a/docs/system/quickstart.rst
+++ b/docs/system/quickstart.rst
@@ -11,3 +11,11 @@ Download and uncompress a PC hard disk image with Linux installed (e.g.
    |qemu_system| linux.img
 
 Linux should boot and give you a prompt.
+
+Users should be aware the above example elides a lot of the complexity
+of setting up a VM with x86_64 specific defaults and assumes the
+first non switch argument is a PC compatible disk image with a boot
+sector. For a non-x86 system where we emulate a broad range of machine
+types, the command lines are generally more explicit in defining the
+machine and boot behaviour. You will find more example command lines
+in the :ref:`system-targets-ref` section of the manual.
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 560783644d..145cc64551 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -1,3 +1,5 @@
+.. _system-targets-ref:
+
 QEMU System Emulator Targets
 ============================
 
-- 
2.20.1


