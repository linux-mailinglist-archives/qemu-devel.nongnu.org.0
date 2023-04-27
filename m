Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59ED6F0DAB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tL-0005wu-Pb; Thu, 27 Apr 2023 17:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tJ-0005wD-I5
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:01 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tI-0005Ov-22
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:01 -0400
X-IronPort-RemoteIP: 209.85.160.197
X-IronPort-MID: 279189031
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NWQ9OatJlLyuki7FmAlnZjIIHOfnVO9cMUV32f8akzHdYApBsoF/q
 tZmKT3SbvvbM2HxeookPN/n9E4C7cCDz95nS1Rlqn1kHnwR9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBkOqgQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqU34PZ4CkVp5
 cZFFxAEaQu8v8WYyZuCH7wEasQLdKEHPasas3BkiCjFVLMoGMGcBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2eO1sWawh/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKyYYOFK4TRHK25mG6Su
 U/Lr07EOi1DJfOuzh+C43eOi9L2yHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyUoC4UUTp/ziLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO75FeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:0y2CWageyocUg78Kg6URRATF4HBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
X-Talos-CUID: 9a23:Y/Yitm7s+1NR90DwZtss21QEFcsBVW3nkUjwKkijNl5OZrS8cArF
X-Talos-MUID: 9a23:y0solQsOaw4xytAJdM2nji5POZdC3pySUVEioJIjvNiBFyFNAmLI
Received: from mail-qt1-f197.google.com ([209.85.160.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:49 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3fc80bb6so103868531cf.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629848; x=1685221848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68oaiYGL7UhG3W5jva6oSZ0GIeZDrcn2k6P7uHwGxlY=;
 b=YSJAwvgbkH9fCZCzgmtIGlAln585VR2jxmWRALT8Yi2/XojQ5qUBmUfQEzau/aCnEK
 7DCedm+QrBtV8fCgFzEBNcckbrbiaGOzt7ihuhMcFBsWIuVhuNq4x9thhQST/QW/mWbR
 5sdJ0Ydw8YVaTPhpoBKMYZfOedNPehCOATEndJ2fmVdQDYcTrHzryH0sp4dZwvUgDjNK
 u9XAsGMywpSbUoVvtSIf7QqAPMLp85ZkX1/yuZsdo0j7phkruWM7ZjL5KfmffM7Cjw0b
 WwKizpYWu4jEYS4o8XqazzJoMXFZeYbZhLSdZQc6Bs+HQsSSwm04Gaaqyl5V6sbvYP6C
 AnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629848; x=1685221848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68oaiYGL7UhG3W5jva6oSZ0GIeZDrcn2k6P7uHwGxlY=;
 b=adMb1cepxVE144y9Xzi56+dSBgLJ1tk8vfCacMYy4ya6YCNJXzR4XQ8ZBmFSz8+3Or
 KuoRT6Ot4VstozyBvMM8UL2IROUPQHmaATNvNgZffurNq6GscbAmbt2n8DLjRKltGoOr
 5YYjX/F2JNmR2JsR41+jLYrpN0vuWNg2JsSSknw/E1t8jdQz3GDZ8kW3UrcTl24wNHfU
 k8j35JoBusxM68sAXFeBnYOdlDXxCpcn4Z9tifZBaaBfKRVTUpVd/8Bif802HoF4Osd9
 t4sRd9K+wrx2q7Q53GrlxfQiMP/NbAUQxk1QTjOxFlJxhg1W/4h+vPVIegaSJ11nuO/y
 Fg1Q==
X-Gm-Message-State: AC+VfDzDnTPNIOs5iiAcmbuGLj5us/qV3tF9uD4iESB/w/gzt8gJYvJo
 rrz/fLdJX1cVhdztPG7DAvD2zmZhgNwig/9MWZMhlKVdaD33rPUgcu36O5CC5+BGA72mF3fxfy/
 sfmgHbgtF1QDgE+Z/2bNjyERarmgp3mbcl0Rl5hzUc08=
X-Received: by 2002:a05:622a:649:b0:3ef:3bad:6d24 with SMTP id
 a9-20020a05622a064900b003ef3bad6d24mr4087797qtb.47.1682629848454; 
 Thu, 27 Apr 2023 14:10:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wcIS9ZrvhiadDC7X/QUy+vREYVt3Z6AlKXrwXCOzQvwDK1XzR/bvOsR0KVROqeeeemzrb7g==
X-Received: by 2002:a05:622a:649:b0:3ef:3bad:6d24 with SMTP id
 a9-20020a05622a064900b003ef3bad6d24mr4087748qtb.47.1682629848140; 
 Thu, 27 Apr 2023 14:10:48 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05620a08d000b0074acaeeb7c3sm6204862qkz.91.2023.04.27.14.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:47 -0700 (PDT)
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
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org (open list:PReP)
Subject: [PATCH v10 7/8] raven: disable reentrancy detection for iomem
Date: Thu, 27 Apr 2023 17:10:12 -0400
Message-Id: <20230427211013.2994127-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
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

As the code is designed for re-entrant calls from raven_io_ops to
pci-conf, mark raven_io_ops as reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/pci-host/raven.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 072ffe3c5e..9a11ac4b2b 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -294,6 +294,13 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
+    /*
+     * Raven's raven_io_ops use the address-space API to access pci-conf-idx
+     * (which is also owned by the raven device). As such, mark the
+     * pci_io_non_contiguous as re-entrancy safe.
+     */
+    s->pci_io_non_contiguous.disable_reentrancy_guard = true;
+
     /* CPU address space */
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
                                 &s->pci_io);
-- 
2.39.0


