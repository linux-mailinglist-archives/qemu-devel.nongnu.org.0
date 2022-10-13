Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCE5FDA02
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:11:23 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixze-0000eM-Rn
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTr-0001ia-TL
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTR-0004GV-0k
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVDmc3XDvK/thJgkpU95iFUXhIKVU4Gu6IGZq73ljw0=;
 b=NPeBuef+RTB3gnt6RFcKhFdr4Z/ArPDHalJ/Q7HFfS/f4wrTrHNNdOsnnVRGZf/6jRc4r1
 xyTYKdhJqHqYRIcQnQjdeplm9o/dMztnjsQBBhZs1U33UYh3Rc0MuY9VdljVBhyyJpLGKS
 OKxl7bP+4lj47Le9zibU0KGsDhVD6t8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-e-jTsCHTP8-8RLmoWR2NmA-1; Thu, 13 Oct 2022 08:38:01 -0400
X-MC-Unique: e-jTsCHTP8-8RLmoWR2NmA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso1431525edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVDmc3XDvK/thJgkpU95iFUXhIKVU4Gu6IGZq73ljw0=;
 b=IRnOLyOsuciw+GxRLEqfFdNQy/lpTy6ZD1PUnDrPnLlcWYgwjYwjNXN4tF0IjUojb5
 zsI8QmoTcjrTHt8mWV6lapVix7kUn7Mw0j5aKEiDZtYjeZSKS8L0lsXdSYa6e8EEvXEt
 hPVM3Txa/EuCeR5IePm0tfxf8bxSHH/elFswBEx6w1CTenBFrbU6wBKySTXqz1I91b57
 EQ3MzODGCck84XbDoCCWqG7kCLufaAcW61SfHnJglV+8eloA6xI8WYkCDqTnGk1FwUde
 1OVvt4ku59NHckTrLhPageL/jPtZ+MFvV6x/BeuQ72GHkgDwKFKx/Ry4yIcMb69SvWNk
 PRzw==
X-Gm-Message-State: ACrzQf1er6LDhE4rO521PUPdq7JBr6wHmJiOJqLA2ZIFvMKUoLW1Q5BP
 vDMVKzanaBMZgIlJ9hhj9a+J3T5mWtmfbzCVGZ4FaIazkwrL04T6zrZLy5e5rXZipb2ewECBFh3
 a2ow4y6fFQ+qP4RII9TSQ2UPlQ2TMbca+6EJDmBe3JT1PzvfGJO4uCkZ6PkpCU6TDeVY=
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr32125990eda.38.1665664680389; 
 Thu, 13 Oct 2022 05:38:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5notXaPdokFml5smlFsvujYAPXx8QCKa2p72jSlf6MfVaqnqOInVp3cqp2E7UUS56Oq0mFUg==
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr32125976eda.38.1665664680144; 
 Thu, 13 Oct 2022 05:38:00 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 cn22-20020a0564020cb600b00459012e5145sm13075521edb.70.2022.10.13.05.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 16/24] mirror: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:03 +0200
Message-Id: <20221013123711.620631-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/mirror.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 80c0109d39..95677c8969 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -922,8 +922,8 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
      * active layer. */
     if (s->base == blk_bs(s->target)) {
         if (s->bdev_length > target_length) {
-            ret = blk_truncate(s->target, s->bdev_length, false,
-                               PREALLOC_MODE_OFF, 0, NULL);
+            ret = blk_co_truncate(s->target, s->bdev_length, false,
+                                  PREALLOC_MODE_OFF, 0, NULL);
             if (ret < 0) {
                 goto immediate_exit;
             }
-- 
2.37.3


