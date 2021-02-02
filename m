Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7830CB24
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:16:15 +0100 (CET)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l719q-000256-8C
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l716C-0001GR-Q2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l7169-0003Ty-KI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612293144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BK/ICNeoZrpNbeqdcfS6CcF+k2lKiPJLcbhlihNzZmY=;
 b=edvR0kRqFPVoooGBwSUnCVRxtsaf8WCn45Djdnxv/0QknJs1X+tvAOII6GR5SQ2DGpNTc9
 8rQDkjfHWwKC5F53OTZHmqTY0iGSqEzydTtavaI7PdMjraNoPyIPtlEsAJ0V8SPYBXz3dA
 NNlaHikb9JYRfgl3qvuEeompD2ykCQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-YcIculLAMqS454qiV7kaeQ-1; Tue, 02 Feb 2021 14:12:20 -0500
X-MC-Unique: YcIculLAMqS454qiV7kaeQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1976C1084457
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 19:12:09 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD1D85DA7B;
 Tue,  2 Feb 2021 19:12:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] device-crash-test: Remove problematic language
Date: Tue,  2 Feb 2021 14:12:07 -0500
Message-Id: <20210202191207.4103973-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace "whitelist" in the device-crash-test script with
"rule list".

I'm using "rule list" instead of "allow list" or "pass list"
because the list is not used only for expected/allowed errors.
It also contain rules specifying which errors shouldn't be
ignored and/or should be fatal.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/device-crash-test | 96 +++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 04118669ba7..ef1412ca590 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -41,18 +41,18 @@ logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
 
 
-# Purposes of the following whitelist:
+# Purposes of the following rule list:
 # * Avoiding verbose log messages when we find known non-fatal
 #   (exitcode=1) errors
 # * Avoiding fatal errors when we find known crashes
 # * Skipping machines/devices that are known not to work out of
 #   the box, when running in --quick mode
 #
-# Keeping the whitelist updated is desirable, but not required,
+# Keeping the rule list updated is desirable, but not required,
 # because unexpected cases where QEMU exits with exitcode=1 will
 # just trigger a INFO message.
 
-# Valid whitelist entry keys:
+# Valid error rule keys:
 # * accel: regexp, full match only
 # * machine: regexp, full match only
 # * device: regexp, full match only
@@ -62,7 +62,7 @@ dbg = logger.debug
 # * expected: if True, QEMU is expected to always fail every time
 #   when testing the corresponding test case
 # * loglevel: log level of log output when there's a match.
