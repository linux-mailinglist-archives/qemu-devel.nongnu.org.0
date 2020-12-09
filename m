Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD92B2D4990
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:56:55 +0100 (CET)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4dy-00043d-TZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uv-0004Ec-9c
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3us-0000CR-F7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Urg1ebOe/xpAwplm9XU6ObuQmhPirq/STMsGbdggf6A=;
 b=TC//JT631MSOGJ7nIcMUBon0w50yuF8UdIV5kQsUyZYAZlJDcb1SgUy5JxwehnNKKX9KK+
 bLLsFrzNyiWoKvZNEsbbfW5d5I6boyc1KfNSOfmQ6bIUlRlxXwh7VhWE91u+X8BB68u39G
 aFn+m/j+wUWkCvhkQzh97kZ4ezhzn78=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-BePgo-SeMVWMMkTxh92NXA-1; Wed, 09 Dec 2020 13:10:15 -0500
X-MC-Unique: BePgo-SeMVWMMkTxh92NXA-1
Received: by mail-wr1-f71.google.com with SMTP id d2so961820wrr.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Urg1ebOe/xpAwplm9XU6ObuQmhPirq/STMsGbdggf6A=;
 b=jeNBYbNYs5iaONfI1QlxD0xiBvIaN9iuxndbFNp0xrKuMHEW8kn/t7Ly2JoVAvEHEe
 VDXwLRbLMdjM0+N1osrGVhu0zDs2xkKh1AMW65TrkcaZuCWR81Ec773akyVN4oyMGULP
 LE01fp0v6yAOGEprxL00ESWhaVGNh3ZmnlRgrkjoLKwOcoe8YPjO71M7OTKQ8ayjBcvK
 7uxOgjC7W/AIpMc08TpFIXTX1aSVnidID8GJZq6ZVN/FkRs1Uo3su+s61B98KLFCvOlL
 RGHQ3ShFyl1ONeT/We/X5d2uLxgTF/vM6ciqrko6TM3JU9sMw5TEagH4SZi8UIijCOQO
 WVaA==
X-Gm-Message-State: AOAM530Ad6Cgw6ijf4I6sLI/mqVjG9ym6nGZBLNZmA2jAwWWMbFx9X3Y
 Xr0B+xta/zbNOY1tWl17o3EXh/feU/+9NhJzhgqq9vxrLakA7n5wV6IBNczTtldIh8OuCYahTM5
 eZ3JgZ4FWP7YiKDa3Jv6moYDmGfDXk0LtunnlDtOKoCa7wFVT3mxc/U0D9P83
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr4155372wrm.260.1607537414121; 
 Wed, 09 Dec 2020 10:10:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXxrVXuR+evYQHYP3HgLS852mkJeE4Wvsiy3T/wuv2Q0/X+v57zUR+h4K2yhDHDNjFDL3yXA==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr4155355wrm.260.1607537413959; 
 Wed, 09 Dec 2020 10:10:13 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id m81sm5109763wmf.29.2020.12.09.10.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:13 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 46/65] libvhost-user: remove qemu/compiler.h usage
Message-ID: <20201209180546.721296-47-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-4-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 54aabd1878..fab7ca17ee 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -27,7 +27,6 @@
 #include <sys/eventfd.h>
 #include <sys/mman.h>
 #include <endian.h>
-#include "qemu/compiler.h"
 
 #if defined(__linux__)
 #include <sys/syscall.h>
@@ -60,6 +59,10 @@
 /* Round number up to multiple */
 #define ALIGN_UP(n, m) ALIGN_DOWN((n) + (m) - 1, (m))
 
+#ifndef unlikely
+#define unlikely(x)   __builtin_expect(!!(x), 0)
+#endif
+
 /* Align each region to cache line size in inflight buffer */
 #define INFLIGHT_ALIGNMENT 64
 
-- 
MST


