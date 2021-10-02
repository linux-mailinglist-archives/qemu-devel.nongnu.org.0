Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611641FC0E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:07:56 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWek7-00049m-5m
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWj-0001Ux-FY
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWg-0000lJ-Rl
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJdW6m0Ma56hwzjCy1teOEHrEH20tchf6AQogJnEfxU=;
 b=IMROb0Jmtcifq0WE06BVpFvlcPZbhXPT0OmZYgYlj4whBtlz4N5yag++utQ0FO4vr1FBYy
 PeCMczK9CbCzOSnXMni4eO4wQ7+b35x87Ov4pnPsDb4oG6069DUETVZq3rtSm6Kod0vg30
 xezFufs0RlYqf6TDnkCgPG0m/lv6caE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-fo7qyVphNk2CZ85SDApV-Q-1; Sat, 02 Oct 2021 08:54:01 -0400
X-MC-Unique: fo7qyVphNk2CZ85SDApV-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so7367354wmq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJdW6m0Ma56hwzjCy1teOEHrEH20tchf6AQogJnEfxU=;
 b=3FORP0ALzs9qNUQZyze2n14vYjKDDSuBTfvE0yq6i38tmyXATE4Zr7ay5gvePEMa9H
 K73sfwHptl9n0UfMKx0qkuSo8RwEc7zPrFcLvTrt/CH8jTp63dxMOddBCYr04hqMhEra
 QoEAaPDWfFIgFWiLATTZIOcxaqqkxH4exo7+tNeFEunbjFi+8Zcgiy4/QCZJLaCjLHtW
 /exyhtZ/lhPPK0vx7VeRcNaoWPVZ+DdZ2q5fPowEL3mmw+hsN2JOsRUeSB/j/pk+k713
 IubGZw9qFrJ7g65HZIGvm6ggtegMJfckogtG2WDuCkI4RhQVBmZz2S55PrSD+UnuD/ur
 uPqQ==
X-Gm-Message-State: AOAM532vVkTR4zVUkTT/u29YvpSXpdrC5prWkCsp6Lft2lCnUsrLNwa8
 5u5NoRWN6P7HxfcbdSLNatHcAJHtjttAj6Zs1ii+0bwgJgS7Q40FGSSpByARx41VPEvxb3gPYmL
 bmHf+UHFeB6286Ge82cYj19cz9yiZ72OXOUohFm7FjEV6T79rbSBzeW4uI84g35SY
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr3374991wry.292.1633179240125; 
 Sat, 02 Oct 2021 05:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1kpUWp8JDca6ogxcYyGFA/Lr3YXbhWtYHXiUio3plQycEwa1/nNlCgTVPD8fjk35/bjBa4A==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr3374964wry.292.1633179239910; 
 Sat, 02 Oct 2021 05:53:59 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f1sm9356839wri.43.2021.10.02.05.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/22] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
Date: Sat,  2 Oct 2021 14:53:04 +0200
Message-Id: <20211002125317.3418648-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
is protected by the "if (sev_enabled())" check, so is not
reacheable.
Replace the abort() call in sev_es_save_reset_vector() by
g_assert_not_reached() which meaning is clearer.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index eb0c89bf2be..4668365fd3e 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -54,7 +54,7 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
 bool sev_es_enabled(void)
@@ -68,7 +68,7 @@ void sev_es_set_reset_vector(CPUState *cpu)
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 SevAttestationReport *
-- 
2.31.1


