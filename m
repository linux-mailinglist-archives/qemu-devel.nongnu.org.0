Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02D6D84CA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 19:22:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6p8-0004hy-Do; Wed, 05 Apr 2023 13:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Fa4tZAUKClAv0y0By66y3w.u648w4C-vwDw3565y5C.69y@flex--digit.bounces.google.com>)
 id 1pk6p6-0004hl-Vz
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:29 -0400
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Fa4tZAUKClAv0y0By66y3w.u648w4C-vwDw3565y5C.69y@flex--digit.bounces.google.com>)
 id 1pk6p5-0004bJ-Cz
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:28 -0400
Received: by mail-ed1-x549.google.com with SMTP id
 4fb4d7f45d1cf-4fd22779a36so455646a12.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680715285;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KSldPe0deeSyf3HYxnNOuVuY5+gkfHfz8Olmmt/PVAU=;
 b=pBNfpLhcoZqPuPerPA8uwDAg4l9XV688mSxLXQrWihdc2qm8PCIRPBF6OdWc8GoClD
 zj9orYeNYwNaOiIQjRzdCmeGjFOFgIWST0C6Tcb7qMfdm1DiaohPjGFoRrL8p07J4pA1
 mKinfQ6abU8kHBXj2aiDqcwaSRSBiHAZKnwL6QBAMaHwywIjcT2rbX1W6YKkFVj/H0pu
 s5VlzRBCW2HfMbiwikpeIA7vFPA+p1XT9g//l7WkvD2OjiUKPWUFsWJ/jYoXYa8T4fEB
 riphjYtY0LMhDo+GihMMACwvHK5YWyoVHU3b6lkPBxOywK3tIJf04JaM30I5AmxwS9aY
 tE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680715285;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSldPe0deeSyf3HYxnNOuVuY5+gkfHfz8Olmmt/PVAU=;
 b=iDsD3S5tg3xTMZGe7tN2izC53rcjcIRUUUqygJ02ZrpDLhEyoV0TsmP4IABVFHMnIN
 FuZXUgNwYeWWBZSks13XXbAm+0FVVjTgf4ioYFRoXiyhjOmKbMZzowXXhBKpAYv8CSGv
 R8iQvF4kTEJogDepwCsBTj8lduZYeU3RpWBL4F/xi+rc48TeuB/BUCKxPvfOydhJCAQy
 mTqtO2qU0DwhvrecXRhWBTtSMxNgSa68qUlnNEVnQqV0xVt0PizjS657xF3NXxp8CBMi
 D7Yh1BNtTtMh/3Z+AX3lu8WEehjJRXwLfRXzbhJ8E6z93RDz6yu92QxxwRMMGHQuUWTu
 9Nhg==
X-Gm-Message-State: AAQBX9fFjzqpbaP93RkSuf7EMu1INGCSJ1cAO5OEoyygvWy89nQF6gqM
 05Ruaw0IHHB1mbPmVkWT6n+Yij3Z/E/grmEEp9SJqdMEp1HY1dPhKn2BcVtDFFpYa2Zlqt5kIQn
 jw8i0HgPkGJvLGCGhBIAMD1IOkCIKb6Q5eaAAPycrL2MiBfz5gOANSgXAKw==
X-Google-Smtp-Source: AKy350Ydm62hsavLGEkZyEFiZHsXTuUqqpuZzpSWr3FFl64zvi+T78Ek3JPWVDWil2srqFT6B64w/rfHog==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a50:9987:0:b0:502:4c87:7982 with SMTP id
 m7-20020a509987000000b005024c877982mr1647969edb.2.1680715285369; Wed, 05 Apr
 2023 10:21:25 -0700 (PDT)
Date: Wed,  5 Apr 2023 19:21:07 +0200
In-Reply-To: <20230405172109.3081788-1-digit@google.com>
Mime-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405172109.3081788-2-digit@google.com>
Subject: [PATCH 1/3] Fix libvhost-user.c compilation.
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::549;
 envelope-from=3Fa4tZAUKClAv0y0By66y3w.u648w4C-vwDw3565y5C.69y@flex--digit.bounces.google.com;
 helo=mail-ed1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The source file uses VIRTIO_F_VERSION_1 which is
not defined by <linux/virtio_config.h> on Debian 10.

The system-provided <linux/virtio_config.h> which
does not include the macro definition is included
through <linux/vhost.h>, so fix the issue by including
the standard-headers version before that.

Signed-off-by: David 'Digit' Turner <digit@google.com>
---
 subprojects/libvhost-user/libvhost-user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0200b78e8e..0a5768cb55 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -32,6 +32,12 @@
 #include <sys/mman.h>
 #include <endian.h>
 
+/* Necessary to provide VIRTIO_F_VERSION_1 on system
+ * with older linux headers. Must appear before
+ * <linux/vhost.h> below.
+ */
+#include "standard-headers/linux/virtio_config.h"
+
 #if defined(__linux__)
 #include <sys/syscall.h>
 #include <fcntl.h>
-- 
2.40.0.348.gf938b09366-goog


