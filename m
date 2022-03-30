Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA94ECEEF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:44:06 +0200 (CEST)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg6n-0006ST-SZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:44:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2C-0005i8-RC
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2B-0005EP-36
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuNDDv29rDBOfHxmW0v67zbZ/KMeTKCpZ84LsWOMvjI=;
 b=WSSFCDlI8SKQsWOaa/h0jG1p/HqBVnJsRDe4Gfbq8axFB8bOCmwiJUyJHFOCyQs6Kxhxt3
 VYDxfpQwN6o9fVoSkB8/jD7em5xiaFuXhtbIVbeHbaJK3DkmUix+aovRa2ldsO2P5/h8Eh
 hQIrohHOsu3LhFWyvEWfdBVuFoO3rqE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-S2OLLNi4OkiQoCcA-E85JA-1; Wed, 30 Mar 2022 17:39:17 -0400
X-MC-Unique: S2OLLNi4OkiQoCcA-E85JA-1
Received: by mail-qv1-f72.google.com with SMTP id
 cf13-20020a05621403ed00b004412de7b1ffso17041193qvb.19
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuNDDv29rDBOfHxmW0v67zbZ/KMeTKCpZ84LsWOMvjI=;
 b=XTvXu2+Nvc2cEJ9HsgpzuGpZ1ZYyBaMmCtdh4yBitQ8FRTqPMsKpadKuGfo5t24yYM
 ACpoXIr17QXiFTqaTsQm/kiwGJOEFs8WhaXcpM6EDmkeNTjhHjGVfQ8bqNVcoo41sP8J
 r5rTV0WcO2uUHaxFjJqIVPaQ2uw/orEmFa6LQXYjz+fh5wtntGW2gcLcfkkhn8Hv1xu5
 HfPrIe/pkovkrBrO0ssyjy0HjgT+60l9PE6B8tBIb55mdvADQ9pszpWTT+8fdPbbrG/I
 VA7w9K6YoF9nuvpQKedN1m6wpD6RwWzKEZ6EPsiQJo4KJclFcyx54LtrmvQYL+uSbLw6
 8SkA==
X-Gm-Message-State: AOAM531gbetZxSndZOVGZzPMtA16aXarXba0/RTRHDTitlD9hMovyysH
 zSyi83RsnqH9pAXaoq8VEM5TviyvKYJn8Ab5IlKttSg107n8VroT1+wc3k9uhO1HxLvjdEVHn9G
 j7FkZB/IQH3x+83vO9c4eKtklPaMcoUz6WYcletA8R775BmS9qQZnZHjMbMjCEjXr
X-Received: by 2002:a05:620a:2588:b0:680:f657:fbd6 with SMTP id
 x8-20020a05620a258800b00680f657fbd6mr1228406qko.287.1648676356822; 
 Wed, 30 Mar 2022 14:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQw4ghpFEIa/gv1yaLa64GeEBuSth2FVCNFfdbZPErQ1WkdSLVfQ6v+0M24KQjcR00yNtSVQ==
X-Received: by 2002:a05:620a:2588:b0:680:f657:fbd6 with SMTP id
 x8-20020a05620a258800b00680f657fbd6mr1228391qko.287.1648676356560; 
 Wed, 30 Mar 2022 14:39:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/19] migration: Export ram_load_postcopy()
Date: Wed, 30 Mar 2022 17:38:54 -0400
Message-Id: <20220330213908.26608-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be reused in postcopy fast load thread.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 +-
 migration/ram.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index bfcd45a36e..253fe4b756 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3645,7 +3645,7 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
  *
  * @f: QEMUFile where to send the data
  */
-static int ram_load_postcopy(QEMUFile *f)
+int ram_load_postcopy(QEMUFile *f)
 {
     int flags = 0, ret = 0;
     bool place_needed = false;
diff --git a/migration/ram.h b/migration/ram.h
index 2c6dc3675d..ded0a3a086 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -61,6 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
+int ram_load_postcopy(QEMUFile *f);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
-- 
2.32.0


