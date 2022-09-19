Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC35BD43B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:55:37 +0200 (CEST)
Received: from localhost ([::1]:47352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKzY-0001Do-Ff
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfc-0002t5-Ol
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfb-0002qA-2Q
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxema3O4f4dvX8H4/IkVvmNNqQSpOhMQeCzrlQfPNrU=;
 b=E8UY+LmXq6oMO+eyIRSS7dICe/p7efilc28HHXZHO/6TPSuQYETiymRsi40tbg3EfXiUpc
 QVixjrZv3XIgWxWzAs74QkCqLFUKjROnnsaV1vx3Qd8WzfoNIakkq+6wSEMgNyo8IgeyCp
 NJdZTZ1hmtE1cg9kHJ+2wYCExXlNklo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-eHLJx3S_Ow-MJRI-vQJ4uA-1; Mon, 19 Sep 2022 13:34:57 -0400
X-MC-Unique: eHLJx3S_Ow-MJRI-vQJ4uA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b003b4ab30188fso4964907wme.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uxema3O4f4dvX8H4/IkVvmNNqQSpOhMQeCzrlQfPNrU=;
 b=DfzVtZtPxFugvHmXtpEPhlEcABu/AtD3WtgENvqIsV8cLSZaBCtwuWujrXRZqDHOX6
 Sv4tLQswdUfppvZjmGkVWVWSGj+jd2U9lVI14xq2dP0dJwcZvZimXrPBMAFOFtAuN1H+
 rD+2bIOGMVCAepyQ9tPaprUGEvLr5K52RDvCFnknk24ao5J7f2o0JO7dPwRXBYxvowcr
 Q2C4AY55i06d4lMNnWahBbXqLZ5kztvC7nLdrHz95sK0sSAQ/A2ZrDu2skrlQbj6xlnR
 1ET8iq4QOnWDQaAsHFtmw5IKHDzw67IL3mCdxOYDQzr4LueiMK2ioZcBqmcW9UmlXsvw
 BRCg==
X-Gm-Message-State: ACrzQf1ZSRXxbAq4TjAXS/J1+x7OwIdRVVqgNpI04tbEfarL+DsKUS8G
 3oDYCptSvk7eFZOj537QorF5na4byp12+ODX1LYoTNneIFZuYLH/CD1BzofGIkQKy+C2iDZA8Bn
 JDUrHgCOpjibSMiwW9yoE8b0blsIqGGezcEavfyaoAs1K5qtU+U5XnTJoQjfNhWZrz+w=
X-Received: by 2002:a5d:5289:0:b0:225:4852:4248 with SMTP id
 c9-20020a5d5289000000b0022548524248mr10853259wrv.228.1663608895569; 
 Mon, 19 Sep 2022 10:34:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7NOXTSdox5kEauVmNzs54dIO8kMtMqJmciFcj2yNCGxgqHlqdJagBIxgV6tvJKF4O7B+ZylA==
X-Received: by 2002:a5d:5289:0:b0:225:4852:4248 with SMTP id
 c9-20020a5d5289000000b0022548524248mr10853245wrv.228.1663608895268; 
 Mon, 19 Sep 2022 10:34:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a05600c4e4400b003a6a3595edasm15011979wmq.27.2022.09.19.10.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:34:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/21] KVM: use store-release to mark dirty pages as harvested
Date: Mon, 19 Sep 2022 19:34:29 +0200
Message-Id: <20220919173449.5864-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


