Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE232B988
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:40:53 +0100 (CET)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVUS-0005St-Rx
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQe-00008c-3S
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHVQc-0002rJ-68
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:36:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id u16so6597450wrt.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmQ9WuVuI0VGnZuuNn7EAfs0gdyLaSensm8NVod8pVg=;
 b=HWZI308TJukFvtbSn2loLICxIM06pNa74CZg42QaWzfoaKYQ+genJTnkvoaM9IXVld
 2b5hR4qm8XIP6VW1wuB58ITdyIHJcPuUHPgK3wlq8wIp2EQ7D6pw1V+0IqAQpBYPei1H
 XHZlOovl9TlWKnnfs2/wmowMAPi/7bUooNTs0ZOeaj7ae6gtczIbKANrUMoIhlQTGM9G
 m7uy34F/TPNZ799fsSXEIkNJCTpcGFfzfPAMNK5QlQcpb6zzq10ipWQbf7AoV8ympQIi
 bFAciZJCUY8q0/wiDDBOf9JD1ofxx+H2TA5cxGqlbidXkHQtuNAP3UJeQRTuRhqxVC4I
 zEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmQ9WuVuI0VGnZuuNn7EAfs0gdyLaSensm8NVod8pVg=;
 b=KlTIEYKvljagqoU+1BJe0y9WRbUiiKrWO72p2WsxBADoVkVqSomr5mPQV3IcTekRvl
 evbhixfTVn8T+6MbyU1Xtllp5G8P2qBWfUb0OyqEHSH1R5VEyp1Qv1AQRGCJC8DXD54w
 TV85gMvXHOPydA9nuzwBWAswCVT57aPn9UatNYvuq9j7TljVOt/W6lD6dK1II0uQ00D2
 o7KlLYeIBpnpLGE4ancPwvpPAJXRPr3zcTUAxv9HPMDjkdyAb0dxc3E4/oGBJ/iYR3fK
 spy+JwlCYyVJ8gPM76pZKLBNh2AuB/T5WlFFNBmQy87Urlkpn6L51UC+GNWKLp4oF8Cr
 M+NQ==
X-Gm-Message-State: AOAM5339ZwpRPaUacB3o7QjBlloxxcFa9t5wkmZM8F/3RRs/wSwpAlba
 jvSYGRgxDsrGPKS92dmwWWjyeQ==
X-Google-Smtp-Source: ABdhPJy26X6i0Wu/nkBtfpoLZsbBTaHgfgWyBsKvtkLCsqrS9ybg7BnEbcUgmQFGAk8CrTvbGndY9Q==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr9538076wrm.389.1614793012908; 
 Wed, 03 Mar 2021 09:36:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v13sm7752139wrt.45.2021.03.03.09.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E80CC1FF92;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 6/7] docs: add some documentation for the guest-loader
Date: Wed,  3 Mar 2021 17:36:41 +0000
Message-Id: <20210303173642.3805-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20201105175153.30489-7-alex.bennee@linaro.org>
Message-Id: <20210211171945.18313-7-alex.bennee@linaro.org>
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
index 34cdd20672..8ec6fbc259 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2011,6 +2011,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


