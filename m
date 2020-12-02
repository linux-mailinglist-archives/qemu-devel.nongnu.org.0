Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E62CB784
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:46:00 +0100 (CET)
Received: from localhost ([::1]:58688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNlv-0005ME-Kv
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCe-0003CG-Em
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCK-0003jJ-TS
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BIvQ2eZiqMBqVbDjswDQKEC6cHH3qXd59qZ8tvv6IA=;
 b=E9JNGCQASiMBole8Pz/PBsQaT0dtYZf/GQc9364QAO/vXkwyAwBKyy9V9ilL2Bl5uXcDel
 CyPlY3NFLkL7vuQMvS1U13yv4TpxDbMjHDBkLc0JRd4U3IHtbXWtp6T6eNV/3P6VC8B5mw
 pqtLeO4baz79zSD2jbxsZVuDVgOJAjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-eush4CFPMbuv7SpsSrYRew-1; Wed, 02 Dec 2020 03:09:10 -0500
X-MC-Unique: eush4CFPMbuv7SpsSrYRew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA578558F0
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77C115D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 053/113] vl: remove bogus check
Date: Wed,  2 Dec 2020 03:07:49 -0500
Message-Id: <20201202080849.4125477-54-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason to prevent -preconfig -daemonize.  Of course if
no monitor is defined there will be no way to start the VM,
but that is a user error.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 69d54b27b9..2f2372bac7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4032,12 +4032,6 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (is_daemonized()) {
-        if (!preconfig_exit_requested) {
-            error_report("'preconfig' and 'daemonize' options are "
-                         "mutually exclusive");
-            exit(EXIT_FAILURE);
-        }
-
         /* According to documentation and historically, -nographic redirects
          * serial port, parallel port and monitor to stdio, which does not work
          * with -daemonize.  We can redirect these to null instead, but since
-- 
2.26.2



