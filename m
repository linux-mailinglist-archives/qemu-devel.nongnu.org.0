Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3A28F2BF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 14:55:19 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT2mr-0006wK-PD
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 08:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kT2lG-0005Qc-IG
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:53:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kT2lE-0002cn-Es
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 08:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602766414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQJ5ChWn862XIAp2S1C6eFc6xJmzBxGKTu4b3wGWBps=;
 b=ZwECUgCmu1UWv+G73i34ndYO/c3MT+tm9Vy5fWnewUaYTCUZrU0/LtZDgUBD10Jbv1GDxJ
 qPJlR0yDFb8i4mh9uwrlAgFtrN7k+h/PiTCfMxCdec7an5QHT/Gx36Pi2mxRaNIv5BCEE1
 sJtt+LzBtSXjmZkWOx/RYhzR7sEm9Ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-2YbHjk_DNKycx4BtZ2mFtQ-1; Thu, 15 Oct 2020 08:53:32 -0400
X-MC-Unique: 2YbHjk_DNKycx4BtZ2mFtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7ACC10E218F
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 12:53:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 831CF75125;
 Thu, 15 Oct 2020 12:53:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ABAED1753B; Thu, 15 Oct 2020 14:53:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] modules: update qom object module comment
Date: Thu, 15 Oct 2020 14:53:16 +0200
Message-Id: <20201015125322.23648-3-kraxel@redhat.com>
In-Reply-To: <20201015125322.23648-1-kraxel@redhat.com>
References: <20201015125322.23648-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200923103728.12026-1-kraxel@redhat.com
---
 util/module.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 836fd444e1fd..4349607ad176 100644
--- a/util/module.c
+++ b/util/module.c
@@ -250,8 +250,10 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
  * only a very few devices & objects.
  *
  * So with the expectation that this will be rather the exception than
- * to rule and the list will not gain that many entries go with a
+ * the rule and the list will not gain that many entries, go with a
  * simple manually maintained list for now.
+ *
+ * The list must be sorted by module (module_load_qom_all() needs this).
  */
 static struct {
     const char *type;
-- 
2.27.0


