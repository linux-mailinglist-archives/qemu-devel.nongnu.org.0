Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A52F6878
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:56:18 +0100 (CET)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06r4-0007qj-23
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gk-0000a4-1x
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06gX-0005si-DZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyxTfxS9N7W6odCb26oUbs8f91QaNWio8M561x7sKdA=;
 b=TM1bCc4hMMDLvH8Sx/gYz4E+91UZr9EnnGttFshmy4qkbC/sfX7yMgRbxQZccBjop2w/l8
 GrUoUJiMSu4uP4b//rwmoBGckPgXiReQUedz7kzdHeNXLdVkVJvMvmvL7kyp/p0GOPkMH/
 J9ZyRMRF2eEyTZlfcgX3ujRQIeT+l8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-vxR8l_W-M2aQ8aHdydxzYA-1; Thu, 14 Jan 2021 12:45:23 -0500
X-MC-Unique: vxR8l_W-M2aQ8aHdydxzYA-1
Received: by mail-wm1-f70.google.com with SMTP id c2so2649763wme.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zyxTfxS9N7W6odCb26oUbs8f91QaNWio8M561x7sKdA=;
 b=XchKXXd01pWiobUPPjuPRJ7ECXnnGV6vbDR7+JvUbINokYGcx2g9C7mqfR5m0HXRYF
 gaSbRld0aSe7ld3BGKRoHK0kj78x3pyK+GJqrpH7+7yslXN37SxLtpQP6g0M2D/DXyma
 N5099JK6zm7TOSvas5uJRHX8bMGh5bPq/dq15e2pnv+SKvyNmTpmDAv2/Ju8g/ScGqQ0
 5aQywPYgacYOqCrvAeVqVgxRNgxMBgypODHSNgkczsAgrZrcOcRcP7vmJdKFmH+0WhVg
 kJr2PjZzVljxYe9zTshaY4Yi3DNBXgIsQgTywdKlv7kNaQJCXSC6FkSUOIoCHAgZJ/16
 +o6w==
X-Gm-Message-State: AOAM531rsSZf4jToNxFhI60I6u1TsjgihsZpGX+5dYa4ES+P+rYwi84S
 LN0ZktlR5oLYRUkOjB0CaXAjePobo587RYnUeS39d/DxQn/pmRjZLIYEMjuhI0SDshHZSqq0yi1
 dAtzuoKcANYW1LV34J9RHJtNBiyuXmwEs/xjVR70u5+/BLzt67xtrwSJFdnoILlLQ
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr4885704wmc.102.1610646321556; 
 Thu, 14 Jan 2021 09:45:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw81gZdm4n8jfvM8Ypum7rCFamepv7jm3uU9kDsWVYM9kOoUcmAaZCzrc62+TcdR4GHK9na8g==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr4885686wmc.102.1610646321380; 
 Thu, 14 Jan 2021 09:45:21 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n16sm10977801wrj.26.2021.01.14.09.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 09:45:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] meson.build: Detect bzip2 program
Date: Thu, 14 Jan 2021 18:45:09 +0100
Message-Id: <20210114174509.2944817-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114174509.2944817-1-philmd@redhat.com>
References: <20210114174509.2944817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The --enable-bzip2/--disable-bzip2 configure arguments are
somehow misleading, they check for the bzip2 library, not
the bzip2 program.

We need the bzip2 program to install the EDK2 firmware blobs
(see commit 623ef637a2e "configure: Check bzip2 is available").

Check if the bzip2 program in the global meson.build to avoid
the configuration to succeed, but a later when trying to install
the firmware blobs:

    ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found

Reported-by: John Snow <jsnow@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: c8d5450bba3 ("configure: move install_blobs from configure to meson")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ecc45d04d6a..954152c90fe 100644
--- a/meson.build
+++ b/meson.build
@@ -96,6 +96,8 @@
   endforeach
 endif
 
+bzip2 = find_program('bzip2', required: install_edk2_blobs)
+
 ##################
 # Compiler flags #
 ##################
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 6a341b6cea0..af95c5d1f1d 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,5 +1,4 @@
 if install_edk2_blobs
-  bzip2 = find_program('bzip2', required: true)
   fds = [
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
-- 
2.26.2


