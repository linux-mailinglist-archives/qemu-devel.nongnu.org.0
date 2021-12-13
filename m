Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC66472B23
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:18:46 +0100 (CET)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjLx-0002ZX-N8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJU-0008Vz-CP
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:12 -0500
Received: from [2a00:1450:4864:20::52a] (port=42715
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJS-0007FV-Ea
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id r11so50238159edd.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UOq7HXf+K8oMudzzz7NHQ+jQVflm2qA+bj7AzU+PASI=;
 b=sFtXHZJzIKgcGpBwUs+JNSib1s5iRrXfkAAAcRX+NSJx1hC4sjDYBaL2J92hoqkFAa
 xXke3SZH4C5ZvTyJF6OnLIctlTgo3IK/OGyVMLIX+/MA2Kb4nDSJKUVb5gmY4STRG4zY
 HbOBNzz25cETmGAaEgJFhr/hyXLfEp1y3hnKoGe3bBdDX4bnPWqYir0Pdh6iyzjWGsDs
 QVpJNm2vniDOktf62G5lr2xq85iYLnTi3TYWLNwomimi65M0PIdfYsRwxkEI+4g8XKUH
 wL+WzLCPIaviMxgn2FVD12RiyX3BVtqxeHgdbKSoWUxj2In++uIEA+KsrmSdaVURNlda
 4PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOq7HXf+K8oMudzzz7NHQ+jQVflm2qA+bj7AzU+PASI=;
 b=HGzYVdz467bpAsWo92EOtbpXq5MQQl+6JzN4i8CXfv8JIqKs8cpH+6NEMr7/c1wsQ7
 k3hVeK1i7SjHuelocZe8jyMja/9/cC0DJqOneS2gp1Er2AlQ/kySHdxb2prPfqoaspTj
 KVjBDqL3xJQwqVcQVquzN5OilDz3N2Dh2L8hRxF+Q8rPxTRf5sMJcaILhRk2P6nykk/S
 83WtLHPFGKnN0fGGjCUb/s36wHurhYUKhP2LVU83qiUJS1LSAjKUGgS5ZmVog1LAfgbh
 I5c8hZwuNK9tYiY+7m1avDYDFu5iGy0rk/jGAjJTBp/faBZB/HfZEqv5GfTOg18DkYc9
 VuuA==
X-Gm-Message-State: AOAM531DwZx5uOU5PGhQei3IAiOinvryLHnpHPrmfP3+CvPhHU9Xwbri
 /CJEQOMag7hf0oi7aXpLfr+hP6mgxZ734g==
X-Google-Smtp-Source: ABdhPJxPWDn1mFyH8gk3X7PBRa9eGUFEI04KngwIWTauWTcOlrA0foHSD+6GS+9ziK5jYsbnzB3dzw==
X-Received: by 2002:a50:c35b:: with SMTP id q27mr63056301edb.154.1639394166451; 
 Mon, 13 Dec 2021 03:16:06 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:05 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/5] gqa-win: get_pci_info: Clean dev_info if handle is valid
Date: Mon, 13 Dec 2021 13:15:50 +0200
Message-Id: <20211213111554.62394-2-konstantin@daynix.com>
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

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4e84afd83b..3dd74fe225 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -514,7 +514,7 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,

 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
-    HDEVINFO dev_info;
+    HDEVINFO dev_info = INVALID_HANDLE_VALUE;
     SP_DEVINFO_DATA dev_info_data;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
@@ -749,7 +749,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     }

 free_dev_info:
-    SetupDiDestroyDeviceInfoList(dev_info);
+    if (dev_info != INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(dev_info);
+    }
 out:
     return pci;
 }
--
2.25.1

