Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C33190EA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:23:08 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFgJ-0007UO-Ln
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdI-0005em-Hc
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:20:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAFdF-0005FJ-MY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:19:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l17so4696278wmq.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 09:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uM4w7EGKPDq+ZH1NX/u4HRpRj7Wv3jOo9v6vSIC9Mdc=;
 b=vHLzZeY8yAlnzz3oPqOA73YhmPGd2nzHr7sXDHSuuhg8QK/Np6A21wjmNHmiYg/QC4
 hVuUw+OWoYaCJciF551k0XP7YWaD+JmYjDQ7DS0bRiLpJStdrxMJqdihp14lpTqvV3Mj
 jx4mj2E/FibSVPt+QgZM5WKATDnj8YWTzayC8fN37Dcs6Pm6NXwlVc9HG5gLe1OuqNuP
 +4LW89pCv8R8j8Oj+oxniURRjmuW6K/gnUcM3p5eIV4ldo1YNe5Q/ghbQGH4LvavOI7M
 aujY8A9uT460jUB3xa7cq7hTf8XonUWO3NBTiPHkyIpFo0Wh/2PHkcupgJleiiFHiHpU
 V2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uM4w7EGKPDq+ZH1NX/u4HRpRj7Wv3jOo9v6vSIC9Mdc=;
 b=PufXmrRlJA9jPWuCxCJMlWWPeQAFU9IkdTpT3v1uW5R8I12DY3LRXhp7vb/nX1IIhY
 pFDbXxya34IVAcofqyV4EYTjD24qlyj48rp4+QxMUyXu1cRxWrKkxIm3OyFsc8qCJ5+C
 JGbIjWKFIBChlhz8YuINi17/3eYiSoW4uEanZGDjdPW47bXC9OHVXiXynSvIOR7djIGq
 79bM8vII570zjgKjuww4v2V+jzx99z4JeC4DUT8mdzOIDSwNuwrGjDOkKbc+qWMdq4WL
 O5at3k4YLJt668yQsSnT2adFkpDcipqQog+3PlQ7zAWVWgJyDnTqldnNDvK1zk9m6Vyd
 KO7g==
X-Gm-Message-State: AOAM533ogNZtgeVZ1D4OX69ZCPMflbv/7EnEUqUK1/Rzr6ygFrgy3Apn
 1j0A4Z6WcuNS/Q125XWumS/bVQ==
X-Google-Smtp-Source: ABdhPJxzExjbkoFfYqwsuLpSdRjf+qkuuNTtEVUPGY9I1u8td6zf8I21bZRLpAq+wV1D9X5W43+cbQ==
X-Received: by 2002:a05:600c:4894:: with SMTP id
 j20mr6335347wmp.152.1613063996346; 
 Thu, 11 Feb 2021 09:19:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t2sm6150461wru.53.2021.02.11.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 09:19:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7B281FF92;
 Thu, 11 Feb 2021 17:19:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 6/7] docs: add some documentation for the guest-loader
Date: Thu, 11 Feb 2021 17:19:44 +0000
Message-Id: <20210211171945.18313-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211171945.18313-1-alex.bennee@linaro.org>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>

---
v2
  - add docs and MAINTAINERS
---
 docs/system/guest-loader.rst | 54 ++++++++++++++++++++++++++++++++++++
 docs/system/index.rst        |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 docs/system/guest-loader.rst

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
new file mode 100644
index 0000000000..37d03cbd89
--- /dev/null
+++ b/docs/system/guest-loader.rst
@@ -0,0 +1,54 @@
+..
+   Copyright (c) 2020, Linaro
+
+Guest Loader
+------------
+
+The guest loader is similar to the `generic-loader` although it is
+aimed at a particular use case of loading hypervisor guests. This is
+useful for debugging hypervisors without having to jump through the
+hoops of firmware and boot-loaders.
+
+The guest loader does two things:
+
+  - load blobs (kernels and initial ram disks) into memory
+  - sets platform FDT data so hypervisors can find and boot them
+
+This is what is typically done by a boot-loader like grub using it's
+multi-boot capability. A typical example would look like:
+
+.. parsed-literal::
+
+  |qemu_system| -kernel ~/xen.git/xen/xen \
+    -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
+    -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
+    -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
+
+In the above example the Xen hypervisor is loaded by the -kernel
+parameter and passed it's boot arguments via -append. The Dom0 guest
+is loaded into the areas of memory. Each blob will get
+`/chosen/module@<addr>` entry in the FDT to indicate it's location and
+size. Additional information can be passed with by using additional
+arguments.
+
+Currently the only supported machines which use FDT data to boot are
+the ARM and RiscV `virt` machines.
+
+Arguments
+^^^^^^^^^
+
+The full syntax of the guest-loader is::
+
+  -device guest-loader,addr=<addr>[,kernel=<file>,[bootargs=<args>]][,initrd=<file>]
+
+``addr=<addr>``
+  This is mandatory and indicates the start address of the blob.
+
+``kernel|initrd=<file>``
+  Indicates the filename of the kernel or initrd blob. Both blobs will
+  have the "multiboot,module" compatibility string as well as
+  "multiboot,kernel" or "multiboot,ramdisk" as appropriate.
+
+``bootargs=<args>``
+  This is an optional field for kernel blobs which will pass command
+  like via the `/chosen/module@<addr>/bootargs` node.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index cee1c83540..6ad9c93806 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -26,6 +26,7 @@ Contents:
    ivshmem
    linuxboot
    generic-loader
+   guest-loader
    vnc-security
    tls
    gdb
diff --git a/MAINTAINERS b/MAINTAINERS
index 774b3ca7a5..853f174fcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1997,6 +1997,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


