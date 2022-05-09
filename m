Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252FA51FAEC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:08:29 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Fb-000479-UB
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fY-0005Es-81
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fW-0002qK-PG
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQh22lnufKAWgD5CqwEj3x+kz0+ZoWkWusiZbQ7A4AM=;
 b=Q+lEGQ2W750YQAQdkgRWdDgy0SqsO5gmRRljg2w6YHh0UiX0Mv7Lu70Jt+Nob0VNylK0vj
 HC6o6aP7IsDlDPO1Bz2cEefSYHcsu3LDIzwSfe8Ry00HkmaX6SbRcR8pmU0iRjb+1xE3pJ
 h9B0/y/aFeiTuug129xLJpOfNX1gqt0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-6WgXxChBM5O_p5vu8sHxxQ-1; Mon, 09 May 2022 06:31:01 -0400
X-MC-Unique: 6WgXxChBM5O_p5vu8sHxxQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e21-20020adfa455000000b0020ae075cf35so5649198wra.11
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQh22lnufKAWgD5CqwEj3x+kz0+ZoWkWusiZbQ7A4AM=;
 b=25kP3Lm2lEoNsSKydQ3FEV9KaPx/xWW28JZI7gCc2yYVoouDKkN+W4dzgXM1bVbX71
 cJAppDk9Ll/dfv2OfJ/PdCHom4zyOmOIcaBKKaGs70W5Lw0rge7Yb3y1XSwLsPoyUnc7
 cE8Lf211YnpXGQjknN4v9Gs9ZN5x0sCVM9oaZHB9jSyVWPkHbFvrwep33rjOlY/1cvZL
 KWvodhFiiJyMJV1Bt1QQEcwwTFmgxyAh+ndudPbCAAO2FIORmkrDXVQ0KZNikMib5toU
 paCqQ2UfEePtpULYmfsWqScK+LXGTRNgUfBodMQpCrJbY1c0F2KWxMDV3tms5lnatHph
 R3RQ==
X-Gm-Message-State: AOAM531OwK3r7iAdLI3WNFw9UVtXOacPDWfohfFYjxOS1QD4OXlvoyhv
 S7DkFjVcRFu7Li2gEjaj73iO+7ut3TqjC3h/4jcQXSA+Gr3cNHx+5VNogBJ4U6OIYvxFlpO7Yth
 HLWmntL9Sm8W3a9gZOoVLv4Tee/dALfWGQ6GgvalPU1BOD2Yu13tuUlJ5xDxZDc5KUcs=
X-Received: by 2002:a05:600c:4e88:b0:394:8835:2220 with SMTP id
 f8-20020a05600c4e8800b0039488352220mr7390023wmq.140.1652092259853; 
 Mon, 09 May 2022 03:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5zPqPw+quHo6pwyntwDH9wGAQi5+mrPV78TibURWRcy3Kubqwu/T0L/KaNUA0o3klz7ookA==
X-Received: by 2002:a05:600c:4e88:b0:394:8835:2220 with SMTP id
 f8-20020a05600c4e8800b0039488352220mr7389986wmq.140.1652092259459; 
 Mon, 09 May 2022 03:30:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfecc1000000b0020c5253d8e6sm10730411wro.50.2022.05.09.03.30.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/26] curl: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:09 +0200
Message-Id: <20220509103019.215041-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 1e0f609579..cba4c4cac7 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -855,7 +855,7 @@ out_noclean:
     return -EINVAL;
 }
 
-static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
+static void coroutine_fn curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
 {
     CURLState *state;
     int running;
-- 
2.35.1


