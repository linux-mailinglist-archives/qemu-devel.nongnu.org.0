Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CA5E5F92
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:14:43 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJEA-0006Rk-P8
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuG-0004XS-Om
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuF-0003Kc-7X
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgOi7vAF4ipXIXW0KsqPLZlNYbP7Q8ITUi2hsfHmSgE=;
 b=eP/RpE3z4QrBh23ORBsSY5WFmpNzH+kpvkwjkmsLh2YvMVkRBvhQ4rJKRT8fwPTaujnkl8
 d48aKXoJjL7KhAfMCjvBEwZKKLtHV+mcYposHlEwPRh0QteC8u/8IYcDOzwbcXL79mv+Yc
 2VIqYPj1KSJ51YBx/b2d2j1e90PkcqY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-SUGAYeEBPtmhBy8y44YFBQ-1; Thu, 22 Sep 2022 04:50:01 -0400
X-MC-Unique: SUGAYeEBPtmhBy8y44YFBQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f10-20020a0564021e8a00b00451be6582d5so6217004edf.15
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dgOi7vAF4ipXIXW0KsqPLZlNYbP7Q8ITUi2hsfHmSgE=;
 b=0QWdlXqlGoVYpmBf7QG+ygjUmZsP8bfgurit1HV6RGO0Ctj7LatrEGxGR4HFxE2IfK
 hopJr+y7YTn1ELd/GyUn3AQRDxNmPWvlyTjtczuWTikhEpTe+UoIx3vC2l9ce6KhD6Tu
 RWSvvsd2AaZ8Ze/nStxQDmFYblU2EIW8mUaHorv0S7PwquM03X20OUakleaP7i5o7fu8
 vcQ7dte3jX2Qy8J/KVhF/3nDkDrKs3l+Ys3q94V93m3nt1YyLAAMwJMkP7g6qlUsErSM
 mHbgu8/bzSzXCAMnRmQVeWyc8AXVLGG1W9VFj+OfriC0ejuUbyaqUUm9cLbg5KGWKj5c
 JQFg==
X-Gm-Message-State: ACrzQf3kKBKJdCNiCXesdZht6QcvnTsUskUw8Qtf6Zc1D7uWuMCaK9us
 fJA4cvEUycNME+qb53dZO//ibZ/n3BMsimBUVKiZfSyTuBUJ3lqVAIs5YPtL6I9NjB8ZAJRtiN3
 +w/il0ajMeLL4OiAqSrmCRS3ltO750dIMRaCJ2H2+u/0FRZGjzNg+g1t0dLKF8u+F1sA=
X-Received: by 2002:a17:907:9490:b0:781:c079:1294 with SMTP id
 dm16-20020a170907949000b00781c0791294mr1956095ejc.29.1663836600107; 
 Thu, 22 Sep 2022 01:50:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79VI+tSCtK6t4Y5zFEEAtK6h+A5FMxZxBqTPkO3kjMYeF4W73ESzMk+hbyx/rLFniFAE5Vjg==
X-Received: by 2002:a17:907:9490:b0:781:c079:1294 with SMTP id
 dm16-20020a170907949000b00781c0791294mr1956077ejc.29.1663836599836; 
 Thu, 22 Sep 2022 01:49:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a05640226ce00b004544bdd56a4sm3331463edd.89.2022.09.22.01.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 23/26] raw-format: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:21 +0200
Message-Id: <20220922084924.201610-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/raw-format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..45440345b6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -411,7 +411,7 @@ static void raw_lock_medium(BlockDriverState *bs, bool locked)
     bdrv_lock_medium(bs->file->bs, locked);
 }
 
-static int raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
+static int coroutine_fn raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 {
     BDRVRawState *s = bs->opaque;
     if (s->offset || s->has_size) {
-- 
2.37.3


