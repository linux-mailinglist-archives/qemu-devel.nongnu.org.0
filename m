Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419D55BCEB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 03:13:29 +0200 (CEST)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5znE-0005aH-1U
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 21:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zje-000202-P8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o5zjd-0002U6-9O
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 21:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656378584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aup/1gVKAiFfbSKNM4xeKWJ2hlPIQ898VBYFGgJNIwI=;
 b=U/rxO+TgyLsBhHhFCBNk8RL8H7sdsti+nVA92L5eRVC2Jyhi1JzhFUUGfbIWYaYwojCtBL
 Yrg1fLO5NKEBEVT6FtnbfPIq2VcBxyQOFtKJI1yPh736+TY5k8VbLxEqkvMTwxU8lnEuy+
 LeYT74EwBYRmQddX50qG7dyyifKP65Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-OW8LX2ynOu6gND9w5N5qHg-1; Mon, 27 Jun 2022 21:09:43 -0400
X-MC-Unique: OW8LX2ynOu6gND9w5N5qHg-1
Received: by mail-qk1-f200.google.com with SMTP id
 186-20020a3708c3000000b006af306eb272so3951606qki.18
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 18:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aup/1gVKAiFfbSKNM4xeKWJ2hlPIQ898VBYFGgJNIwI=;
 b=lu8dUTOyZrpkXy+NIYO0qN7ABAz6vpPWIe/9Kk8i2h23SD8hlFNBB4Btqi2QQYeuHB
 0AH7W0Bnlppb0SAAvKd8S/Sya/xyDvIiTSfpYVCMRJeEcB4sDdrVofP1SiHAxeRxGJrP
 Y9+pLEk78X5p/3g7MhhtApXQlrr4whC89jCTQdJ55E/cQGvLdJ/c5OI4+NJ9lBMoOiWA
 JDwKjKms9or+HOUuDQgq9Tt7LyS6pVs1ainwCNRYR9SIUuZHai7PEX3lH+UHexQbDTRd
 E+G72g8pYy60Q1fHUBSM16r87jS9HOwIo2jdaeKExeZZl0mCh9JeX6JmTOcpjjbt+3bQ
 vRTg==
X-Gm-Message-State: AJIora8L6hci/5H1kYWGq13qfhWlCVni7h3wyvLy4hLVXSMAozNEUrMF
 nAfjS3XLU1NJB6e5lp28/naTnNm8yiFC+6ePcFeMBmGBLCP+cG0IpQqeoJbu9Ju71yr8C+2Ykd6
 Lue9pLUoVIbfyIaU=
X-Received: by 2002:ad4:5ceb:0:b0:470:54e3:92a4 with SMTP id
 iv11-20020ad45ceb000000b0047054e392a4mr1916697qvb.22.1656378582798; 
 Mon, 27 Jun 2022 18:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trBb9maUvcjMayGHtrlmUo0hJqTHMOFhkU1wSVdreqkW2qLfQulFpMT7jI0vMfd8RFZST9wA==
X-Received: by 2002:ad4:5ceb:0:b0:470:54e3:92a4 with SMTP id
 iv11-20020ad45ceb000000b0047054e392a4mr1916684qvb.22.1656378582604; 
 Mon, 27 Jun 2022 18:09:42 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:57bb:78f:fc5a:be9c:9417])
 by smtp.gmail.com with ESMTPSA id
 cc18-20020a05622a411200b0031b7441b02asm1742047qtb.89.2022.06.27.18.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:09:42 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not working
Date: Mon, 27 Jun 2022 22:09:09 -0300
Message-Id: <20220628010908.390564-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628010908.390564-1-leobras@redhat.com>
References: <20220628010908.390564-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some errors, like the lack of Scatter-Gather support by the network
interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
zero-copy, which causes it to fall back to the default copying mechanism.

After each full dirty-bitmap scan there should be a zero-copy flush
happening, which checks for errors each of the previous calls to
sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
warn the user about it.

Since it happens once each full dirty-bitmap scan, even in worst case
scenario it should not print a lot of warnings, and will allow tracking
how many dirty-bitmap iterations were not able to use zero-copy send.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..9c62aec84e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -624,6 +624,9 @@ int multifd_send_sync_main(QEMUFile *f)
             if (ret < 0) {
                 error_report_err(err);
                 return -1;
+            } else if (ret == 1) {
+                warn_report("The network device is not able to use "
+                            "zero-copy-send: copying is being used");
             }
         }
     }
-- 
2.36.1


