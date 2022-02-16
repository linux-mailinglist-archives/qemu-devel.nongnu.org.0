Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A94B827A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:03:42 +0100 (CET)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFHo-0003NI-Sv
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDp6-00050d-95
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDp4-0006JU-FE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klamX9g+kUedSn42RLdhUX1ILZJHYJuXlx1KfqUP520=;
 b=XIE5xmJJtpMVc+VzZkgFH87B6HtC24MPWRCT4QqhmdM62ujpbsAKca84GKr4olOFuE1Vml
 4o5LfurBS0lfez1GBmYDl3mb7Fz7eUgYtDxYIYy5WyhnE5mSbpKObhwLCwUUzM8WAZcxuM
 lPeg7DnuqQ9LJXCKKECRgvj33EuSq/o=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-jvlU9JsmOPyhihq78iyFgw-1; Wed, 16 Feb 2022 01:29:52 -0500
X-MC-Unique: jvlU9JsmOPyhihq78iyFgw-1
Received: by mail-pg1-f200.google.com with SMTP id
 t7-20020a634447000000b0036579648983so735642pgk.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klamX9g+kUedSn42RLdhUX1ILZJHYJuXlx1KfqUP520=;
 b=L9m6ofOKIDxXgUMCOJGNpiNOv5jjjDzlS93P+VocObAGq1steGntM+atiyPUKlrCp6
 TRb1Uctj1lISGYDbz0GeRo84Izq1Wod8nBZoIGPfJpg4gXMBKtHyTvNS2AakWXwvpOdB
 XrpYLMT3D3Gpw7yWe8NYCP1vL1Ubuo8+AAEVavwUEuO1tBU1MVuo3qj4qWFtl9GhXgZK
 lCf0WoHAs7vTaKhOho0uox56CVKzBLMDulS6vublVZan2o6DnfBDQKwZMT4CpY0OQ6bu
 qcvdzLa19+T0KwJsGgTk81H0FaCCDRdoGEdW/7MvwQRPWceOGfSzbQEAyqSo4RlxdIoG
 pY+Q==
X-Gm-Message-State: AOAM533bt8lZ9V2j/EqSftXqG5nn9F50tdxMKRZmSVll3Tmq0lbIDCjY
 7r1brMj3LMDx10nmGW4Dz17oDwk3wdpLzovJsNu/APxhhuc5jRFkmpwxo3+wvfd2u1lCZNpdt4O
 +XOdSt2+yIEL2OODc5risLM0Aoxlnh5iXjmFdp07i5lf9sLrWhzNrbSeH94SChdsk
X-Received: by 2002:a05:6a00:2345:b0:4bc:1d4d:dfe with SMTP id
 j5-20020a056a00234500b004bc1d4d0dfemr1433196pfj.15.1644992990943; 
 Tue, 15 Feb 2022 22:29:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUEShFT2h4TClqxX7wt7K/HIZ7KRE9/V59Ls5ynDopVr7Eoh1A+Mwc1rUlaRg9nOsUH9eL5w==
X-Received: by 2002:a05:6a00:2345:b0:4bc:1d4d:dfe with SMTP id
 j5-20020a056a00234500b004bc1d4d0dfemr1433178pfj.15.1644992990604; 
 Tue, 15 Feb 2022 22:29:50 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:50 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] migration: Export ram_load_postcopy()
Date: Wed, 16 Feb 2022 14:28:01 +0800
Message-Id: <20220216062809.57179-13-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be reused in postcopy fast load thread.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 +-
 migration/ram.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ed70b17d7..f8bc3cd882 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3644,7 +3644,7 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
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


