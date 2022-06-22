Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30011555582
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:52:00 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47KR-00050U-2t
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I8-0002HZ-6o
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I4-0004EU-PB
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1zRIDGvAyc8CqU7i7BK9gW1oBEe5YfrD+IIcJEkTr0=;
 b=GwGPam5GqAvIME7M8NxVa2hEyTCuUv5KU2rldvtv7mSRXnYcwB2pO9xwV7/azZ9waVH8t9
 KJoGscdS+dfKIYQEG9WWd2OkV0EGOrVe9AQHhkfOKUkFVo6o6zSDYYZJH+gamAiur5bxPq
 NveavIK30DgSqH+fEw4FkXhd5L+GrKY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-7tVHv8vaP7iVHz2LNGI3PA-1; Wed, 22 Jun 2022 16:49:30 -0400
X-MC-Unique: 7tVHv8vaP7iVHz2LNGI3PA-1
Received: by mail-io1-f69.google.com with SMTP id
 y22-20020a056602215600b00673b11a9cd5so57769ioy.7
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1zRIDGvAyc8CqU7i7BK9gW1oBEe5YfrD+IIcJEkTr0=;
 b=TWvEcQLzqJkQLloWfKkGDxRLluNJJEKI68aivYFY/uqjhcTf0iEy3psAC8R8j3FkDs
 DxIynrE2zh+OgIxrQglQeRpH8nL4+qA6Cb7BzaUmhvo0LUusoGsdsPmBm9cJDa1sgfJi
 +9dAI62L7KhcLEooUW6SIrdzwls7FAEzU9QOP474Pv9GXGiB9iYfDqGqMHCqnLt6uxmQ
 gaVzHXAbMUt/vShfit59JFHteiSDQyULFx7s4XlA3laAqOlCBiLnQXS6kOsLly1/E4zK
 Kq9KlsBZ6aUDIzbIDn7dpt9LQudtgz64fxCzAgjyHH3rtCWZEC8DExaNob4W4sWorWCS
 +fcg==
X-Gm-Message-State: AJIora8LDXi8iw3eic7cXa33+OeTur7iN/alDWPHzN1CbzZM+M23pbdK
 V2v7kqj+27Id/U9MmzEtyhO5GSodn2B4gXq/HpgJu//CnLQdC40YziMpoRQrWQjP8UXka+vP/TL
 vYeeBpY+ZK1Fy9BQG2bRBwCGQdPYQuzT/2r799pCbxWgiPpnAppZx4/aSm0VMOzQa
X-Received: by 2002:a05:6e02:1523:b0:2d3:cb16:2d03 with SMTP id
 i3-20020a056e02152300b002d3cb162d03mr3167991ilu.198.1655930969989; 
 Wed, 22 Jun 2022 13:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHn+eZgEHucwQDvqyQwnAwsJyrriecr0c4It5qhD7X2kgWKxvAv3jvrpAt8s2hp9JTiAxzuQ==
X-Received: by 2002:a05:6e02:1523:b0:2d3:cb16:2d03 with SMTP id
 i3-20020a056e02152300b002d3cb162d03mr3167966ilu.198.1655930969624; 
 Wed, 22 Jun 2022 13:49:29 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:28 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 01/15] fixup! migration: remove the QEMUFileOps
 'get_buffer' callback
Date: Wed, 22 Jun 2022 16:49:06 -0400
Message-Id: <20220622204920.79061-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This fixes a bug with the cleanup patch.  Should be squashed into the patch
in subject.

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 3a380a6072..1e80d496b7 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -375,7 +375,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
                 qio_channel_wait(f->ioc, G_IO_IN);
             }
         } else if (len < 0) {
-            len = EIO;
+            len = -EIO;
         }
     } while (len == QIO_CHANNEL_ERR_BLOCK);
 
-- 
2.32.0


