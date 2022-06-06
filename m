Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56B53E50C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:24:52 +0200 (CEST)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDf0-0002bA-Tu
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDKi-0001iY-AJ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDKf-00028i-1q
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654524228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=REGlmdVS1lYdUH1ngn7i4jdmEYP4WYH5gSTgDPDmR4w=;
 b=L9KzhTM2DK6VZahNuuS1gqK9uRXVoLgK8O8d2iivnGJvvyHw+oSGWM0EkabGAPwbGcVV+u
 nztdPCCzgB0y00Qpw+7u348/1OPPzisVx13ZR1CYBUdt+E+jwxbWZW5vRnRVQNSLQ/PRKW
 V76+qLRoMIWasCWmSEjtwXA2c/IAa2o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-0mgEC4nSMO-NEFpRjcbJPA-1; Mon, 06 Jun 2022 10:03:46 -0400
X-MC-Unique: 0mgEC4nSMO-NEFpRjcbJPA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so4825517wmb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REGlmdVS1lYdUH1ngn7i4jdmEYP4WYH5gSTgDPDmR4w=;
 b=M/1zCeNDvW0dj3Ngcz58bu7XXNKRW2YoUg82z78KLtNmwZh6/yRc3bXFRgFovbnpat
 j/duBmS2NlQtBIwv0m6GrXi43kJh2fo7E3PGPw4PpoCXi+yFKCxWsMmIjgQ8L6SNAFPl
 iw+acBNzdBgcZX6WE1YYZ0cS3BRwUab75Qz7u5uTB2KkTj0EhDRJgFp/N6ZD12IjTk1q
 zNZk1k79glHU9NwG5UcYmQ6AONMyJqJ5sVkQA9GnWWUkHFFcZK1xh7xSWzlbS7z8pqtb
 xTgMhZdOUVCV71kvjGxa7pFxiCTDw7/JP1n3436T9bbqlFEv0AXik5mhHtFWN/0w0Neb
 AP5w==
X-Gm-Message-State: AOAM531LW0g029rOc7fg4YRMKAmK6RH9CBdBkLLX/auj9w5hd8sPEjHe
 wwdKZhleyL6KtuNmCZ0Jixq0tFxE34Mbn+0OQONJgCu9dvotYXAn5GafoZ7r43boTaZbHTJAJgl
 vnHJZiFSqo4A95YBDkZmT+m+wkHJnsvoTvs52AIhaDzY7NaQWXC5bSWm2EtMOH7hShuI=
X-Received: by 2002:a05:6000:2cd:b0:216:2dc5:f454 with SMTP id
 o13-20020a05600002cd00b002162dc5f454mr11850887wry.626.1654524225068; 
 Mon, 06 Jun 2022 07:03:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv2/eq1p5BctSuAQ7YoUSms74dpmakrIs2Zqlup/Il7pCzMfciv3Gpd7krz8auZ0r6IV/7Yg==
X-Received: by 2002:a05:6000:2cd:b0:216:2dc5:f454 with SMTP id
 o13-20020a05600002cd00b002162dc5f454mr11850842wry.626.1654524224607; 
 Mon, 06 Jun 2022 07:03:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 p9-20020a5d4589000000b0020fcf070f61sm15345256wrq.59.2022.06.06.07.03.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:03:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: qga: do not use deprecated meson.build_root()
Date: Mon,  6 Jun 2022 16:03:42 +0200
Message-Id: <20220606140342.1147411-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function will return the build root of the parent project if called from a
subproject; that is irrelevant for QEMU's usage but rarely desirable, and
therefore the function was deprecated and replaced by two functions
project_build_root() and global_build_root().  Replace it with the former.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 619ff095bc..65c1e93846 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -125,7 +125,7 @@ if targetos == 'windows'
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
-                              '-D', 'BUILD_DIR=' + meson.build_root(),
+                              '-D', 'BUILD_DIR=' + meson.project_build_root(),
                               '-D', 'BIN_DIR=' + glib.get_variable('bindir'),
                               '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-- 
2.36.1


