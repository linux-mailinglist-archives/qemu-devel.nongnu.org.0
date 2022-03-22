Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28A4E468D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:17:42 +0100 (CET)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWk0k-0001rt-1z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:17:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjy7-00085C-Qx; Tue, 22 Mar 2022 15:14:59 -0400
Received: from [2607:f8b0:4864:20::1030] (port=36624
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjy6-0005SD-Cy; Tue, 22 Mar 2022 15:14:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 kx5-20020a17090b228500b001c6ed9db871so4002965pjb.1; 
 Tue, 22 Mar 2022 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56Sb5MySwq7l5qpWqAORgeN+64g5W2ggGWIGq51tO0M=;
 b=MESM55lTXy8uJIYy9QDga16Y8W0pJ2+v3oxnGW6e7CMKOmX8zigRgyXRh0jan/DhRl
 ziskqKLT5BbIE7c09HMPKAYwl+taB3loElEXKtArT6SG+FUzcOwOzplNmghNMhCXOVhP
 TmAO7k82ne0c4q/VgXtXMbac2qTtuo0y6CKTUrKI9iujHmqbA8Hqv3PN2tS02sL+Aovs
 qDABP9il4lL4VJw9pqWXLPCRy+9IBuGvHmTKiDVfscrwdKO/b0SLDk1i/sNp+Hf7UDV0
 zyXmQY8bMhxsaFKJq829ICByujwBnjLx+cgdzdXjeAYzgzp8VntD6RVSqBIXROgy9biF
 OXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=56Sb5MySwq7l5qpWqAORgeN+64g5W2ggGWIGq51tO0M=;
 b=Tf0QPUPgG79uGeAnIRU1d6noRmNJ8nwzCSzsRZJoPltJgJsHoflbaqF75WDBb0SJyi
 bzzMP16QBnxZ5tP4OJuQsYVGFD0UFNsR28Y2Y+4LR0i5EYPcHD4Hap9QkAvW/XIztSic
 tXxb9ueeUxrCWLPDm1ZpQOWjLeTCdPSpKKqkMBFAv9tTIbrCXaHITEXmH5zkgg3L/E7+
 oAy8t6C3kgg7TqVAO11q/BFJFs1YyIUD1dIEw/gIoJKR3/5F6xRezR9SNAvxiRrLMnVY
 wqUmHNkb8aFDFG49dL/EIdiDgRu3Lu5swBsaM68TcpLB8hPrtjql4FIUSKb2+00Bgs1C
 7joQ==
X-Gm-Message-State: AOAM533LSI/m/8tuw9rifGr6Gj9y0qSrgxdIj944U2AqtENpXlnv1B90
 Y7uLXmd9Me1Cr2aZCYgybOVXfh+AVCaeew==
X-Google-Smtp-Source: ABdhPJzup03wfo59Sf9kDVo6J9sZKLAuhE/v+M2Nl0x9K5Q+tss2sQ6RiL9xHE89JK9es5mO1qEn1A==
X-Received: by 2002:a17:902:8a91:b0:14f:969b:f6be with SMTP id
 p17-20020a1709028a9100b0014f969bf6bemr19845243plo.161.1647976496274; 
 Tue, 22 Mar 2022 12:14:56 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q20-20020a056a00151400b004fa99ba6654sm10146827pfu.115.2022.03.22.12.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 12:14:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] cirrus: upgrade mingw base packages.
Date: Wed, 23 Mar 2022 03:14:09 +0800
Message-Id: <20220322191409.1330-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20220322191409.1330-1-luoyonggang@gmail.com>
References: <20220322191409.1330-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
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


