Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC06A8C6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 14:29:53 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnMae-0004cy-Ak
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 08:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hnMZi-0000rG-E5
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hnMZh-00034W-Bi
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:28:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56252)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hnMZf-00032S-7g; Tue, 16 Jul 2019 08:28:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82089C034DF3;
 Tue, 16 Jul 2019 12:28:50 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 725E960C05;
 Tue, 16 Jul 2019 12:28:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Tue, 16 Jul 2019 14:28:36 +0200
Message-Id: <20190716122836.31187-5-thuth@redhat.com>
In-Reply-To: <20190716122836.31187-1-thuth@redhat.com>
References: <20190716122836.31187-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 16 Jul 2019 12:28:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 4/4] gitlab-ci: Remove qcow2 tests that are
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since most iotests are now run during "make check" already, we do not
need to test them explicitly from the gitlab-ci.yml script anymore.
And while we're at it, add some of the new non-auto tests >=3D 248 instea=
d.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c63bf2f822..fa5d094453 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -45,15 +45,9 @@ build-tcg-disabled:
  - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 =
048
             052 063 077 086 101 104 106 113 147 148 150 151 152 157 159 =
160
             163 170 171 183 184 192 194 197 205 208 215 221 222 226 227 =
236
- - ./check -qcow2 001 002 003 004 005 007 008 009 010 011 012 013 017 01=
8 019
-            020 021 022 024 025 027 028 029 031 032 033 034 035 036 037 =
038
-            039 040 042 043 046 047 048 049 050 051 052 053 054 056 057 =
058
-            060 061 062 063 065 066 067 068 069 071 072 073 074 079 080 =
082
-            085 086 089 090 091 095 096 097 098 099 102 103 104 105 107 =
108
-            110 111 114 117 120 122 124 126 127 129 130 132 133 134 137 =
138
-            139 140 141 142 143 144 145 147 150 151 152 154 155 156 157 =
158
-            161 165 170 172 174 176 177 179 184 186 187 190 192 194 195 =
196
-            197 200 202 203 205 208 209 214 215 216 217 218 222 226 227 =
229 234
+ - ./check -qcow2 028 040 051 056 057 058 065 067 068 082 085 091 095 09=
6 102
+            124 127 129 132 139 142 144 145 147 151 152 155 157 165 194 =
196
+            200 202 203 205 208 209 216 218 222 227 234 248 250 254 255 =
256
=20
 build-user:
  script:
--=20
2.21.0


