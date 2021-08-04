Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F13E0218
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:34:36 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBH2Z-0006c2-Jb
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGs0-0008GQ-No
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBGrz-0000be-0i
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628083418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7n94kqGLSUTnQGUy9Qq0cRNEvWCkJjOb+BwoKNdN2aE=;
 b=G6eF0AGmgvgdFmNYYM4lv8KHhBgQSg9ZnuuAVCmyg5pD1BqNXZ6ZoQG9hcwdF4zgi1uGHq
 YkKA+f2BHPT+QHccFNtX4rH5hMmbKYeH+0/4mBaldMOMDm7hQNA644xAG4Uur4nPCgQs9q
 Bn3MPThE/vL7qvnGg/RKy4js+RQWLxs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-BTmfhg6_Of2QqMU4Fk2YBw-1; Wed, 04 Aug 2021 09:23:35 -0400
X-MC-Unique: BTmfhg6_Of2QqMU4Fk2YBw-1
Received: by mail-qt1-f197.google.com with SMTP id
 g10-20020ac8768a0000b029023c90fba3dcso1048406qtr.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7n94kqGLSUTnQGUy9Qq0cRNEvWCkJjOb+BwoKNdN2aE=;
 b=SbrsqAxTHDqN/gZDrmSWcTy2RscTx996hV8WuMhgQ3ycvYT6pWTYM9Gys9I+flAiuN
 2rm/Gl5XNCHqdoirCsclb3VK5dZySCR+qtKuPX3oM0pPRRaXPVODrOZg9loC8xx2Za19
 ZpFee/30dV4mgj8eqLXwICJCOwXehfucxUTH9gUNJVWV+wuW1thB6i4QP+EvjZQscsjL
 4v4Tw3ZoEMdyItHeYpvGD4Am2zcwVJdfrxU2cnC1g6wP+qi2vHGQBQbaC7BRCFhaA/dJ
 Mxj0StsZrnYU0NWHl3Q4A1s9ptQp5CIkDJdqyerdkNS+bTBnEghNpI7iv66ASzu65xuY
 GcIA==
X-Gm-Message-State: AOAM532ts/hEpxXQq0O9c6DoW51nyAD6Q6u8LlwdVpKbfUYJff9nh4Il
 YOPD98Df1rLf/DknELZqMT0AI6jBk7YQ3s6Jmd5V4Wt8VN0nuUiw7mzS1nTRCoK/p744TWZsyQR
 O6Yih0On8z26HW7EtlT3zI73YbpJsRxMc6tnjm2xZ8clQIWs/q687j0UzRzgkjrrn
X-Received: by 2002:a05:620a:5f9:: with SMTP id
 z25mr25717841qkg.108.1628083414474; 
 Wed, 04 Aug 2021 06:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfzSbpPVywrSvP/p8skYoqpzZbmG9h+QkdoKRRE2wswASnwORhvVLUw1792rlFUuU+oghfLw==
X-Received: by 2002:a05:620a:5f9:: with SMTP id
 z25mr25717811qkg.108.1628083414194; 
 Wed, 04 Aug 2021 06:23:34 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca. [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id z29sm1388608qkg.9.2021.08.04.06.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:23:33 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] Makefile: Fix cscope issues on MacOS and soft links
Date: Wed,  4 Aug 2021 09:23:28 -0400
Message-Id: <20210804132328.41353-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210804132328.41353-1-peterx@redhat.com>
References: <20210804132328.41353-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes actually two issues with 'make cscope'.

Firstly, it fixes the command for MacOS "find" command as MacOS will append the
full path of "$(SRC_PATH)/" before each found entry, then after the final "./"
replacement trick it'll look like (e.g., "qapi/qmp-dispatch.c"):

  /qapi/qmp-dispatch.c

Which will point to the root directory instead.

Fix it by simply remove the "/" in "$(SRC_PATH)/" of "find-src-path", then
it'll work for at least both Linux and MacOS.

The other OS-independent issue is to start proactively ignoring soft links when
generating tags, otherwise by default on master branch we'll see this error
when "make cscope":

cscope: cannot find file subprojects/libvhost-user/include/atomic.h

This patch should fix the two issues altogether.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d39d3670de..eeb21f0e6a 100644
--- a/Makefile
+++ b/Makefile
@@ -229,7 +229,8 @@ distclean: clean
 	rm -f linux-headers/asm
 	rm -Rf .sdk
 
-find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
+find-src-path = find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o \
+	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
 
 .PHONY: ctags
 ctags:
-- 
2.31.1


