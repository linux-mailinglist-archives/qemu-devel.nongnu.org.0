Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97723311029
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:43:52 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8659-0007Wq-02
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84l4-0000wX-4G
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84ky-0003Tu-0O
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pSoQiepgpeuvlonviTFU0Pq0agocqriq1sbtJ5D1E5c=;
 b=fF0yUQsQoJaSlctABylCev/kMFriwPDxq+KbrEkK1Q5QYExaU1Oi86gQO5KCEJjMGlJaUM
 eNI+W5Qmh3GkOfbBGIc22PZ9uHlLP5Ih4Ak3hCItdy+LuTpHxcMdpQslVtLwIN+J9olo6I
 i33GjmzCKhas+lnH6eLAQTRPLiz872c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-p0ICm8vMNr6X62eLsEN1kQ-1; Fri, 05 Feb 2021 12:18:52 -0500
X-MC-Unique: p0ICm8vMNr6X62eLsEN1kQ-1
Received: by mail-ed1-f70.google.com with SMTP id g2so7311162edq.14
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSoQiepgpeuvlonviTFU0Pq0agocqriq1sbtJ5D1E5c=;
 b=FCfxcBExZH8mbHExw8b+UIpbR/AcDMv51JA6rcgXKDovkobO/z+QbNXEvk46J7Zkch
 HfiqB3mEYwnm0lf6UtWEmcYWhbg8SFTvoBGOSk1+RsJcFYmpoKhQpsBeAVi/StdFJT7l
 mkbiJsaEUUXdiQsQk4FWb2dzruetZszFGjFIPHIpe1xQHGGJFnfleq0xGTw67xkXnic0
 m2i9KGKjVmbG6BFZ7WqxY5sesjx3KC96doSFCL/ZZe3P3vS0djwboqRA01HkmlMjaL/A
 m47R+5qoLIL2/4FkbWs1CtEIm99p3VfJCn/BddDKGw57TpVZbEYYPJezIjizr5tN6WDN
 1TwQ==
X-Gm-Message-State: AOAM531mDox5EHtMKrhTh+y8s20d/fmjiX41BqsJIU/B4dDHa/WsBcb0
 ihArzcT41r8sE4FOg0JKC7DiD3unCa4t+PRT/Eb9POvOYyV1HFbj1GU2gOv9GyHAk6Ts47TSTiy
 fNac3YkGNnMyGyvdgWgsD6THkhNLGvEqp/pDksCLPTDvsk2CtS2xJTAalrvnxWJ6j
X-Received: by 2002:aa7:de14:: with SMTP id h20mr4486727edv.95.1612545531260; 
 Fri, 05 Feb 2021 09:18:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh+QfvHe5QteoXDA9vEoFKQsmWHqylEHxA4GYuiQmZNcT8dRgwtTGR0VtZWbf4UNi08KvRXQ==
X-Received: by 2002:aa7:de14:: with SMTP id h20mr4486686edv.95.1612545531036; 
 Fri, 05 Feb 2021 09:18:51 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e6sm4505496edv.46.2021.02.05.09.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] seccomp: Replace the word 'blacklist'
Date: Fri,  5 Feb 2021 18:18:14 +0100
Message-Id: <20210205171817.2108907-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/qemu-seccomp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 377ef6937ca..4c684bc9e71 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
     { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
 };
 
-static const struct QemuSeccompSyscall blacklist[] = {
-    /* default set of syscalls to blacklist */
+static const struct QemuSeccompSyscall denylist[] = {
+    /* default set of syscalls to denylist */
     { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
@@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
         goto seccomp_return;
     }
 
-    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
         uint32_t action;
-        if (!(seccomp_opts & blacklist[i].set)) {
+        if (!(seccomp_opts & denylist[i].set)) {
             continue;
         }
 
-        action = qemu_seccomp_get_action(blacklist[i].set);
-        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
-                                    blacklist[i].narg, blacklist[i].arg_cmp);
+        action = qemu_seccomp_get_action(denylist[i].set);
+        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
+                                    denylist[i].narg, denylist[i].arg_cmp);
         if (rc < 0) {
             error_setg_errno(errp, -rc,
-                             "failed to add seccomp blacklist rules");
+                             "failed to add seccomp denylist rules");
             goto seccomp_return;
         }
     }
-- 
2.26.2


