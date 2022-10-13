Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41755FDA03
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:11:41 +0200 (CEST)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixzw-0000rq-Rp
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTD-0001br-Eh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTC-00047k-23
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEjqbfSyEAtM0b3ifIeU6in3u3Xiw2yBc5yUjehkgcU=;
 b=A88UIgHeUaEV6f2OpCixvzcK4yL0L33jdlQ2uubibjC8C8JgFrqFXIcdP8fVT1lTFtJjM0
 K3R2CKhsRe4c5g+0rh13lpvugg6p997MWpnxvwTcuKJkPQaw818iiU4odQt1SCSZ2b0lkU
 RZCgEJYYTvaYLwUMX/1H4ykif6asxqo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-SNyo5sWSPtK_vKmkPMiHfQ-1; Thu, 13 Oct 2022 08:37:42 -0400
X-MC-Unique: SNyo5sWSPtK_vKmkPMiHfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y6-20020a056402358600b0045932521633so1416648edc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEjqbfSyEAtM0b3ifIeU6in3u3Xiw2yBc5yUjehkgcU=;
 b=uknj29piQJT8566ngWFpWahNyYz/p3Dj3iaPgf08K25mvVO4VpEvFF2ZKzunoLrxL3
 ZQ+DkCnpGWYd6G3ZgOnbs/IiR+oZDWjG/WUlI8VhTKzWaEvHhgsrDYh4zMC8ceB+ccOd
 am73eGkNM/XOsLMMTFdqjz52pghkRAgTssrHLaURDxLpLKqDZPTrfWopPMQQN0RsfMDy
 vfLcc2OUwIIOFq61lii1Fa0JbbqfktqTMiuTt42TC+j4KLS1rSnS0vtqbguM+N9lrJjR
 lw5H731lNmBK/njNQOc1A9FluuMEmcK06j3kZNoLRC/HmkfIMKmU/RvkrHb/S4qbcp+7
 C+ew==
X-Gm-Message-State: ACrzQf2+pCanEVMJmjIefKf/PryqJ84Gihr/itdxlDA+7B+VmRP2PtCR
 2zkGO4LkSzUEAl9zPp771hDX5GxdJ8kDKUSsLHiwPKjxmyl+vHTExEHBWmYDvn+x3NKvTEpFd5q
 KS0CJWOB4b7nIIf4zEhmJAG//Cq6wNyzILkR1DWr9ye+JmCtZhsfVJlFNCvdfejz0wx0=
X-Received: by 2002:a17:906:9b8b:b0:78d:8276:ff47 with SMTP id
 dd11-20020a1709069b8b00b0078d8276ff47mr24950863ejc.430.1665664660727; 
 Thu, 13 Oct 2022 05:37:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5acd8L6GHdtnc/C088ugsN+SoRH5OyCcjP0Msry3Xxpv0FGfG5nv1Q+cXehXMTT6DGo2eU+g==
X-Received: by 2002:a17:906:9b8b:b0:78d:8276:ff47 with SMTP id
 dd11-20020a1709069b8b00b0078d8276ff47mr24950843ejc.430.1665664660411; 
 Thu, 13 Oct 2022 05:37:40 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 lb5-20020a170907784500b0071cbc7487e1sm2968564ejc.69.2022.10.13.05.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 09/24] qcow2: add coroutine_fn annotation for indirect-called
 functions
Date: Thu, 13 Oct 2022 14:36:56 +0200
Message-Id: <20221013123711.620631-10-pbonzini@redhat.com>
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
 block/qcow2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index b57f7cc8ee..b7cac50eb3 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5287,8 +5287,8 @@ static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
     return pos;
 }
 
-static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
-                              int64_t pos)
+static coroutine_fn int qcow2_save_vmstate(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
@@ -5299,8 +5299,8 @@ static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
     return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
-static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
-                              int64_t pos)
+static coroutine_fn int qcow2_load_vmstate(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
 {
     int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
     if (offset < 0) {
-- 
2.37.3


