Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701C5879D3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:27:14 +0200 (CEST)
Received: from localhost ([::1]:39222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoBE-0005TX-Kj
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oImlN-0002K4-I8
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oImlF-0004jW-9r
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659426976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4vvQenHdFl6q7kIDghbIlLxkacw5dJOKPd2kUy20piE=;
 b=TAZShVqj1iC7Qd52P33WCZYOhRh6CykvDGddRgwOhjlvskK9b2odoI0r/74a4AVPMW3Sk9
 v2grQgP56fJiV0QdUOVjZC/auNwuwsNjCxjZuU6whn91HOKQMCPSkxQ0i81hM3eP9fMedm
 5G7O4clya3gbrec5XESHktWQIUkIfA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-AV07xSLFMJWuEUNrrCciUA-1; Tue, 02 Aug 2022 03:56:15 -0400
X-MC-Unique: AV07xSLFMJWuEUNrrCciUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B54463C10142;
 Tue,  2 Aug 2022 07:56:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 524111121314;
 Tue,  2 Aug 2022 07:56:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH] docs/about/removed-features: Move the -soundhw into the right
 section
Date: Tue,  2 Aug 2022 09:56:11 +0200
Message-Id: <20220802075611.346835-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The note about the removal of '-soundhw' has been accidentally added
to the section of removed "linux-user mode CPUs" ... it should reside
in the section about removed "System emulator command line arguments"
instead.

Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c7b9dadd5d..925e22016f 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -396,6 +396,13 @@ Use ``-display sdl`` instead.
 
 Use ``-display curses`` instead.
 
+Creating sound card devices using ``-soundhw`` (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Sound card devices should be created using ``-device`` or ``-audio``.
+The exception is ``pcspk`` which can be activated using ``-machine
+pcspk-audiodev=<name>``.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
@@ -681,13 +688,6 @@ tripped up the CI testing and was suspected to be quite broken. For that
 reason the maintainers strongly suspected no one actually used it.
 
 
-Creating sound card devices using ``-soundhw`` (removed in 7.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Sound card devices should be created using ``-device`` or ``-audio``.
-The exception is ``pcspk`` which can be activated using ``-machine
-pcspk-audiodev=<name>``.
-
 TCG introspection features
 --------------------------
 
-- 
2.31.1


