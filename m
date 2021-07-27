Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A973D79A4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:25:41 +0200 (CEST)
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Oxh-00032Z-1Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m8Ov6-0008AR-2S
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m8Ov3-00013y-Mu
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627399376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTQzhB5mIxDT02D6WCp7EgCPW274nLz8l5qxKayrCVk=;
 b=a+6ZjurI5lrE0zLMySB8IQS8mWaRqL0l3wR0hFWdlNrx3kgiqbVTD0LWs6roccueKOfaRw
 ojeAMe6oPgWVVxZD899WEg6voPHBdOcyjZ8R2r7bmtJ4utIwBLWltjnZG4WOF/HHwpV5+R
 M8WOUeGUWDl/QIPGVL1pFbSkoO/lmGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-BE66zwQfM6qxf3UxCGqsDQ-1; Tue, 27 Jul 2021 11:22:54 -0400
X-MC-Unique: BE66zwQfM6qxf3UxCGqsDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67772107ACF5;
 Tue, 27 Jul 2021 15:22:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AACBD5D9DD;
 Tue, 27 Jul 2021 15:22:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28D2E112D841; Tue, 27 Jul 2021 17:22:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] vl: Don't continue after -smp help.
Date: Tue, 27 Jul 2021 17:22:39 +0200
Message-Id: <20210727152239.829519-2-armbru@redhat.com>
In-Reply-To: <20210727152239.829519-1-armbru@redhat.com>
References: <20210727152239.829519-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Message-Id: <20210720125408.387910-17-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f815acccaa..4dee472c79 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1545,7 +1545,7 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
     prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
     if (help) {
         qemu_opts_print_help(opts_list, true);
-        return;
+        exit(0);
     }
     opts = qdict_new();
     qdict_put(opts, propname, prop);
-- 
2.31.1


