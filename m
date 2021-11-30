Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB44644B5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 03:02:06 +0100 (CET)
Received: from localhost ([::1]:55334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msEwf-0008PM-Vq
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 21:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1msA2I-0001LP-Go
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 15:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1msA2F-00082C-Ie
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 15:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638305249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXR48lhPAGBkO3HrG/JQN/dF6su9RKWq9/wNF0CGpMI=;
 b=B1LnAsq1Js092hcisGUMey2a3C2GGfWCYj51J1ayIb6/8roH5lmd5g11Kjp0x30kp6/vOn
 Yl15Y7iKOqCtlmiO+hY3DGckhyTEICd+W51L8/1/32mBZu7R0aiT3AgWIzGkqH/XoVPufa
 e6PIqXFMq4g5SgpM35Qy/Vm5jtNcz4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-88vPRsGnPfGY08yVJux8yA-1; Tue, 30 Nov 2021 15:47:26 -0500
X-MC-Unique: 88vPRsGnPfGY08yVJux8yA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DBA10151E4;
 Tue, 30 Nov 2021 20:47:25 +0000 (UTC)
Received: from localhost (unknown [10.22.32.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B859B60C0F;
 Tue, 30 Nov 2021 20:47:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/1] MAINTAINERS: Change my email address
Date: Tue, 30 Nov 2021 15:47:22 -0500
Message-Id: <20211130204722.2732997-2-ehabkost@redhat.com>
In-Reply-To: <20211130204722.2732997-1-ehabkost@redhat.com>
References: <20211130204722.2732997-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 30 Nov 2021 20:58:51 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ehabkost@redhat.com email address will stop working on
2021-12-01, change it to my personal email address.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211129163053.2506734-1-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12..7e8a586b2ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -324,7 +324,7 @@ F: disas/sparc.c
 X86 TCG CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Richard Henderson <richard.henderson@linaro.org>
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: target/i386/tcg/
 F: tests/tcg/i386/
@@ -1628,7 +1628,7 @@ F: include/hw/i386/microvm.h
 F: pc-bios/bios-microvm.bin
 
 Machine core
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
@@ -2648,13 +2648,13 @@ F: backends/cryptodev*.c
 Python library
 M: John Snow <jsnow@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
-R: Eduardo Habkost <ehabkost@redhat.com>
+R: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: python/
 T: git https://gitlab.com/jsnow/qemu.git python
 
 Python scripts
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 M: Cleber Rosa <crosa@redhat.com>
 S: Odd Fixes
 F: scripts/*.py
@@ -2730,7 +2730,7 @@ T: git https://github.com/mdroth/qemu.git qga
 QOM
 M: Paolo Bonzini <pbonzini@redhat.com>
 R: Daniel P. Berrange <berrange@redhat.com>
-R: Eduardo Habkost <ehabkost@redhat.com>
+R: Eduardo Habkost <eduardo@habkost.net>
 S: Supported
 F: docs/qdev-device-use.txt
 F: hw/core/qdev*
@@ -2750,7 +2750,7 @@ F: tests/unit/check-qom-proplist.c
 F: tests/unit/test-qdev-global-props.c
 
 QOM boilerplate conversion script
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: scripts/codeconverter/
 
-- 
2.32.0


