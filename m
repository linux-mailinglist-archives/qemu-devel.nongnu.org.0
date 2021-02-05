Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12164311001
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:36:19 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85xq-0000oa-14
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84l4-0000ww-U2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84l3-0003VP-5e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9i8oDXDPeH/7jq3Qnbvz0BqQFc/V0wdV23pNv7JLEdc=;
 b=GLOyJa2LzrOf2JIzN8iWV2DoY9QzQ5/hn3NFm74GAO1sMFf3U6UaJMprOsiOGml9fTLmpC
 R+SglXlETKURVtyul+2G+t5HIwA2cAurL+awPX04hBoolFLXkTuXoi+Ye9OVyAKlPizMra
 JHVrc9nxgcXMdzNdDSd+tTFa26LJkRM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-AO34F-1NOmicY8tgioAo_A-1; Fri, 05 Feb 2021 12:18:58 -0500
X-MC-Unique: AO34F-1NOmicY8tgioAo_A-1
Received: by mail-ej1-f72.google.com with SMTP id dc21so7108968ejb.19
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9i8oDXDPeH/7jq3Qnbvz0BqQFc/V0wdV23pNv7JLEdc=;
 b=K2PQUI+KRgiL1gE73MfmLLZhappdQkabWpCugi+8sBcQclJ9ZkFJOas8CQ8sWWMOH4
 c2Mkuz5D7z/TfwoR6vi+6hGTd1vcqVXYAT7JfgtvijIIndOUkqzTcpj8k+Kzp1pSvyAj
 9FpOTP+sVK8VgjwkFmMfyM3O4LAj1VrUNrj89lqXoOXmAHkN58+OHhCawpSVHUgMcFfg
 rNQCVvvyvRhOGY74GWNCChf4ZfIWzyqa0cNncbBbRSc5AmyRMrGwuXJkhzBLihQ+uNwf
 OLOT1a0a+oW+ADhGuAG+OQivaG7AH3zWcxl3BuHFqsp4p6qGl4E3X4Y46u8ICtBhO2Mk
 7XSA==
X-Gm-Message-State: AOAM531o/VTyMiPhas9e1b48Jv3+VfO03Cg/D7iVJQk7fUyUnPA/VLdN
 PzSOiy1gn0ZYvZNMQwGXEwBmUCPAZN5mFiHHK700/ozNF2uVL34wfNASySDPw9d90y/ZVDzAPd4
 wqYpu0xW1/620oBkjA7Vn/i/Xv2JdPYdXzTpH/RFBXuL4UhnJr45GuOnfa9F6AMCT
X-Received: by 2002:a17:906:914a:: with SMTP id
 y10mr4898772ejw.33.1612545537312; 
 Fri, 05 Feb 2021 09:18:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK/BymxXxj4/wtv/Oc/UeouB7c/+8o5EWtixz6ejzBOZKBVrb0PXXibQV9NReIEmN6AUyN1w==
X-Received: by 2002:a17:906:914a:: with SMTP id
 y10mr4898743ejw.33.1612545537068; 
 Fri, 05 Feb 2021 09:18:57 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cb21sm4297128edb.57.2021.02.05.09.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] qemu-options: Replace the word 'blacklist'
Date: Fri,  5 Feb 2021 18:18:15 +0100
Message-Id: <20210205171817.2108907-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Reword (danpb)
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index c09c4646e28..5f86cd2fbbf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4274,12 +4274,12 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
     "                use 'obsolete' to allow obsolete system calls that are provided\n" \
     "                    by the kernel, but typically no longer used by modern\n" \
     "                    C library implementations.\n" \
-    "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
-    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
+    "                use 'elevateprivileges' to allow or deny the QEMU process ability\n" \
+    "                    to elevate privileges using set*uid|gid system calls.\n" \
     "                    The value 'children' will deny set*uid|gid system calls for\n" \
     "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
     "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
-    "                     blacklisting *fork and execve\n" \
+    "                     blocking *fork and execve\n" \
     "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
     QEMU_ARCH_ALL)
 SRST
-- 
2.26.2


