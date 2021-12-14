Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B64742F3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:52:23 +0100 (CET)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7I6-0002NF-GX
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77W-0001og-9M
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:26 -0500
Received: from [2a00:1450:4864:20::533] (port=33762
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77U-0004cL-2N
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:25 -0500
Received: by mail-ed1-x533.google.com with SMTP id t5so62347068edd.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dtsh7aTiptfdoEl+40W5A3ttiw5rsibSMoGvl8oqbN4=;
 b=hd2FwTfOjyqfZ31y4rsu+JcX9D2iqqMXH6PotnAJSvK3tTu2JS8/D9OrExgZ5uVYJQ
 85skFZR8Kd2HXSorO/Zh0lAhMeTO/czx/16A+YbEq5bdVUZVsQn+r53n4U2+w/KL9JTe
 mo5c34bVoqaIuj1soSH260AVuw//BC//58HmxBVwZKRklY5F+RWMqpvpTM4UzVOHjF6G
 ZkUwFJsePwVuPNdzVJt77DNZAgNViOkoC4Xy2s0a4SCpkxws5qb9EdkQVbQahSUusBkL
 E5Vskz75L5zMk9gml+TlexKUfVQeImqi8BEfi6w1LuzNgwRH1/weuGxLvjCon4xUy7K4
 +Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtsh7aTiptfdoEl+40W5A3ttiw5rsibSMoGvl8oqbN4=;
 b=boBYKBer+/MrymYJyHkwx2AB1HwJY5J18Zw98D34ZyvycstDyPPoBP8ohs/wXWDLJF
 prrdvs9yNAtA8M6AFfmwgQkikuLJH4XZlNKFR83MF1GbXDcEclOMfNwXcT+BOwtFznwQ
 nYijec4hVLasdkbJUA6NKhx1/GVYEXfH5TObMoKH4a7jN8ezC87jE3ayeiHTrH/Gmqmf
 n+jMxAa0uOMhtc6nxNyKG5WFWydAiMOzbxg2zW0W27nNTX19KONoME5qJE6pSxp19aZm
 abYHFXudk13ZtC6LonTbVm8GPqs3CkZ9BjZVKKmhSQuRgJKoRX3tS/GgHUCgX2Cnp8/1
 K/ag==
X-Gm-Message-State: AOAM532ay42ZNBp4KesOkJSvv1dhy1jZ8MsYeC8VeQmwqUgsZo14Heyy
 jHJ7179FqJLyP6bNne3MinEfgjNWipkPnOPE
X-Google-Smtp-Source: ABdhPJyd83xxpmQIfAikie71MvnaeGALwjJ/JoIKIH5Z+uzCfI80Lwdt2qF6IBx+yyGpLDd5uv+I0g==
X-Received: by 2002:a50:d741:: with SMTP id i1mr7563875edj.37.1639485681615;
 Tue, 14 Dec 2021 04:41:21 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:21 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 5/6] gqa-win: get_pci_info: Add g_autofree for few variables
Date: Tue, 14 Dec 2021 14:41:08 +0200
Message-Id: <20211214124109.103102-6-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x533.google.com
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
 qga/commands-win32.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 8588fa8633..3092566313 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -626,9 +626,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
     dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
     for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
-        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
+        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
-        char *parent_dev_id = NULL;
+        g_autofree char *parent_dev_id = NULL;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD size = 0;
 
@@ -654,7 +654,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
-            g_free(pdev_iface_detail_data);
 
             if (!DeviceIoControl(dev_file, IOCTL_STORAGE_GET_DEVICE_NUMBER,
                                  NULL, 0, &sdn, sizeof(sdn), &size, NULL)) {
@@ -741,7 +740,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         parent_dev_info =
             SetupDiGetClassDevs(&GUID_DEVINTERFACE_STORAGEPORT, parent_dev_id,
                                 NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
-        g_free(parent_dev_id);
 
         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
-- 
2.25.1


