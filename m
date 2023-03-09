Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2336B1E88
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtn-0000M0-DC; Thu, 09 Mar 2023 03:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBti-0000K9-HM
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtg-0000Cf-Bv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjNSXKxAYnFoc6sJxFxYTdlz4j0wHO1G3JZwgRMvpTo=;
 b=a0SUGr7BKWqeYaDEB8kBRZaJb6PsHp5vNhXEEhtyZkD9e3tNw/G9GWWLz3tx5+iKxMDXc6
 9kM2VBx5MD90UUeKyuq8J5aliM76ERIt6zudRxwZ309bqGt3WDlvwsbCk5OJUl6D0FrHpG
 +x+oblJA/uIdvR0VdZ5E+0hLe99Uks8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-cRQ6lAalOH-SWwRlUl2Ssg-1; Thu, 09 Mar 2023 03:45:09 -0500
X-MC-Unique: cRQ6lAalOH-SWwRlUl2Ssg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso1874611edb.16
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjNSXKxAYnFoc6sJxFxYTdlz4j0wHO1G3JZwgRMvpTo=;
 b=qhUd7s3XiSZnXH9JAw+msO6rK7ms6D8V9Ms+jtIfIcq5zPiBO4l7fSxRmzsRneYY/w
 1t1LUwZE4DaEQ+SypsdCCjnoHE86uFEgvsGb54pwRXJ4y3Fm3g2kKJuom05ByH9rAXij
 xeifR3BoD5wzRWqT4YUvht4vBJYtErfndeIiP9cCfcLNFM019RnIqPgCafyBmdCoJ7DS
 Z7NnBsH7flyqt25sW5U2comcuZL5EgOpYsCGWi5RzzIe4G+Hl52qLQ5Kw1VzLsZFDGC0
 GbraDdDhURN++GfsDJCz2c3axaCdT6S+QgPRQAMOpY5n5LdspYM1O1x0sMbm0zNn4R4t
 bOTg==
X-Gm-Message-State: AO0yUKWZUnUTEmHuq305jgE4XCwlFGdNHjBbvas/0b9K7wIX6Ww0BXJJ
 USqSW94kDDYMvwF5cI/ZehIJHKtCSYQXPoWY4dpeFquaLbDEaO+iAZ+zJxCM1VTXz4wg39I0DKM
 ixKmR2V4nDdfOPKVsonPvsOIEjzhvcKyy2D8qUsAKXwmWU6KNwLJDQ462Qz3TwPtRMBPgXzdB9t
 E=
X-Received: by 2002:a17:906:95c5:b0:8f0:4a90:a764 with SMTP id
 n5-20020a17090695c500b008f04a90a764mr23623134ejy.23.1678351507514; 
 Thu, 09 Mar 2023 00:45:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9t+U2etUNTGW4eQfKtvyjvZ4k1eCvRokt2lBxwRjVi6tr/7Rhxxrqkssu0N8WmgYwTqO2a4g==
X-Received: by 2002:a17:906:95c5:b0:8f0:4a90:a764 with SMTP id
 n5-20020a17090695c500b008f04a90a764mr23623122ejy.23.1678351507301; 
 Thu, 09 Mar 2023 00:45:07 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a50d7de000000b004c13fe8fabfsm9248068edj.84.2023.03.09.00.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 6/9] qemu-pr-helper: mark more coroutine_fns
Date: Thu,  9 Mar 2023 09:44:53 +0100
Message-Id: <20230309084456.304669-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

do_sgio can suspend via the coroutine function thread_pool_submit_co, so it
has to be coroutine_fn as well---and the same is true of all its direct and
indirect callers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scsi/qemu-pr-helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 199227a556e6..9df82d93a7d2 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -177,8 +177,8 @@ static int do_sgio_worker(void *opaque)
     return status;
 }
 
-static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *buf, int *sz, int dir)
+static int coroutine_fn do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
+                                uint8_t *buf, int *sz, int dir)
 {
     ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
     int r;
@@ -320,7 +320,7 @@ static SCSISense mpath_generic_sense(int r)
     }
 }
 
-static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
+static int coroutine_fn mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
 {
     switch (r) {
     case MPATH_PR_SUCCESS:
@@ -372,8 +372,8 @@ static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
     }
 }
 
-static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                           uint8_t *data, int sz)
+static int coroutine_fn multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+                                        uint8_t *data, int sz)
 {
     int rq_servact = cdb[1];
     struct prin_resp resp;
@@ -427,8 +427,8 @@ static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
     return mpath_reconstruct_sense(fd, r, sense);
 }
 
-static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                            const uint8_t *param, int sz)
+static int coroutine_fn multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+                                         const uint8_t *param, int sz)
 {
     int rq_servact = cdb[1];
     int rq_scope = cdb[2] >> 4;
@@ -545,8 +545,8 @@ static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
 }
 #endif
 
-static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *data, int *resp_sz)
+static int coroutine_fn do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+                                 uint8_t *data, int *resp_sz)
 {
 #ifdef CONFIG_MPATH
     if (is_mpath(fd)) {
@@ -563,8 +563,8 @@ static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
                    SG_DXFER_FROM_DEV);
 }
 
-static int do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                     const uint8_t *param, int sz)
+static int coroutine_fn do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+                                  const uint8_t *param, int sz)
 {
     int resp_sz;
 
-- 
2.39.2


