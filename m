Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D65E5E9A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:29:18 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIWD-00050K-Mn
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtv-0004Ii-9w
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtt-0003Ad-Pt
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUtq4WXz65nbgH+uLQQjwF/Lwtao8PfLQHIC0ni20pc=;
 b=gcISvu2fEXwIVUKFF6zlucI+Xbw6l6nvnJv4Y9EGTyjgirkRsmlsQtrrlCn4JXFjFhdiFr
 1j2vdF7rJCzdD+5bXXNTnzAESPcUDDnAuYNgTgJ31C1VsnEmzEXm/fRRDRWYhQP4PPXCZU
 bMT2WnJRisfdJxSbFJy9Z5f/1AFhY+Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-q-HjVvYTOw-bDLsxYb50Ow-1; Thu, 22 Sep 2022 04:49:39 -0400
X-MC-Unique: q-HjVvYTOw-bDLsxYb50Ow-1
Received: by mail-ed1-f69.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so6176195edd.10
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iUtq4WXz65nbgH+uLQQjwF/Lwtao8PfLQHIC0ni20pc=;
 b=sw7oy2nrr/S2p8zk3xwpLIPuMIWvwbBEptykTC9/8ApHyd1ulWCfqOMVejJOpjXYec
 SDHTxei0d4CL7p1CZ6MNTW+MO0foZUNTwOc9tCyraRvwIUAMijY+QxKLXOdGVnz8IGhb
 raLPj26lB0BrBrgebmJsj+8DI0sdBbRDdy9F+gnR7ySiqZMHN97kgJDD3bzC6MvCpVWW
 JyvKUtazIpsidP8JHi/6AxzO0sHmkj4q5l7RQ5gSOM50OqmWajlbzz/FPOShe/TF5/EY
 a7pbBFGZCMALxeA4zobVEd7/uzQGDKXfIarOFy+CpvqRpsnPhSP2jvw5aZw0UkSCQLtj
 Ay9g==
X-Gm-Message-State: ACrzQf3Y8KZFrRNjxfoo0qIMbmheNOj4DE0G5rN1fs5QYM01Qy7ysvZI
 oIU+IXt0X4FQ96KugFHGDp60kIxOFt9P4Nn9DHLyuGkgUCItZN0rvAK4BgM8P3xY+87Ai8jwTXD
 fwGfMIyX3+P8wnRwTgG+RtrqIWbIggyb8w/Wo+TAWNMEhaxSQSmkifAdG4HBkNao8weA=
X-Received: by 2002:a17:907:6ea7:b0:780:840:f050 with SMTP id
 sh39-20020a1709076ea700b007800840f050mr1877448ejc.394.1663836578533; 
 Thu, 22 Sep 2022 01:49:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IXV4l8a8lJBFeLOZvRQrDCajLsvtxb85NwPaLWtYSZFVmUNwAMLXGt1P83j6tDvwcBm5ucA==
X-Received: by 2002:a17:907:6ea7:b0:780:840:f050 with SMTP id
 sh39-20020a1709076ea700b007800840f050mr1877435ejc.394.1663836578291; 
 Thu, 22 Sep 2022 01:49:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 el8-20020a056402360800b004533fc582cbsm3207817edb.21.2022.09.22.01.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 08/26] file-posix: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:06 +0200
Message-Id: <20220922084924.201610-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..76eea8d350 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2158,7 +2158,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
 #endif
 }
 
-static int raw_co_flush_to_disk(BlockDriverState *bs)
+static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
-- 
2.37.3


