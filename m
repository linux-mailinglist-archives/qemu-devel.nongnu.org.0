Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74E3C2C41
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 03:03:46 +0200 (CEST)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m21PF-0003yr-Ah
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 21:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m21LL-0001Al-Ef
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 20:59:44 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m21LG-0005dv-I5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 20:59:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id o4so5907526plg.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFYtFiPzC96CwY/OVNRqzz3Vjx6DTMRTmatLGw5Tynw=;
 b=n9fCSJ/dTZP1ltoQJ+pExAjiHd/tR6YTrn7WGlJQ8SdXhlsTOGhZYkbcBpFHJX1HBk
 kRXPAnPXNteQmZTnw3Lh2ppf/T/d80GmQwcx3paqumhzw8vMfegmvl9bZ15DoTfQa8O7
 n/ss5DWBsxIl0BllPVUq8eBfhxL4K97+7vwZX44AZKh1+g4FQaGrKzdcXptn2xGU3Eq7
 WhqMHxKncdSxMp7p1HeiIWsp0sDuYAgKwigEMl2Cnx+y+zZzXatEbv71hiV9FLGdIoSC
 tZQhjWexdIlmU2alGppwtIyVwPxqtS1XvK9u8iI+M1OuVarYQzFPAmlJ30SLBVGfgc63
 N7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFYtFiPzC96CwY/OVNRqzz3Vjx6DTMRTmatLGw5Tynw=;
 b=E76OBigF0/FlBG0P59n6wp83h1EOw2uyM0droe3cBF+UxBd5DhCcSEM/GE1moWgXG8
 0f4yvvDKMF2MGOnHxC8PQ5ZODxl5Sytt8oq8itOjsUmLSWN4Iz8mtHxR9eOGxo+iTToG
 vh0MKR56Tr900RI+gsJeztOe8T3CP0rdxpBMV/Xv2EbW4SMamsvVKW5TCMxWqPysCWPU
 oN/JV/gfcL/CXmYr8g1k2rc6XJiQCmv3Aoy0/uCDK0+xurJu1QxELOLAlEMLwsAMGSO/
 O6xTXV83GgTNi0aTRcNdQrcUZCs7ITIsRZDWmeA1AmfKPXt55ukelfotK9cbNpvhpzB0
 xB+A==
X-Gm-Message-State: AOAM530jgQnmLyJhw+8RZ+6Q+uBKrBM0fefAjS8FsKbJf675Nxz7W6CZ
 5bzMvPCZTeiLPjuBQzZg6afP2ydaUVuNhw==
X-Google-Smtp-Source: ABdhPJyrC7NYRgec916LnszEe2FDHbyUKZO4DOa+xvKy2JVDyYVsr0hFWXzFRMlV2C8OR2wD5TwV+A==
X-Received: by 2002:a17:90a:6394:: with SMTP id
 f20mr1571906pjj.80.1625878777333; 
 Fri, 09 Jul 2021 17:59:37 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id w2sm6420932pjq.5.2021.07.09.17.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 17:59:36 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v3 4/4] docs: Add documentation for vhost based RNG
 implementation
Date: Fri,  9 Jul 2021 18:59:29 -0600
Message-Id: <20210710005929.1702431-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add description and example for the vhost-user based RNG implementation.
Tailored on Viresh Kumar's vhost-user-i2c documentation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/tools/index.rst          |  1 +
 docs/tools/vhost-user-rng.rst | 74 +++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 docs/tools/vhost-user-rng.rst

diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index d923834a7398..9d80fa89eceb 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -15,5 +15,6 @@ Contents:
    qemu-nbd
    qemu-pr-helper
    qemu-trace-stap
+   vhost-user-rng
    virtfs-proxy-helper
    virtiofsd
diff --git a/docs/tools/vhost-user-rng.rst b/docs/tools/vhost-user-rng.rst
new file mode 100644
index 000000000000..7f69d7bb3c58
--- /dev/null
+++ b/docs/tools/vhost-user-rng.rst
@@ -0,0 +1,74 @@
+QEMU vhost-user-rng - RNG emulation backend
+===========================================
+
+Synopsis
+--------
+
+**vhost-user-rng** [*OPTIONS*]
+
+Description
+-----------
+
+This program is a vhost-user backend that emulates a VirtIO random number
+generator (RNG).  It uses the host's random number generator pool,
+/dev/urandom by default but configurable at will, to satisfy requests from
+guests.
+
+This program is designed to work with QEMU's ``-device
+vhost-user-rng-pci`` but should work with any virtual machine monitor
+(VMM) that supports vhost-user. See the Examples section below.
+
+Options
+-------
+
+.. program:: vhost-user-rng
+
+.. option:: -h, --help
+
+  Print help.
+
+.. option:: -v, --verbose
+
+   Increase verbosity of output
+
+.. option:: -s, --socket-path=PATH
+
+  Listen on vhost-user UNIX domain socket at PATH. Incompatible with --fd.
+
+.. option:: -f, --fd=FDNUM
+
+  Accept connections from vhost-user UNIX domain socket file descriptor FDNUM.
+  The file descriptor must already be listening for connections.
+  Incompatible with --socket-path.
+
+.. option:: -p, --period
+
+  Rate, in milliseconds, at which the RNG hardware can generate random data.
+  Used in conjunction with the --max-bytes option.
+
+.. option:: -m, --max-bytes
+
+  In conjuction with the --period parameter, provides the maximum number of byte
+  per milliseconds a RNG device can generate.
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-user-rng --socket-path=rng.sock --period=1000 --max-bytes=4096
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
2.25.1


