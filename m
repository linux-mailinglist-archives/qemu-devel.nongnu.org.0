Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E08301608
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:46:40 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KBT-000688-17
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxG-0003b3-7p
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxB-0005qy-33
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9p7gSOnYPpJayFW9/AW7nAqnnRbEnrP94A8CrxVQtAc=;
 b=aHlsg9A09OaWYKAvRS8gAkW9oK4k/WAJC5EcuCmNV0b7ho4z0sDvtbgcWUdCPA/PqgRG4W
 UOSFnpBh0ehV3RyNEV8fJPXUTWbJBr6gKXcn2/V7sKIs+c5CAOscCdTGesZwiYFl9VwCmO
 9tgadrQnN7aQgiFGZTcB3xgmmayAAWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-OuBdu0O2MLeFeIb7m8xuNQ-1; Sat, 23 Jan 2021 09:31:49 -0500
X-MC-Unique: OuBdu0O2MLeFeIb7m8xuNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD1F3107ACE4
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F4143E735;
 Sat, 23 Jan 2021 14:31:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/31] meson: Summarize information related to directories first
Date: Sat, 23 Jan 2021 09:31:12 -0500
Message-Id: <20210123143128.1167797-16-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 49dd0c185f..f50a85e728 100644
--- a/meson.build
+++ b/meson.build
@@ -2233,6 +2233,7 @@ endif
 # Configuration summary #
 #########################
 
+# Directories
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
@@ -2252,8 +2253,11 @@ endif
 summary_info += {'Doc directory':     get_option('docdir')}
 summary_info += {'Build directory':   meson.current_build_dir()}
 summary_info += {'Source path':       meson.current_source_dir()}
-summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
+summary(summary_info, bool_yn: true, section: 'Directories')
+
+summary_info = {}
+summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
-- 
2.26.2



