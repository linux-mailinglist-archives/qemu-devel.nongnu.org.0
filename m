Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26194255921
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 13:09:14 +0200 (CEST)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBcFt-0003Mh-5N
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 07:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcEl-0001u9-99
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcEj-0000OP-NQ
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598612880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgvH5LZTKouaCaPhOVmtES5ueNB/zwfdlXhtvdNj5No=;
 b=Bf7o4+4U/LyR5vUN/cQCKifetBgwmpXl9BVCxjOWtk7jpFaW4BrkZygLoUAO9e4x4jwnHi
 iFyRNQkM+aXRyGoA6jMxfYLxITlWlYpy39RemH8pT5kpoca7Rd4Rdy/Qn8nb+sCfUR0eT9
 6hpaODhqEIkunI3HtNft7Xw907WSZEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-PdwtHMs-NdCFlKL2BKSgXA-1; Fri, 28 Aug 2020 07:07:58 -0400
X-MC-Unique: PdwtHMs-NdCFlKL2BKSgXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 095C1100746C
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:07:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E885A19C59;
 Fri, 28 Aug 2020 11:07:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/16] meson: declare tasn1 dependency
Date: Fri, 28 Aug 2020 15:07:20 +0400
Message-Id: <20200828110734.1638685-3-marcandre.lureau@redhat.com>
In-Reply-To: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
References: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=marcandre.lureau@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 01:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 74f8ea0c2e..2002728487 100644
--- a/meson.build
+++ b/meson.build
@@ -401,6 +401,11 @@ libdaxctl = not_found
 if 'CONFIG_LIBDAXCTL' in config_host
   libdaxctl = declare_dependency(link_args: config_host['LIBDAXCTL_LIBS'].split())
 endif
+tasn1 = not_found
+if 'CONFIG_TASN1' in config_host
+  tasn1 = declare_dependency(compile_args: config_host['TASN1_CFLAGS'].split(),
+                             link_args: config_host['TASN1_LIBS'].split())
+endif
 
 # Create config-host.h
 
-- 
2.26.2


