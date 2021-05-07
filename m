Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF037677D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:04:26 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf21h-0002b4-Dn
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1ih-00089g-9q
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1ie-00016t-M7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LzYOi9y3/bAg2bf530/ErMOAU+nSy3193hDlzyrvOQ=;
 b=T+CYQsN0PkVXYgqaHMxK+gvJwsXsfdqrvJ3vKUt9/VapK8iwtF79BIOtBjD2Q5anSizQeS
 3bGbj5ByttxYMzDMKWm2DfITFKpj0rnJ3PKOkmmT7uIFMa743XXfaYE+8lUZp9CznJiAOn
 19jK9C7W+H9J8lc0vgtMm68Fr+btBC4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-jF6J3VrTNQ-BHGE-SUq0QQ-1; Fri, 07 May 2021 10:44:41 -0400
X-MC-Unique: jF6J3VrTNQ-BHGE-SUq0QQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso3673144wrg.23
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LzYOi9y3/bAg2bf530/ErMOAU+nSy3193hDlzyrvOQ=;
 b=gpFrX6ma5Ai/l36sS6lUSS+mpE/QNUj6pI/sXUubKYu89nEp9EfkVqfLdEBoADg8u5
 FxaxgndxCmKlPv6C2731xRFk9NjSQNKoqohJG+pMbAMK0g7K4ruZ1dUbPTqbv44WKRiF
 uMLF3S/kgiRTuS8/5tXWwzDX7i11c1if9LLu6jUoyh6xoClhlJwOB5tj5p5m9/SrIass
 ETN9QzQDYQWimpjOyj65Dwy6wzA0WkoEKJ7ozI0nUmzt7CuzfgKi8Vmij59mpAoEQ0cS
 qKEyTJhAwaMmoknEKrs+/VgITAnLjZ+Kq9g/bSPIaHoCAtFf+abNaZsPeEyCvBXuI+vu
 N1zA==
X-Gm-Message-State: AOAM530bIAG7e1S5a5KNQIevRMDxBWlQ/4Yy9GDCjw4tJsq81jXR+u3c
 plP/HG4OO9zlNLi7TAhNNWEqUvVI8MsPUOviLfkPlucAle2wmBJsid06VUxbnnz4qwsdQAf0SHS
 jt+TBA9Mv877aeDoANCtVVx8V9zC/8wmv2Dba0vSy4hfVol33WmhU+gsfYg9zUPdq
X-Received: by 2002:a05:6000:144:: with SMTP id
 r4mr12809731wrx.128.1620398679911; 
 Fri, 07 May 2021 07:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqPj6e70tDk+0Kapo/Q8l2xehNQRZ54fEglCYWvPkgmcAvqV1wQP9ylia+jNgLIxhdTdu4Bw==
X-Received: by 2002:a05:6000:144:: with SMTP id
 r4mr12809703wrx.128.1620398679711; 
 Fri, 07 May 2021 07:44:39 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id a9sm7223387wmj.1.2021.05.07.07.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH v3 17/17] configure: libSLiRP buildsys kludge
Date: Fri,  7 May 2021 16:43:15 +0200
Message-Id: <20210507144315.1994337-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only enable -Walloca when libSLiRP is not built.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 67cb6d5421c..ab5b6248253 100755
--- a/configure
+++ b/configure
@@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
@@ -5255,6 +5255,14 @@ case "$slirp" in
     ;;
 esac
 
+# Kludge pending an alloca() call removed from libSLiRP, see:
+# https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
+case "$slirp" in
+  internal | disabled)
+    QEMU_CFLAGS="-Walloca $QEMU_CFLAGS"
+    ;;
+esac
+
 ##########################################
 # check for usable __NR_keyctl syscall
 
-- 
2.26.3


