Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5D3CFA13
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:06:39 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pSI-0007zz-9z
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGQ-0004m2-GI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGN-0008He-3X
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5+apKCmdzHiZuhEkLwuaiHTwdXxk3U0EfkxM0ycIO8=;
 b=Q84GWFftd1+tD/r81VuHDzOQMKNXYnoJhR4K3tzjHuM6V9hF/Fjk2ktz8dXrrDrOWKihdn
 3iOdQ2J/QMqGUUvWYmzxGzUkIVC3XCPxFZXZJqGfS/Za94CG0AfqX4cajyh56D/qHzTkjI
 syEsCstnizc7v88A7Eyku4qaOtJXS7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-C93DQFuuM1CNZa6aJ87opw-1; Tue, 20 Jul 2021 08:54:16 -0400
X-MC-Unique: C93DQFuuM1CNZa6aJ87opw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A49010151E0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC3210016F8;
 Tue, 20 Jul 2021 12:54:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25B95112D856; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] vl: Don't continue after -smp help.
Date: Tue, 20 Jul 2021 14:54:08 +0200
Message-Id: <20210720125408.387910-17-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We continue after -smp help:

    $ qemu-system-x86_64 -smp help -display none -monitor stdio
    smp-opts options:
      cores=<num>
      cpus=<num>
      dies=<num>
      maxcpus=<num>
      sockets=<num>
      threads=<num>
    QEMU 6.0.50 monitor - type 'help' for more information
    (qemu)

Other options, such as -object help and -device help, don't.

Adjust -smp not to continue either.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ce0ecc736b..8f9d97635a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1543,7 +1543,7 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
     prop = keyval_parse(arg, opts_list->implied_opt_name, &help, &error_fatal);
     if (help) {
         qemu_opts_print_help(opts_list, true);
-        return;
+        exit(0);
     }
     opts = qdict_new();
     qdict_put(opts, propname, prop);
-- 
2.31.1


