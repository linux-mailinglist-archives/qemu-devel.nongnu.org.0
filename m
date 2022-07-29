Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B78585224
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:11:43 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHReQ-00056P-Je
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXu-0003fu-GU
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXt-0005ct-3r
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oym6wOOKBT4WvthSHQ18RTGVxUH/cH6Hs2+0WEigjfY=;
 b=SwMnVaLfDlY+widiPheJsDSouwnBiKSbKP4S8gQrUK9YJNl4IaBukuY0jx2I/MenJD0ik6
 F2+Op9+kyMQMg0YH2qCLOLUuuaHbDxT9GW/J0UExPxLvgp2oqq+t66fD2Nht87EYiMZAE/
 Rl9SmRg6bxB1Xse3hwRFCIwt9DvUtKc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-b_BV2PvqP-6IEtoM_TEUmA-1; Fri, 29 Jul 2022 11:04:47 -0400
X-MC-Unique: b_BV2PvqP-6IEtoM_TEUmA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z1-20020a05640235c100b0043bca7d9b3eso3048725edc.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oym6wOOKBT4WvthSHQ18RTGVxUH/cH6Hs2+0WEigjfY=;
 b=tiE81G8s8G5zc82ZqJ2X8NMl1u0/bB731Vez09AUwg4ftXQZLXhlb69JvVC2y6+b5W
 3NVic6AgK8czYCWScmZnRM1z/wC7XxEumHTJXyxrtfb3Gs+qgLQ5KK8LquEZLaEnPqC8
 QmPDgqx03iZobzFIjPxHcl3vlp7vl+A7AkVbG2QTqlgX1vlRP9QBoYMbiTUlTK9WmRuR
 BsabPFCApNk/1ORUE2TY+u9djJrM71epVg+eSc3LVTLIkv6Z2Pll9ZmO3o31IdaQvKY6
 y54CKhb7b3NNiL8tFB0urtgkmJiICJl/ftJ57+7TSxrNFQGRk6zukXMh/1iH8MjLY3cy
 jBkw==
X-Gm-Message-State: AJIora9Y4MY4q7Cjrp2jM2cUGmxj2yWliH6rMHpOBzyOe1vNx3R39kZh
 E/8haW5E2yvWBJEJUcT1LmgFOd/4ls0o+GWN+UaIb6nmOsb08oGzsntUfeoERZk7JJypPmqob8J
 SFdHwLJfrbpyJeBZ2PUMxWaBZnknOnFS997TjMW6cI+D4Y82YQJPQBTlw8EL2iOFjI1U=
X-Received: by 2002:a05:6402:34c8:b0:43b:e7b1:353c with SMTP id
 w8-20020a05640234c800b0043be7b1353cmr4006886edc.171.1659107086325; 
 Fri, 29 Jul 2022 08:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+JfC0xVPtEFc+CYy2RM1zo6gaHJ0itVBDGqG19hE/7CXFe853QV46hpRGPfpREDL4ZyAv+Q==
X-Received: by 2002:a05:6402:34c8:b0:43b:e7b1:353c with SMTP id
 w8-20020a05640234c800b0043be7b1353cmr4006853edc.171.1659107085894; 
 Fri, 29 Jul 2022 08:04:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a056402014b00b0043cc66d7accsm2442955edu.36.2022.07.29.08.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 3/6] stubs: update replay-tools to match replay.h types
Date: Fri, 29 Jul 2022 17:04:35 +0200
Message-Id: <20220729150438.20293-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Claudio Fontana <cfontana@suse.de>

detected with GCC 13 [-Werror=enum-int-mismatch]

Solves Issue #1096.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220704075832.31537-1-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 stubs/replay-tools.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
index 43296b3d4e..f2e72bb225 100644
--- a/stubs/replay-tools.c
+++ b/stubs/replay-tools.c
@@ -7,13 +7,14 @@ bool replay_events_enabled(void)
     return false;
 }
 
-int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
+int64_t replay_save_clock(ReplayClockKind kind,
+                          int64_t clock, int64_t raw_icount)
 {
     abort();
     return 0;
 }
 
-int64_t replay_read_clock(unsigned int kind, int64_t raw_icount)
+int64_t replay_read_clock(ReplayClockKind kind, int64_t raw_icount)
 {
     abort();
     return 0;
@@ -48,11 +49,11 @@ void replay_mutex_unlock(void)
 {
 }
 
-void replay_register_char_driver(Chardev *chr)
+void replay_register_char_driver(struct Chardev *chr)
 {
 }
 
-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
+void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
 {
     abort();
 }
-- 
2.36.1



