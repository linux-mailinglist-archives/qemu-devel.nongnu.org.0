Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB333426E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:06:24 +0100 (CET)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Lr-0006tY-TF
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G3-0004cw-IA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:23 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G1-0002jx-Mv
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:23 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jt13so39766020ejb.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IR6vFLzUACk+G2n73bw/zv7txMf+sDqfwEPpB5jBt2E=;
 b=gf7eH1U0fD3i/L4Cn77E7dK5yphSv1EyV1ndkFrUyjClzXVcrFMpyygN1j/hbweuZg
 d6iHu7gEfG4bdNUGdV+ElkDb95bRHq8vT4CCW1oZjaDBix0hn/hOG9VBCHA90AL5DeNk
 opCu8Dml657lniNj8MjI4b4gWdE4E3oHrRRH5gDodcWFSKy3o3wzEg6eiQh9PhBX63Vz
 LnjZ7H2iCtasPPimHVHBGUwFMjPJaF7QDdkqLeDtPYmYVJpm+6mLrRIwZ3tQxpZlHWZ6
 mTjLcObi2vopkYSJkTsq/pQnSnt+pL4c4KFP0+PJIbjsMU1qjIgyU1DjVwpPsvoA9niT
 IIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IR6vFLzUACk+G2n73bw/zv7txMf+sDqfwEPpB5jBt2E=;
 b=Ux6Uw4aYtjRCo5VrTpxc6TdqkAP5gAb62/c6Pz25PmRj3itEGsIGbV9c3LzI1xxsQt
 ZV8EsUR4iO1IgUiWUj+CY1Wp8FyP5L/SDS/qF8feMnS3hfmFp1/jF3yUIDM8+QzQvrPm
 EZva3+VsbtyVzWaTnhBvMmCHWy+0Fpu0reLFb8AJHIAadoGdoTybwJgpFjNNDCdRwSjK
 iSb5c6TD7G2dZJr9zuVSplU9t0lnZ7nL25459kjkAVnLO2wNm8P0kJ3RMlQNbjigUCZV
 Gz7jrtapmOG9Xd6ZopAVYTH/N7SoaSmp2p9m/IOlktY/s0/fKkBC9tOuyJpctCqw0ozO
 Q4Ug==
X-Gm-Message-State: AOAM530+FB9E4xGyw33M/xhAINunf1stn3VPOC91u6DZAzQUwtKYKplL
 NtPjchcOGNh5kvFE3MrjPY4TUw==
X-Google-Smtp-Source: ABdhPJxMg4tVsNupsiitJHNHfj3d3oi4GJc74XwtG4DmhBuMLgifratdY97DbczToMlA9ZdFygu8ug==
X-Received: by 2002:a17:906:72d1:: with SMTP id
 m17mr4407947ejl.118.1615392015229; 
 Wed, 10 Mar 2021 08:00:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm10259207ejs.41.2021.03.10.08.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7DD1FF9B;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 12/15] docs: add some documentation for the guest-loader
Date: Wed, 10 Mar 2021 15:59:59 +0000
Message-Id: <20210310160002.11659-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210303173642.3805-7-alex.bennee@linaro.org>

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
index a1170bad5a..2ad004fed5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2026,6 +2026,7 @@ Guest Loader
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
+F: docs/system/guest-loader.rst
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
-- 
2.20.1


