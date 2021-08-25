Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C357D3F7713
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:23:31 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItoG-0004wV-TX
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mItms-0003lQ-S7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mItmq-0006r8-UA
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 10:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629901312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TvGnJPU5Wbb8imQqQOMANo/AZ0oxg9H9ViHFBV4SBG0=;
 b=Kt06KbCOInQA1GXmQ7vA3LFZOsDjNcCG0YHhU9nTr41wvyUZo5ABeCBZvONMNeymyZUdvU
 UdJPQ4iTuJlFLuSmoeVV3xPhm4tzmmFSv/Iw3gFNTKI07Xsn1jQ2wnW5rMMrvyXlHO0Ex6
 7GCZsBMv8c6CDFavVdUmsdhugqLYxeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-SugC2KifPgqlCIkMrqTgyg-1; Wed, 25 Aug 2021 10:21:49 -0400
X-MC-Unique: SugC2KifPgqlCIkMrqTgyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 249CE801E72;
 Wed, 25 Aug 2021 14:21:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB3C3CC7;
 Wed, 25 Aug 2021 14:21:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: Remove the "show-fixed-bugs.sh" file
Date: Wed, 25 Aug 2021 16:21:43 +0200
Message-Id: <20210825142143.142037-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we are not using Launchpad anymore, there is no more need for
this script.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/show-fixed-bugs.sh | 91 --------------------------------------
 1 file changed, 91 deletions(-)
 delete mode 100755 scripts/show-fixed-bugs.sh

diff --git a/scripts/show-fixed-bugs.sh b/scripts/show-fixed-bugs.sh
deleted file mode 100755
index a095a4d6ba..0000000000
--- a/scripts/show-fixed-bugs.sh
+++ /dev/null
@@ -1,91 +0,0 @@
-#!/bin/sh
-
-# This script checks the git log for URLs to the QEMU launchpad bugtracker
-# and optionally checks whether the corresponding bugs are not closed yet.
-
-show_help () {
-    echo "Usage:"
-    echo "  -s <commit>  : Start searching at this commit"
-    echo "  -e <commit>  : End searching at this commit"
-    echo "  -c           : Check if bugs are still open"
-    echo "  -b           : Open bugs in browser"
-}
-
-while getopts "s:e:cbh" opt; do
-   case "$opt" in
-    s)  start="$OPTARG" ;;
-    e)  end="$OPTARG" ;;
-    c)  check_if_open=1 ;;
-    b)  show_in_browser=1 ;;
-    h)  show_help ; exit 0 ;;
-    *)   echo "Use -h for help." ; exit 1 ;;
-   esac
-done
-
-if [ "x$start" = "x" ]; then
-    start=$(git tag -l 'v[0-9]*\.[0-9]*\.0' | tail -n 2 | head -n 1)
-fi
-if [ "x$end" = "x" ]; then
-    end=$(git tag -l  'v[0-9]*\.[0-9]*\.0' | tail -n 1)
-fi
-
-if [ "x$start" = "x" ] || [ "x$end" = "x" ]; then
-    echo "Could not determine start or end revision ... Please note that this"
-    echo "script must be run from a checked out git repository of QEMU."
-    exit 1
-fi
-
-echo "Searching git log for bugs in the range $start..$end"
-
-urlstr='https://bugs.launchpad.net/\(bugs\|qemu/+bug\)/'
-bug_urls=$(git log $start..$end \
-  | sed -n '\,'"$urlstr"', s,\(.*\)\('"$urlstr"'\)\([0-9]*\).*,\2\4,p' \
-  | sort -u)
-
-echo Found bug URLs:
-for i in $bug_urls ; do echo " $i" ; done
-
-if [ "x$check_if_open" = "x1" ]; then
-    echo
-    echo "Checking which ones are still open..."
-    for i in $bug_urls ; do
-        if ! curl -s -L "$i" | grep "value status" | grep -q "Fix Released" ; then
-            echo " $i"
-            final_bug_urls="$final_bug_urls $i"
-        fi
-    done
-else
-    final_bug_urls=$bug_urls
-fi
-
-if [ "x$final_bug_urls" = "x" ]; then
-    echo "No open bugs found."
-elif [ "x$show_in_browser" = "x1" ]; then
-    # Try to determine which browser we should use
-    if [ "x$BROWSER" != "x" ]; then
-        bugbrowser="$BROWSER"
-    elif command -v xdg-open >/dev/null 2>&1; then
-        bugbrowser=xdg-open
-    elif command -v gnome-open >/dev/null 2>&1; then
-        bugbrowser=gnome-open
-    elif [ "$(uname)" = "Darwin" ]; then
-        bugbrowser=open
-    elif command -v sensible-browser >/dev/null 2>&1; then
-        bugbrowser=sensible-browser
-    else
-        echo "Please set the BROWSER variable to the browser of your choice."
-        exit 1
-    fi
-    # Now show the bugs in the browser
-    first=1
-    for i in $final_bug_urls; do
-        "$bugbrowser" "$i"
-        if [ $first = 1 ]; then
-            # if it is the first entry, give the browser some time to start
-            # (to avoid messages like "Firefox is already running, but is
-            # not responding...")
-            sleep 4
-            first=0
-        fi
-    done
-fi
-- 
2.27.0


