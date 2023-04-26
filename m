Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D58B6EF852
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:22:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhtS-0001Ws-Dm; Wed, 26 Apr 2023 12:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhtP-0001T9-Pe
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:21:19 -0400
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhtN-0005wn-JQ
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:21:19 -0400
X-IronPort-RemoteIP: 209.85.219.197
X-IronPort-MID: 298807095
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pscfZ6B/yZWXRBVW/5Hhw5YqxClBgxIJ4kV8jS/XYbTApGsq0zQOz
 DcXWmiCPfmKYmqgf90iOoWw9hsC7JaEx95gTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0ilaYDkpOs/jY8E814qyo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPd3uw/PmQVZbQY0cFUD3MQt
 tolLDk0O0Xra+KemNpXS8Fpj8UnadjhZcYR4yA/iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxAOGUHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBmsziLk1QgjdABNvLOPeHQdNwEjH2Ro
 3ro4FiiDi0FF+KmnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkF8HNro/FjqwqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXDRcJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:FLLm8q5lfUscqeI6XAPXwbaCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQwdcKO7SdW9qBLnhMxICOwqTNWftWbdyRCVxb9ZnN7fKlHbakrDHgA079
 Y/T0BRYOeAXWSSp/yKvDVRKr4bsYi6GErBv5aM854Vd3A0V0gC1XY0Nu/4KDwNeOAcP+tlKH
 P03KMuzFDMFRt4H6HLYkXtcNKz8+Ej/6iWOSLuciRXkDVm+gnYkYISfSLouCv2egk/jovLMA
 D+4lfEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwiy6zDb4RFYGqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg6jAz8HXvoGXowEcL4PaJBA7SOfAxx76xQSGprnbIe+sMlJ
 6j6ljp9Ka/yymw2xgVqeK4ES2C3XDE3kbK2dRj8UC23uMlGeVsRMokjRpo+d47bVPHwZFiH+
 90AM7G4vFKNVuccnDCp2FqhMehR3IpA369MwM/U2Ouok1rdV1CvgIlLfYk7z893YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXeD3cZew6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdsWIpYUrhBcCHwZUO+BHQR2e2Wyjr16hlltJEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2I55SC++LFxqZJW4EtDeOL6W66UNuJ/H9luxLKW5m+Pi7WrECntarA8ruGA==
X-Talos-CUID: 9a23:MMPUtG8tF2YmyrxlBLCVv38JA5EXV16F9Xf7BGy2GzgqboCRQGbFrQ==
X-Talos-MUID: 9a23:+Ya9PQToaRGDXY9cRXT3www4Bd458Z+nDVgjjqldt/WbFhJJbmI=
Received: from mail-yb1-f197.google.com ([209.85.219.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:37 -0400
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-b9a2b777ff2so2719266276.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526036; x=1685118036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=QoIDC32migVEzUPBoeoodOuS1v0jNqOULXEcZafDuMTZhw/vIeBLq5i37qCUuxhAH4
 uWskatSsk5al1HKfr/SXmHqT9O/bALY8NgQEb4T390sx9PSTz/uk4W2y59UtJtxvXwXi
 dOwaoKuYLyIwgT4mp92iqXuH/BZviz0YohS8Vz2S3fCyB/oy9eQdIwf4U7Z58B41rGPi
 eO9bcKpWICvcrfD5Da8M4l9eYK5wsuLwuNq78iBi+ZenHqoleEebAoi9b4Pxv8c5wbki
 o7CH5poCxxmHEuj1tS23ntch9rZVt7IlIrWH0ox9pjOUhGvFEtyfHBMJNfgQXvSGesG6
 nUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526036; x=1685118036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=W8tf3FW5gxaHcNfVSAkV+y/A86zZrTw/cBc0Y7FJnKJiXmOOncFbjZLttuR+EOMj2/
 SS5ycmHISQA3ufEH/e4+BuK73Sd0lQ+7kVNmEq1pBWKwxAioPLxjowFla5FXDluPSWsh
 LtCqZiGweWkz1WHnh4IKJFs3Aj8duq6BEsbLMKjqxR8uqcSn4L/aiUUbyoni8/6rWft1
 fOyM679Uu1O5nPsDxhBU5mEWInuVl5QVK+bZmCLZaM7niLmK4zFXQ54sr0rvYKlDLeDq
 ku+dElXnYpQrXblb7Sa3rKUDg3SzJqG2stM1WptwrSaxn5g+HqflJNH0dQdXRDgzGBQ+
 H6Jg==
X-Gm-Message-State: AAQBX9fJBJ4g6to+lvbumHTb6gsKb1OpDSq1u05yRdwOCD13ns2+Cs0B
 bFSmnLnMqUhuuZiy/2iiP3A0Cyes/RSy4yjvBnoS0RJBPPeTHXJr/5U00sGVR7fYJ2JBBVb9PnP
 LhJBwcC/G4RkYxrMm9pody4Zyov7BV0pRPVJowilRxcA=
X-Received: by 2002:a05:6214:5097:b0:5df:4d41:954d with SMTP id
 kk23-20020a056214509700b005df4d41954dmr34483371qvb.3.1682526015565; 
 Wed, 26 Apr 2023 09:20:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350YCPqhh2ueUNhIuDIWpWIA4JFBO5U0tZnkeqz4bLtjv4MFDCuE3rLbrYFCY7PqxcXUIziSuHQ==
X-Received: by 2002:a05:6214:5097:b0:5df:4d41:954d with SMTP id
 kk23-20020a056214509700b005df4d41954dmr34483328qvb.3.1682526015314; 
 Wed, 26 Apr 2023 09:20:15 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a0ce211000000b005f5b71f75f3sm4950683qvl.125.2023.04.26.09.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:14 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fiona Ebner <f.ebner@proxmox.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v9 5/8] lsi53c895a: disable reentrancy detection for script RAM
Date: Wed, 26 Apr 2023 12:19:48 -0400
Message-Id: <20230426161951.2948996-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As the code is designed to use the memory APIs to access the script ram,
disable reentrancy checks for the pseudo-RAM ram_io MemoryRegion.

In the future, ram_io may be converted from an IO to a proper RAM MemoryRegion.

Reported-by: Fiona Ebner <f.ebner@proxmox.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 hw/scsi/lsi53c895a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index af93557a9a..db27872963 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -2302,6 +2302,12 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&s->io_io, OBJECT(s), &lsi_io_ops, s,
                           "lsi-io", 256);
 
+    /*
+     * Since we use the address-space API to interact with ram_io, disable the
+     * re-entrancy guard.
+     */
+    s->ram_io.disable_reentrancy_guard = true;
+
     address_space_init(&s->pci_io_as, pci_address_space_io(dev), "lsi-pci-io");
     qdev_init_gpio_out(d, &s->ext_irq, 1);
 
-- 
2.39.0


