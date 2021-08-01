Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C593DCCD8
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Aug 2021 19:12:52 +0200 (CEST)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAF18-0003m2-QB
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 13:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mAF0J-00036N-Kp
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 13:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mAF0E-0003uq-L5
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 13:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627837912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j9/vxBtF8qUtt9lHQFlE2Wof5M/b+VFeO0kl8z9Tmag=;
 b=AvSzgTvfdso9DfkLnAc6+k6yTlQvZA1UqM0Zc3f3dXGkjLQHKWPQevCEoFbK1ot60Z2r3t
 Ym7hpSpPl3mtHR2prz/YbaDvWq2CGPxkeStZH+qfC6JLjX90fDVsALLaZ51mn5DOI186wR
 85Reshd6H9Sqb8Q47dfvsLy7sC18Veg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-7Tnmp-NAO9qH9luODJZ5sg-1; Sun, 01 Aug 2021 13:11:51 -0400
X-MC-Unique: 7Tnmp-NAO9qH9luODJZ5sg-1
Received: by mail-qt1-f198.google.com with SMTP id
 f19-20020ac846530000b02902682e86c382so7241530qto.4
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 10:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9/vxBtF8qUtt9lHQFlE2Wof5M/b+VFeO0kl8z9Tmag=;
 b=OyAkp8Vrqd4RTvUeAS/gQV7CokQxTYdN8oCZk83B6vXt03M/DQ4fi0kqicSi1eRQwu
 uhujD9VB66qtGu45oa2kpWxY5I6/0mQcd9PtD5YmVIbdV6Fxx2HI/LsSb2DiaZ68uTez
 I8diGZaLnSkSNtGK3CsjZrPA8BieWS9pf1N7cDJLCoOnEca6YAG8o2f+QreiSxfujYIM
 TTbOjtVr8ty1vK3GHFSzXrRxQfgOMaBgBFMTJvCyHIWoFj/oKQhwBYzQayqZFgnG8If5
 pw0UtTVsFdDJbUM+nxwxceC7KH9AbIhK2MOY9XDh8hJtoWZPYeq1DXtQy1o/TPmS2THF
 JXbQ==
X-Gm-Message-State: AOAM532VsdtKqu0ayKbbryxrzdKiWUjVW6AJhu6g0Lw0nqUXou4kvaXI
 VNcI4JIztQOQmWHL4lcxh+jV+1r9degzCWDuO+EacmIwXeHeuGYyCerzlGKSi9tciBy7NppCSzO
 gD9yNGtp3KXFPxY/hO0jLDDA78B7v9YiDCDIa5eA+50QtMJf3neXcMWN0/cM5bhBt
X-Received: by 2002:ac8:5714:: with SMTP id 20mr10557257qtw.337.1627837910297; 
 Sun, 01 Aug 2021 10:11:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyinS8GSnrXvluQmYTBI3qoXGEQnCcEuECKw4UCvTJwz1yH44FjyMgcJCYZ7U1Hs68Gsfv6aA==
X-Received: by 2002:ac8:5714:: with SMTP id 20mr10557233qtw.337.1627837909922; 
 Sun, 01 Aug 2021 10:11:49 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id f13sm4378241qkk.29.2021.08.01.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 10:11:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: Fix cscope issues on MacOS and soft links
Date: Sun,  1 Aug 2021 13:11:44 -0400
Message-Id: <20210801171144.60412-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, peterx@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index 401c623a65..5562a9b464 100644
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


