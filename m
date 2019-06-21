Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87D4E71F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:31:46 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHlh-0000Kl-4U
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHj3-0007sx-At
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHj0-0003ae-8T
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:29:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHj0-0003Xu-2l
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:28:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id m3so6256320wrv.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=9pL/Z5DFJzohSpK1nhF7UHS5kALHqB6eeua8inxT02g=;
 b=ORUvkXVLFYLfGu/VEWYLZ/xWciYV5whQOi2CQeGMK2tBR4o4K+uDSPVFF3KnpTz007
 CMZtKgo7ckwfBLj7NL3fo2Ao5/EHsZa/TrVcWyhXskJO7+mE27j/HEx3GqxEw3uTrql6
 SOmPzk13LQJMQBIssaQngc5/Euo/qwPMxb2GVqnwqFYpwnrsl8tKQFsnr84Ex09361nI
 79YhwzR0K6kul0oghAxpnSrvyWornrebdfpfRGJq+Eq/xcAIWDk5OibrTsRA3Sa2w0zD
 CbNMt88P3mAmVsWQacXrkDj0PQWSDtOlxyRabO+CoVTS49xW0hkuNShtWgDxcjFJ7Svh
 9ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=9pL/Z5DFJzohSpK1nhF7UHS5kALHqB6eeua8inxT02g=;
 b=W02LaeuRivPLbjh66iKd3kcd16697QHMQtTn9PlaKEIcPQVQeuQ9oefCyFee/g8+kd
 PDOD/oWFuG0GU554JKRl60BzohWJ1EhIPjWZC17u/4k0I75TquYNUd7KBoJOqwymHQh/
 AqM4wzg64b/PI0WikPdUuuyg5l9aHb9+5xP+MTuHg46ZySFnTZFs+O5LMrfDxCxFOUSm
 yfaI9Ju0+EZcAeUF+9KogNFGo+k7JC9/EZuLv3pjk3m+GhJXUL2JRN3ZBhEIpFt89/GF
 zkgbY3PFUrqNprUBEpZhW8SRyWH7uGoK8Jp117suej8ujXJQ3N/7xJwCTpske09t3lm8
 CIFA==
X-Gm-Message-State: APjAAAWDw/Wn897AtLRvogDYEunCPvChVVFeWlual95sIydAPK4xplBu
 WOzmlqMGpkUJeuQ+SMyIfXYLtzCn
X-Google-Smtp-Source: APXvYqxPzF5Z/C9UjV+VWq0q+br6kBEPhgZBPSQKfwSL4X7Xnw2R8U0rhawQZZu3UwGGPwi9fCDcaQ==
X-Received: by 2002:adf:afd5:: with SMTP id y21mr94446674wrd.12.1561116536149; 
 Fri, 21 Jun 2019 04:28:56 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id y6sm2578525wrp.12.2019.06.21.04.28.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:28:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:28:54 +0200
Message-Id: <1561116534-21814-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-devel] [PATCH RFC] checkpatch: do not warn for multiline
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
Cc: armbru@redhat.com
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


