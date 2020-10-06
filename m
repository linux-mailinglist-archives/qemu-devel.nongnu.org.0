Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB3285487
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:26:27 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvPe-0006nQ-0W
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPvA0-00079O-5S
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9v-0006RA-Qv
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wabzeqjx4gl9MHSoxV5ky7HBWx939+T9xiX3U/dgbwI=;
 b=XjH0piKSixdASl90jFcQU5OSAp5CAu+g+9z9duDpHhRPA2lJ19Dkcu/ynU6DC9TDk68J09
 s+3KfU3rQu3Justtk6DstrGChNimQFGSekqaZKHR3xWf9eJ2UyQV2lB167Vr9Wjf6Y+h5Q
 z2ioo+umZjbB0dqwg75wUwFVDayLvT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-zGoc1BbMMFmmseS-qe6DSA-1; Tue, 06 Oct 2020 18:10:01 -0400
X-MC-Unique: zGoc1BbMMFmmseS-qe6DSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B501580400C;
 Tue,  6 Oct 2020 22:10:00 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 770406EF43;
 Tue,  6 Oct 2020 22:10:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/21] kernel-doc: Remove $decl_type='type name' hack
Date: Tue,  6 Oct 2020 18:09:29 -0400
Message-Id: <20201006220930.908275-21-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The $decl_type='type name' hack makes it impossible to document
macros with uppercase names (e.g. most of the macros in
object.h).

Now that we have explicitly tagged the struct and typedef doc
comments in memory.h and object.h, we don't need that hack
anymore.  This will make the documentation for the macros in
object.h finally be rendered as expected.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201003024123.193840-6-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/kernel-doc | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 57b911ff17..0ff62bb6a2 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1064,14 +1064,6 @@ sub output_blockhead {
 sub dump_declaration($$) {
     no strict 'refs';
     my ($prototype, $file) = @_;
-    if ($decl_type eq 'type name') {
-       if ($prototype =~ /^(enum|struct|union)\s+/) {
-	   $decl_type = $1;
-	} else {
-	   return;
-       }
-    }
-
     my $func = "dump_" . $decl_type;
     &$func(@_);
 }
@@ -1928,9 +1920,7 @@ sub process_name($$) {
 	    ++$warnings;
 	}
 
-	if ($identifier =~ m/^[A-Z]/) {
-	    $decl_type = 'type name';
-	} elsif ($identifier =~ m/^struct\b/) {
+	if ($identifier =~ m/^struct\b/) {
 	    $decl_type = 'struct';
 	} elsif ($identifier =~ m/^union\b/) {
 	    $decl_type = 'union';
-- 
2.26.2


