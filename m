Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003F3514C6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:26:03 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwOg-0007D7-3m
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCQ-0000c9-Cv
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCN-0004UX-LW
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gb6so1070882pjb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ucPW6AwDArigoJGiD4YxTX7iziwkWQWTh6uKDGyTHHk=;
 b=u/dd/lf1oi99LYDvoCC7OKugmOXECYCn5xUYtlxUW5yqpbnI0kEnqSFRE5zmqoR/FC
 ac6oMTGJMWF9eFJ1vv/ge7ETwHrZnWGAUsRs8DpN2O6UlhU82utMZDi+GhKsKOgSTiQi
 JXEDf/wbYtLx/gh99zbr/v2DwWcO2kFuI1+G9jgbYm1ubU4I+JpxR4sMXIKbZHwjiFvP
 phOZuUcwPjQz+Elp6fHc2EHYJ1/2zwizmDL2rYrySP3SjgG6ioIOVP0rETN8OHhZ54+q
 f1qteeT1VVwMHNapt0VFIUWFTPjvErDSh6xZQavDE1W4kgW31kPs8z3QcePtN3AUoGb/
 OY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ucPW6AwDArigoJGiD4YxTX7iziwkWQWTh6uKDGyTHHk=;
 b=R0nf3TiskKpHEsBFiTu1JCVN+mLmhoUwol69beGDv8h6Bifyhhq7FRxRv1O4QLDfMw
 FVqSCbf7l5I5E+D9yrc0b44Z1rHe1+9lQguJr8eEbUx9yMY8V3P02UFEr6CoO+YWjeWK
 XDmJbIkv8bIliuG1qvQdusHRC/jDrnxy33L9GyS9WJwB+UN85mRMHpvIgqA0UERAz7/9
 taNi2qropm6JE3JeB5anlm5Sn9bv5wTEZkuDirtOPbrISrodOSo86CjIDfjYPxqXhsj/
 4u0ozggjqR0p6XZGT9IoTPslL7Y9d52F2R8SQ5qVStXhgJVFKiC72sd0p6VoHHqE4HAo
 e7zg==
X-Gm-Message-State: AOAM531quSTejpWJzI/v4w+suaQbbsnOay5I3gmfTmdiu5Wp90Zj3lWo
 lyn+lAzbliYunJql8HoAGP83ZBF7YpJ/pg==
X-Google-Smtp-Source: ABdhPJw8gwRKWUZ8/UkJl1pvJ0lir8hONId0W5spn4seUioY/OII90kptgPTKjq2n3V+okCk62hwfQ==
X-Received: by 2002:a17:90a:ff91:: with SMTP id
 hf17mr8954713pjb.34.1617279198360; 
 Thu, 01 Apr 2021 05:13:18 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id ha8sm5311443pjb.6.2021.04.01.05.13.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:13:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2 5/6] docs: add a man page for vhost-user-i2c
Date: Thu,  1 Apr 2021 17:42:34 +0530
Message-Id: <276f8f8825fc5eb084710b8265b9ee9097e0aa69.1617278395.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1617278395.git.viresh.kumar@linaro.org>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Basic usage and example invocation.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/tools/index.rst          |  1 +
 docs/tools/vhost-user-i2c.rst | 75 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 docs/tools/vhost-user-i2c.rst

diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 3a5829c17a54..af2519406ddf 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -17,3 +17,4 @@ QEMU Tools Guide
    qemu-trace-stap
    virtfs-proxy-helper
    virtiofsd
+   vhost-user-i2c
diff --git a/docs/tools/vhost-user-i2c.rst b/docs/tools/vhost-user-i2c.rst
new file mode 100644
index 000000000000..1f05c6473ad7
--- /dev/null
+++ b/docs/tools/vhost-user-i2c.rst
@@ -0,0 +1,75 @@
+QEMU vhost-user-i2c - I2C emulation backend
+===========================================
+
+Synopsis
+--------
+
+**vhost-user-i2c** [*OPTIONS*]
+
+Description
+-----------
+
+This program is a vhost-user backend that emulates a VirtIO I2C bus.
+This program takes the layout of the i2c bus and its devices on the host
+OS and then talks to them via the /dev/i2c-X interface when a request
+comes from the guest OS for an I2C or SMBUS device.
+
+This program is designed to work with QEMU's ``-device
+vhost-user-i2c-pci`` but should work with any virtual machine monitor
+(VMM) that supports vhost-user. See the Examples section below.
+
+Options
+-------
+
+.. program:: vhost-user-i2c
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
+.. option:: -l, --device-list=I2C-DEVICES
+
+  I2c device list at the host OS in the format:
+      <bus>:<client_addr>[:<client_addr>],[<bus>:<client_addr>[:<client_addr>]]
+
+      Example: --device-list "2:1c:20,3:10:2c"
+
+  Here,
+      bus (decimal): adatper bus number. e.g. 2 for /dev/i2c-2, 3 for /dev/i2c-3.
+      client_addr (hex): address for client device. e.g. 0x1C, 0x20, 0x10, 0x2C.
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-user-i2c --socket-path=vi2c.sock --device-list 0:20
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system \
+      -chardev socket,path=vi2c.sock,id=vi2c \
+      -device vhost-user-i2c-pci,chardev=vi2c,id=i2c \
+      -m 4096 \
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on \
+      -numa node,memdev=mem \
+      ...
-- 
2.25.0.rc1.19.g042ed3e048af


