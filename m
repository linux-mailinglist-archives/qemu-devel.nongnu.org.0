Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C82D7658
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:15:01 +0100 (CET)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniGC-0003RD-3L
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kniF9-0002rg-6Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kniF6-000135-KD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607692431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m4eDFvApzfbJJcbdarI5iOjS3Wx+qUzMuAEg7SKkpTE=;
 b=H1SBq3+sOqU6vR7xtEEGI6HuKrRrCmZQvS7kboju7qgC1rS8sNnDBGr4ZSAS1kylevh9iK
 MfxTVPWOSQtlUoAnLKqWokb1wuRBB2QngYusPMeNEOkP7+aHdY0HiwDMhixGRXzjvdS+Oe
 h8uVl70fgrRjU8ePhbccpgxqeyWHLJg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-iVGS8NK7PDeol-m8DGq94Q-1; Fri, 11 Dec 2020 08:13:50 -0500
X-MC-Unique: iVGS8NK7PDeol-m8DGq94Q-1
Received: by mail-ed1-f70.google.com with SMTP id c24so3914659edx.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m4eDFvApzfbJJcbdarI5iOjS3Wx+qUzMuAEg7SKkpTE=;
 b=Fur7pGF80xEhpLJNJzfhe7jJHMkSDdJRYv6W00VqRQnWO1dbPYDpiURkvQiRs1fprD
 IySL/cDjfra7h/wRY8+3ospSirvp6IxW9ly9WWAOWw4WnL9infxKlIL5OEajDwkQACqq
 ev6MA9UK7t93wX8jsQcqds4YfdWfkVeZPAEJzYCBIkFV9on8j74TaEGH4O0PixYVtDcc
 nw1ezvPhtrGjocKIVMdt+hRiqntDPZAj+V6xzTrHWx5mss+OZ5t4PYGRuB6nwgUYxq28
 rQIuIgzc/S0uuKtx6EWbzeVdmLuTLoxZIbFEs/taTR3pmEe30KwfEyY5NOLbGVekqat/
 zmnw==
X-Gm-Message-State: AOAM532Bdebs24/IIUj8+XnTB7/znxIsh5+jjDfRSXsxho3qYed0KPA0
 iVwqHDa33smjoB72w1qccCUwf/VzToo0P7WTV95wPUQVKhmPwrhyRt8YNiGJ5V5m25yAuFcVha2
 bXzT1p7RcHpnNgCuM41gtrxTPjYENAl0VDxJQ63J/ouCtORltF61TdVLKkOSt3Y+w
X-Received: by 2002:a17:906:6c94:: with SMTP id
 s20mr10912752ejr.0.1607692428733; 
 Fri, 11 Dec 2020 05:13:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmy6jk/2x4HiAExG9AtfEFyO9uctDhpd8cojDzChvyMtTVMUVpi/Z3oFnBAbZqfk/EQuSkiQ==
X-Received: by 2002:a17:906:6c94:: with SMTP id
 s20mr10912729ejr.0.1607692428481; 
 Fri, 11 Dec 2020 05:13:48 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v24sm7939371edw.23.2020.12.11.05.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:13:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect fallback
Date: Fri, 11 Dec 2020 14:13:46 +0100
Message-Id: <20201211131346.473882-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
__builtin_expect too)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[PMD: #error if likely/unlikely already defined]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f3540..ae1aee79c8d 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -43,14 +43,11 @@
 #define tostring(s)	#s
 #endif
 
-#ifndef likely
-#if __GNUC__ < 3
-#define __builtin_expect(x, n) (x)
+#if defined(likely) || defined(unlikely)
+#error building with likely/unlikely is not supported
 #endif
-
 #define likely(x)   __builtin_expect(!!(x), 1)
 #define unlikely(x)   __builtin_expect(!!(x), 0)
-#endif
 
 #ifndef container_of
 #define container_of(ptr, type, member) ({                      \
-- 
2.26.2


