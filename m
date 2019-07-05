Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306EE60C62
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 22:31:56 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjUs7-0004Wx-Cr
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 16:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUk9-0004Ld-W3
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUk4-0002ny-H6
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46956)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hjUk0-0002gH-JE
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z1so6392869wru.13
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=2QJXgDdeciu+QM4e3C1K2WEVvDtyNAWGx3hRO2WruJ0=;
 b=W1C4IIInxHmm2j6ms/74hDmp0LtqX9wHVoNRfffyya+p8megN0YXbeVuSuCnnEyNTT
 GVY8mjl4MdoUqydVMgWIRfnqBQcruMIb4BhZxkBsGpb4Vn5c5P+8/Uzqb3i0JaZ8aAxd
 2t/XnVwQ8mUgWxTXlXWsg+Xgjab0w5reGBA7mN/UYmZFd9m/r8YlMKU0ljiqxcWxeUtf
 mgd+pikrgOjiNwXDAemnUOBY748n3QmLsgNbJ4ceexdZxJcHwFVvg4hhBoYS6Afdh/ua
 Udj7BQ3I67GVJoFTIcVKUfJ0drngeo3NSXJdmZ8MlytyMCWiMwhjRUIxdQ9wSVCMGr5e
 S/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=2QJXgDdeciu+QM4e3C1K2WEVvDtyNAWGx3hRO2WruJ0=;
 b=bRt/h0T4oQjFalToH4aGsu4j9E9QOIAsJLeYKIz+e7CJI8bE5TfF+4U12ctGlyOVNF
 RkRaMhk4MVnBIte6O3bed1PSh5U5MlfEgST/qsqY1Gc5SfpDleUHb5SXvL+UBc8TuaSf
 JarYzT3ZpFgBWkczZKCd5vRZ/6121ar1WMPmpnVbKrANBweYinDDeevqqTkLwzgT1ctW
 thiqeRYoTgKrm1PYOfr0IIHkdJmPwDHlvsyObLERxd3caU7NQ7k5cvk0a9YTCd+Kb9D+
 kfqN400iZuqZJc3j+s9UOgDf7X4RbCSu2NC5FeMCrgCpstyGcbt5IBjuXIUfJuPzQqeQ
 xx4w==
X-Gm-Message-State: APjAAAV2swoAuRqsXXGfjpD8KMBl09onLi6wkI8RPW7ftyUVT/aydn9A
 Vf7svX6ZGOm+1Rdj15zEOou7ZcG47r8=
X-Google-Smtp-Source: APXvYqxytVifRVE+fgeroUdTtAW4PhIvmRt485rGBW7kvxqAMnBWjWNVGxoYN8peMrf+lWsl2oaNCg==
X-Received: by 2002:adf:c706:: with SMTP id k6mr5239400wrg.40.1562358205626;
 Fri, 05 Jul 2019 13:23:25 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id v23sm3035875wmj.32.2019.07.05.13.23.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 13:23:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:23:12 +0200
Message-Id: <1562358202-28008-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
References: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PULL 02/12] checkpatch: do not warn for multiline
 parenthesized returned value
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

While indeed we do not want to have

    return (a);

it is less clear that this applies to

    return (a &&
            b);

Some editors indent more nicely if you have parentheses, and some people's
eyes may appreciate that as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1561116534-21814-1-git-send-email-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c2aaf42..2f81371 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2296,7 +2296,8 @@ sub process {
 			       $value =~ s/\([^\(\)]*\)/1/) {
 			}
 #print "value<$value>\n";
-			if ($value =~ /^\s*(?:$Ident|-?$Constant)\s*$/) {
+			if ($value =~ /^\s*(?:$Ident|-?$Constant)\s*$/ &&
+			    $line =~ /;$/) {
 				ERROR("return is not a function, parentheses are not required\n" . $herecurr);
 
 			} elsif ($spacing !~ /\s+/) {
-- 
1.8.3.1



