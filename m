Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECAA3472CC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:39:08 +0100 (CET)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy6d-0004ld-7c
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1R-0006EG-Ha
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:45 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1P-0005vp-LV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e14so7456693plj.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3e5/TJsEm417t8ZisLCen2L7jNFH78ByxNrkmf3geT4=;
 b=tGVL8kCnx8Ik7KlFLnQsz71O2Q9CYB7I+vq9w9SL+cvGyWB3L0fW+m/Yx7LEUESWzr
 qXxu0NPXzpSoGyHLtgsZIpH0lOszLrxgUln3bFTutnhQ8ygr3qGCQSHhfHPKa212YJRc
 O1Qbtnb0A4495slzyfGNxDDzIxhmMNCCQzu8uqUUW3wE+LCT3JSnBV4XoDcx2LUfJ4uE
 V1TEAhjE3NQmuYYN4+CiAP63u0nEyN3JZbgawYT9ojrMSRKwXlmxiahjNPjX81BfTglX
 puHW01iR+VeE3op2cnPtVkn7HxelHOExHMVLMhCniIkeHrHjiOTo0yPme9rlQL0uDk9D
 oHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3e5/TJsEm417t8ZisLCen2L7jNFH78ByxNrkmf3geT4=;
 b=YjQIWqvYk/aXXbA8GPIs98a/qlVF83ypZy+XdUHAyg5o94XbpcEh36hM7HnqVWzmdZ
 dkkr+5sMy/EAH3MF0TJ7UDFCi0LWoDKlKLKU1B2O5xMazWd5ZD/kXxt6Igs9g/SFRVhQ
 daodC83OARM9H1ws3100t3VB6cDDdzfy/GIX5J1ex4umb6BkHCbSJyKbDzf96s+6hEfa
 ZrTMPRkqCBD1z/fO+74mnQUkw1NYJj2Zbn4FWppk9iTSQKe7J1N9VwHxb52k4Wtc5N8B
 1WTHExrx1wQu3uToZksGImEoOsr/+itVf4paoTQosjCCcZONV2EK5QoQPGoWnEuuFWii
 vu0Q==
X-Gm-Message-State: AOAM532JIqJJL/wXXDsEO+4CRqoPA2teTGW1otZImbrXleHb7t2gO1XM
 lwxhvoJAtb3vP/qMsnamqlol+HryR5plmw==
X-Google-Smtp-Source: ABdhPJw2ouRivK6PdxVH+Fasz0mBybCz1SxG0zytBqCwDZLhZRiTl4O3tAt9aYVjtXzpCRWsciY1Gw==
X-Received: by 2002:a17:90a:f2d5:: with SMTP id
 gt21mr2219338pjb.197.1616571222446; 
 Wed, 24 Mar 2021 00:33:42 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id j20sm5232054pji.3.2021.03.24.00.33.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 00:33:38 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] docs: add a man page for vhost-user-i2c
Date: Wed, 24 Mar 2021 13:03:13 +0530
Message-Id: <915600fab4a1ed54d4cdb54346406dff5e3032d6.1616570702.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1616570702.git.viresh.kumar@linaro.org>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62f.google.com
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
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
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
index 000000000000..8471b39d8b1d
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
+comes from the guest OS for an I2C device.
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


