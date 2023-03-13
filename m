Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EA6B7121
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdVb-0001Qm-23; Mon, 13 Mar 2023 04:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdVB-0001Ao-T5
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:54 -0400
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdV8-0000ba-GP
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:25:53 -0400
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 287108782
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0WFoHqKTXHHOWmTeFE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENS1DZWx
 2QaDG6HOveLZ2f1ftt+aI/j9UJUuseGytVhSlRorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8kWo4ow/jb8kg3562p4GlwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69NVEWYoJJIRw/pMPjtB2
 PFbJzZQUw/W0opawJrjIgVtrsEqLc2uJZ9G/386lWmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2A3NHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTiMlVQhj+i3WDbTUsaKZt94skOIn
 2Hh0T/cM00CCNKlyzXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rhTzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:i97DQa4ZoYPUg/xESQPXwPvXdLJyesId70hD6qhIIiYlFvBw9v
 re/sjzsCWe4gr5N0tMpTn+Atj4fZqxz/JICOoqTNSftWvd2VdARbsKhbcKpQeOJ8SUzI5gPM
 lbHZSXL7bLfD1HZf2Q2njeLz4Yq+P3lpxAjN2ut0tQcQ==
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:25:48 -0400
Received: by mail-qt1-f200.google.com with SMTP id
 r3-20020ac84243000000b003b9a3ab9153so6454168qtm.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpeFkI+n/R4JnjsLeFjb8CrnOXuUwmA/btTZScIGnXo=;
 b=bMMqmklJPiucjcRrFHTgtE/MLYv/2okRD40GEKh882iwDYeTAUFoPnImaoeQXn/4zD
 +L9u8RsCvMnYNedNqmjEQkpCp9grzyzyRGVXyyn4J0nzk4+REAqL+htsV/PH8linMdp1
 uHxKOMZFUGSH2oack5IAjjtJ5dR0nizKJ63s1EvvKfchvmbJdM3TWZn9EEe8s/dL0kL1
 Gd7dQ7V0RXZ8KNW90B/o0inGkXPSbbcZ9KjLfZThyzHDEM3XNKrYJoP6g0s+b6WIt06t
 OuIUwRzVMqiA2j5GZCjWUkNGGparOD9uZgqQNcSbSzaOcs/hJTsOrgP+kpyVFRfGxLbU
 u9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KpeFkI+n/R4JnjsLeFjb8CrnOXuUwmA/btTZScIGnXo=;
 b=aOxYGAI8unC7LxjkOk3urSiAKsYYU2lsEV752T02PkbtPZjKRKCoMUg9e+i5F13tWa
 CndwrAQ0I+ufB09AIdo7ZsgqfNNjzWY1O66NozQuEX+Cnha0VAGitBpvsspcKjFIcycy
 yLhIt0hTMLCfAKQwyoQnvI3gz/6giq8U87PDO09cFRvsBxWw8N2RlMrkDwwh7RKx8QLZ
 Ro9B0FizHkt86UxtYPl8E/9RyS2QaeYLoCWs1U4eXLvpd96Nm8BhhAjWfP3G3fhlk8Xh
 6zz2Gs4ID8aHEz72hZ8ZrWk06tUBqd+3tTt7Jg3C9sDNbaSEmRoRPY9YQslgETqyfNkO
 pjSw==
X-Gm-Message-State: AO0yUKUbfSyLHinhBMq2Cn9PsCwoshGmsB1LGAhHpUcN/9gynvXcVmBb
 VFVNe6pgBDMnh0TJyrT6lajmZWogUKnnkFPQRkkQTMRmu3SLtXNbAu2JdLaCR5gysQb0JD/6Hs0
 tnago4k52Cav1u0TptwqBTLe+UzpuNifNWS72LWaTXZY=
X-Received: by 2002:a05:622a:15c2:b0:3bf:cc1a:f0bf with SMTP id
 d2-20020a05622a15c200b003bfcc1af0bfmr62235703qty.24.1678695947577; 
 Mon, 13 Mar 2023 01:25:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+vhAvRPaKaOApdS2WxqDHC1jnbCz5it639ctifSVqlSqXngL3WZ1tEQuqp6/ltI2eh1SN8Bg==
X-Received: by 2002:a05:622a:15c2:b0:3bf:cc1a:f0bf with SMTP id
 d2-20020a05622a15c200b003bfcc1af0bfmr62235683qty.24.1678695947350; 
 Mon, 13 Mar 2023 01:25:47 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x27-20020a05620a0b5b00b0074230493ccfsm4911867qkg.73.2023.03.13.01.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:25:47 -0700 (PDT)
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
 Siqi Chen <coc.cyqh@gmail.com>, Fiona Ebner <f.ebner@proxmox.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v7 6/6] lsi53c895a: disable reentrancy detection for script RAM
Date: Mon, 13 Mar 2023 04:24:17 -0400
Message-Id: <20230313082417.827484-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


