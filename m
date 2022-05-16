Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F630528421
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:26:38 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZo5-0004Mf-Mh
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8R-00018E-Bx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8P-0005dW-O7
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TnV0DctF1mNLxRYwoqBR3FQ0Y0vcC373ju/Bs6KrI4=;
 b=aHe/LZ9tjVWlt9+CCFAiN5BWaacmkTbYP8uXtlu5MRANVhWe6QEQG7/D8FbuI9raQW8atz
 uR4tGuzCZU8buNIyYIbLoIqM2dvOc1Z8+gJaYW6AVa4uliCksPQYiyjmVFfLnhEQjGOqwc
 Z7m808knGaaZlNC6vznQ4kr5mR7aJK4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-MkK_0d-ePAGEYd8ayifXoA-1; Mon, 16 May 2022 06:39:27 -0400
X-MC-Unique: MkK_0d-ePAGEYd8ayifXoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso10156913wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4TnV0DctF1mNLxRYwoqBR3FQ0Y0vcC373ju/Bs6KrI4=;
 b=VPc8bLERBxmuNNNTxkuDn8IzcmxNBg0OYEBRKDLlm7uqNAWDZ38+aS6CFVLHv6J6iY
 eUZWMV1urTI/gGNTjzqy39tUzTxBSmVzRCj2MOfJSwlzcWSbk67S2Qi6CsKLo+ZAXZZT
 Wbil6GLiEiyVSm1GwdpXl/lgWpztu24tr3FTy1wvosoZAuUgBOUn2Xj5uksH2RbF4HxL
 0iOHjgDYgwcK3ptI3FQVVOgHfvNtTyA/aePxofc+S9AkSe11TwLYdPyB7zO95XeZessl
 PtV/nPQD7E0tQbehCmPubyo7HUtleARbqnzka9JAPmjeLjx8jY5j4STxAJSxOp/SasqG
 5cxQ==
X-Gm-Message-State: AOAM532GB4fdAxcYbqiLBektUbHXtPD89wHI+h/MACp+ycVXB1OOu8Fz
 7fuFHaRKuYMx0L/yVOMhPM/3+Kpgx8vGiUqpX/EU6R09ST1hvGv6zOb8E35ngWtbi1LpLVyqY+A
 LGmsd4GaLHGWv6VnEMcDZTriXHbWJRFOPTgWAkSV2XFJfaEyFBOCeqmRzysPs
X-Received: by 2002:a05:6000:1563:b0:20c:5bcf:c531 with SMTP id
 3-20020a056000156300b0020c5bcfc531mr13918588wrz.592.1652697566568; 
 Mon, 16 May 2022 03:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyluWe4ZVyc3PdOeDOT1ZaXHdBk+lWsjfC2QLHfpJmBtGdjn/dUulCLdVaoATLTspLsvXfVOw==
X-Received: by 2002:a05:6000:1563:b0:20c:5bcf:c531 with SMTP id
 3-20020a056000156300b0020c5bcfc531mr13918570wrz.592.1652697566336; 
 Mon, 16 May 2022 03:39:26 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 v15-20020adf8b4f000000b0020d0c48d135sm1575535wra.15.2022.05.16.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:25 -0700 (PDT)
Date: Mon, 16 May 2022 06:39:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PULL 65/91] libvhost-user: expose vu_request_to_string
Message-ID: <20220516095448.507876-66-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

This is useful for more human readable debug messages in vhost-user
programs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220321153037.3622127-9-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.h | 9 +++++++++
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index cde9f07bb3..aea7ec5061 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -473,6 +473,15 @@ bool vu_init(VuDev *dev,
  */
 void vu_deinit(VuDev *dev);
 
+
+/**
+ * vu_request_to_string: return string for vhost message request
+ * @req: VhostUserMsg request
+ *
+ * Returns a const string, do not free.
+ */
+const char *vu_request_to_string(unsigned int req);
+
 /**
  * vu_dispatch:
  * @dev: a VuDev context
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d0041c864b..b4cc3c2d68 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -99,7 +99,7 @@ static inline bool vu_has_protocol_feature(VuDev *dev, unsigned int fbit)
     return has_feature(dev->protocol_features, fbit);
 }
 
-static const char *
+const char *
 vu_request_to_string(unsigned int req)
 {
 #define REQ(req) [req] = #req
-- 
MST


