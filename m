Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E276BDAF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 15:52:47 +0200 (CEST)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnkMP-0003Bb-Oa
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 09:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkKh-0004ck-IL
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkKg-000147-Cp
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:50:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hnkKg-000133-6a
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:50:58 -0400
Received: by mail-wr1-x433.google.com with SMTP id n9so24926654wrr.4
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pqoBdfyfQ4n50onawoU/FS48FgTcxwkxaKzHr93XtPA=;
 b=uMHfX8ggR2y00Q+pn6P234+XW1MxewC/5h9U5RsF4QsKLWwtZpqxg9j6SCztdR4uFt
 ZxIOFVgR2cFB+RNb+DaDHVYKdGRAgZs58XjmjiKaR25DRnck0I2QfhkpGl/VDGgUgeml
 UivvAfyqK3a1sE2SjUWv/Td8GrqQkA/LJ7zpNZWTY8cVYRBFplpMdGt2fiZ2BDu3ntr8
 d64va9cLeMfx68ZcREi6oTZ/qkqsY3Uhc7C4OA8pOr8ZKfHby4chNT7vrAbWfIPKYON8
 raqML6bWgBQ75q0Ph2Bi/dbvlDDCjCJQMWUJazKkVk4R0zTkN4XSExQH/989HXVNNwkM
 Ht9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pqoBdfyfQ4n50onawoU/FS48FgTcxwkxaKzHr93XtPA=;
 b=Yi9VfkzVZnl+RluuAXsOqv6b/miQ9BkH0BRhqjPrn6bGEBaTGrz5WLAJNLKlmCbM1K
 9ih5A50kqRh+q7fao27M4qpbnE8MhnSIk5CCMYALO7MTmFdQ6gAoAyiGU5XT2/IU1bM/
 mU8jAHp1fwJjNVy45pkocoXkYraPjKerWyI4tsJ6bNK4P0firJiN2RIBswHy3QyFi8/u
 8+LfU7R13U4MzqkTCSA4Dir1nAPJKINSwzTutTAq/bdHj7tSAqpf7s9KcaAyeYLiHbX/
 d/qAC6wtPUed3kO5Hs1OqI4vAd0Ewe9/camnHGU96IdcmCwAvBTTjEKUw2WByelBysW6
 iq7A==
X-Gm-Message-State: APjAAAU+ONpqgIcgkcABmtZKxcOUOoa2YhAiVWbPKEQ3som3fWQ+UBec
 1w8oBqpgOBxqBRfTvArBIeiPoQ==
X-Google-Smtp-Source: APXvYqxAw387F+m/llJioEjxfUnUpGWilInRJ1LROWQ2HGzHVPNbbrLhpTFBkw7UjzN7ZkqwANlMnQ==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr42140342wrq.261.1563371456935; 
 Wed, 17 Jul 2019 06:50:56 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j33sm54337220wre.42.2019.07.17.06.50.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 06:50:55 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3A5B1FFAB;
 Wed, 17 Jul 2019 14:43:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 14:43:35 +0100
Message-Id: <20190717134335.15351-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717134335.15351-1-alex.bennee@linaro.org>
References: <20190717134335.15351-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-devel] [PATCH v2 23/23] gitlab-ci: Remove qcow2 tests that
 are handled by "make check" already
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Since most iotests are now run during "make check" already, we do not
need to test them explicitly from the gitlab-ci.yml script anymore.
And while we're at it, add some of the new non-auto tests >= 246 instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190717111947.30356-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c63bf2f8225..cd4c03372b8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -45,15 +45,10 @@ build-tcg-disabled:
  - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 147 148 150 151 152 157 159 160
             163 170 171 183 184 192 194 197 205 208 215 221 222 226 227 236
- - ./check -qcow2 001 002 003 004 005 007 008 009 010 011 012 013 017 018 019
-            020 021 022 024 025 027 028 029 031 032 033 034 035 036 037 038
-            039 040 042 043 046 047 048 049 050 051 052 053 054 056 057 058
-            060 061 062 063 065 066 067 068 069 071 072 073 074 079 080 082
-            085 086 089 090 091 095 096 097 098 099 102 103 104 105 107 108
-            110 111 114 117 120 122 124 126 127 129 130 132 133 134 137 138
-            139 140 141 142 143 144 145 147 150 151 152 154 155 156 157 158
-            161 165 170 172 174 176 177 179 184 186 187 190 192 194 195 196
-            197 200 202 203 205 208 209 214 215 216 217 218 222 226 227 229 234
+ - ./check -qcow2 028 040 051 056 057 058 065 067 068 082 085 091 095 096 102
+            122 124 127 129 132 139 142 144 145 147 151 152 155 157 165 194
+            196 197 200 202 203 205 208 209 215 216 218 222 227 234 246 247
+            248 250 254 255 256
 
 build-user:
  script:
-- 
2.20.1


