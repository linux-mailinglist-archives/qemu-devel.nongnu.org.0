Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0105E5EC2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIgq-0003vP-EY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu2-0004Mp-CK
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu0-0003Cf-OC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoMhUiiW46hHU/7ueBXGLOXJdUNOszC/FunOU7fBMmo=;
 b=CDusB1wYf8FXUK6MUnpnNTZgEj+aF6COFTG1oS4UIHmhLYKJ7bgB5rcpqzwqetVIbJTs76
 i+eIs4wGS6oCjKd2X4PG/FQhfGf3q+zE0je8lPBHuLIMW4+ov4UDdUwmivmCEKbDzg/OA4
 eS8vEYJ4tI6x1YHaZWLOlWZMzvFE070=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-McvT4AwOMCesX4CRIT95Qg-1; Thu, 22 Sep 2022 04:49:47 -0400
X-MC-Unique: McvT4AwOMCesX4CRIT95Qg-1
Received: by mail-ej1-f69.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so427700ejc.15
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FoMhUiiW46hHU/7ueBXGLOXJdUNOszC/FunOU7fBMmo=;
 b=lkvopf1yJ/rjceUAybjp8XytOC/lwSukSmubvVB3lBhPH43rLrc9XW3F+UeZr6paCi
 MXepbq87JQg4cfNJbjVpMlWUq0Bkf0kxFvGfX0zWSsumV0Eixfg61CnlqE9cDbyGlanw
 bTP1trQjdYJZJgVEHo51+Nc+kxmNIRZ60NhikNfO7XB4yf4igkvXWcyfyAhPT+VQfey6
 dIe+v0bEUpLMjp9q/LQpIAQFi7OkJ+DjHKUkR7tTJ5z06ppXznjpUbuDf4lxc80/4uZg
 oRBVdKhLcStHPSY9JiQlHBZXWG8eYk6ej4d7kl83CBiEXntbKxXA/gy7MGO8O5ZY5918
 9QXw==
X-Gm-Message-State: ACrzQf3pN+VSAMpehaFnHLF4yqxAGJdAa6TP5SmxH8PmJqXmDl5OZ0aF
 dyK9acMRDgGBXXp87dGLAx9j9mmGjMDoIHpqgnfp+mfh/DpVLbKo4er3QJVb1z7v+xCV0BT1G1E
 Ch78OifHqer0J1zasATEny8RjrpY6W/YjBLW0oMuKjcMmZFC2IjAXtSMPI57hU3t1s6U=
X-Received: by 2002:a17:906:db03:b0:741:337e:3600 with SMTP id
 xj3-20020a170906db0300b00741337e3600mr1870129ejb.343.1663836585590; 
 Thu, 22 Sep 2022 01:49:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7jEiBJbBamSXVIERtfq8mlZ9To10j3RTH3DnM4Otq8FUiHiazXBTY4j/Yu0s2i7h2BGc2r9A==
X-Received: by 2002:a17:906:db03:b0:741:337e:3600 with SMTP id
 xj3-20020a170906db0300b00741337e3600mr1870110ejb.343.1663836585306; 
 Thu, 22 Sep 2022 01:49:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n26-20020aa7c45a000000b00452ff2c203asm3277956edr.92.2022.09.22.01.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 13/26] parallels: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:11 +0200
Message-Id: <20220922084924.201610-14-pbonzini@redhat.com>
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
 block/parallels.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..5fc726f446 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,8 +165,9 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
-static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
-                                 int nb_sectors, int *pnum)
+static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
+					      int64_t sector_num,
+					      int nb_sectors, int *pnum)
 {
     int ret = 0;
     BDRVParallelsState *s = bs->opaque;
-- 
2.37.3


