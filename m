Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19C01F4C67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 06:38:01 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jisUy-0004Oa-Qg
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 00:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisKq-0008Bt-Ca
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 00:27:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56804
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisKp-0008GP-KT
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 00:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591763250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWR60ercXQZVd22zZQp4vrHc0/weVq8wSWjY7Go6ogE=;
 b=cpicBbO1O+lAl3EkX1Sq5g3F4OFYWGlQVt6V9mnhfT26cxoi73nHWzk18dvjf4JmU2W70Z
 yBX6HGbqsaLA+Td2O1H5uJDQHLTP3oSOoMm4GcWWjcfy+W/rJayi7rCKm1xXKJaaoENaRe
 gmdjNENyiQQHhqSTkzqZTjjBJESEYSw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-mG-MpiTCPOGVMxmf-0YMOw-1; Wed, 10 Jun 2020 00:27:28 -0400
X-MC-Unique: mG-MpiTCPOGVMxmf-0YMOw-1
Received: by mail-wr1-f69.google.com with SMTP id h6so515536wrx.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 21:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IWR60ercXQZVd22zZQp4vrHc0/weVq8wSWjY7Go6ogE=;
 b=EtM1BPwPlVskCGjbgUZ/czTJFrwxrmFGvZ6hjtyKw09ROl0laT7QeQmQKPlCX7oeMl
 Vgt+Q90hPR7+L0bZKH+WRth9jdpsk1MdiRtiXzboXwmp02q8KqTjvkgN7gQTcxLgxp5M
 ns6p/bC4FaHh9oTOqF7p3duhrUo4dUttHmLOJwbLFH9uufuGubo6NKgYqbVcxSWGLNj7
 rdK3GwN9FX7r6OjKEvraOjtLSPL0DC3Fv5mpGAmZ4PtquF8qD9KeriNWRgI4U6YuViN4
 2QmPeWXGROk7IJRueskScRvLQI11apm/gUHw/FeD5oA8Luh0bed6iMIcK4AZcb9D1OCf
 X4sg==
X-Gm-Message-State: AOAM530PFwCqpj2RhuXIFJBfiW3jZMEa54BCOwRAqthZd1t7Oe2EQPO+
 1hxqgaCNMgOVtCO7+ben4OgGhnK0BUh96ahWDefPWBvscjuEyJmJJeF9XbE6BGC947xI9Gr2PEj
 bjdy6d7z8z0lo2wA=
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1188574wmj.185.1591763246653; 
 Tue, 09 Jun 2020 21:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwra3MR2zNx6OPnUxLatdvcu7XSHifv7PqkdUxpNP1lCtRcqGq8MFYmwFNa8LBIIaECV3Yi4g==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1188559wmj.185.1591763246458; 
 Tue, 09 Jun 2020 21:27:26 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id w17sm6176506wra.71.2020.06.09.21.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:27:26 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:27:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/56] virtio-balloon: fix free page hinting check on unrealize
Message-ID: <20200610042613.1459309-24-mst@redhat.com>
References: <20200610042613.1459309-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610042613.1459309-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, Wei Wang <wei.w.wang@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Checking against guest features is wrong. We allocated data structures
based on host features. We can rely on "free_page_bh" as an indicator
whether to un-do stuff instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Cc: qemu-stable@nongnu.org
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20200520100439.19872-3-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 7ff6a7aa7c..32e9fe3f64 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -818,7 +818,7 @@ static void virtio_balloon_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
 
-    if (virtio_balloon_free_page_support(s)) {
+    if (s->free_page_bh) {
         qemu_bh_delete(s->free_page_bh);
         virtio_balloon_free_page_stop(s);
         precopy_remove_notifier(&s->free_page_report_notify);
-- 
MST


