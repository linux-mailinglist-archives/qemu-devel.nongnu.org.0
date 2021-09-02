Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F163FEE72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:12:21 +0200 (CEST)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmVw-00006T-1m
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLmA0-0005JN-Nv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9y-00074g-Ie
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJuO4X7OFW85IDNdVVLbJ0yOhIXK+QU5l/sHCYyRezs=;
 b=HHl/VVvol/VBo/KE4O0AmLm0YpQGW5Q4UfivMk4f9LCapo+eX90b2Kvtq/C9YHwz2PleF0
 JJJ3mxZlnYBVXT18c4pYfP7F6r8un6sAS3dZVjn49pgM2yZ7xKoCfRgA45TEx8uI40uQeB
 ooOZB54XPMWwuO+ymiuyojTxF1D78iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-zijJ4_JHPy2sGpF5hSDwWQ-1; Thu, 02 Sep 2021 08:49:32 -0400
X-MC-Unique: zijJ4_JHPy2sGpF5hSDwWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B48E801B3C;
 Thu,  2 Sep 2021 12:49:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD64710016F2;
 Thu,  2 Sep 2021 12:49:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/13] scripts: Remove the "show-fixed-bugs.sh" file
Date: Thu,  2 Sep 2021 14:49:08 +0200
Message-Id: <20210902124911.822423-11-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we are not using Launchpad anymore, there is no more need for
this script.

Message-Id: <20210825142143.142037-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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


