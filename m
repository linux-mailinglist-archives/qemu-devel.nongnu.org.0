Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E021951FB12
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:13:36 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Ka-0002D6-1P
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fv-0005L3-0k
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fp-00037A-Gq
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRBevPxYNuPIiH6l6U7B9z+Bu2KtSXy4/LwRnwqeYUA=;
 b=BeUA6/juQbcyOlgvAgwiXg/oMn7Ph3pIsQWV8zffAQbvJ93v9cnt2xkJILtd1r0tQh/19L
 esP3ZzrY5u1runlNQN3KycsqM8zy+9tcL8G//XiKQy7mS0XgIfU9ymqxoWmGBrdl/tDOcM
 LbcNZ80iMCicaEyp0lIBc/Foign4H4Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-TlQVlgeROsO20-HxlGFZHw-1; Mon, 09 May 2022 06:31:27 -0400
X-MC-Unique: TlQVlgeROsO20-HxlGFZHw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so4566474wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRBevPxYNuPIiH6l6U7B9z+Bu2KtSXy4/LwRnwqeYUA=;
 b=mXwQKjYjZOw07XqOR6v4vfzOSkag1ukf53y12+u7lIT+oUiSNM5W9SI7VCLWGXdO4B
 dgYb9PbrB7xBOkaJhSRALehs2hQJqRC4jN5aHcsd1eqI8OcpSHukqUJrdjuKh25Rw8Rc
 rhT9c1S0zCOF4LHcNX24DN9K8+7iqR6XKuVx19NwvkFEB01MWLwuH9G49YYtyuGQETfK
 y1NeOhSXSs9xOKy/6rTU1CCP4+picGjEFI5RmwZP4dTTasVQVgxtsiRYwmztCUKCOKSO
 XMzahcO1Hryd6X1qjEtrQwLmDbAF1F1PtpRaq/auiEwnkyx6TsOwCm5jdr/NTf8+/rew
 B0Nw==
X-Gm-Message-State: AOAM533Wk/Kc+NAAQ1hhOKDq5ssNP3oZG8RsSQqzbB4eLum0X1qU8bqR
 TBV546M5kw0tTSTk5gG1Bhyq70mfr3C2x27u3oQgn1vzji8eOr5Ywu8qlr2HnP4CFjxEq1HkCRt
 fsTTODNuCzvOnqFOE1Z6F1Mr8LacL58dSHZeA3ic0GP8ieegxP/vAxvtTMzPP1bYlfO8=
X-Received: by 2002:a5d:5505:0:b0:20a:ce51:1c48 with SMTP id
 b5-20020a5d5505000000b0020ace511c48mr13553859wrv.351.1652092286177; 
 Mon, 09 May 2022 03:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydL3fFFBSdBfiRqD30CfqLX833NwP4PnF8c2E7qjQSYJnCjVWyQZEhuYKRQerQunEBCCK3/Q==
X-Received: by 2002:a5d:5505:0:b0:20a:ce51:1c48 with SMTP id
 b5-20020a5d5505000000b0020ace511c48mr13553831wrv.351.1652092285808; 
 Mon, 09 May 2022 03:31:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d4089000000b0020c5253d8d2sm10620659wrp.30.2022.05.09.03.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 25/26] migration: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:18 +0200
Message-Id: <20220509103019.215041-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..e4ccfb9496 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -565,7 +565,8 @@ static void process_incoming_migration_bh(void *opaque)
     migration_incoming_state_destroy();
 }
 
-static void process_incoming_migration_co(void *opaque)
+static void coroutine_fn
+process_incoming_migration_co(void *opaque)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     PostcopyState ps;
-- 
2.35.1


