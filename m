Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC93BCA0A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:34:52 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iPi-0004rm-Pr
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htx-00012v-3E
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:01 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0002Lu-99
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so3283588wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxP6H7astAMh/Svx/Qb16hkYAt94IE8X0Jh9lpll8tU=;
 b=nGRwGVLgSWC8grFUrpyp+ViNkA6mSq8Jzt1xIeuy/J2SpjnQbd+Rv3Zr2XUWhmWLcd
 +Pl++Wo8kmThWPGJ8BCSMNgsagO6AB58a4Qas9xJ80m9uP7fWJwfYwjKZL/MW0UzHT7K
 S+ppRAF90IeQ6Uprpj3X/iq4EPtAYnCJQ2UZ56BSRiLJGlOxBGZlCrcjc8ZtkWO31Eyq
 oMqJmLrwBR8w4sJplLByj4yaO61ywX3AdqOWjBfDSkor0Nh9TdCovhyq5ezgjRnfaG+t
 0400CUtuDbg6IPqEzmDyAPU9bxmcD3PbRK04kDmWuyWSXRdvoxlpGWQiayuVUroh+weE
 xMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cxP6H7astAMh/Svx/Qb16hkYAt94IE8X0Jh9lpll8tU=;
 b=PgOq7I3wJ9oh9YYHsiGMmjehcrtsqLPxToZ6nk1YbRjep3PoxgdbHO3Sif8WISkOSR
 Y8kWlJ9n5SCnuF00ky4XtWxib+MjDQPI9e//UNzFVs/qqEiQScWiFyXfZ10I8ewKR3Xm
 hmtkG/AcXP/xP2TFU52QBW6B7cuyiJ58/th4wvdtnZofnnGJAYgmLM8y0GPhVGk2jASe
 94SrJ5xgVD4ECjLBF0laAQc9buFe89lXgsVyMPFq+E/Wb6T1RlvzKpnbpzN+/ozHAr1n
 /OkowDtb4ULW9y889A9MtOW+L0UQU/34zLOYf170sa065fkcH0aKu9XowPiKI8pKpT6e
 dEtQ==
X-Gm-Message-State: AOAM530g68u9YfuAzRRgTfjVXO9SVEUPocPknj+RZZA6oNkULw4Rm2Xr
 2gi4hENz5+PO4aKloLHnDTNdNSCLQ5c=
X-Google-Smtp-Source: ABdhPJxOeZudOZZRJU1VSdTCG+1GFOh8ejdqyEJR2BA7GtqCyuDbfh43AxZEsiU4IevsdSeYHWQM4g==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr3874790wmr.123.1625565717770; 
 Tue, 06 Jul 2021 03:01:57 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/40] meson: sort existing compiler tests
Date: Tue,  6 Jul 2021 12:01:24 +0200
Message-Id: <20210706100141.303960-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patches will add more compiler tests.  Sort and group the
existing tests, keeping similar cc.has_* tests together and sorting them
alphabetically by macro name.  This should make it easier to look for
examples when adding new tests to meson.build.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 1216ac8f72..53dfc2b4c6 100644
--- a/meson.build
+++ b/meson.build
@@ -1253,16 +1253,19 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+
+# has_header
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
-config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
-config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
+# has_function
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.31.1



