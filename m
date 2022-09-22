Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A398E5E5E9E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:30:33 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIXL-0005lJ-BC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuB-0004WM-HH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu9-0003FM-Sd
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMyrsH6flMrRHoTLooSRFWvZ6rfjgHHnfaNWVEG2s4w=;
 b=JGKMmbON7ONVaGMr71c3FFndFVjqUkqRiKKUI0RSl1cJU57jqqKvWRkS8784Z4Orc3N8Ew
 WWR8Akh5VFydkMxA2XTc9Cjt7AbuPr0Oi+PUTRRY1FJrWhKc4YxrWjdZ6lRkgRX0d2kSUP
 FLCJPPA/40EfmZiAuCpJUgBU1w3O2p4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-rHaJnK1HNKOfFGOLECAGjQ-1; Thu, 22 Sep 2022 04:49:55 -0400
X-MC-Unique: rHaJnK1HNKOfFGOLECAGjQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so6133724edb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hMyrsH6flMrRHoTLooSRFWvZ6rfjgHHnfaNWVEG2s4w=;
 b=0Iw5wSSytmXfBff1kjH5pWJ5zu2oJ7XhLUBSzVuEk1pVPLtrBUaOb5BgxRrhTQ+8W3
 VVMKxx3u+mO2qAej8/1LjGyez7gcz3umFzafDwJG6sGDqHq1DrQiC2mq1aO03kYiNmiG
 kxRDFkN7pADk+7Fre/599JqChJgBOWZOHl67onxjxIo3Zpf2MjLXPctgnc5Opp8w66EE
 Lvtv+3wiMAScdQGZwn79I7ekW/PHkW+mXgQ1/4BLKDdKtyb3Al2L6grbBU+54I4Bgj2T
 VzRuDvHz2STfuDuj+k3eIViOz1MJ20CGqyfjY6NJH2x1bQaC1Xfk7885DgeV+UucuxTs
 hj9w==
X-Gm-Message-State: ACrzQf1Ohga/+31RytF/c5/VQDxuzV5SVAEAeEdkA7dWQXFK1czyzKDR
 9dzVa3t339OOO9DxrY2eOmAUZeD/nka3ZFVq06nzpg4fXBgjLbrA6t66PiLGAXmKgmHHGsnlZlr
 eG99xLLdrJa4JrJuxYCK63putIBP9CMFSKWfdFnUt0tlavS5EJ+aQ9NYPCbGDepYgGzs=
X-Received: by 2002:a17:906:847b:b0:773:db0f:d533 with SMTP id
 hx27-20020a170906847b00b00773db0fd533mr1908585ejc.0.1663836593953; 
 Thu, 22 Sep 2022 01:49:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4T/ePeV0dljIx8aQjrbTRqhtjmviIwpsLGx8I3coEtaazCnt4nx0QERRMbqKn97AShhF94ZQ==
X-Received: by 2002:a17:906:847b:b0:773:db0f:d533 with SMTP id
 hx27-20020a170906847b00b00773db0fd533mr1908569ejc.0.1663836593724; 
 Thu, 22 Sep 2022 01:49:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a50fc0e000000b0044792480994sm3217874edr.68.2022.09.22.01.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 19/26] throttle: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:17 +0200
Message-Id: <20220922084924.201610-20-pbonzini@redhat.com>
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
 block/throttle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..ddd450593a 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -162,7 +162,7 @@ static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-static int throttle_co_flush(BlockDriverState *bs)
+static int coroutine_fn throttle_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
 }
-- 
2.37.3