-ERROR_WHITELIST = [
+ERROR_RULE_LIST = [
     # Machines that won't work out of the box:
     #             MACHINE                         | ERROR MESSAGE
     {'machine':'niagara', 'expected':True},       # Unable to load a firmware for -M niagara
@@ -186,65 +186,65 @@ ERROR_WHITELIST = [
 ]
 
 
-def whitelistTestCaseMatch(wl, t):
-    """Check if a test case specification can match a whitelist entry
+def errorRuleTestCaseMatch(rule, t):
+    """Check if a test case specification can match a error rule
 
-    This only checks if a whitelist entry is a candidate match
+    This only checks if a error rule is a candidate match
     for a given test case, it won't check if the test case
-    results/output match the entry.  See whitelistResultMatch().
+    results/output match the rule.  See ruleListResultMatch().
     """
-    return (('machine' not in wl or
+    return (('machine' not in rule or
              'machine' not in t or
-             re.match(wl['machine'] + '$', t['machine'])) and
-            ('accel' not in wl or
+             re.match(rule['machine'] + '$', t['machine'])) and
+            ('accel' not in rule or
              'accel' not in t or
-             re.match(wl['accel'] + '$', t['accel'])) and
-            ('device' not in wl or
+             re.match(rule['accel'] + '$', t['accel'])) and
+            ('device' not in rule or
              'device' not in t or
-             re.match(wl['device'] + '$', t['device'])))
+             re.match(rule['device'] + '$', t['device'])))
 
 
-def whitelistCandidates(t):
+def ruleListCandidates(t):
     """Generate the list of candidates that can match a test case"""
-    for i, wl in enumerate(ERROR_WHITELIST):
-        if whitelistTestCaseMatch(wl, t):
-            yield (i, wl)
+    for i, rule in enumerate(ERROR_RULE_LIST):
+        if errorRuleTestCaseMatch(rule, t):
+            yield (i, rule)
 
 
 def findExpectedResult(t):
-    """Check if there's an expected=True whitelist entry for a test case
+    """Check if there's an expected=True error rule for a test case
 
-    Returns (i, wl) tuple, where i is the index in
-    ERROR_WHITELIST and wl is the whitelist entry itself.
+    Returns (i, rule) tuple, where i is the index in
+    ERROR_RULE_LIST and rule is the error rule itself.
     """
-    for i, wl in whitelistCandidates(t):
-        if wl.get('expected'):
-            return (i, wl)
+    for i, rule in ruleListCandidates(t):
+        if rule.get('expected'):
+            return (i, rule)
 
 
-def whitelistResultMatch(wl, r):
-    """Check if test case results/output match a whitelist entry
+def ruleListResultMatch(rule, r):
+    """Check if test case results/output match a error rule
 
     It is valid to call this function only if
-    whitelistTestCaseMatch() is True for the entry (e.g. on
-    entries returned by whitelistCandidates())
+    errorRuleTestCaseMatch() is True for the rule (e.g. on
+    rules returned by ruleListCandidates())
     """
-    assert whitelistTestCaseMatch(wl, r['testcase'])
-    return ((wl.get('exitcode', 1) is None or
-             r['exitcode'] == wl.get('exitcode', 1)) and
-            ('log' not in wl or
-             re.search(wl['log'], r['log'], re.MULTILINE)))
+    assert errorRuleTestCaseMatch(rule, r['testcase'])
+    return ((rule.get('exitcode', 1) is None or
+             r['exitcode'] == rule.get('exitcode', 1)) and
+            ('log' not in rule or
+             re.search(rule['log'], r['log'], re.MULTILINE)))
 
 
-def checkResultWhitelist(r):
-    """Look up whitelist entry for a given test case result
+def checkResultRuleList(r):
+    """Look up error rule for a given test case result
 
-    Returns (i, wl) tuple, where i is the index in
-    ERROR_WHITELIST and wl is the whitelist entry itself.
+    Returns (i, rule) tuple, where i is the index in
+    ERROR_RULE_LIST and rule is the error rule itself.
     """
-    for i, wl in whitelistCandidates(r['testcase']):
-        if whitelistResultMatch(wl, r):
-            return i, wl
+    for i, rule in ruleListCandidates(r['testcase']):
+        if ruleListResultMatch(rule, r):
+            return i, rule
 
     raise Exception("this should never happen")
 
@@ -543,12 +543,12 @@ def main():
             break
 
         if f:
-            i, wl = checkResultWhitelist(f)
-            dbg("testcase: %r, whitelist match: %r", t, wl)
+            i, rule = checkResultRuleList(f)
+            dbg("testcase: %r, rule list match: %r", t, rule)
             wl_stats.setdefault(i, []).append(f)
-            level = wl.get('loglevel', logging.DEBUG)
+            level = rule.get('loglevel', logging.DEBUG)
             logFailure(f, level)
-            if wl.get('fatal') or (args.strict and level >= logging.WARN):
+            if rule.get('fatal') or (args.strict and level >= logging.WARN):
                 fatal_failures.append(f)
         else:
             dbg("success: %s", formatTestCase(t))
@@ -560,10 +560,10 @@ def main():
         logger.info("Skipped %d test cases", skipped)
 
     if args.debug:
-        stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
-                         enumerate(ERROR_WHITELIST)], key=lambda x: x[0])
-        for count, wl in stats:
-            dbg("whitelist entry stats: %d: %r", count, wl)
+        stats = sorted([(len(wl_stats.get(i, [])), rule) for i, rule in
+                         enumerate(ERROR_RULE_LIST)], key=lambda x: x[0])
+        for count, rule in stats:
+            dbg("error rule stats: %d: %r", count, rule)
 
     if fatal_failures:
         for f in fatal_failures:
-- 
2.28.0


