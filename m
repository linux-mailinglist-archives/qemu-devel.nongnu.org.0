Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1E3D39E8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:03:04 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ttO-0001x9-CS
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6tsc-0001I2-0p
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6tsX-0001G1-40
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627041727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bGdVqiDLMv3lEVzW1di8JcpKB5o7922vJVvPd8lkY7E=;
 b=LsDtyDos5JxyhOJMdrCw6/K76hOfqORsVNuxGxXf5oHzCxjfq9HeUJk8aRPwAqWRMgQZJU
 yzlfulZZpjN25wR/fAbZP8uzF6oE1MNTUITXyL28FYQoQVrJYKnt7D4duV0kOPkz3UtfI0
 Db5rTDOx/FkiirIr0bZuGb+DZhtTnRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-ig8VuomKPReqMUyGAKLHNg-1; Fri, 23 Jul 2021 08:02:05 -0400
X-MC-Unique: ig8VuomKPReqMUyGAKLHNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EEB0801AE7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:02:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 739BD1A869;
 Fri, 23 Jul 2021 12:01:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E96C818000A3; Fri, 23 Jul 2021 14:01:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix dependencies for modinfo #2
Date: Fri, 23 Jul 2021 14:01:56 +0200
Message-Id: <20210723120156.1183920-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

modinfo runs the preprocessor and therefore needs all generated input files
to be there.  The "depends" clause does not work in Meson 0.55.3, so for
now use "input".

Part #2: Update the rule for target-specific modules too.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index df5094e563e9..f2e148eaf98e 100644
--- a/meson.build
+++ b/meson.build
@@ -2373,9 +2373,9 @@ foreach d, list : target_modules
             # FIXME: Should use sl.extract_all_objects(recursive: true) too.
             modinfo_files += custom_target(module_name + '.modinfo',
                                            output: module_name + '.modinfo',
-                                           input: target_module_ss.sources(),
+                                           input: target_module_ss.sources() + genh,
                                            capture: true,
-                                           command: [modinfo_collect, '--target', target, '@INPUT@'])
+                                           command: [modinfo_collect, '--target', target, target_module_ss.sources()])
           endif
         endif
       endforeach
-- 
2.31.1


