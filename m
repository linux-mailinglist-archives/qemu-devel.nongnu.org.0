Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F92C413
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 12:15:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVZ8l-0001EY-LL
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 06:15:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYth-0006OR-SJ
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtf-0005ZM-Rg
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYtf-0005XP-J8
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i3so2173102wml.4
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0Lud7yYlVVyhHS+OI1YCD1+JH7L0tGMnLzLym0KFWVY=;
	b=DJ2HBVOrJRYByjAo3RE2LDneaP55/KUMkBt5jffp7x76y3jsVgVg0m1cFg5sapYtZg
	gA1MZfM7c9oMYL7/GhIPFkfo60xjjhhG6vAasc8uhvOKuoZ8b4E6N7mCq8e/IIQwnD0S
	rlgUvauWIemETtmpN8TlehB14SXW5omSirIJsXgTtpgrr9en4NuBWBKypOz7G4YRqCde
	/VEhkjCfuT8PU+SBFHiAVp+COPUbNdC2fofYqQqJmljSYbOcvgQm5+WBch5NtYZM1asQ
	Do4LcpfTIxsayRySV0iTxCeonYG9ozcLqMVn8YlGtkxLg00xH/LrOB3LwLAmT4yrO9oI
	y6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0Lud7yYlVVyhHS+OI1YCD1+JH7L0tGMnLzLym0KFWVY=;
	b=dGY4oIA3FsgsraYfymEM1HXejx2/TzdK239SNBzpAi9FTnrJuaRU40MNl1hLswoaXW
	d8dG2Wpf4kqDy/XxF4cuK3sqmScer5gDAZJR6MXe/dAK0u/nbyOTa1BudbHHU7ynpYzH
	1dV6f82gsckx4LDhYruVNHAZbB/YhCXEi3dYW5U9DTUMwcCFTUyF/T1fj4KmFVHtB9dx
	KBY+7yp5MEhdRc7BHTslX9/tI5OPPJri1Mx4s/BtpRU3I1043sPehkykoucUSVYSdHRv
	9JsScUySs0NGO55/irj/aHh2rR/uF0pzOFXY0QlhcXtO835mAEjMkdkyjpLYYNiV8j+3
	ZnNw==
X-Gm-Message-State: APjAAAWaY5cfC6gs5gZA5WFaIanrjUAwxRsxSRZVLLiIfMjIi6mJ8Bhv
	Mx2uRBd+6Aod3Pfqi1VrcWRLcA==
X-Google-Smtp-Source: APXvYqxmX0KXsJSIJDkQdZ53dD6uIW7nluNld7ksI3A3wuRQ5p4BBh1S2TapsIBPkBfeZpjsaARgtA==
X-Received: by 2002:a05:600c:40f:: with SMTP id
	q15mr2426034wmb.157.1559037594234; 
	Tue, 28 May 2019 02:59:54 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	v5sm27524693wra.83.2019.05.28.02.59.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:59:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B6ACF1FFAE;
	Tue, 28 May 2019 10:49:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:51 +0100
Message-Id: <20190528094953.14898-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: [Qemu-devel] [PULL 26/28] tests/qemu-iotests/group: Re-use the
 "auto" group for tests that can always run
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Currently, all tests are in the "auto" group. This is a little bit pointless.
OTOH, we need a group for the tests that we can automatically run during
"make check" each time, too. Tests in this new group are supposed to run
with every possible QEMU configuration, for example they must run with every
QEMU binary (also non-x86), without failing when an optional features is
missing (but reporting "skip" is ok), and be able to run on all kind of host
filesystems and users (i.e. also as "nobody" or "root").
So let's use the "auto" group for this class of tests now. The initial
list has been determined by running the iotests with non-x86 QEMU targets
and with our CI pipelines on Gitlab, Cirrus-CI and Travis (i.e. including
macOS and FreeBSD).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190502084506.8009-7-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 52b7c16e155..2c74deec00e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -1,8 +1,21 @@
 #
 # QA groups control file
 # Defines test groups
+#
+# Some notes about the groups:
+#
 # - do not start group names with a digit
 #
+# - quick : Tests in this group should finish within some few seconds.
+#
+# - img : Tests in this group can be used to excercise the qemu-img tool.
+#
+# - auto : Tests in this group are used during "make check" and should be
+#   runnable in any case. That means they should run with every QEMU binary
+#   (also non-x86), with every QEMU configuration (i.e. must not fail if
+#   an optional feature is not compiled in - but reporting a "skip" is ok),
+#   and work all kind of host filesystems and users (e.g. "nobody" or "root").
+#
 
 #
 # test-group association ... one line per test
@@ -32,11 +45,11 @@
 023 rw auto
 024 rw backing auto quick
 025 rw auto quick
-026 rw blkdbg auto
+026 rw blkdbg
 027 rw auto quick
-028 rw backing auto quick
+028 rw backing quick
 029 rw auto quick
-030 rw auto backing
+030 rw backing
 031 rw auto quick
 032 rw auto quick
 033 rw auto quick
@@ -46,35 +59,35 @@
 037 rw auto backing quick
 038 rw auto backing quick
 039 rw auto quick
-040 rw auto
-041 rw auto backing
+040 rw
+041 rw backing
 042 rw auto quick
 043 rw auto backing
-044 rw auto
-045 rw auto quick
+044 rw
+045 rw quick
 046 rw auto aio quick
 047 rw auto quick
 048 img auto quick
 049 rw auto
 050 rw auto backing quick
