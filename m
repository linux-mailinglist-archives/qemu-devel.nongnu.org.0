Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62125827D1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:37:36 +0200 (CEST)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhEF-000317-SU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5C-0003VY-Uy
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:14 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5B-00022w-Ds
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:14 -0400
Received: by mail-pg1-x536.google.com with SMTP id r186so15943515pgr.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Phf7RRs9YPshwkeWcjieRVLG6Kz9qCuEGQI3Aw89tI=;
 b=IbBmHuDpEMfiwARyflJ/ijqAcCXoeCQelqeV2vCNdnxhEsWEsLUX2J04zTEkqU+BY4
 4GqWH0JuDKGePQ9/ft3eIgq1BMD3W9G1SWp6gfZ4H9Vner9wVIdDDSKlp3Ouc3G53dCl
 LxY5rWWp71Zw+wj0Yg/OKwpymz++VGXQLsv8lQjVIHVLlHXM4XPSOVLIFAIQ8RY89uKz
 jfttPn3zSnVd7lg1myvAY+wFRNZ0Ca+gyhT+zDGjxx2iSkM52hpVJMyQntn+iqG+UJbb
 FbKFRgU4TMyR0XgGuKmI56wpRGSxNw1xCFLqrjH+ObHHvNzVQgn0TslJIbbuiAqjUZU1
 hOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Phf7RRs9YPshwkeWcjieRVLG6Kz9qCuEGQI3Aw89tI=;
 b=LJ0nwBkcKHMUm7jamhEJBWJvfEWdEVAhVjDrmPhc5kDqVJ8d8DTfVreH0w22nORDP8
 J6dmr+8zgIhJuuUYURVLTBh4h5+HsGjLSxGjf1XZF30oVXTtMsV2BSUEAKaj/51CSb5N
 qMBnOmIMvutbYkA4qA9cZ1M/KjtZEVlLBxKrPOEyXXW9MXRj1jzKbOCCmR+tdpSNcMvJ
 umyI78iT1ISg6MrtnwpIcW/bbhAC8fAeciUo+UlwnBxybSfzoFICZSYu74MF9ceS1a83
 z93EngzwDYKB1GjLqgWVRt037D742PEVRjln283WaDG4DD6qY5eqUbK7sFf3fueZaUj6
 ykQw==
X-Gm-Message-State: AJIora+hSiryWbciiXIbkNFkw3qWHvDFG7qgPmV8M4M0IOBsKRKEMIWX
 jInCAbtETw8EcczYCR8dv25AF15zSig=
X-Google-Smtp-Source: AGRyM1vbTnT8CHLbgBJ4/4Xxxm42QwPeT5nG7135p5idU6HI7nmN0gU7R4zMC0NNEnEIS1RtHGU7tQ==
X-Received: by 2002:a63:6e85:0:b0:41b:42d0:83ef with SMTP id
 j127-20020a636e85000000b0041b42d083efmr3454252pgc.236.1658928491393; 
 Wed, 27 Jul 2022 06:28:11 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 2/6] util/oslib-win32: Add a helper to get the Windows
 version
Date: Wed, 27 Jul 2022 21:27:58 +0800
Message-Id: <20220727132802.812580-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

This adds a helper to get the Windows version via the RtlGetVersion
call, for QEMU codes to determine the Windows version at run-time.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 include/sysemu/os-win32.h |  2 ++
 util/oslib-win32.c        | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index edc3b38a57..1e324026a4 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
 ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
                            struct sockaddr *addr, socklen_t *addrlen);
 
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 5723d3eb4c..6d2387b9ff 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
      */
     return qemu_fdatasync(fd);
 }
+
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
+{
+    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
+
+    /* RtlGetVersion is available starting with Windows 2000 */
+    HMODULE module = GetModuleHandle("ntdll");
+    PVOID fun = GetProcAddress(module, "RtlGetVersion");
+    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
+
+    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
+    rtl_get_version(info);
+
+    return;
+}
-- 
2.34.1


