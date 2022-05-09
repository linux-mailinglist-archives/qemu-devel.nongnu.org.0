Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663DC51FAED
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:08:30 +0200 (CEST)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1Fc-0004CS-GG
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fu-0005LE-Ar
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fo-00036x-4s
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hS2bdLYJd1/LDmXPmGLqhJIOHD/m7LY1SJSJcfAc9/o=;
 b=gYUXYbGke3uisS2pZGRWHcX+lth2WCVZLmKPN0yMtVonBJi+OV8QKiPj6drCK6unQWgsQL
 tzbPvvQfxLBj2zqNxIP4EP+TC2sXS0i7KC54RLEXp96kBc+GhbWnDeHOqM8DsdicfWorQ+
 WOPEJn68/YiHQV3+vEO80QAGKKloSjc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-HwNlyvskNqCydo3IwHL3JA-1; Mon, 09 May 2022 06:31:24 -0400
X-MC-Unique: HwNlyvskNqCydo3IwHL3JA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d28-20020adf9b9c000000b0020ad4a50e14so5608029wrc.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hS2bdLYJd1/LDmXPmGLqhJIOHD/m7LY1SJSJcfAc9/o=;
 b=8LkhAlxCkoRsg0Ojuh8Xso6RgkOQlBD3IP/9VhMN/SG65yDh2X25p5VqWiEKo3h/zB
 2/3L/tO5AKFL1+5AwG+2wQRqop3xWLIZgPsLdz2oeD0PaDi86uQGO+v58BAGVxO3c1IP
 VGj9WaQ4i4/QfF9HYg6STliCz6FJ26qXf3IB6h0IqtV4qvJ5D9C5Lk6o3iRxvG63zeV3
 zqmxJ9JYMvPv6Wn0DGdRphY3ZlAld8+NojrLYbn6W5hknR+jGx2R7BWcQQ9kP4/LzD+R
 lcGgLYdb4joBtaz6hnNqWNZfcwpyUK9UHhQqU+fQSGkK4IkHjsVTK2uRN0papVFX7Ybk
 uslg==
X-Gm-Message-State: AOAM533zEaLhmEH/bN6GugjuBbidq8EZpWA+N2JUEDGY7Oubg07wsVQy
 uWaYU6dSLSUCWXKh026BJfF0BuajhVwSuecCVAJcknzc3VzrNhK9hQTqfWBezOFPN1+l+hG4A5W
 jQLZ0I8YWCm6gldSNJUiix3XIOokbcR5yVfqszBsZoTRwV/H9De3fhuy5hR3XXmm2ZFQ=
X-Received: by 2002:a05:6000:1569:b0:20c:4ed4:4ba8 with SMTP id
 9-20020a056000156900b0020c4ed44ba8mr12988248wrz.270.1652092283124; 
 Mon, 09 May 2022 03:31:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS279LkxlHvv4bXbiYeCPjw7UBVA2cgnNw6WzehrbtpQzpmUjyL6LAD9w9bcC+699ms24c2w==
X-Received: by 2002:a05:6000:1569:b0:20c:4ed4:4ba8 with SMTP id
 9-20020a056000156900b0020c4ed44ba8mr12988219wrz.270.1652092282673; 
 Mon, 09 May 2022 03:31:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a056000024e00b0020c5253d8besm10555844wrz.10.2022.05.09.03.31.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/26] raw-format: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:16 +0200
Message-Id: <20220509103019.215041-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
 block/raw-format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..45440345b6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -411,7 +411,7 @@ static void raw_lock_medium(BlockDriverState *bs, bool locked)
     bdrv_lock_medium(bs->file->bs, locked);
 }
 
-static int raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
+static int coroutine_fn raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 {
     BDRVRawState *s = bs->opaque;
     if (s->offset || s->has_size) {
-- 
2.35.1