-051 rw auto
+051 rw
 052 rw auto backing quick
 053 rw auto quick
 054 rw auto quick
-055 rw auto
-056 rw auto backing
-057 rw auto
-058 rw auto quick
+055 rw
+056 rw backing
+057 rw
+058 rw quick
 059 rw auto quick
 060 rw auto quick
 061 rw auto
 062 rw auto quick
 063 rw auto quick
 064 rw auto quick
-065 rw auto quick
+065 rw quick
 066 rw auto quick
-067 rw auto quick
-068 rw auto quick
+067 rw quick
+068 rw quick
 069 rw auto quick
 070 rw auto quick
 071 rw auto quick
@@ -91,18 +104,18 @@
 082 rw auto quick
 083 rw auto
 084 img auto quick
-085 rw auto
+085 rw
 086 rw auto quick
-087 rw auto quick
+087 rw quick
 088 rw auto quick
 089 rw auto quick
 090 rw auto quick
 091 rw auto migration
 092 rw auto quick
-093 auto
+093 throttle
 094 rw auto quick
-095 rw auto quick
-096 rw auto quick
+095 rw quick
+096 rw quick
 097 rw auto backing
 098 rw auto backing quick
 099 rw auto quick
@@ -118,60 +131,60 @@
 109 rw auto
 110 rw auto backing quick
 111 rw auto quick
-112 rw auto
+112 rw
 113 rw auto quick
 114 rw auto quick
-115 rw auto
+115 rw
 116 rw auto quick
 117 rw auto
-118 rw auto
+118 rw
 119 rw auto quick
 120 rw auto quick
-121 rw auto
+121 rw
 122 rw auto
 123 rw auto quick
-124 rw auto backing
-125 rw auto
+124 rw backing
+125 rw
 126 rw auto backing
-127 rw auto backing quick
+127 rw backing quick
 128 rw auto quick
-129 rw auto quick
+129 rw quick
 130 rw auto quick
 131 rw auto quick
-132 rw auto quick
+132 rw quick
 133 auto quick
 134 rw auto quick
 135 rw auto
-136 rw auto
+136 rw
 137 rw auto
 138 rw auto quick
-139 rw auto quick
+139 rw quick
 140 rw auto quick
 141 rw auto quick
 142 auto
 143 auto quick
-144 rw auto quick
-145 auto quick
+144 rw quick
+145 quick
 146 auto quick
-147 auto
-148 rw auto quick
-149 rw auto sudo
+147 img
+148 rw quick
+149 rw sudo
 150 rw auto quick
-151 rw auto
-152 rw auto quick
-153 rw auto quick
+151 rw
+152 rw quick
+153 rw quick
 154 rw auto backing quick
-155 rw auto
+155 rw
 156 rw auto quick
-157 auto
+157 quick
 158 rw auto quick
 159 rw auto quick
 160 rw auto quick
 161 rw auto quick
-162 auto quick
-163 rw auto
-165 rw auto quick
-169 rw auto quick migration
+162 quick
+163 rw
+165 rw quick
+169 rw quick migration
 170 rw auto quick
 171 rw auto quick
 172 auto
@@ -180,74 +193,74 @@
 175 auto quick
 176 rw auto backing
 177 rw auto quick
-178 auto
+178 img
 179 rw auto quick
 181 rw auto migration
-182 rw auto quick
-183 rw auto migration
+182 rw quick
+183 rw migration
 184 rw auto quick
-185 rw auto
+185 rw
 186 rw auto
 187 rw auto
-188 rw auto quick
-189 rw auto
+188 rw quick
+189 rw
 190 rw auto quick
 191 rw auto
 192 rw auto quick
-194 rw auto migration quick
+194 rw migration quick
 195 rw auto quick
-196 rw auto quick migration
+196 rw quick migration
 197 rw auto quick
-198 rw auto
-199 rw auto migration
-200 rw auto
+198 rw
+199 rw migration
+200 rw
 201 rw auto migration
-202 rw auto quick
-203 rw auto migration
-204 rw auto quick
-205 rw auto quick
-206 rw auto
+202 rw quick
+203 rw migration
+204 rw quick
+205 rw quick
+206 rw
 207 rw auto
-208 rw auto quick
-209 rw auto quick
+208 rw quick
+209 rw quick
 210 rw auto
 211 rw auto quick
 212 rw auto quick
 213 rw auto quick
 214 rw auto
 215 rw auto quick
-216 rw auto quick
+216 rw quick
 217 rw auto quick
-218 rw auto quick
-219 rw auto
+218 rw quick
+219 rw
 220 rw auto
 221 rw auto quick
-222 rw auto quick
-223 rw auto quick
-224 rw auto quick
+222 rw quick
+223 rw quick
+224 rw quick
 225 rw auto quick
 226 auto quick
-227 auto quick
-228 rw auto quick
+227 quick
+228 rw quick
 229 auto quick
 231 auto quick
-232 auto quick
+232 quick
 233 auto quick
-234 auto quick migration
-235 auto quick
-236 auto quick
+234 quick migration
+235 quick
+236 quick
 237 rw auto quick
-238 auto quick
+238 quick
 239 rw auto quick
-240 auto quick
+240 quick
 241 rw auto quick
-242 rw auto quick
+242 rw quick
 243 rw auto quick
 244 rw auto quick
-245 rw auto
-246 rw auto quick
-247 rw auto quick
-248 rw auto quick
+245 rw
+246 rw quick
+247 rw quick
+248 rw quick
 249 rw auto quick
 252 rw auto backing quick
 253 rw auto quick
-- 
2.20.1


