Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179905FD9CF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:19 +0200 (CEST)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixtl-0002Vi-SZ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSw-0001W0-1g
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSu-00043j-0g
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgW0FJhS1AR3ZxmsZrbLa+Ggxo1fR+5TjfuCh1jGz8E=;
 b=ETnQqnbQWRr839CP2GggJmYTQlMxGoX1GfTTwtTG6eoKMLGoZjE2l2sH1t9UcVqU40Ll2L
 abst3PEXuaYYiZ1DlRk3XVysP6gBSNBM5OZraAjo4TojZwxt3a6/TUjOJ14b02UFGWs9kV
 DYsBdBy+m7yATgPflze2uyqKcpl78I4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-pYoXuSjCPsGalUZQoshp8A-1; Thu, 13 Oct 2022 08:37:30 -0400
X-MC-Unique: pYoXuSjCPsGalUZQoshp8A-1
Received: by mail-ej1-f72.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so833229ejc.15
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgW0FJhS1AR3ZxmsZrbLa+Ggxo1fR+5TjfuCh1jGz8E=;
 b=Lxb3d1rb/0fz1rgn5t0fLufPV6BdKiW/G2EkYwfejCo5npnwGs90VuyuyZPOiDrx6N
 bvXfckl3jaDkBXMckx4HU3CYtH7J74+qplE2aLqUCgeQ1v2am0DVL7pKZnL5GLKnX4T9
 Em7fPqs97FvuEvVlnUzckn+rpkiPMMGhKBQH1JLL06NMqN0jj2nuRH3tjkhK+j3peuap
 liFZXLB2D24GKyfrwIwXRfq/mu/00+8YF2VHr7pv6X6+azHAhICWmpn3AIMlK3K393jp
 EocAknAJgaC+IBJr2MINSd7SE01StC+Aeq1vSTQpVapr6U7hRp40W2sqNhiotPBRDOO0
 +xKw==
X-Gm-Message-State: ACrzQf0vWBbD/+GwpsxnLI35WLoAYxp5NPvmvxV7rk55wyK8jLZ3qptu
 at6lYtx9Qh/mlwrXAVrDvdKAZKG9v4Y3V+T2glBnkZstDlndZa0dlczlar62FC3rxV7G+Qqdvzn
 UDHo53Fu+LgFUDkw5oaG06/yDgyMnjA+irLY5IEmlSJe/O9EjvmAzjNYsU3yCJBPAWuI=
X-Received: by 2002:a05:6402:414d:b0:451:73f0:e113 with SMTP id
 x13-20020a056402414d00b0045173f0e113mr31926437eda.207.1665664648867; 
 Thu, 13 Oct 2022 05:37:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4EOsGfwXGbXBZlA9NUA0vtOa3TbOu6gwAIqc6DbtSBIuGnonPuqlN9iii/PFBcYslP8dYM9w==
X-Received: by 2002:a05:6402:414d:b0:451:73f0:e113 with SMTP id
 x13-20020a056402414d00b0045173f0e113mr31926423eda.207.1665664648621; 
 Thu, 13 Oct 2022 05:37:28 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a50eb41000000b00457c85bd890sm13260388edp.55.2022.10.13.05.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 05/24] block: add missing coroutine_fn annotation to prototypes
Date: Thu, 13 Oct 2022 14:36:52 +0200
Message-Id: <20221013123711.620631-6-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The functions are marked coroutine_fn in the definition.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/block-io.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 492f95fc05..770ddeb7c8 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -83,12 +83,13 @@ void bdrv_aio_cancel(BlockAIOCB *acb);
 void bdrv_aio_cancel_async(BlockAIOCB *acb);
 
 /* sg packet commands */
-int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
+int coroutine_fn bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 
 /* Ensure contents are flushed to disk.  */
 int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
 
-int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
+int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
+                                  int64_t bytes);
 bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
 int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
-- 
2.37.3


