Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98926D7DA1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk34w-0007D0-0L; Wed, 05 Apr 2023 09:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tXAtZAUKCnQVaYalYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--digit.bounces.google.com>)
 id 1pk2jj-0000oQ-7I
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:39 -0400
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tXAtZAUKCnQVaYalYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--digit.bounces.google.com>)
 id 1pk2jh-0003tx-6B
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:38 -0400
Received: by mail-ed1-x54a.google.com with SMTP id
 c11-20020a509f8b000000b00501e2facf47so50035133edf.16
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680699574;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KSldPe0deeSyf3HYxnNOuVuY5+gkfHfz8Olmmt/PVAU=;
 b=LTa74Lp/33UpBBIXpeR/ozjWPmVUFAqd/u8X3qiDWwlCto3PkvCou4j1pacf+/cq3M
 zrZsl8c+VRvXbGpJy2mUuPK+q2vn9WGeyL6SXZp7DEiewXGN+HLgoAKjr3m3XDYIKZ8s
 Jxi00/PltP4/wVkSNshiRyNEaz05+hI4Nt37A3ENyrtyfcbyokmHp5ls5LeKCmfcyh7z
 7CVfGN97Mu+g+oxXRsm27dQuW2glb2SNffI4hZSiIPFa20knhGm3RTljZi/iT+bwoG40
 sA/VtOVCxzM+tw9kspTwPJU7Kbl75NJTfEV5Vofql5n11mKHXcmeNs5oHZ608yCpKAZ3
 nCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680699574;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSldPe0deeSyf3HYxnNOuVuY5+gkfHfz8Olmmt/PVAU=;
 b=cwBYteNjHLxzN9g46edealIR/Y4sTqZqycMjZx7H50T/wYYsfedES41IrssckAjHWm
 O8H9oLRY+sjDNe2uo+XCOxD40sB3+SPeoNGnrvOpPdjmKK1wkgb99JJM2bC2K/hnyL5d
 RiG1GnED/mNBnwPqCxrF6KSrUvtssA8yVjk3XGrfWD+vlFWnsc6NQmE3k0jESOUFNS98
 W/9nAfIXJVtSSgDP2UjLq0UVxjSqJektvcmfxoj/mVlbkVDV27qKrHCX+PAGAHczQfK4
 xN8H6htQf7tYxHU0jfJEN0JwrhUVCne/9SQx67gT1i3wV3Rrr7Ub4B3B1swA3vZoZBFl
 av4w==
X-Gm-Message-State: AAQBX9ejpSqigZhaHfvRsCTOF9RX5vmhBVlVZjxSQqb4T+br5v1pQl79
 UKXCCCQh4p0lZUnELaMHF8ZyGCYj4YAbOItExE7F6+ipA+8zRj0eW5yPJLz/7Rd1T3uuVl7lg8M
 J57eaNBv9DZPJfM4XsP+YQ6jmLvNPbxeSqW5QUqOgyjt7bjd64C/GBzA//Q==
X-Google-Smtp-Source: AKy350aDuyE7yG/13EHN9WmEDaRqxkOD9aSAWNC6b8d2F7Jc4O+l9GGEX7fUr/wxkSwpQ+vAp7rVi4Q0gw==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a17:906:3598:b0:8d1:9162:514a with SMTP id
 o24-20020a170906359800b008d19162514amr1586488ejb.8.1680699573846; Wed, 05 Apr
 2023 05:59:33 -0700 (PDT)
Date: Wed,  5 Apr 2023 14:59:19 +0200
In-Reply-To: <20230405125920.2951721-1-digit@google.com>
Mime-Version: 1.0
References: <20230405125920.2951721-1-digit@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405125920.2951721-2-digit@google.com>
Subject: [PATCH 1/2] Fix libvhost-user.c compilation.
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::54a;
 envelope-from=3tXAtZAUKCnQVaYalYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--digit.bounces.google.com;
 helo=mail-ed1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Apr 2023 09:21:30 -0400
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


