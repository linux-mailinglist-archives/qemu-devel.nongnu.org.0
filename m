Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B86F0DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tA-0005sq-PY; Thu, 27 Apr 2023 17:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8t6-0005rx-0t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:49 -0400
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8t3-0005MH-82
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:47 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 273267400
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+IGXKaA07k9pqxVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApGwrgTIDz
 WEeXT+DPfmIZ2X2fdAlPoWx/U8G78DSy9Y3TANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0ilaYDkpOs/jY8E8146yp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPGyqpEF1smALEkubl7XmJWr
 sJHGTskO0Xra+KemNpXS8Fpj8UnadDoZcYR4yAxiz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGsHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBouDKNk1ApiNABNvLqIPGTdOkSwX+U+
 ELFxELhHA0cOe6AnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjpQqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXQDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:tpe5R66AU/ywPhytLAPXwPHXdLJyesId70hD6qkRc20tTiX8ra
 qTdZsgtSMc5AxhP03Is+rwW5VoOEmsl6KdgrN+AV7BZniChILAFugLhrcKqAeQfxEWmNQts5
 uIsJITNDQzNzVHZArBjzVQ2uxA/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3AJ+VyKWnx4lwOShyXdceA2zgtfnrXOVfUk13LOV+?=
 =?us-ascii?q?FNVoqF7HKSkfLxvxVmOM7zg=3D=3D?=
X-Talos-MUID: 9a23:q2HQIgrTUrfcNGGofpoezw44Gd5Zz+PxMUxTsZY9ndGaKSp9CSjI2Q==
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:43 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-74e0cfab3f0so1383337785a.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629842; x=1685221842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=KW7CV0J6EY0fDwThGtGw2mV/XIr2QVr9ZzmmCxQL3KD5G23HIbJP/Ts25JkCfWJ+RC
 IxqH5DOE5TQpIU5qq1u4hOuL3nbZrAkljXBE8lakBfKn7bTXfWNyNOCZz14xAvGyp0+S
 2hGWcspqZ4+8E2sXL+sv2K0mdNtZj2GbZF9R1aa0i6SV9V89V7VGCreAM1BlXZ8ybVrV
 rqHkU/HW4W5kRTo+9zfKTibYMRJ9flsws+Snd0flNLR/81a6s0K1F6xk6k+oQ4LOPkO9
 LYW0Q/4CCusiAk91x76HiHDTm7kXIVoCebsvov/G4taQnZfTgFuXGz/FGKq8VHbM4P9n
 agQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629842; x=1685221842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=cxMteY2wlHYSqj5WPa+TnQcxF9K44l6TrhekrJHif6A6d0hL11FeXK2frH6bcPi0Uk
 1IWQE+xitGhHt+UrCXlzO0fxn/raDFJ4RZGghYS1cNGuxb1jHesWwFpCncFb42Y7hu6L
 Qcd7ynkWDwo7Wq1yY3LhmcAtFfC632qr/H9QMyww5Z2uli4xjJBIJxiF26aItcK5+udW
 riuyKvZ39Sl6/d9o0hPrkYlIsKMnxjDNCra+STHunq3DE/5E75brKZExlCQMtktTJnI+
 l/0ihN7dLfWbQcP24UhNIUclfjqhBdOZ1h4YsjaCl0PdgpyyuB/OgQkICWnJcLHu9Rie
 FJtQ==
X-Gm-Message-State: AC+VfDz2r+E1oowp2QLPUVlejiEKprhnO2wDbv0zwSiPwX6+DgnU4gRZ
 EPU2D4lAo4j4Q7busM7lY2x/BfuZ+Fabr+pdJ50bxwD9tAqSilSoeNWfIYXB2ZUQPan9PjhBKn1
 osevOOpvycpDPjjSNSVH+dT/13UoSsZ8vI4aoK2LYPbg=
X-Received: by 2002:a05:6214:20ee:b0:614:da60:f45d with SMTP id
 14-20020a05621420ee00b00614da60f45dmr4902469qvk.30.1682629842287; 
 Thu, 27 Apr 2023 14:10:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6B2366U41LLQszN6ihcZBrJk8YDRrKzcE3mBVfX6MFBk6kfHQJtYnCxk0tCNi7X4uqKewdLA==
X-Received: by 2002:a05:6214:20ee:b0:614:da60:f45d with SMTP id
 14-20020a05621420ee00b00614da60f45dmr4902422qvk.30.1682629842058; 
 Thu, 27 Apr 2023 14:10:42 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z30-20020a0ca95e000000b005ef61084fddsm5909401qva.131.2023.04.27.14.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:41 -0700 (PDT)
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
Subject: [PATCH v10 5/8] lsi53c895a: disable reentrancy detection for script
 RAM
Date: Thu, 27 Apr 2023 17:10:10 -0400
Message-Id: <20230427211013.2994127-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
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


