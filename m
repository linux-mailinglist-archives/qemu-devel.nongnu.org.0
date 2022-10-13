Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7F5FDACF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:28:03 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyFm-00038y-48
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTL-0001fA-RE
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTK-0004AH-By
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCIh+kWFUgLaHVSIufoAJ6Cycswz/EUJ5NdLNcYpSp4=;
 b=dkslxj21F4lQOfl49c0j9wzii5evxZjfh/scmmrEKjzUjWU15J03RwDNjvR5GnYBAER/UD
 qHlVGyOX6mH2pn+TGq07Zy8cQ3r9YgQEAieSuHGjmWPP4lIJoVOoheTNQ/25HJVAukYLqk
 jLWNzYRNWc3upLXiKUWM2iqUvWIXtHw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-5cIcrgw4NXemj5irdNOxcQ-1; Thu, 13 Oct 2022 08:37:56 -0400
X-MC-Unique: 5cIcrgw4NXemj5irdNOxcQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 j20-20020a05640211d400b0045bd72f05d6so1424793edw.11
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCIh+kWFUgLaHVSIufoAJ6Cycswz/EUJ5NdLNcYpSp4=;
 b=uPRm0P75/TZVGp00dtov2KQXAdwX3ieTdSFPYzgmX45zq4QpdPiGycc2/sbD/Wp9bG
 d4erTmDXCXxoZbuoitJuxCEC4tp1pxWSZYO1cp8poGr3f6M/pltjB3pL/Oqi5GmshC1t
 H8mgMmRjI9CGGVYtQJZFqKNwFjazGh/Ss4ATNWigxTuSyKXmPRRjFihN9rLezIAb0aN+
 4azcIkZBEci1t9nu7TeXybGBxTwqE32TdI/ZPa5Mn9iyTW0EXXhvNyEA3CWhWaDFvaEj
 LCTvIrBreTwBSsQjv2ExHmP4/mXctX0UML9SReshg9flnqtP5PmKaQosQOry2Ea9nDWp
 SIuQ==
X-Gm-Message-State: ACrzQf3H+Bclb3y70ibqgSrFBFcOp4bThzCJ1y131sxw7WV9v8bkGkbL
 MgLRXmXE94BEV9mVokOMZud0Fj/nXKQBNmIkcOXoOgAwiDyYGVlg4degJ0Jt0frQfNiHWXYXcnO
 CBNyR+3ZQ80mfHs0ODL99B2Godtvd5Gkad77axYcHjMxe/zhW01Ikl4nY9ClZWqS9IV8=
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr26960462ejr.11.1665664675445; 
 Thu, 13 Oct 2022 05:37:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Z1LYLG9t4aDYaSu27RGXgUZ8uyc8ubpGqxrAirG27WaKjxN/wSw8KJfwbDZWQ5wRKyVTrrg==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr26960447ejr.11.1665664675134; 
 Thu, 13 Oct 2022 05:37:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a170906065600b00780982d77d1sm2916798ejb.154.2022.10.13.05.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 14/24] commit: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:01 +0200
Message-Id: <20221013123711.620631-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/commit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/commit.c b/block/commit.c
index 38571510cb..945945de05 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -135,7 +135,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     }
 
     if (base_len < len) {
-        ret = blk_truncate(s->base, len, false, PREALLOC_MODE_OFF, 0, NULL);
+        ret = blk_co_truncate(s->base, len, false, PREALLOC_MODE_OFF, 0, NULL);
         if (ret) {
             return ret;
         }
-- 
2.37.3


