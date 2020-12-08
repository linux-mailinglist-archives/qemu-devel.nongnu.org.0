Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2F2D3302
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:13:15 +0100 (CET)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjMI-0002Rq-Mm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmin2-0007D3-73
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimu-0005ia-Hn
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHE/uRm8PGtDDHGDXS1NURqOE/Q/b84pUZq/OaljFlE=;
 b=GVO8TDn8cdHoWkNXp61RdrftIX5zvWuIRE1DKBAUCTeetS9F3QIcq/O+vxcBKwBdTFHW7B
 ZI8RelXSGYSHlFf/gKJczMFcHWgsJ3hiJiHLK0JIJpF3MkRek1F5kXtF+n/EHH5cHoCHd/
 PxWXFaB25YlQPtwjbQqmQic9yppo43o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-po6ON_sDMESq76Y4xKT07Q-1; Tue, 08 Dec 2020 14:36:37 -0500
X-MC-Unique: po6ON_sDMESq76Y4xKT07Q-1
Received: by mail-wr1-f69.google.com with SMTP id o17so39640wra.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sHE/uRm8PGtDDHGDXS1NURqOE/Q/b84pUZq/OaljFlE=;
 b=fUInwRX+Q2tSYJWwQ8HwXsnBHhw90Kh9AgNMlY/6hK4qi5+hhDt1gjXQvtjn2wS5Nw
 tJcKTXFPjBKyoZPZFaRrHsWbKiriN1v8YRPJsEA/0Lu3wvTTVijPxWeXuMJRuEnNuZKx
 uaaugT1e8dNfBGG7aew2rp0OQSZg7HGFerCDlwiJTVjA9duoH5fI1j7eYeY6ipg6WJHd
 HG0EhPLek55it+cZM4EYe0hDTimb4iafiK3ep8BrZA438Z1Wp+x0FZvFJbSLZ+Ni2Vvn
 XgAvKT24fw4xnm/Xc9F8n/9JMOItLjWqf5FedM71olKnCIM5DboWd2kPR/7rU2q+gq7f
 fPOQ==
X-Gm-Message-State: AOAM533qpBramq4ZwWx6I9ks1cEBWd+o+P1Z8NDwXd4u6BjDKskIcksO
 ni+pjR9K/SK80Dd2ffB8kbSUcOQauTRAlrSIp3l30evHmzP/VGCXkUsr0CEVUsU5bFLRXvxx6hh
 B7u/jGL0x094lqX2kZucJBmzjgPUYjezDsD0DEIokAFUPyxrE+7INlD5ll7a9
X-Received: by 2002:adf:eac7:: with SMTP id o7mr7497392wrn.23.1607456196267;
 Tue, 08 Dec 2020 11:36:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY2geD7CVv+y0rOqeVmJdjs46bydUpKmSyAxpogRCJeC8Hbb/27iGYEn5MF4gUJvVIzrVSpw==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr7497370wrn.23.1607456196004;
 Tue, 08 Dec 2020 11:36:36 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a13sm12850635wrt.96.2020.12.08.11.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:35 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/66] libvhost-user: drop qemu/osdep.h dependency
Message-ID: <20201208193307.646726-48-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Johannes Berg <johannes.berg@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-5-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user-glib.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/contrib/libvhost-user/libvhost-user-glib.c
index 0df2ec9271..efc9d814e3 100644
--- a/contrib/libvhost-user/libvhost-user-glib.c
+++ b/contrib/libvhost-user/libvhost-user-glib.c
@@ -12,10 +12,16 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
-
 #include "libvhost-user-glib.h"
 
+#ifndef container_of
+#define container_of(ptr, type, member)              \
+    __extension__({                                  \
+        void *__mptr = (void *)(ptr);                \
+        ((type *)(__mptr - offsetof(type, member))); \
+    })
+#endif
+
 /* glib event loop integration for libvhost-user and misc callbacks */
 
 G_STATIC_ASSERT((int)G_IO_IN == (int)VU_WATCH_IN);
-- 
MST


