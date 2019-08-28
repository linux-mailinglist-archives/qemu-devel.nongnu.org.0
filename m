Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42AA019C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:29:08 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2x4V-0008O3-86
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wlV-0002KB-73
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wlT-0004EM-VP
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wlT-0004Dz-PY
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b16so2234119wrq.9
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KSEgW/RlIiuzqLmIOofMJWxF7Te87Mr+srbDIEOWTAs=;
 b=li1toCyLJbHv8GUACtUJp+Wl/5kx/sdc1lgOMMO0m9q8xmv32DrXCPd1Am64LTn+vq
 ITntiiXWgSy2C+vtwx3GiP5d/nwLdeJYV4fOjPBYg753S6XSqJH+3FxVWKNzra2e7BX1
 ANeeed3Mwlgxctq1YKLOVWFMUdR75hO/zuExAJazdY3gV/mrmcr6K8+v/sYFTtc4aVjF
 jgEpRBE9SvzuNRO5wjCk2OTd1jllYxJaGn33x++23hQlcLuLCYBHHUOiSIDmmkEcIhe3
 ObNmoSiZl9y3qmCpcSL/t2XX3wYQZtMQD7Z4nKlf4kVf1ISY5yml5YKUzh69iIU2Uh/F
 XbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSEgW/RlIiuzqLmIOofMJWxF7Te87Mr+srbDIEOWTAs=;
 b=hhVX4eF4m/aBZBFAv6XTi9TFFTDiQGplU+D2H2uTbbofUzP+zUjRO313xkjMFcttsN
 nyL2cD2gmf22ftXNJ2cHqkHfDdw72D9N9hKXE8EAf2j1NDnBX5zWW5AMwW1Q0mmtuyEz
 TfzaAmlSmASUCPFMJqaAjXdu9IFBq1sJ0caZ+0ZPlLYQSx3W+fKf/NH8EeDbKySV5ZkG
 mSMCtEgvwQM7pk9zZSRZJs7JmJcY29Bjdlxx/2nW0JN0EZxTqcGafu9svRYET5rN97um
 NLvfyFaSaEUudmsVN/whV0TB8brlLKABnRw/PpKGf/1WzeY/BytyimPZLgXfCicQrvSq
 ltwQ==
X-Gm-Message-State: APjAAAXGH47BmvhgoizrQuZhycdn1GW0T2YYxUCgcrDu9Pu1Wv4hkbDr
 4Hw39bTBm/BBMTBxov9ZAgs9Jw==
X-Google-Smtp-Source: APXvYqx2cPnFNGGZGVu71rf8W0qV5kl6JYtvg1ma1hqdmEtSj21BmKHk0gVtwPNTWv4rj0ZM8wx1lw==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr4385939wrw.90.1566994166756; 
 Wed, 28 Aug 2019 05:09:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b4sm2742440wma.5.2019.08.28.05.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:09:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6390A1FF93;
 Wed, 28 Aug 2019 13:09:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:09:19 +0100
Message-Id: <20190828120921.9586-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120921.9586-1-alex.bennee@linaro.org>
References: <20190828120921.9586-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: [Qemu-devel] [PATCH v1 6/8] .mailmap/aliases: add some further
 commentary
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The two files are not interchangeable but a change to one *might*
require a change to the other so lets flag that up with an explanation
of what both files are trying to achieve. While we are at it document
the many forms .mailmap can take in the header.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .mailmap                            | 14 ++++++++++++++
 contrib/gitdm/aliases               | 20 ++++++++++++++++++--
 contrib/gitdm/group-map-individuals |  3 ++-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index d0fc1d793c6..0756a0bf66d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1,4 +1,18 @@
 # This mailmap fixes up author names/addresses.
+#
+# If you are adding to this file consider if a similar change needs to
+# be made to contrib/gitdm/aliases. They are not however completely
+# analogous. .mailmap is concerned with fixing up damaged author
+# fields where as the gitdm equivalent is more concerned with making
+# sure multiple email addresses get mapped onto the same author.
+#
+# From man git-shortlog the forms are:
+#
+#  Proper Name <commit@email.xx>
+#  <proper@email.xx> <commit@email.xx>
+#  Proper Name <proper@email.xx> <commit@email.xx>
+#  Proper Name <proper@email.xx> Commit Name <commit@email.xx>
+#
 
 # The first section translates weird addresses from the original git import
 # into proper addresses so that they are counted properly by git shortlog.
diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index 07fd3391a56..c1e744312f5 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -1,6 +1,22 @@
 #
-# This is the email aliases file, mapping secondary addresses
-# onto a single, canonical address. Duplicates some info from .mailmap
+# This is the email aliases file, mapping secondary addresses onto a
+# single, canonical address. It duplicates some info from .mailmap so
+# if you are adding something here also consider if the .mailmap needs
+# updating.
+#
+# If you just want to avoid gitdm complaining about author fields
+# which are actually email addresses with the message:
+#
+#   "...is an author name, probably not what you want"
+#
+# you can just apply --use-mailmap to you git-log command, e.g:
+#
+#   git log --use-mailmap --numstat --since "last 2 years" | $GITDM
+#
+# however that will have the effect of squashing multiple addresses to
+# a canonical address which will distort the stats of those who
+# contribute in both personal and professional capacities from
+# different addresses.
 #
 
 # weird commits
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 05e355d30ec..1c847174380 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -2,7 +2,8 @@
 # Individual and personal contributors
 #
 # This is simply to allow prolific developers with no company
-# affiliations to be grouped together in the summary stats.
+# affiliations (or non-company related personal work) to be grouped
+# together in the summary stats.
 #
 
 f4bug@amsat.org
-- 
2.20.1


