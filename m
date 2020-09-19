Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D6270F9E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:47:18 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJg17-0006vL-6w
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHc-0005lv-NL
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHQ-0007UV-0Z
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xP6WqepeP8xglmi4j/uOwwV7vPCvBXJqTO/ebv4iXdk=;
 b=fKTs6oZ2eubL03pU/opqLoJxznV3k17WM1QeqCwU91c0tLyn2q1qltSeTHR7Rq6AvrXQBn
 VYdUXz0qVT3xbIbV+TxHWlb0nb5bJQwhudOHPUjRubz4rInpJ8C5Wrj/e2hIQ9W6QQlOq2
 Y6Kxoe8BN38VezepGM7SatXiGLwGWTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-zlNGgAQ-PYO05AincS6yOQ-1; Sat, 19 Sep 2020 12:00:00 -0400
X-MC-Unique: zlNGgAQ-PYO05AincS6yOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D08186DD4B;
 Sat, 19 Sep 2020 15:59:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A728B10016DA;
 Sat, 19 Sep 2020 15:59:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 57/57] meson: fix installation of keymaps
Date: Sat, 19 Sep 2020 11:59:16 -0400
Message-Id: <20200919155916.1046398-58-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:41:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anthony PERARD <anthony.perard@citrix.com>

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Message-Id: <20200918130354.1879275-1-anthony.perard@citrix.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/keymaps/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 2e2e0dfa3b..05eda6c0d2 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,6 +47,7 @@ foreach km, args: keymaps
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                       install: true,
                        install_dir: qemu_datadir / 'keymaps')
   else
     # copy from source tree
@@ -55,6 +56,7 @@ foreach km, args: keymaps
                        input: km,
                        output: km,
                        command: ['cp', '@INPUT@', '@OUTPUT@'],
+                       install: true,
                        install_dir: qemu_datadir / 'keymaps')
   endif
 endforeach
-- 
2.26.2


