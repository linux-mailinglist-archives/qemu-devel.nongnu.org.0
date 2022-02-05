Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A214AA57F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:58:50 +0100 (CET)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGALh-0002Vv-2u
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sU-IE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003JZ-CV
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eumjoy2b3JuV2CT6O4JwajdWx+yglD5Kzegw38RNJ0M=;
 b=b74TXLrXfK4Zs/Vi8/SMV7CksbpmSUEL8hzyTNnzzOAgmCTaz9gTaIKgyIiEFQA7oqVUmZ
 BIGKOwMrBJGfbBAxrHnReeIgFicRDwuCEoAz46XbkTq1NjFdewV5vmzjtiMbA9rTj0bCnN
 f4QNFMG/yyJcAVF5wtEFRNO5Ofqcpww=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-x9nzJLXiNhqPFWqR_FLteA-1; Fri, 04 Feb 2022 20:43:10 -0500
X-MC-Unique: x9nzJLXiNhqPFWqR_FLteA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso2803872wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Eumjoy2b3JuV2CT6O4JwajdWx+yglD5Kzegw38RNJ0M=;
 b=7w75A9e551FZ7EE2PvdqboEWJI1eCMgWafnj+y+YoqDL+LBGsLP3Zu0hprYhjoABeP
 oxa2Glty9u0eyi0023DnaeFRR26wMSSfiYyomznQVAmr2Ib1rtMr8PS+dsDZW2gLlbtE
 9hP1LURQYkdwMo8b9SNf5JmUKJKL2g3f45k7g/g0cyKFe/Vh02vOVwHLEIlz8FgX6x8M
 0SiINDM2Zrfcp2DtlOPLlMdgAiubmukpNxev6afbMjcWMRHScbicadY9eCIP1UrgP4oS
 4CHqetPXuBCp15FWxYKFM0qbNTLtEOZQSE7Qb7YqbfqH8y9UzLqt6hfWn6ATNAcPMoOC
 sjUQ==
X-Gm-Message-State: AOAM530p04qRywy0eg2/I91lEQusKdvGxeiM4SltSvS1zcVg0fAZh2av
 xaHAQiHExAl9Xto8rPCpA69aS3ZWq4feZN5wv+km8+FipIFg97Fg81JNHmZaVze8QK4uVSwoX10
 lPD/NeWmU2gh3JYpFQOb56Wo9jwS5AI5eRcMQG/5kg1orpGVSOXJwgj0Paq9t
X-Received: by 2002:a05:6000:85:: with SMTP id m5mr1232771wrx.99.1644025388945; 
 Fri, 04 Feb 2022 17:43:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGbaU4UhrYD6whkHRGVkUdkmilg8eJvQzyY20xB1EcB/3quOSh6tCkLvfPKTXcuxWGGUkxNg==
X-Received: by 2002:a05:6000:85:: with SMTP id m5mr1232750wrx.99.1644025388652; 
 Fri, 04 Feb 2022 17:43:08 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id bg23sm3307317wmb.5.2022.02.04.17.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:08 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/32] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Message-ID: <20220205014149.1189026-12-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We end up not closing the file descriptor, resulting in leaking one
file descriptor for each VHOST_USER_REM_MEM_REG message.

Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-5-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 7dd8e918b4..3f4d7221ca 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -868,6 +868,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         vu_panic(dev, "Specified region not found\n");
     }
 
+    close(vmsg->fds[0]);
+
     return true;
 }
 
-- 
MST


