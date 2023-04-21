Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E66EACE9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:29:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprlH-0006c9-D5; Fri, 21 Apr 2023 10:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlF-0006WX-38
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:17 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlD-0008FM-CJ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:16 -0400
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 277638507
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f9cC+6Ali7eQQhVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApD931D1Ty
 TYZWz+PbvrYY2GgKoh0Pomx9kpS65LcnIdiTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0ilaYDkpOs/jY8E815ayr0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPO+txNL1koB7Ei59tHInlv9
 tNHCA4kO0Xra+KemNpXS8Fpj8UnadDoZcYR4yA/iz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGUHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBovDaInFEpj9ABNvLMcYOubIZIpH2Ug
 TnZ41b3Lys0Dv6mnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjqwqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXADokhYphAQaifIL
IronPort-HdrOrdr: A9a23:gVWhhKMkeWz2fcBcThejsMiBIKoaSvp037Dk7TEUdfUzSL3lqy
 nKpp4mPHDP+VAssR0b6LK90ey7MAjhHP1OkPQs1MmZLXDbUQKTRekInOjfKn/balfDH4ZmtZ
 uIGJIOb+EYY2IK6PrS0U2TP+xl7uO60J2Fs8/j8lYFd3AUV0ii1WtE48Sgf3GeiDMpOXNALu
 vl2iOPnVXARUgq
X-Talos-CUID: 9a23:2iNiBW/E4QxeqIcbK4CVv2wtM+MGamPn8E3NHn+bEUdqZ+K1d3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AvVrF0A77r76vC+rHf1TsmnyHxoxx6PuKIQMQq64?=
 =?us-ascii?q?KnJKbKR5+Fg2zthaOF9o=3D?=
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:29:13 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74e1b845790so245144185a.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087353; x=1684679353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=JMZbQQu/dOnzJN5Rgehj/tR+I78YQobWuhj1Kg0Mkv4iCApt7hGFGqlJpanS0r70Yd
 wzWpvdVs5HoicwSpREylC0cvkGLC3GwqqUPX6GnrO/MObfPcuPLCrpJtfzGcOrHmsh2Q
 9G/9dpr87waOyYQP5G1AGUy7RIjnn/BgdK6hrJAz1RWqRpH1tDzEkrfV4G6frEO1heiD
 uDVfNqYsx46y75thm/cygv34triEaXBb+Lp4j+8fYrAOgK2G/7EMvMUdeoHvsJk5kYtK
 F25sTCqxoM0d/jVqmgsbF46ETWQBR/acTF8f0d3DJUfUb2mCF2FjcAl5wY0N1SH7r+rs
 pORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087353; x=1684679353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3SdAMrXHXFKpIl5axn2Wa+vv4dRDlBMdBU9qEifc6x0=;
 b=KIEM5elwcRxwFGdAqYDsKgCg1x0icEyEIJeIg+g3rAy7Jkxyrgk6mg1+P0Owyc7B7q
 76YcG4I+XUuO91gS/B/cOzRztFR7OQmSzA0pYcazz9p8Fguvs4kIY+0g2pW7SlwQRieu
 xuLlytnT5vKE3Kfw4c1QAVH31gpUPMtZGFeh+nsoTtAhqpEYmSo1UfshBk/UmqKR6XQ8
 Bv6j6lAaAoOGYKVROp3qu+d6MypP4RPzsBi4vQhsWc0e+MPCbDvW76AJGMSXnSzfIbg/
 TAKQzpopcS1r9Pzb5lpwtnDlGVowGFH7R0UDRbEyq0KcuOWZjUPA1UdTfHPWDP1I7Xk8
 9nsg==
X-Gm-Message-State: AAQBX9eRnrud6AiKbeGje9PybBy0CurzLQUxnKmphCuj5D89slFyHQjN
 dyvTNoX+oLgUBp8nHWt/eujCM+elwnlRF/YpBC7BB5+GfgaSiJ9rDbNUBugd8qVQg95sNZxHceb
 Kjf1U6oqxmvNQH16Prt5XxyvrUjmqkCaVoXwCUxPw2rc=
X-Received: by 2002:a05:622a:206:b0:3ec:6cc8:fb0f with SMTP id
 b6-20020a05622a020600b003ec6cc8fb0fmr8243465qtx.49.1682087352906; 
 Fri, 21 Apr 2023 07:29:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZalHBpgFRaDNiQ4J7yRruVopNuu2TlF4in5LUH6xeVM6kwppXymvhnpDGa2u6wHQKfWwkL2Q==
X-Received: by 2002:a05:622a:206:b0:3ec:6cc8:fb0f with SMTP id
 b6-20020a05622a020600b003ec6cc8fb0fmr8243422qtx.49.1682087352631; 
 Fri, 21 Apr 2023 07:29:12 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05620a278d00b0074ad1e1fc3csm1373022qkp.2.2023.04.21.07.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:29:12 -0700 (PDT)
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
Subject: [PATCH v8 6/8] lsi53c895a: disable reentrancy detection for script RAM
Date: Fri, 21 Apr 2023 10:27:34 -0400
Message-Id: <20230421142736.2817601-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


