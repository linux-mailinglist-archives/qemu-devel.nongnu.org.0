Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647205AA43E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 02:22:27 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTuS2-0005kl-Ha
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 20:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTuPW-0004Ft-Oi
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 20:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTuPO-0001Nh-7J
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 20:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662077980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NqFgr1dFdfVjgmiYS84zu/LQTJixQjYR4pwL3+o9ZwA=;
 b=cBo2QZW4zyjK0r0I4B52gbFpA+E6Qfj+XTz7MMMUFRXN+o9IjllCeUw7zhhUMPebyag3yR
 01Ste8C3IN2GhGjuax5Rp4yI30pPcmX9r4LZrpSpNEUeFiy1KmNxBjF/46QslO45oCD5LE
 pU0USUxN3pvZPy4FXYxUvbEsmsJHTKA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-oTOGpwuoNzK0eHp31j8flA-1; Thu, 01 Sep 2022 20:19:39 -0400
X-MC-Unique: oTOGpwuoNzK0eHp31j8flA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i6-20020a05640242c600b00447c00a776aso333824edc.20
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 17:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NqFgr1dFdfVjgmiYS84zu/LQTJixQjYR4pwL3+o9ZwA=;
 b=70MOKKcauJv+PXe+BK4atZC8YfX8XDntkTXhvlMWQRckn4Ip8kXB9ep2rQTqDct80s
 OyLMTAc+n/n9k5a/wsSEj3G1V4zphj37czt6FGs7mtHE4Lh0iDcU+M5QhSOl0Fcs+711
 RJ2LGUfN6fL7d4HrW3kcnNsS4jAFQrniusLMLD6utOoVJsZgRcBskYYDt95TamNuUAzO
 o2gsx9feZbnstJNZQExSbRI0E8Lxkz2zRkbqDg7az4NI0WYQHUycDgRz2PQhekeZfeFp
 3ogMEqGRQlx2ycH/S00wRuiKKOCXV9v3X6uQKboiSUs5ZAKa55bPowyKCD21tYwDskUp
 1Q7w==
X-Gm-Message-State: ACgBeo1hXrhZiweviOF/cLEcXZP3qvEoJIn9yXQ7cQj1kCpLDNWpW8hT
 qDdJliTMVQz/8nvCa2+FbLx9bhi2xfpP79s28GJV/BkcICdOo/JumeR3wL5pEDU1DJspn4XnOEY
 BDYxPfd9FIRmEcGB/RAkre/C3COjdeGImuQwU1pSXtCoVoSXgREetqcydjfl6rnKapkE=
X-Received: by 2002:a05:6402:2945:b0:446:1144:f1aa with SMTP id
 ed5-20020a056402294500b004461144f1aamr30095359edb.79.1662077978292; 
 Thu, 01 Sep 2022 17:19:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR690Hn7IoC4ybNUoTtso+xofA3asxUO3wPiNkhtmHEytu0Ozbr2FPYRgJAOR1ft2p92Pwrrsg==
X-Received: by 2002:a05:6402:2945:b0:446:1144:f1aa with SMTP id
 ed5-20020a056402294500b004461144f1aamr30095346edb.79.1662077977990; 
 Thu, 01 Sep 2022 17:19:37 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 kx16-20020a170907775000b007413aad3acbsm348680ejc.165.2022.09.01.17.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 17:19:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH] KVM: use store-release to mark dirty pages as harvested
Date: Fri,  2 Sep 2022 02:19:36 +0200
Message-Id: <20220902001936.108645-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following scenario can happen if QEMU sets more RESET flags while
the KVM_RESET_DIRTY_RINGS ioctl is ongoing on another host CPU:

    CPU0                     CPU1               CPU2
    ------------------------ ------------------ ------------------------
                                                fill gfn0
                                                store-rel flags for gfn0
                                                fill gfn1
                                                store-rel flags for gfn1
    load-acq flags for gfn0
    set RESET for gfn0
    load-acq flags for gfn1
    set RESET for gfn1
    do ioctl! ----------->
                             ioctl(RESET_RINGS)
                                                fill gfn2
                                                store-rel flags for gfn2
    load-acq flags for gfn2
    set RESET for gfn2
                             process gfn0
                             process gfn1
                             process gfn2
    do ioctl!
    etc.

The three load-acquire in CPU0 synchronize with the three store-release
in CPU2, but CPU0 and CPU1 are only synchronized up to gfn1 and CPU1
may miss gfn2's fields other than flags.

The kernel must be able to cope with invalid values of the fields, and
userspace *will* invoke the ioctl once more.  However, once the RESET flag
is cleared on gfn2, it is lost forever, therefore in the above scenario
CPU1 must read the correct value of gfn2's fields.

Therefore RESET must be set with a store-release, that will synchronize
with KVM's load-acquire in CPU1.

Cc: Gavin Shan <gshan@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 136c8eaed3..7c8ce18bdd 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -728,7 +728,23 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
 
 static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
 {
-    gfn->flags = KVM_DIRTY_GFN_F_RESET;
+    /*
+     * Use a store-release so that the CPU that executes KVM_RESET_DIRTY_RINGS
+     * sees the full content of the ring:
+     *
+     * CPU0                     CPU1                         CPU2
+     * ------------------------------------------------------------------------------
+     *                                                       fill gfn0
+     *                                                       store-rel flags for gfn0
+     * load-acq flags for gfn0
+     * store-rel RESET for gfn0
+     *                          ioctl(RESET_RINGS)
+     *                            load-acq flags for gfn0
+     *                            check if flags have RESET
+     *
+     * The synchronization goes from CPU2 to CPU0 to CPU1.
+     */
+    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
 }
 
 /*
-- 
2.37.2


