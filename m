Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296445AA9F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:56:07 +0100 (CET)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa1W-0006PJ-Ij
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx1-0006Ri-RQ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwz-0006lX-B1
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPYxMrCOWugGC2Ig3skogvxaOmXOSxKYsh8Dbjvo4MY=;
 b=XpH6uC169fid0BszWJqEgkES8T3lWLBTEag8X3Z4Qw9VCaJWWgZ4Ys4B90OiBlKL1XeNW5
 AfZiXRPL/zCzBg1O0CDV+heB32q9PSSrGAWwJXsXqXfWgae4978k4Znew/lY5XS/SU9n3q
 0bK6oKaSATKYyWsEc/DsmFQkSnqw7Jw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-NNj82MPeMjWwlqyj8PrIHA-1; Tue, 23 Nov 2021 12:51:23 -0500
X-MC-Unique: NNj82MPeMjWwlqyj8PrIHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso1570304wms.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPYxMrCOWugGC2Ig3skogvxaOmXOSxKYsh8Dbjvo4MY=;
 b=40+e1ZJu+6KGKGwZefSVxxw2R3jM4Sj/4yTaSEW98JNend8WWOY69u8e3LkZFjz1Ko
 T5Vp23PW9CbNp1+l2eghVWi5ZeDdeuJH+DfuWuWcrQgHqPILlmetSPD/oXffgHznEMex
 SL/cHYdGeo649Brs1khC+Y+8MDqdRhJ3LbusWLxlYmuKfOf/L6VtoVj21cY/XDRhToD4
 xNFSNF7qDlI4Ou+viWziuJvZXeKo972uTQgnrEmss2pMXqgO7jarQbZFCpHx8Mrrv497
 uh+nZG7pzDka1kLRdx7VRouW64KRfFOAT8VRRDQA0HgcQwYkug86C6QmIwwmytqbDPrr
 1nMw==
X-Gm-Message-State: AOAM533q+VcassOw8yrNNcif0nXlmglwjxt1lNzQlPZ1eoeEnHEPY7vN
 NZSo4IWk89XuJR4AlxdpIho1cHXEtaLcfX4DRJR4d/oxWj4FvwGCWCh5sNea929x3gQfbRt5vmN
 o5ykhEq0v6swdyL6P8/SR8hM7Hxqjh82Sm7isx1BVmFIecTOWfOL67zCTWT4mJj4WbUU=
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr5363529wmb.182.1637689881850; 
 Tue, 23 Nov 2021 09:51:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNJ8VmPilnB28Oy8aQoqMQJThw8B5FmxDrK78cQJtsLdauXbLgiuKu0VhAIDXLicAzPz3zIQ==
X-Received: by 2002:a05:600c:1e87:: with SMTP id
 be7mr5363495wmb.182.1637689881640; 
 Tue, 23 Nov 2021 09:51:21 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id l18sm12852378wrt.81.2021.11.23.09.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:21 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/23] multifd: Add missing documention
Date: Tue, 23 Nov 2021 18:50:54 +0100
Message-Id: <20211123175113.35569-5-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 2 ++
 migration/multifd-zstd.c | 2 ++
 migration/multifd.c      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3fc7813b44..d0437cce2a 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -72,6 +72,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -94,6 +95,7 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index cc3b8869c0..09ae1cf91a 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -84,6 +84,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -107,6 +108,7 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd.c b/migration/multifd.c
index 8ea86d81dc..cdeffdc4c5 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -66,6 +66,7 @@ static int nocomp_send_setup(MultiFDSendParams *p, Error **errp)
  * For no compression this function does nothing.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
-- 
2.33.1


