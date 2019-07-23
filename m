Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEE7164F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 12:39:06 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpsCI-0000ci-6L
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 06:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37911)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hps9h-0006CZ-UA
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hps9g-0007TJ-OJ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:36:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hps9g-0007Sj-I9
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:36:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id 31so42646348wrm.1
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMKdIh2g4fFAozN08FjAe0WwG5ZoXRsvCwFyQU3g99o=;
 b=G/WCn/oKpEsorjpZxDmSZANa7D5EWf/oJ9P2BTlyDKQkQI3/bINkUTlhgVAqfgSGOy
 nIkLUMG+wNQeEjaz5wS5TL8D8HZickanwUGOG6+hEDHrDhtDPPwpcVPktMhhiQVRl9H6
 wDsHPBheeIU0I6U3CUR1Li8L4jmqWTpQqun/mrYk6aWZodwXAgNuslXa+tCBZRaj/a1v
 SzQssTdKZ9/D8ZgYBh8LQggcmKL6XizQEMuWvlJicm0LokphrlTyhvcA1Yh1Q6jOhEC4
 PRju+v1WQDJHXDCvviJwrMXcQbkj2M6R3t3h1OIs2zET7qVT3xKhf80QaVS0U837qH1C
 geRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMKdIh2g4fFAozN08FjAe0WwG5ZoXRsvCwFyQU3g99o=;
 b=AmwZc5hfWKSqoQ43CUXto6owJiNNB5RF4WRPY/Qo2JU/OvhO1dFOeGdS26Ja7r9RfL
 QT7F+XpCEqxgnzJG8Ax8kJm0t+5+TJjl+l1lCXtOP1QzMVdxFV6i47/2Iz2vTW5I0vZC
 MyMaVlt+x2VNBV42gohUJkQ7YVGxz5QIQBEKS/+CjRqBOXb3rDx0m/P7J3b2QLb/hdAS
 JhRu/+yAJ4KkKI9QgGw0nE/PO1aeeWI3xZ6n6e4YzoaxRQYY9oEEUkZvxf7wIFqSSshy
 nckFiJU8OubRNnZX1+ov3/vS1NuR6eyI+lBxTf+hgWzU74yGZwZ4gKDnAFzZj6/N1y0w
 NObQ==
X-Gm-Message-State: APjAAAWVS1SFr+1aNRKOI1m+8KjfXCaWMzeVWiKWZpBlPdrrOiNck9rA
 2Dy0HyRClg39N69QpuMhcyslCvuKnrs=
X-Google-Smtp-Source: APXvYqzFS1yjcde51rFi1gvEpgsWSqHCX/XC1LdH+iCmsA8l2WeCqW9vNvzGquu/BL1NHws2zaiiig==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr4985394wrw.64.1563878183343;
 Tue, 23 Jul 2019 03:36:23 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id s63sm35358934wme.17.2019.07.23.03.36.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:36:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6200F1FFAB;
 Tue, 23 Jul 2019 11:36:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 23 Jul 2019 11:36:12 +0100
Message-Id: <20190723103612.5600-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723103612.5600-1-alex.bennee@linaro.org>
References: <20190723103612.5600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-devel] [PULL 23/23] gitlab-ci: Remove qcow2 tests that are
 handled by "make check" already
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Since most iotests are now run during "make check" already, we do not
need to test them explicitly from the gitlab-ci.yml script anymore.
And while we're at it, add some of the new non-auto tests >= 246 instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190717111947.30356-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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


