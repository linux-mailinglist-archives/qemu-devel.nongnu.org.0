Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFD6D93CC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMfG-00016h-0y; Thu, 06 Apr 2023 06:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMfD-00016A-C2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMfB-0002hk-QL
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680776176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=//FRnxD7jb7UvIipQKGrwvKuqPVrQZt6mxX5vG4OVV0=;
 b=g0Qoqhx0Luyt4JbKocAMFE+0CsDI+QXVVfwzULd/lsUofvbnRVKQJlo+5YQ+f9pyBNEIAQ
 h8/5w1+hgZ3RJNYGmiSypldqNTx5rUmZVlBuE8JLUSlBDKCgRgnMsA93vgJJ+3nXLM57mQ
 EOQII/rhhzatbOjwrOSvzrxL3ICC08g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-zdMDQclMPw-kSS93LpAbYA-1; Thu, 06 Apr 2023 06:16:15 -0400
X-MC-Unique: zdMDQclMPw-kSS93LpAbYA-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a50d751000000b005045c08ca6dso857275edj.7
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776173; x=1683368173;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//FRnxD7jb7UvIipQKGrwvKuqPVrQZt6mxX5vG4OVV0=;
 b=wCnb8djSNzGI1hXAv5AEGVMweVqjeAho6g5wt/uWRXgM6fI+8k9FSbcA/XJPYcV1if
 yB4L8AwcFE43Z+mDENopuM6RyRAs0Kpa7Ywdt57XnD35U5ZxbkGRe9ZU5FceHFlXNofn
 iBxaggp8bfKWaKwSHXnfF9xSsdOdspeLeKE+Fk5SHNZNEiYgHqIHy5I3VBrhwrOu5+2T
 empoZNC8KLDpHOpeshnDoEdfaifnSfB/zIDHZdtr7TpeqcqEAUp+ycXM0DhcgP7zZ8ud
 XF0nhZUEbJPOt65eotN1dR+Sh7Y0rjkABr2ANqx9IjwBRG7bnx4f/FhHYioGivLF9kmu
 iIfQ==
X-Gm-Message-State: AAQBX9dJsxWv5SHsI9pzhmBNlZ5778NswccHHn4GNPIQ57pMcE0Piqlc
 WA3MApMludVPIb6jCE4FKwdfqzsSBXZMYQnYIDDuxiTYP1A9EUpDSbyty4UEP6vXe6yGbkiYZAS
 WLyFYhqGkA3AHwP59gMVPLALJx3M60BqsQM03ZZsAews+IwsB05MzfLGNE5+r6z+pfsXphiC2UI
 A=
X-Received: by 2002:a17:906:d055:b0:933:4d37:82b2 with SMTP id
 bo21-20020a170906d05500b009334d3782b2mr5354879ejb.57.1680776173702; 
 Thu, 06 Apr 2023 03:16:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1TZ2LVJw8ZjJ2Aulv0iALt+Yh/V9Kj4B4a3RotdmuzRnsYq8kwdH/g7WyUe9m1TsD+Ix4Lg==
X-Received: by 2002:a17:906:d055:b0:933:4d37:82b2 with SMTP id
 bo21-20020a170906d05500b009334d3782b2mr5354868ejb.57.1680776173411; 
 Thu, 06 Apr 2023 03:16:13 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jr3-20020a170906a98300b00933356c681esm609675ejb.150.2023.04.06.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:16:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com
Subject: [PATCH] postcopy-ram: do not use qatomic_mb_read
Date: Thu,  6 Apr 2023 12:16:12 +0200
Message-Id: <20230406101612.241872-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It does not even pair with a qatomic_mb_set(), so it is clearer to use
load-acquire in this case; they are synonyms.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/postcopy-ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 41c07136501a..23befd5ca8a2 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1495,7 +1495,7 @@ static PostcopyState incoming_postcopy_state;
 
 PostcopyState  postcopy_state_get(void)
 {
-    return qatomic_mb_read(&incoming_postcopy_state);
+    return qatomic_load_acquire(&incoming_postcopy_state);
 }
 
 /* Set the state and return the old state */
-- 
2.39.2


