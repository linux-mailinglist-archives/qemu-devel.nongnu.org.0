Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD857D1BF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:42:07 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZFW-0007aO-Gx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAB-0006yu-4w
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZA8-0007fn-MT
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=QzmL1nefM/ZmYAK4ASBR+RHT4UAX2gB1VDxp7rqY3ZfFD15/9Pg2iaYOncP4J8ulcsDT4i
 f8aV1/djPNkWEOdwcgpXXviesYCTiUgdvpAezAQxtQ8XkgLOoZEHS3FS0oAKaCXixXONN2
 tN1HdlW2KvC6fehuxmUMRLShIq3jeJE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-5PK6X94VMxKPd3amZvEWXQ-1; Thu, 21 Jul 2022 12:36:30 -0400
X-MC-Unique: 5PK6X94VMxKPd3amZvEWXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so1436241edc.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=vwM3xKRvK8FZlAxu1hdnPj9jNjobVBUG6vK7gGK2ZjA88jyqbJH6Vr4q9kCn5h3tMN
 wrPMXROWrMK0Wb9nOXA9q0SWLb8PmhL68ZGEYw1hNcgr8ykhKGWwgGKxCKDiDEfPqyYW
 C9nyMjNTaiBb9K7lRBV5cFJ5WmeTMQAKW74mRAEucn7PnFhsPuqc6kbH2yhRvCN3QF02
 RGlknOkFPMy4aedmmowE4pqkp9YB8g07+p2kQRB68OSa2ZTP5sufF5D9UpLhA7zz3+K2
 HR7o47HH4KwQR8Exewvus0mkdPkYFcWDQYayuYeBd8R8ePC8h4KVOGcHbk+gQSGn4nNg
 5Xzw==
X-Gm-Message-State: AJIora9b6a15DHGzdOqJvEzMhfpz+MtUuuA6UCdyi1biMgQOQAG4QZNW
 EHGrj7392dASn33PWC3r4HaO4ULRbTvd08t/6FaCfk1ISrkDyUZAAxfvRSiPTDlHNjMf8z+NvI7
 NuJlsuYmfZFSPxR0tLvpX1RsFeLee4p5U3akvKtwTqxH9rBY1nO56RiaLQQBIY09rNxk=
X-Received: by 2002:aa7:de85:0:b0:43a:d89f:1c7b with SMTP id
 j5-20020aa7de85000000b0043ad89f1c7bmr58500095edv.17.1658421388929; 
 Thu, 21 Jul 2022 09:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tjwaQxT6SiByzy/g4oiiKLJxMe9F+s5bXbg1sROfvctAL3VDdrTA5zbVKPpwgFRnxZzWcG9w==
X-Received: by 2002:aa7:de85:0:b0:43a:d89f:1c7b with SMTP id
 j5-20020aa7de85000000b0043ad89f1c7bmr58500075edv.17.1658421388750; 
 Thu, 21 Jul 2022 09:36:28 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a50ef0f000000b0043a2b8ab377sm1278348eds.88.2022.07.21.09.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 3/9] oss-fuzz: remove binaries from qemu-bundle tree
Date: Thu, 21 Jul 2022 18:36:15 +0200
Message-Id: <20220721163621.761513-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

oss-fuzz is finding possible fuzzing targets even under qemu-bundle/.../bin, but they
cannot be used because the required shared libraries are missing.  Since the
fuzzing targets are already placed manually in $OUT, the bindir and libexecdir
subtrees are not needed; remove them.

Cc: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/build.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 2656a89aea..5ee9141e3e 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -87,8 +87,10 @@ if [ "$GITLAB_CI" != "true" ]; then
     make "-j$(nproc)" qemu-fuzz-i386 V=1
 fi
 
-# Prepare a preinstalled tree
+# Place data files in the preinstall tree
 make install DESTDIR=$DEST_DIR/qemu-bundle
+rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/bin
+rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/libexec
 
 targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
-- 
2.36.1



