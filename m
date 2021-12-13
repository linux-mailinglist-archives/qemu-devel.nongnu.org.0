Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79666472B22
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:18:46 +0100 (CET)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjLx-0002ZG-KK
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJU-0008W0-HN
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:12 -0500
Received: from [2a00:1450:4864:20::52a] (port=35574
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJS-0007Fl-GY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v1so51262934edx.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZyjWKDKqH2alTErU781Viw3hW4bS53yAycPis4lhQRk=;
 b=wyu3kJG6fWDQX1PeUxnjK2xOP5Cttq05VZCASbif9/HeTqb8imyw9LueiingxDy+vX
 hsA2PtnKKFBKHG7TFOA436UqLRi3UIp/CcIhceZRa1Q+oli1S7wrhxLcavUt8/xEpwIN
 3FlgEEKVjLxElcDYPs0OJ0FsWVy0x/jHW16bSWKUXKhrV2QW/OQ0iWJY2eWpPlYECWmx
 gpoZVEYaRKxl420NI9YHxfnYa47EqivMipZNPN6zHBnJAwmLenM7neBkT6tfFIZ0koG6
 AW2pQSuFnvZ46XZGUSaxSAjqfyQoWlYmw+BBXZsHje+rATOvsbR9EfwQMDiQN8lAj3lu
 X1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyjWKDKqH2alTErU781Viw3hW4bS53yAycPis4lhQRk=;
 b=7dWbgSEkvSq722H2DzNsn07Kb1lfTa3rTkmrX0Mdy6FpaSmUzulziylX+coGJHi2de
 tSFLLRX2DAFNWLwxreC+NZEWsDWPBy0QZy7Rhzm56HRmQ57t3srzT1hngjwt+zUP+z68
 zKaCHtB8quTcjcymCrD+rowG+zocpxUjeGT2pLsG1kLEWTJkQYPkJn4F8X7T+Z2SC1uz
 6Er9sXnEw4lPOeHxZOjaK+NFdI0zECgtoohTQqtS/Zx4sBR6ybKx4vtV1QNhbnWWIx9+
 j/Ikd6tfoFom+bdHKAODQ1CPU1DqryV+5/P2026FGwwbjATp7nt9luIztOQLrtjyn37p
 aOYw==
X-Gm-Message-State: AOAM531cWg4tE6a6bfqnKfC5JicGxoxmzVjvMCUNCVRzWvEwcCZgrxsV
 MjPgtqiS/80F8pgZtJH1rWbeFJdqAkXWTw==
X-Google-Smtp-Source: ABdhPJzoft/rmap85EooIh5zWWrRDafibkeMhEYz/XPWAydZ7+PoY4niLLim2T+StAV/GUyKdlcycw==
X-Received: by 2002:aa7:db47:: with SMTP id n7mr63959186edt.303.1639394168294; 
 Mon, 13 Dec 2021 03:16:08 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:07 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/5] gqa-win: get_pci_info: Free parent_dev_info properly
Date: Mon, 13 Dec 2021 13:15:52 +0200
Message-Id: <20211213111554.62394-4-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213111554.62394-1-konstantin@daynix.com>
References: <20211213111554.62394-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x52a.google.com
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

In case when the function fails to get parent device data,
the parent_dev_info variable will be initialized, but not freed.

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 12f7a88078..cef14a8762 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -515,6 +515,8 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
+    HDEVINFO parent_dev_info = INVALID_HANDLE_VALUE;
+
     SP_DEVINFO_DATA dev_info_data;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
@@ -542,7 +544,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
         char *parent_dev_id = NULL;
-        HDEVINFO parent_dev_info;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD j;
         DWORD size = 0;
@@ -744,11 +745,13 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 break;
             }
         }
-        SetupDiDestroyDeviceInfoList(parent_dev_info);
         break;
     }

 cleanup:
+    if (parent_dev_info != INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(parent_dev_info);
+    }
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
--
2.25.1

