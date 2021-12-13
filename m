Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7F472B4E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:26:06 +0100 (CET)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjT0-0001Bk-SY
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJW-0008WI-Fs
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:15 -0500
Received: from [2a00:1450:4864:20::52f] (port=37457
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJT-0007Fp-9j
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id e3so51520323edu.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7sBF+Qy7/vzAjQ+8VJmnouHX5HxqVw+CgpLyJxT4k1k=;
 b=NRqDmXorx8tsujvCUJOAt/z7zgkL29eL4O4bpgM4Jotg4Odx33X2p3ICUmSNY25cv2
 7QiMBSXHb8+9mxMzhGEWp1CBfZyLYA+H0PQhWTyZM5rWU+BxB2v96CdHZlBT5V8IHhge
 qhDFaBb6UajJ+aVArA4oMW6+cwqMU8CcxErYZ67uyd0pcPZRQ8Q0Y9yfXfWXre//FeC3
 pZhUaxXf/6P7/flMfdladYBnrcN83yydG0Z7nKqsQCaPHC3ogViFcFy97t+i8bD2PRyl
 gAKrynHNg18+VZiqKmh0rJ+1qteb8ZCCFuYKswbNPK7m6GaOGtbunRzDMh/0Gl4h1Lxv
 PF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7sBF+Qy7/vzAjQ+8VJmnouHX5HxqVw+CgpLyJxT4k1k=;
 b=d2jCkqup0l0JLy8+bC7xyblnMqLOvrssxpX4ZwnWWkx0zMsYrT0f5BrHOaMzvqR4vM
 b4z8CoBBdI4ZfKZHxmgEcHDEinP8UnQAdxsHgPf/tyoL70Jk/BQMUfzEhX0Qx8AyEuP+
 6DjOEFvMepxjgKdA2nz6+MqZsyGN3PVpEWbGauEXNg+cVTaadJ4uW2sIyy3TQEACa1Z/
 aKliwry1SWxg+W3cZjQpCASIPYDz7Q439TWOYCgKpnSBBlt3UO9QnpJisjWBmnl9Le5p
 jSzxw61LJsOounnGY8LlhBn78IsDJbmLHm7v0N9butENCse6+wO1Mm7m4Lm5UGIE2bPW
 gz4g==
X-Gm-Message-State: AOAM5304vP+LY8Wc+kqYpb3WE+DY4Mvei4ubxoEsZU6exsBRApFvIVhj
 tA9MR9a2v36Tcf43ETihPbReaKKfS90unw==
X-Google-Smtp-Source: ABdhPJyxaZbWeHq0nWOg9jKWpG8hywPhAzhu9QiMaeVHylK8lEQW3sxZtullFO5O//WCL5dFYhh54A==
X-Received: by 2002:aa7:d748:: with SMTP id a8mr63669081eds.21.1639394169212; 
 Mon, 13 Dec 2021 03:16:09 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:08 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/5] gqa-win: get_pci_info: Replace 'while' with 2 calls of
 the function
Date: Mon, 13 Dec 2021 13:15:53 +0200
Message-Id: <20211213111554.62394-5-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213111554.62394-1-konstantin@daynix.com>
References: <20211213111554.62394-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x52f.google.com
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

Microsoft suggests this solution in the documentation:
https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-setupdigetdeviceinterfacedetaila

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index cef14a8762..6bde5260e8 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -552,10 +552,10 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         if (SetupDiEnumDeviceInterfaces(dev_info, &dev_info_data,
                                         &GUID_DEVINTERFACE_DISK, 0,
                                         &dev_iface_data)) {
-            while (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
-                                                    pdev_iface_detail_data,
-                                                    size, &size,
-                                                    &dev_info_data)) {
+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 pdev_iface_detail_data,
+                                                 size, &size,
+                                                 &dev_info_data)) {
                 if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
                     pdev_iface_detail_data = g_malloc(size);
                     pdev_iface_detail_data->cbSize =
@@ -567,6 +567,16 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 }
             }

+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 pdev_iface_detail_data,
+                                                 size, &size,
+                                                 &dev_info_data)) {
+                // pdev_iface_detail_data already is allocated
+                error_setg_win32(errp, GetLastError(),
+                                    "failed to get device interfaces");
+                goto cleanup;
+            }
+
             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
@@ -597,8 +607,8 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             ULONG dev_id_size = 0;

             size = 0;
-            while (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
-                                               parent_dev_id, size, &size)) {
+            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
+                                            parent_dev_id, size, &size)) {
                 if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
                     parent_dev_id = g_malloc(size);
                 } else {
@@ -608,6 +618,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 }
             }

+            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
+                                            parent_dev_id, size, &size)) {
+                // parent_dev_id already is allocated
+                error_setg_win32(errp, GetLastError(),
+                                    "failed to get device instance ID");
+                goto cleanup;
+            }
+
             /*
              * CM API used here as opposed to
              * SetupDiGetDeviceProperty(..., DEVPKEY_Device_Parent, ...)
--
2.25.1

