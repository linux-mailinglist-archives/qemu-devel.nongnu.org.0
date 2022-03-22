Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E6C4E4473
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:43:59 +0100 (CET)
Received: from localhost ([::1]:34448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhby-0001xZ-Bv
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:43:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWhaT-0008Hn-US; Tue, 22 Mar 2022 12:42:25 -0400
Received: from [2607:f8b0:4864:20::1032] (port=43547
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWhaS-0000zQ-C6; Tue, 22 Mar 2022 12:42:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so2653984pjq.2; 
 Tue, 22 Mar 2022 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56Sb5MySwq7l5qpWqAORgeN+64g5W2ggGWIGq51tO0M=;
 b=pGa2JX2GFey9hXbDPlkgjYRcB2Wo0L7kCMzT4Tx7zqBeZSJfLUWYkYNJNLZ22Fl74+
 OURtHIbUbvIhp+YyceHXxSljjOauVmV+SYWnsxzGYbq5LcUVvLMqVQYPMs4SUJgaFAME
 CO90HVr8im6p8TFaQS0xUQRfeUNAs+aUW1m68D9JJFnV3p/y4EkHiCV45Dxsm/+m0gyR
 qn54WCBGw6SMs/nTvyWD8w+nYkEmGnf7nH/lF+ni46bqsnGggXOqs8mebkBfTi+SHPzB
 ZtIST4whkCLqKnRyWWjLgPCedlGEqciqZABJq1IlVgYxQ1pYF0aJlF3+5QGe3C7Apsor
 udbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=56Sb5MySwq7l5qpWqAORgeN+64g5W2ggGWIGq51tO0M=;
 b=Bhju63LUIxVVq38pkaF+3Ape8Jqqkl0jHA7udtuCCvDZz20l0h208/E2k7+4lOcSGJ
 A3alNdmxbQabkTbCWs/CfoOMuljKoSWjidMDPvP1sg4BpmCZXj/8wTLl4U4nTn1aWfw2
 6QLdrp0Rbuzv1nQbXCyVtjAEf5IwH+93oRxxKfxnwxbBi0ZgigxfSx94wPNksaY/OPm3
 ++vF8cSt3+gtRR8va+HDzoJ/tXcQOAFV82t8vGqD1k4bTyjsczW8HJmo+NtA625/Ym/I
 WlPYg29FX4IAXFv4G48vyXdm9Zwp7rp60In03kg/An+hcKUWGn+bFl25cEiQH+9TdRH0
 A2KQ==
X-Gm-Message-State: AOAM530FUEEVoNWnuaN9fhPvUwgDWsUSfwcjBP0QWfNM9RjZXDeC3de4
 Rgwv3olg4i6c7zwlrryxd3hM6yrP5eqHXA==
X-Google-Smtp-Source: ABdhPJzQMYfu1lWyqQ6MOL7oNdmGn9uSNwXP+d7BWmkDHKzHWdAN8JINILvcaMqsNSYrWvejK1mdKA==
X-Received: by 2002:a17:90b:4d8e:b0:1c7:1e1f:484b with SMTP id
 oj14-20020a17090b4d8e00b001c71e1f484bmr6036075pjb.216.1647967341616; 
 Tue, 22 Mar 2022 09:42:21 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 e10-20020a056a00162a00b004f6fc39c081sm21736958pfc.211.2022.03.22.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:42:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] cirrus: upgrade mingw base packages.
Date: Wed, 23 Mar 2022 00:41:55 +0800
Message-Id: <20220322164155.1715-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=D0=B8=D0=B6e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml              | 2 +-
 .gitlab-ci.d/windows.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7552d70974..59b004721d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,7 +12,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-03-19/msys2-base-x86_64-20220319.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1df1630349..e8b65faccc 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -16,7 +16,7 @@
     }
   - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
       Invoke-WebRequest
-      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
+      "https://github.com/msys2/msys2-installer/releases/download/2022-03-19/msys2-base-x86_64-20220319.sfx.exe"
       -outfile "msys64\var\cache\msys2.exe"
     }
   - msys64\var\cache\msys2.exe -y
-- 
2.31.1.windows.1


