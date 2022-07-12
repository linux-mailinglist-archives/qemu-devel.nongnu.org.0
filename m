Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409F571AD1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:07:04 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFbT-0000qN-Nu
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLU-0003CE-0P
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLS-0001Uo-54
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKBzYHIAT6VBcq03PETtR4a9TQUaMhkMxNp2UTkCvng=;
 b=XBBJ1ZrJNiloE50Aj7wQShcb9Deo0LCg2ihCpcHgb2rGClCWxlFJEWO3OwCU0OvAT+Tew3
 Q8FmluKtqaGe0RUUCygaOfjywm9/feXoTLV4r6qgzDJL4CXWx0JxkYYHr5RVTM8Ycnr0sw
 TjTWqzPAicMMQs7L4FIjqHwsBNe2A+0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-EM5US8_lNIuLVkINNcwxuQ-1; Tue, 12 Jul 2022 08:50:28 -0400
X-MC-Unique: EM5US8_lNIuLVkINNcwxuQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb37-20020a170907962500b0072b820af09dso645471ejc.20
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VKBzYHIAT6VBcq03PETtR4a9TQUaMhkMxNp2UTkCvng=;
 b=Q1TucxX8Vp5puXVdBvI13EKmPMoK75BgSq9Fx/2SioW/URbWPESQraktRA/vXj+eIL
 qHe0tDH/PoW4qd3cg+9CIzqBHuOvJXRxOwSSiXmiVFujJlWPAHywOdPyWFQ+A2YRMRP1
 K9QVcCVMeliDYBHRn4Mwu5XkJRqDybqxlltnAhfp3e8jrMkZLiWvYr/BhCELvDU6xczY
 b/o4di7pkn/rD1DFtL/1TcMOXd/ZvX+SkCY75u8znga7gmJW4k24ICg9QhLDOwZEDH+/
 lnlglbb3/Vum9xXxlrEgs0szVkZTRih1GhZ/L5wxzs1ZzUSnEWApNDvSPkXCER48ovmU
 ae6g==
X-Gm-Message-State: AJIora+YizsvpLRt8rG3pRYfm2ogcmOkyYXMw1+Yv0djfwSR9MenD2L0
 NajvlH+UVseiArYTSJg1t5koC5VMnKYYyRhkClEByZUULrSiGSbmyfp//y1pW6WIsk8cDpdT9la
 Pj8XypGtxVfUDD5yNhn+1iayGgf59ckteBPKfY0nF99Ds9yQoJPQiioKx1ssioKs9BdI=
X-Received: by 2002:a17:907:7202:b0:722:e4d6:2e17 with SMTP id
 dr2-20020a170907720200b00722e4d62e17mr23557876ejc.434.1657630227121; 
 Tue, 12 Jul 2022 05:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tf22oQqrWUCezgPW3nunB3SitYzOfN4V2IsxM+yv/zV6CCI9y2lxR/OXV8sewlC4kbvQPvYA==
X-Received: by 2002:a17:907:7202:b0:722:e4d6:2e17 with SMTP id
 dr2-20020a170907720200b00722e4d62e17mr23557857ejc.434.1657630226848; 
 Tue, 12 Jul 2022 05:50:26 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a1709061da100b006fe8c831632sm100496ejh.73.2022.07.12.05.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 17/18] qga: Relocate a path emitted in the help text
Date: Tue, 12 Jul 2022 14:49:55 +0200
Message-Id: <20220712124956.150451-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220624145455.50058-1-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index c373fec3ee..5f1efa2333 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -223,6 +223,10 @@ void reopen_fd_to_null(int fd)
 
 static void usage(const char *cmd)
 {
+#ifdef CONFIG_FSFREEZE
+    g_autofree char *fsfreeze_hook = get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT);
+#endif
+
     printf(
 "Usage: %s [-m <method> -p <path>] [<options>]\n"
 "QEMU Guest Agent " QEMU_FULL_VERSION "\n"
@@ -270,7 +274,7 @@ QEMU_HELP_BOTTOM "\n"
     , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
     dfl_pathnames.pidfile,
 #ifdef CONFIG_FSFREEZE
-    QGA_FSFREEZE_HOOK_DEFAULT,
+    fsfreeze_hook,
 #endif
     dfl_pathnames.state_dir);
 }
-- 
2.36.1



