Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E4954627F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:34:52 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzb2Z-0000ZA-1Y
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYA-00028Z-V5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZY7-0006Qf-H8
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFf4woivlgGIhUXgkypBGc3W4vwTg3PU5HRExeu4NKE=;
 b=MG45pgEOK+RegKXzOIq46uaVdN4swAlJoJoeuSUaNlLDR7UEBLH63ORzKSuIMyvkhFT1Ty
 JdAjb6LuDr/iGvYz6+D6oziBOTN34lUsx1av6JnPG09JY0GUd8NRuSPlK+rQyQvbSwbhsJ
 ikN6+E7Dc6yZAu3y88BaujOxkv8aQ+o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-rm_JF7_3OKygNvkFajXi0A-1; Fri, 10 Jun 2022 03:59:17 -0400
X-MC-Unique: rm_JF7_3OKygNvkFajXi0A-1
Received: by mail-wr1-f69.google.com with SMTP id
 c7-20020adfa707000000b002184d715e69so2930504wrd.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jFf4woivlgGIhUXgkypBGc3W4vwTg3PU5HRExeu4NKE=;
 b=GBBkpeW8E12Jd9Pgo8Tngd9WdC9tS0XULBSeoF37aB8wA4b9prEc6CPCdw8mZnpTsU
 OV5SnWbJSzPGDdPQb0bDTQy3MWrrkxuka9LrJ7sM55tcLiZQpUKNdzjA8oo2SsG+zXQy
 Vu8LPnyPGPpPkt87O1VrIAp6Ls0zOaF+1AdH7bCBXdWwxLDQ1XZdCKA7fpBDBWJul/Kv
 Wl1+iNcharH2+KmlWDRZIBGsB4Ud0YvMLGK/4foL2wNuk3lr9tGcQiZvPEV5jvzj96Bi
 YKg3yhDl2Z2aHcugHMI6yXWeV1mmXvrw3GI2Buw3Yl3N7xiYjhWYPdlLSvh4p7ZGFdlp
 emiA==
X-Gm-Message-State: AOAM531jyJgPKfqNBoLGs7w/3YkIG5MRedbs0RWOd4ajkfLlM043fSt5
 uAgMC1T9xKEJVBQp5lj3KETzNUwjsJJOsTDfKjh3DYfRrZCSBLvV2+4ncMdegBoDrsQe3qRdY84
 fPacD9n6vLAte/Nly57Hwo34kKomswl9dU6plEaNEUshkMfJIZTkeytzaWMes
X-Received: by 2002:adf:f390:0:b0:218:4de4:510c with SMTP id
 m16-20020adff390000000b002184de4510cmr19434429wro.475.1654847956323; 
 Fri, 10 Jun 2022 00:59:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeE9euYqVck6zjVN5GYaZMZkz/ySz2j0Y2UBDbLULqcLLETfX1TJUK7EwwkOyNJnJQkDttUA==
X-Received: by 2002:adf:f390:0:b0:218:4de4:510c with SMTP id
 m16-20020adff390000000b002184de4510cmr19434400wro.475.1654847956000; 
 Fri, 10 Jun 2022 00:59:16 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 h6-20020adfa4c6000000b0020fe61acd09sm28001338wrb.12.2022.06.10.00.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:15 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 Dario Faggioli <DarioFaggiolidfaggioli@suse.com>,
 Martin =?utf-8?B?TGnFoWth?= <martin.liska@suse.com>,
 qemu-stable@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 44/54] pci: fix overflow in snprintf string formatting
Message-ID: <20220610075631.367501-45-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Claudio Fontana <cfontana@suse.de>

the code in pcibus_get_fw_dev_path contained the potential for a
stack buffer overflow of 1 byte, potentially writing to the stack an
extra NUL byte.

This overflow could happen if the PCI slot is >= 0x10000000,
and the PCI function is >= 0x10000000, due to the size parameter
of snprintf being incorrectly calculated in the call:

    if (PCI_FUNC(d->devfn))
        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));

since the off obtained from a previous call to snprintf is added
instead of subtracted from the total available size of the buffer.

Without the accurate size guard from snprintf, we end up writing in the
worst case:

name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) = 51 bytes

In order to provide something more robust, replace all of the code in
pcibus_get_fw_dev_path with a single call to g_strdup_printf,
so there is no need to rely on manual calculations.

Found by compiling QEMU with FORTIFY_SOURCE=3 as the error:

*** buffer overflow detected ***: terminated

Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
[Switching to Thread 0x7ffff642c380 (LWP 121307)]
0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/libc.so.6
(gdb) bt
 #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/libc.so.6
 #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
 #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
 #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
 #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
 #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
 #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
 #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
 #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
 #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
 #10 0x00005555559a6e5d in get_boot_device_path ()
 #11 0x00005555559a712c in get_boot_devices_list ()
 #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
 #13 0x0000555555bf4c2d in pc_machine_reset ()
 #14 0x0000555555c66988 in qemu_system_reset ()
 #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
 #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
 #17 0x0000555555c7b459 in qemu_init ()
 #18 0x0000555555960a29 in main ()

Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
Found-by: Martin Liška <martin.liska@suse.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20220531114707.18830-1-cfontana@suse.de>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/pci/pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9b37f8000..6e7015329c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
 static char *pcibus_get_fw_dev_path(DeviceState *dev)
 {
     PCIDevice *d = (PCIDevice *)dev;
-    char path[50], name[33];
-    int off;
+    char name[33];
+    int has_func = !!PCI_FUNC(d->devfn);
 
-    off = snprintf(path, sizeof(path), "%s@%x",
-                   pci_dev_fw_name(dev, name, sizeof name),
-                   PCI_SLOT(d->devfn));
-    if (PCI_FUNC(d->devfn))
-        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
-    return g_strdup(path);
+    return g_strdup_printf("%s@%x%s%.*x",
+                           pci_dev_fw_name(dev, name, sizeof(name)),
+                           PCI_SLOT(d->devfn),
+                           has_func ? "," : "",
+                           has_func,
+                           PCI_FUNC(d->devfn));
 }
 
 static char *pcibus_get_dev_path(DeviceState *dev)
-- 
MST


