Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C41529331
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:53:05 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqieG-0004he-Rl
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjn-00028F-EG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjl-0006nH-Px
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4TnV0DctF1mNLxRYwoqBR3FQ0Y0vcC373ju/Bs6KrI4=;
 b=WbOW8g2P4l1DhF+eoFSKmk4fdXkXSLn8/C5ViIJvWY0jwRErhL34F9mREZAIPOUftXJkQn
 aIk2RRic5lJd6zy1N0asagZiE3JunsSCnkwkn6u9mhzd9uhEdj2nSuvMfb0YiK4I3X5x+F
 8JPGV22oh+nfrJVFROnsF2+UGvJogQc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-nrtLtnAoPeeCmLG_HKVUfA-1; Mon, 16 May 2022 16:54:40 -0400
X-MC-Unique: nrtLtnAoPeeCmLG_HKVUfA-1
Received: by mail-ed1-f70.google.com with SMTP id
 n12-20020aa7c44c000000b0042ab2159b3eso2544702edr.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4TnV0DctF1mNLxRYwoqBR3FQ0Y0vcC373ju/Bs6KrI4=;
 b=nVshTAWZJbPx145FkRnBV1tpPWy/D0vf5FATd6Vvwz+rKQKb2KYuyylS/m9Wm7AWf0
 4TcvSogB1rCClros+3LWoCrZq+np2Mq3RcIXBz8wdS6NFfms3rLeG2NaSeyp3WZM410h
 fR3+84hGQsyzzN19S/knB4Ft+Qiyhm9vGizNS5TuOTy/bz1pB/5v3JdeJagd+caMTaHU
 Ep0zTxi1clqsLqX4u2799GPOqubcUYQlz76xu4OF7PsJBKFtQ8pMCLWqkjvPLkKTZR0Z
 ak6+kqXF6t7at7VHrwr/B+uurAyUOiK6zvfxjwrQj3n6NNAsl+4Ng+ACkScnunwkAosG
 4aTg==
X-Gm-Message-State: AOAM532F33XQT/w5miGxnJkw2Xy2+bUyKOSWzeQgrnvFo55NP3G9O+so
 uh7zIqX5qNvplUGM2obNjglQS9Qnt4Oz98knzUVQFCbTQSINThIFdiTOYNG7EbWr4clnrbB8zeS
 ApaORnVVdFpkUiAUTkmmG/F7ViBIqeJYfM1pcAp18Q6YPDbxXRMgLO2QOnwl5
X-Received: by 2002:a17:906:c114:b0:6f5:db6f:71a1 with SMTP id
 do20-20020a170906c11400b006f5db6f71a1mr16617445ejc.338.1652734478576; 
 Mon, 16 May 2022 13:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB0HsOWOPa1EZfntyV0TV5+he7OxvnlNGG3k3ZVrBR9i7cCLGSfFROZrp/CIS/ZWWRMMSaAQ==
X-Received: by 2002:a17:906:c114:b0:6f5:db6f:71a1 with SMTP id
 do20-20020a170906c11400b006f5db6f71a1mr16617429ejc.338.1652734478346; 
 Mon, 16 May 2022 13:54:38 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gh24-20020a170906e09800b006f3ef214dc4sm178228ejb.42.2022.05.16.13.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:37 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL v2 65/86] libvhost-user: expose vu_request_to_string
Message-ID: <20220516204913.542894-66-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


