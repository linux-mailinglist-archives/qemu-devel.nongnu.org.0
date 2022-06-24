Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F9559592
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:41:28 +0200 (CEST)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4esZ-0007YA-Ux
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efY-0006Lf-Pk
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efW-0005Vq-O3
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKRIRkfS5iDFDtYG1yCN2RIcM7QWhd9MCUeeaDQfRyQ=;
 b=Pe4+ZDpxUhdxNK1DRFlE4VJSnTOctVKPfR3Su4qJaeBoyZab+evJlC2blN+m0ncU2bcJyq
 WYMOiYcOkYmRX7sf04OmSgEFJDyxUZizicBMG8zQUZkSRSNwuuWukgYv/MOmeA9K718vMn
 /4fsU1Fg+MF1SW4k07roZt2DPaiGchs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-8ekuZRvDNxuPb14Z_fihrw-1; Fri, 24 Jun 2022 04:27:55 -0400
X-MC-Unique: 8ekuZRvDNxuPb14Z_fihrw-1
Received: by mail-ej1-f72.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so565081ejl.21
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKRIRkfS5iDFDtYG1yCN2RIcM7QWhd9MCUeeaDQfRyQ=;
 b=o+NTFkdSm9ybtHvvQ7eREbVQvfkHXlCkRb0zt5pYxOjo2BaIC+xvclvlOo8zZL8aK/
 uQm77CCjiPKoMm6stSN60u7f/qPWRy+vQvJlvkkudn2HoFd6bOGAfp05blW9c6qMHyVL
 hJJRe+EU/hOBHujJDtYLvtAYC2bF5aCfcMQAtOwRml7C8I4mAH6JiVwnzltvE6r/S/Ct
 MpUGMVhTUeKSsoHkbFVB3vpwfyFC0UVi/KuOvzedIyxu/JzjvGWRKV8CA4c/u0ftZjQJ
 sCXqRGTVmBRY1JPGUs2Q2eup/ldjJbi+3V+8CTkax4OsV2NIwWlTQ+N0TXLTCMkdk7/z
 GkUw==
X-Gm-Message-State: AJIora8EnzwnDnErySxFVxLNNQfuLd6pdX+9jhUxBO0DlaL86iFqYwCK
 L6+KD61PQAP/hMKHUZsDd8ZHfkOKngeDf4d/SFoYfOv5C/Z+bra/j4reNiYsowXYENJuy028k1O
 Fki6dUOh9NGzbWCjauz2YonlmFCdoC/tLPTl9/md0B9ewvI+mqRiv528VolbVzKEvq1s=
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr7106608edv.322.1656059273668; 
 Fri, 24 Jun 2022 01:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdKXqZmH+zWXu0ZdpOei0SyVHHiIqsU809bTfeLmf6T+P+ytXO2j0Mij1Qy0Z2rsKjey/Krw==
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr7106580edv.322.1656059273408; 
 Fri, 24 Jun 2022 01:27:53 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa7d0c6000000b0043572ffafe0sm1379190edo.92.2022.06.24.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Subject: [PULL 11/14] fuzz: only use generic-fuzz targets on oss-fuzz
Date: Fri, 24 Jun 2022 10:27:27 +0200
Message-Id: <20220624082730.246924-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
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

From: Alexander Bulekov <alxndr@bu.edu>

The non-generic-fuzz targets often time-out, or run out of memory.
Additionally, they create unreproducible bug-reports. It is possible
that this is resulting in failing coverage-reports on OSS-Fuzz. In the
future, these test-cases should be fixed, or removed.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220623125505.2137534-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e0521..aaf485cb55 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 #
 # OSS-Fuzz build script. See:
 # https://google.github.io/oss-fuzz/getting-started/new-project-guide/#buildsh
@@ -105,7 +105,7 @@ do
     # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
     # that are thin wrappers around this target that set the required
     # environment variables according to predefined configs.
-    if [ "$target" != "generic-fuzz" ]; then
+    if [[ $target == "generic-fuzz-"* ]]; then
         ln  $base_copy \
             "$DEST_DIR/qemu-fuzz-i386-target-$target"
     fi
-- 
2.36.1



