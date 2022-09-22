Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2A5E5ED9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:46:09 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obImW-0000vn-44
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuO-0004YJ-4B
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuK-0003Se-6X
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQfYt/ZXJmjE1TcR1De7ZzjZEgfz0xSkkoMH4Gfc/48=;
 b=WRqRZfhQSzRWbsXQ073f4d45ZbhEvBqP7SDjtViiWfMkhDF5Iv06bgHP6VQf2Xjyydh/R0
 vlgGg0D5RD+TBKQG+3rYutUsRw0uk4S0+2OfBb+MW0ZOotM6nqq2ynUxaoLdmJKrS+DYO7
 R1FkBAzQt0zxJ1pdCqc5qQbIF6HSh00=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-6Pm6RV2YNZqY1OZR1hcA_Q-1; Thu, 22 Sep 2022 04:50:04 -0400
X-MC-Unique: 6Pm6RV2YNZqY1OZR1hcA_Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso6149170edc.18
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lQfYt/ZXJmjE1TcR1De7ZzjZEgfz0xSkkoMH4Gfc/48=;
 b=4GmYFF5euQ5KVx2YRlijliph1g0HDDieyWe5sHO5OlD5QCSsE36LRBcvsGUKVfbqNt
 aQeDTXpbW5O+7HKoT39d7SHCyL22O2yhQqu3rB4JDLbh5e82BNerWpilQx2Qx0iWfAgv
 TNiwvOz4whN4q9kFrdXpN5DonX1W4qXlzFTGMCoN3uZr7+u4i/ocLOJpX3LckxJ28BIh
 btTN269HtT6VysqXUCEVrHACsu0S4SZh8HnSx2xjFOmNqRN2nl0mfRSp+iqps4aXMQxm
 DuF0qilgbT2FwhNYQ0354JsTmbC/gBoS7pDYIRUW3Qq04/cJPIWvHySX/B6G7R+wY6wQ
 t7Fg==
X-Gm-Message-State: ACrzQf3H9RTLaa/ooeftKoSrncJvHUk0wgMQtYeEEcpFHSAduVMb03em
 OdZi3skWNkKilxV1eqEfW3ZdMV7zsJWWoU2Fnbz4vJJfLmnSIRCQ3mw0LfucwVhcWsZZx143XpA
 qcE3ho1Bd/jlVs5OImW5yF+eMkoDD2gHL0aHa44bVtcr6yAqPTafAD8nHuAcvpYPsUq4=
X-Received: by 2002:a17:907:948f:b0:780:4c66:6689 with SMTP id
 dm15-20020a170907948f00b007804c666689mr1840395ejc.401.1663836603506; 
 Thu, 22 Sep 2022 01:50:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cJFxX8uyRf4ElbdYuY46kfVx6+c7+iQ+tOGc0cr92qLsr2o7YirK1G8Ds2gzivpJ7M4cCUQ==
X-Received: by 2002:a17:907:948f:b0:780:4c66:6689 with SMTP id
 dm15-20020a170907948f00b007804c666689mr1840373ejc.401.1663836603282; 
 Thu, 22 Sep 2022 01:50:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j12-20020aa7c0cc000000b00445e1489313sm3202658edp.94.2022.09.22.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:50:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 25/26] migration: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:23 +0200
Message-Id: <20220922084924.201610-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index bb8bbddfe4..739bb683f3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -574,7 +574,8 @@ static void process_incoming_migration_bh(void *opaque)
     migration_incoming_state_destroy();
 }
 
-static void process_incoming_migration_co(void *opaque)
+static void coroutine_fn
+process_incoming_migration_co(void *opaque)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyState ps;
-- 
2.37.3


