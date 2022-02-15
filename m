Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DC4B688B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:03:11 +0100 (CET)
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJufu-0005KA-M1
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCT-0004Uz-2g
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:45 -0500
Received: from [2a00:1450:4864:20::631] (port=42832
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCQ-0008Ta-DO
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:44 -0500
Received: by mail-ej1-x631.google.com with SMTP id hw13so14355164ejc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QsjrVfDbM3uRmhBjv0LGskeKvpCMdxywr4PakZvThbI=;
 b=Lez+bfqcqQ/PEhONeVpTkBjkVob5GDQkl4QV8QiSBKnHvz3FLkYUmoWYYpLeE04EwI
 8J7MJKKdYWFs+wadPWahl9vkRJlch825/m50jEy48INyKQzwR7hcHqiXUBOBM0y7efM2
 4HkBDJiEQWPUft+YP1rWB2H4nAL0EAtHQgBAvtnZQBlD4sJFby6LbVyADUwZmbtObq32
 lCFhJUomEvYwQ41YTfEH0X2SE7ajaOaxEdG3adAahLw9Nhjke8L2cC371y49X4xAE84H
 x8p1GLMNnGASA5b+UlVYTGm9/ICMma6QHIjLSSn2UldXTlSViR5LsifwaIbveZKliBCj
 eOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QsjrVfDbM3uRmhBjv0LGskeKvpCMdxywr4PakZvThbI=;
 b=cxwfdIAzlQaQvUQfCE5aMP98F5BE8uV7yrnAsdXTHd4bc8ERjVIyCGSXFrXUxlikJn
 6PwR9WSa1tYdXsZK0byGXuTvkyFV30hpsnpOWwzQXVNRFyQkUQfhYS3Q9Dc+v6xgYyLW
 ZSeZl++HnAIxWpBLS68eB1yRs9dGpM9XKsoMgbfvzMuWRoaL9m2LE1d4Apv3mRuMoBBo
 lKKLkPl5qWIus8+9M8XqzKnuqxXywU4TQLDFwoeTN3vgD6Ndamo+ZqmdB/eaDygqbxlW
 bzbpxC+k0wlPiqJy8KGz3/QGh4YTj5rBRaM6NDlxbMe35H6weA7jTzWfwTD7u0SViiBT
 OdVg==
X-Gm-Message-State: AOAM530BasuGYtnAJ+euBaSYy4qn+qf2gmR0oDvCM2DaAwSfsuJK2tKf
 n60CIUdJbpHenxC55nZhjNNgut595Vs=
X-Google-Smtp-Source: ABdhPJwXvy9RSQOh0+zzCSQWfFmP8zailh7TNB05kMry//I0HnwFgbMYmV+ho7t90v3xXPni/m8FGA==
X-Received: by 2002:a17:907:d01:: with SMTP id
 gn1mr2240673ejc.507.1644917561169; 
 Tue, 15 Feb 2022 01:32:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] qga/vss: use standard windows headers location
Date: Tue, 15 Feb 2022 10:32:17 +0100
Message-Id: <20220215093223.110827-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Stop using special paths with outdated headers from an old SDK.

Instead, use standard include paths.

You can still build against the old SDK by running configure with
--extra-cxxflags="-isystem /path/to/inc/win2003/"

(this also allows to build against MinGW headers, which are currently
broken as in 9.0)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/install.cpp   | 2 +-
 qga/vss-win32/provider.cpp  | 4 ++--
 qga/vss-win32/requester.cpp | 4 ++--
 qga/vss-win32/vss-common.h  | 6 +-----
 4 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index 40de133774..efc5bb9909 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 
 #include "vss-common.h"
-#include <inc/win2003/vscoordint.h>
+#include <vscoordint.h>
 #include "install.h"
 #include <wbemidl.h>
 #include <comdef.h>
diff --git a/qga/vss-win32/provider.cpp b/qga/vss-win32/provider.cpp
index 72d8b0e19d..fd187fb66f 100644
--- a/qga/vss-win32/provider.cpp
+++ b/qga/vss-win32/provider.cpp
@@ -12,8 +12,8 @@
 
 #include "qemu/osdep.h"
 #include "vss-common.h"
-#include <inc/win2003/vscoordint.h>
-#include <inc/win2003/vsprov.h>
+#include <vscoordint.h>
+#include <vsprov.h>
 
 #define VSS_TIMEOUT_MSEC (60*1000)
 
diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 940a2c8f55..4513324dd2 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -14,8 +14,8 @@
 #include "vss-common.h"
 #include "requester.h"
 #include "install.h"
-#include <inc/win2003/vswriter.h>
-#include <inc/win2003/vsbackup.h>
+#include <vswriter.h>
+#include <vsbackup.h>
 
 /* Max wait time for frozen event (VSS can only hold writes for 10 seconds) */
 #define VSS_TIMEOUT_FREEZE_MSEC 60000
diff --git a/qga/vss-win32/vss-common.h b/qga/vss-win32/vss-common.h
index 61c170b52e..54f8de8c88 100644
--- a/qga/vss-win32/vss-common.h
+++ b/qga/vss-win32/vss-common.h
@@ -46,11 +46,7 @@
 #undef VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED
 #undef VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED
 
-/*
- * VSS headers must be installed from Microsoft VSS SDK 7.2 available at:
- * http://www.microsoft.com/en-us/download/details.aspx?id=23490
- */
-#include <inc/win2003/vss.h>
+#include <vss.h>
 #include "vss-handles.h"
 
 /* Macros to convert char definitions to wchar */
-- 
2.34.1



