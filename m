Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB136513
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:05:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYcAL-0006HI-Oa
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:05:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5P-00034B-27
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYc5K-0005YP-Jz
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:38 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]:36784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hYc5K-0005Bi-Bs
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:00:34 -0400
Received: by mail-qk1-f172.google.com with SMTP id g18so26835qkl.3
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 13:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=v+ECkpJzkDVdVI5rLDwJXguPVOQxaO4yQjX4+F++UwY=;
	b=iQOAowjvdO4BNJNGRjAlbgTBR0t2X9JWWD3XKRarZ87rbNEQKfmsl8Ih/KoSiCBH6I
	sj6Zslfj8xusWUN3lt7y9G6Qq8hGwjsRpLy1thNI5anxZiaCKkcUASSdZXkOwfE2hCBW
	0B/3CmEp2/QkaQdWFzaiYrt/Xlp5eJDPLQF5VM0/rcKOcQcc2xm4yhn1TYxV/l+BwYDd
	vMf5gxHySGrWyXu3GG+XP+a1Z/fNckMYTlHST/8XQl9ni9ETVNuUXZiAxk6+qJ3F/+hF
	B6ITBfO9OFhayL949I1f9TF7kkMta+Xm+hiti1US+RxN10HyaZBb5CAwMSPRUn1NCon5
	1c4A==
X-Gm-Message-State: APjAAAVNjBSQMe+jAuvYHs8UO8Z6lqoj/Jh/M4/Qu8kvqUOeUqmQXxZb
	u7hzkuT5//W3TzUDgIpUp13+UGZJS+Q=
X-Google-Smtp-Source: APXvYqxdVM8fzD5SnvnjlJT4x5IoavvSSHrw+LPYWFKStqf7ljki//aj6G1uhSo7NWE3Ad6iPW9pmA==
X-Received: by 2002:a05:620a:1329:: with SMTP id
	p9mr15864237qkj.224.1559764822016; 
	Wed, 05 Jun 2019 13:00:22 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	p37sm13545546qtc.35.2019.06.05.13.00.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 13:00:21 -0700 (PDT)
Date: Wed, 5 Jun 2019 16:00:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1556604614-32081-1-git-send-email-wangjie88@huawei.com>
References: <20190605195913.12243-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605195913.12243-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.172
Subject: [Qemu-devel] [PULL v3 07/17] vhost: remove the dead code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jie Wang <wangjie88@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jie Wang <wangjie88@huawei.com>

remove the dead code

Signed-off-by: Jie Wang <wangjie88@huawei.com>
Message-Id: <1556604614-32081-1-git-send-email-wangjie88@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7f61018f2a..2303a8c206 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1650,7 +1650,6 @@ fail_vq:
                              hdev->vqs + i,
                              hdev->vq_index + i);
     }
-    i = hdev->nvqs;
 
 fail_mem:
 fail_features:
-- 
MST


