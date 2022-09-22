Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1825E5EEA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:49:41 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIpw-0003hi-EY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuO-0004YL-6f
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuL-0003TA-At
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGlB7wDGTDXEUeXT2vUgCzKB9NN/3MUucWZTD+WyvLA=;
 b=jGGkSMNv7SdSECyYWDriuVCzZpTO/DoLKqhibpLBa5x8hzzKXhTRY7E6ZocF5R+VwYPLoT
 EwubIc6c5fk7BQqBdUw+j5yLqrokcUQV2Arrx4FNcoZIf1Y13gHtSZcfrvj910SI7KFCW0
 jHK9xvm+wZEOCTt/TpZTC7tGqONNhtw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-7Bg3s1vrNcezx5rCgw-Hqg-1; Thu, 22 Sep 2022 04:49:52 -0400
X-MC-Unique: 7Bg3s1vrNcezx5rCgw-Hqg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so6160734eda.19
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lGlB7wDGTDXEUeXT2vUgCzKB9NN/3MUucWZTD+WyvLA=;
 b=ihAPMqr5vy7/BhCxvLI2fbLEhnmwwUUtlnoQKqfAFznzmNvdUwaP6Brap6vdvTcYK7
 2PtNIRNBNu9CmhG023J3EO/aP/BSCF7lyowKRWkpkoRRFm04U8tLffdF8kV5X5SmzELy
 MIIPzx8ENoaPg7EozlzfA/WwuCSurULIE6799IMtXboPexnItrwWTefbEmDR0MFOireH
 3xBm3XT/8AHVlqS8i2wQzRecCs7E06x/KIcOzxAurCTz07Nrx6yofprLYpL34bqel7tK
 mvPMzJAglMYo2KcmVZNr7ad4UbKXSjafusS3ujEGbRALdZodUhna3pv92ts9m6irHhYa
 wueQ==
X-Gm-Message-State: ACrzQf20bfkQwdu5G1ZAGFq60bivYoEUKSPEP3ypHS5jFO2RSXFj17+a
 DpdIBsS3XoB7d3XFezKyEDmycCqJm1k43gsrEcjmd0XhNNatfX7YFxDtEptKmDpdlxMQlQlcdT5
 q4XBtEMDVCDlOvteItton9d/kMfWHZcG/QVfFSGXPSH5a4Cg9DLvXcSp2ngTgRWeB6zs=
X-Received: by 2002:a17:907:d04:b0:76e:e208:27ba with SMTP id
 gn4-20020a1709070d0400b0076ee20827bamr1937104ejc.652.1663836591266; 
 Thu, 22 Sep 2022 01:49:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4h+m5PCvGdNKBDVw9bBVGOFaUS51QGheBCvbV9LwgYi3/NLEdnODhQRGgD989LQHQ6K5toCg==
X-Received: by 2002:a17:907:d04:b0:76e:e208:27ba with SMTP id
 gn4-20020a1709070d0400b0076ee20827bamr1937080ejc.652.1663836591032; 
 Thu, 22 Sep 2022 01:49:51 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a50c90a000000b00455262f83aasm543028edh.32.2022.09.22.01.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 17/26] qed: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:15 +0200
Message-Id: <20220922084924.201610-18-pbonzini@redhat.com>
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index 40943e679b..8b6a5288c5 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -254,7 +254,7 @@ static CachedL2Table *qed_new_l2_table(BDRVQEDState *s)
     return l2_table;
 }
 
-static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
+static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
 
@@ -273,7 +273,7 @@ static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
     return true;
 }
 
-static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
+static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
     assert(s->allocating_write_reqs_plugged);
-- 
2.37.3


