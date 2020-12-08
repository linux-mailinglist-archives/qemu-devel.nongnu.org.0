Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B272D3325
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:26:24 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjYz-0008Re-UI
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminQ-0007fI-FG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminM-0005p4-0o
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EjFghi3WS2AvoBsu5lJuVir5yWvf/AU0cavtmFT/jVA=;
 b=MBEJOv+7z4WTd+NQIaWRmadjMKQXfOXWrO86G+Banh+UdcRiExa8h3A7WiorLHu9FBz3BY
 1KuMHYgEjooB6MOMziPjj17Y57Z2mibr8bD0TqrrnbhpGew3TGhwuqger395t+3ZEzfZXz
 WYRzvq02axSoEeOw5wdsW6MgPBiCprI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-PHQV7t3SMAu9z9djwYJQxQ-1; Tue, 08 Dec 2020 14:37:05 -0500
X-MC-Unique: PHQV7t3SMAu9z9djwYJQxQ-1
Received: by mail-wr1-f70.google.com with SMTP id o12so1750792wrq.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EjFghi3WS2AvoBsu5lJuVir5yWvf/AU0cavtmFT/jVA=;
 b=jVjsj1gESkv9BgbxHGc27yw5p9g6qQYcyMOCSGX8a2ljan1SPQ0EVxbwr3McceZy5r
 7mTBsTl4GtBOWjV+8ZaToI8xCN72HbG2oRVaKXpgD8RxRRN6MldTrXmMzeTCNoGdrIQ1
 DarCg9/jUZQsBH3XxZKFx7h4cMN2o7333Dj1nmQYy5WvW2WZYrtpz6WglGVTG10jZCfj
 37P12lMBFHRf/BQpl+Eck/sR4CYA6pOejbK4eFLWc1gDSraDkVNSRzWIS/bH3iOTXIWi
 omC63y/FTuHiQLwdoEumPNcFet63x8W06T2IgIdAJFhJOjm7sdJ5suZkL+GU+qRIfvL0
 gu6A==
X-Gm-Message-State: AOAM530i8C6RnViLlKBVTPcYmZn7msZsdz5ldxjLFD8nvbt49sHLNyKc
 ot4yeAiX7gvDf63PH/A6SDtkUM/edJpdIsl+ZS7W4ZAF949p2Tgk3T30/mCnTjky/8v57s9ys05
 O2ZbC4j0u7HmUPBjqIOZ8LYvxLfsb38zWFe6d6z/gdUaJhakduxkyFIB415vo
X-Received: by 2002:adf:90d0:: with SMTP id i74mr27302874wri.288.1607456223914; 
 Tue, 08 Dec 2020 11:37:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs0QvlWo8v9D34EU1dvh2L7HZAhIZh/Jado+tnPzg/+zSz8oWHlh1byt7hFpa+Kh5gCEpKDg==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr27302862wri.288.1607456223756; 
 Tue, 08 Dec 2020 11:37:03 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i16sm2931777wrx.89.2020.12.08.11.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:03 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/66] contrib/vhost-user-input: avoid g_return_val_if() input
 validation
Message-ID: <20201208193307.646726-55-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-4-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-input/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
index 3ea840cf44..d2de47cee7 100644
--- a/contrib/vhost-user-input/main.c
+++ b/contrib/vhost-user-input/main.c
@@ -211,7 +211,9 @@ static int vi_get_config(VuDev *dev, uint8_t *config, uint32_t len)
 {
     VuInput *vi = container_of(dev, VuInput, dev.parent);
 
-    g_return_val_if_fail(len <= sizeof(*vi->sel_config), -1);
+    if (len > sizeof(*vi->sel_config)) {
+        return -1;
+    }
 
     if (vi->sel_config) {
         memcpy(config, vi->sel_config, len);
-- 
MST


