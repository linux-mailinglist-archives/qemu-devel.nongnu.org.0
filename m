Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6081FECA7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 09:41:01 +0200 (CEST)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlpAS-0008Gl-Hs
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 03:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlp9e-0007ns-FB
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 03:40:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39069
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlp9c-0000qb-W1
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 03:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=vwyadaPW4AJLKYmDPXDTYtTsO+DcvRY65yH9JPyf5Ss=;
 b=A/GlI2/5u6JWXdPflHG1Roq5gdL4rqbXpCT8Xk9WYC8CJ/kcmhGyCzQa1cgqLyik4+nGgb
 mlrF3+ZeLfQmdpPE4kPzHZmaw8DgDXoWw6nW8QxtedPgvc2uUOxsdWMN6Bql6CGSl/jQsR
 1j4TmfbFP6WaFoT+uu3cujEonNMbuGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-vcdPbQ_3O_W9GM7qMO2sjw-1; Thu, 18 Jun 2020 03:40:06 -0400
X-MC-Unique: vcdPbQ_3O_W9GM7qMO2sjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 591E08018AC;
 Thu, 18 Jun 2020 07:40:05 +0000 (UTC)
Received: from thuth.com (ovpn-114-95.ams2.redhat.com [10.36.114.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DCA7931C;
 Thu, 18 Jun 2020 07:40:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] softmmu/vl: Remove the check for colons in -accel parameters
Date: Thu, 18 Jun 2020 09:40:01 +0200
Message-Id: <20200618074001.13642-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new -accel option does not accept colons in the parameters anymore
(since it does not convert the parameters to -machine accel=... parameters
anymore). Thus we can now remove the check for colons in -accel:

$ qemu-system-x86_64 -accel kvm:tcg
qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede..273acfcf6b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3485,11 +3485,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     g_slist_free(accel_list);
                     exit(0);
                 }
-                if (optarg && strchr(optarg, ':')) {
-                    error_report("Don't use ':' with -accel, "
-                                 "use -M accel=... for now instead");
-                    exit(1);
-                }
                 break;
             case QEMU_OPTION_usb:
                 olist = qemu_find_opts("machine");
-- 
2.18.1


