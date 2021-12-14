Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB04742E6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:47:41 +0100 (CET)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7DY-0004uB-Jw
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77U-0001nn-A3
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:26 -0500
Received: from [2a00:1450:4864:20::531] (port=40632
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77Q-0004bF-Sv
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:23 -0500
Received: by mail-ed1-x531.google.com with SMTP id r25so62031695edq.7
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7pcB4DRk1ERh5GRKO+vkAyITUzW1FVVPgQ5iX8HuiIg=;
 b=dETOUBtLN9MZUX7zXQ+ZD1sg+Tvh5l2KtPqBr2FDBV57j3GCJ9VrkKKb9yO0JDwOYZ
 2YG0LxZcXKf8O2+UVOGrNpBevX9EQI64B3wP7MqjxNuf6IcjFYXSJxZGUymyBLvzidjo
 SQF4uhjH2ucF+kW0LFwGBUrWENSaXYPrfSEspEd0xyMkbb1Relg8Whr4PTnn0wlbgxRc
 ttKQHu1/l+2Y8Lw0RYY9LjsdZHi/woxFUKZr7ctCDMaQzL6sxpGlZWPyJJknEKJvDvBv
 i2ITG6pTn30v27gmo0hbAEpduuvcb+Poa0UwiGjZ8clHozkoNQhVFQw+kdqVy/hSmTLM
 0TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pcB4DRk1ERh5GRKO+vkAyITUzW1FVVPgQ5iX8HuiIg=;
 b=32B3tDx+raTkJigp3amsQKIAV+sDnN1kpDomW8BOg6K2Pby1qGVKEQuzT1V15q2y6X
 k7Bkez9UvSzpKjlT7JWVXvpYzsRKEyvj+LkkAa99QUKBNZjCBI/7u3HTu9Y8ebopk5eA
 46gH0UEC6yGzLcYevfJQJK/2OzzvYM1Gq27zf6/8FVkjkaTd8nFhJ0RC1tR2kxfrLw3g
 sF1JgJimeGd9AV/J8UC+ax0td8w+AdGsd0Qsk2xHRkm0l0h/E3utd4YPKF+eTVpN8ogs
 BZDRwiIxLe4MQaqmBPdcdKogZ6Aqy27qV2OusoV4vLLiNpV3FlOkfIvaGk7/mH8UmRnn
 2XXA==
X-Gm-Message-State: AOAM532Qbh738qMV1IVAqYX8prI33M+9Vtk/sN0hRDfkZC6frQRQ2EuU
 aAkzdy0kN6cCAkhEPH1ym5W+T3JIJSvG+hKp
X-Google-Smtp-Source: ABdhPJxLp7IcbKSxd1nntQLT937LIhY0gZE8uqGGGn5nURR8QtTML1yy3jRq6sLVvx+l+bOy4Ppmqw==
X-Received: by 2002:a50:ce51:: with SMTP id k17mr7521261edj.356.1639485678610; 
 Tue, 14 Dec 2021 04:41:18 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:18 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 2/6] gqa-win: get_pci_info: Use common 'end' label
Date: Tue, 14 Dec 2021 14:41:05 +0200
Message-Id: <20211214124109.103102-3-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

To prevent memory leaks, always try to free initialized variables.

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3dd74fe225..93c5375132 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -532,7 +532,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                                    DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
     if (dev_info == INVALID_HANDLE_VALUE) {
         error_setg_win32(errp, GetLastError(), "failed to get devices tree");
-        goto out;
+        goto end;
     }
 
     g_debug("enumerating devices");
@@ -562,7 +562,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device interfaces");
-                    goto free_dev_info;
+                    goto end;
                 }
             }
 
@@ -576,7 +576,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 CloseHandle(dev_file);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device slot number");
-                goto free_dev_info;
+                goto end;
             }
 
             CloseHandle(dev_file);
@@ -586,7 +586,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         } else {
             error_setg_win32(errp, GetLastError(),
                              "failed to get device interfaces");
-            goto free_dev_info;
+            goto end;
         }
 
         g_debug("found device slot %d. Getting storage controller", number);
@@ -603,7 +603,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device instance ID");
-                    goto out;
+                    goto end;
                 }
             }
 
@@ -617,14 +617,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Locate_DevInst failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device instance");
-                goto out;
+                goto end;
             }
             cr = CM_Get_Parent(&parent_dev_inst, dev_inst, 0);
             if (cr != CR_SUCCESS) {
                 g_error("CM_Get_Parent failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device instance");
-                goto out;
+                goto end;
             }
 
             cr = CM_Get_Device_ID_Size(&dev_id_size, parent_dev_inst, 0);
@@ -632,7 +632,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID_Size failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID length");
-                goto out;
+                goto end;
             }
 
             ++dev_id_size;
@@ -647,7 +647,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID");
-                goto out;
+                goto end;
             }
         }
 
@@ -661,14 +661,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
                              "failed to get parent device");
-            goto out;
+            goto end;
         }
 
         parent_dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
         if (!SetupDiEnumDeviceInfo(parent_dev_info, 0, &parent_dev_info_data)) {
             error_setg_win32(errp, GetLastError(),
                            "failed to get parent device data");
-            goto out;
+            goto end;
         }
 
         for (j = 0;
@@ -748,11 +748,10 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         break;
     }
 
-free_dev_info:
+end:
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
-out:
     return pci;
 }
 
-- 
2.25.1


