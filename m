Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2C22F993
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 21:56:12 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k09EJ-0007tL-9z
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 15:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k099m-0008BL-1m
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 15:51:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24718
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k099i-0004pC-US
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 15:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595879485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dfd3qkM1bqg4CIxNzJ4YaOWmR/AjbViubSA9eI7tutg=;
 b=fhcmr6oOBfjY+GDbFEePe+OxHxSm5oWhHOAsZ26vOYFuudRczEkt5nUXaVmrMK/14Jw5vh
 KU6zV+MBy7N/tBqoM24FYQC+jr8y/Mnim9ujdvH8gxIe4DqBqRcWVGXZY8bwmzXbIL1SrQ
 NAPjrzTPHZaDJ5u9PG6ATzqbvDaR/u0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-1ynrBw5nMm2k_YwoG-bIUQ-1; Mon, 27 Jul 2020 15:51:23 -0400
X-MC-Unique: 1ynrBw5nMm2k_YwoG-bIUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55AF8186A82C;
 Mon, 27 Jul 2020 19:51:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-118-248.rdu2.redhat.com [10.10.118.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38FF669323;
 Mon, 27 Jul 2020 19:51:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.1?] iotests: Adjust which tests are quick
Date: Mon, 27 Jul 2020 14:51:17 -0500
Message-Id: <20200727195117.132151-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:37:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 dgilbert@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A quick run of './check -qcow2 -g migration' shows that test 169 is
NOT quick, but meanwhile several other tests ARE quick.  Let's adjust
the test designations accordingly.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I noticed this while working on my pending pull request that includes
Vladimir's massive speedup of 199 (but even with his speedup, that test
is still not quick).

 tests/qemu-iotests/group | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 1d0252e1f051..806044642c69 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -112,7 +112,7 @@
 088 rw quick
 089 rw auto quick
 090 rw auto quick
-091 rw migration
+091 rw migration quick
 092 rw quick
 093 throttle
 094 rw quick
@@ -186,7 +186,7 @@
 162 quick
 163 rw
 165 rw quick
-169 rw quick migration
+169 rw migration
 170 rw auto quick
 171 rw quick
 172 auto
@@ -197,9 +197,9 @@
 177 rw auto quick
 178 img
 179 rw auto quick
-181 rw auto migration
+181 rw auto migration quick
 182 rw quick
-183 rw migration
+183 rw migration quick
 184 rw auto quick
 185 rw
 186 rw auto
@@ -216,9 +216,9 @@
 198 rw
 199 rw migration
 200 rw
-201 rw migration
+201 rw migration quick
 202 rw quick
-203 rw auto migration
+203 rw auto migration quick
 204 rw quick
 205 rw quick
 206 rw
-- 
2.27.0


