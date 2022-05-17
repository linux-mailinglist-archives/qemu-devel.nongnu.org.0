Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428252A37D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:34:50 +0200 (CEST)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxLd-0006h1-Hj
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXp-0001aL-Ri
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXn-00037z-Hn
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fbq+318HP7oongP67aWO1SVNAxIjGKD5T0PAUYwWnU=;
 b=MeWRI48Nl3akvHXes3cU1P63C9p8v0WXLKR2IZV04gbiU/MKc6PLt+K3dnQiyDzmRfuBZ7
 RRCNNFTgU3t9XOH2Pn3wtmmkhg8s7nItVExG8RgN4POosVW1+L7JrURoYZ8MCYI2ixY5ph
 5/NfF6376S26Aw49OXcsx90PybpUwJg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-4IQ4wmTONYu2FoUQjqlqPw-1; Tue, 17 May 2022 07:39:13 -0400
X-MC-Unique: 4IQ4wmTONYu2FoUQjqlqPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so4580751wrh.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fbq+318HP7oongP67aWO1SVNAxIjGKD5T0PAUYwWnU=;
 b=TIunL9fuutWOdVx5fkse1i+FsoFkzvRvVTuF6cRcEhU7CCQ6zrZN1cthJKfo7UlhAO
 bXi8PpaVuWY3pN2lvG4nyrc8HDEZW+diYkel1hSNiceI6qToaoimtTacqnrfUtoP1dQA
 ewIu7IL8rKz+dqS7sbzkDg1GesDGhw1lChkg3Vq4Fq5mOMFRODROel6sJHb25N9IzcR6
 wh5B/W3f7nZuW6JddKl0nbeXdUdQOtLgPltCe9ypQc6epK13TIY9dvMWNeBHet6INxf8
 E5t0mmmNfvAkEYXABfIlKs9icIW0nq03G8nl4W0DZWmXwCLCjJwHcolSvG1f+qB0in6L
 WEPQ==
X-Gm-Message-State: AOAM530Lol1KHIdfBID5E3FDRywWaXhYpz02XGj1Akb3udLISqK+8QM4
 +mjY8Yw7LjZQfX4d1Ici4wBPmvyLAbKSo5obPnc83WN79X0lJGN8VourXD5xKUMPWiH59uWvf8I
 xetpmESYiM6PrvFSy79wdojZ0/0RBS1zhRHdVQcYHas25SIp2H2LaXoSmVvhG4ugy
X-Received: by 2002:a05:6000:144d:b0:20c:7829:2a44 with SMTP id
 v13-20020a056000144d00b0020c78292a44mr18237276wrx.663.1652787551539; 
 Tue, 17 May 2022 04:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOS9K1sM9XWBr/Gn7VLkfXjpRY7dF9PZJuVLNucDpa4OWHJ39bHMFxjWh++owUeIRd8Coa5A==
X-Received: by 2002:a05:6000:144d:b0:20c:7829:2a44 with SMTP id
 v13-20020a056000144d00b0020c78292a44mr18237250wrx.663.1652787551342; 
 Tue, 17 May 2022 04:39:11 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:10 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 14/18] block: Implement blk_flush() using generated_co_wrapper
Date: Tue, 17 May 2022 12:39:03 +0100
Message-Id: <20220517113907.200001-3-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
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

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 11 -----------
 block/coroutines.h                |  2 --
 include/sysemu/block-backend-io.h |  2 +-
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 823c98a031..0718441b37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1756,17 +1756,6 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }
 
-int blk_flush(BlockBackend *blk)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_flush(blk);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/coroutines.h b/block/coroutines.h
index 2693ecabfb..7e94b9fa83 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,6 +110,4 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper blk_do_flush(BlockBackend *blk);
-
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5c56737453..e6af0d0ed0 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -165,8 +165,8 @@ int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
+int generated_co_wrapper blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
-int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-- 
2.35.3


