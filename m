Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44E6F2494
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVz-00073K-TU; Sat, 29 Apr 2023 08:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVi-0006JZ-TP
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVh-0004wn-Dn
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0PhNgVo26jX7IJWZqqtOArVqrOt3ATGkt8cuJoYovE=;
 b=Ae6DgxKgkke69b6sENYQqC2fKzvCTdWiVcqqEjO9MbRv24WlBjzUB6aayH+G8x1mHECdOx
 albqVeupmcRzb1qP2RxZVM3mZ8jTAj1t93upcyt/Af3uZ08WBKQ33IVlZ1hSICI24hhzOU
 eaIU3HPTcyI/rgSatXHnyLxT1WA/00g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-hLTPKuS-NainoSmeCW-8XQ-1; Sat, 29 Apr 2023 08:17:02 -0400
X-MC-Unique: hLTPKuS-NainoSmeCW-8XQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50a14564599so18566948a12.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770621; x=1685362621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0PhNgVo26jX7IJWZqqtOArVqrOt3ATGkt8cuJoYovE=;
 b=XgXvR5uCgOXYu4RbRvgOZggoG8p76ceoxKf1G+5sqOGGoVvtogvdwSnrnIRVXb035j
 qtuBO/C0p/M3lAp3oZpBmrmea1cWI6KEtsuxkhGjdoRhMav0pItDkYqTodE4woeLO6ux
 tGlSnDjAON1ubpCU6IIFRy5D56gtzEtgU/7Tfm51uYM6C+h1DeUCYvM0+h3WI89zGEsS
 yB+r+oUUGOH561lkdubOt1Mki8Bx1qALHiwPbCN4ivUdWwI1GYfGGXAG6n9Nr0PvtW/a
 TSx9VSh70zd5NqwTYke/hh6U99fb5e17yvYR7fT7Y3cBQN8IXCt24Ru0otkuQbovL44V
 Iy3A==
X-Gm-Message-State: AC+VfDxqCCfn02DiWykzEmsFytBNs5OQ4rXXVBOIoDxRkq4bOJ4uhtn2
 u/oT5tS3JWh6l5QWor3aOLDyqRGZsUWZFiHTJaKisCU5NPRfwNvRXExRMF+V/Y3QnYXlVYqaBg+
 HRx/Q587KLED6XrUBZtGTU2FsiNMPe4fum3JPrDVoGzhzdYBKTE2rUFiOUCHBLCapHP0MjLk4iQ
 s=
X-Received: by 2002:a17:907:1c24:b0:94a:8e19:6aba with SMTP id
 nc36-20020a1709071c2400b0094a8e196abamr7613528ejc.21.1682770621234; 
 Sat, 29 Apr 2023 05:17:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HE1+zpfCmYkOUHl1OpXDjC+ZE8mMZI5NRsvnLpAsJD5SGJK9sIuHLaBw2ljh5A1pu4vdSZQ==
X-Received: by 2002:a17:907:1c24:b0:94a:8e19:6aba with SMTP id
 nc36-20020a1709071c2400b0094a8e196abamr7613514ejc.21.1682770620996; 
 Sat, 29 Apr 2023 05:17:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1709063bca00b0094ee3e4c934sm12499701ejf.221.2023.04.29.05.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:17:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David 'Digit' Turner <digit@google.com>
Subject: [PULL 12/17] update-linux-headers.sh: Add missing kernel headers.
Date: Sat, 29 Apr 2023 14:16:31 +0200
Message-Id: <20230429121636.230934-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: David 'Digit' Turner <digit@google.com>

Add <linux/memfd.h>, used by hw/display/virtio-gpu-udmabuf.c
Add <linux/nvme_ioctl.h>, used by qga/commands-posix.c
Add <linux/const.h> used by kvm-all.c, which requires
the _BITUL() macro definition to be available.

Without these, QEMU will not compile on Debian 10 systems.

Signed-off-by: David 'Digit' Turner <digit@google.com>
Message-Id: <20230405172109.3081788-3-digit@google.com>
[Add <linux/stddef.h> for __DECLARE_FLEX_ARRAY. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/update-linux-headers.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index b1ad99cba824..35a64bb50193 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -160,8 +160,8 @@ done
 
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
-              psci.h psp-sev.h userfaultfd.h mman.h vduse.h; do
+for header in const.h stddef.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
+              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h vduse.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
 
-- 
2.40.0


