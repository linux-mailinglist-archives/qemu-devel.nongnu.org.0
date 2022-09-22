Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10685E5E31
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:11:59 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIFR-0003CE-Rh
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtu-0004IT-Ok
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHts-0003AK-Ao
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJ9IICv8PE6plCAsrPnkp3/CCOC6ITG5IcJpn3oJM/E=;
 b=DHAvE4cgtyrmkXI8PAMigXqGzIX0EXX7CPwFhP383UhEYU4QwzsgeBJNtV64AoaDFQX2YO
 LXo85O9jmQOAGFFGWncYUmLP0de7PnMNfzQjptuGsj/dVEE5fui9k+sSKOYp7x1EvDGU2v
 aMqm1UUVnFy20vAAONPHAY647J7nchU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-6PXyyQRYPv2OBXDIENq34g-1; Thu, 22 Sep 2022 04:49:38 -0400
X-MC-Unique: 6PXyyQRYPv2OBXDIENq34g-1
Received: by mail-ej1-f69.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso2656999ejc.21
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tJ9IICv8PE6plCAsrPnkp3/CCOC6ITG5IcJpn3oJM/E=;
 b=qbdfXu2gn9s+VJxfSKwJ1dMp6Zt99bRGKTj90sXqGPHovZI/DFDXeOzFjQCll5WgBn
 vMOQFjh5fw4N4jfrDj+VwFMOlGJhTYaZ5ZgEWmi/rkbGI8TDz6syyN4xvt9c96+3NFPv
 EidVoK19R4wFG/8iAPxo+Mo03LlH7/LA/wyYvmd39kDn/QA+HQtkD/P7LqOmyFNjTj+o
 oAUZK5KRwkDGz7rDwy1JxvayiVQc4GLotq3m114zp/TpeC6CRFvpwWBdUIonUqfUPVwl
 OHMQhgIXkTgb7kOBmKB5qkXyyIhy/D+pbAI1XgtE0xFLzqnVO73yJiic4W2w+whDx3HF
 h8Kw==
X-Gm-Message-State: ACrzQf3MxCIZx75Cwf6Zonf3TQ13oEEzhQalujyqdSdJWjn6eU5ILcM1
 6bXHTMU5qk45RhkcWjTOgsV7jbpkf56sokreBFFOTRtJQUNIVZkCDU742au3XePJmN0q0RVzUfr
 FBIPrHdaKhGvcBtkvCunzbA9ebWOKyYKE7683RJLiHpzZd1NJHKEbYeHuzA6jEnsgz70=
X-Received: by 2002:a05:6402:11cd:b0:452:199e:7cf6 with SMTP id
 j13-20020a05640211cd00b00452199e7cf6mr2186472edw.366.1663836577283; 
 Thu, 22 Sep 2022 01:49:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tJwaoiiZeCKt9gmoe65nMnVxorhIIixTHKEmz9v8mImaxmx+2CAcPlaeJ2D1rMQADHfLUew==
X-Received: by 2002:a05:6402:11cd:b0:452:199e:7cf6 with SMTP id
 j13-20020a05640211cd00b00452199e7cf6mr2186451edw.366.1663836577037; 
 Thu, 22 Sep 2022 01:49:37 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906309200b0073dc5bb7c32sm2358966ejv.64.2022.09.22.01.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 07/26] blkverify: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:05 +0200
Message-Id: <20220922084924.201610-8-pbonzini@redhat.com>
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkverify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blkverify.c b/block/blkverify.c
index e4a37af3b2..020b1ae7b6 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -258,7 +258,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
 }
 
-static int blkverify_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-- 
2.37.3


