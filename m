Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA592D49ED
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:15:57 +0100 (CET)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4wO-0008Je-0j
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vS-0004ew-Do
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vQ-0000Qi-Mf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EjFghi3WS2AvoBsu5lJuVir5yWvf/AU0cavtmFT/jVA=;
 b=FoGksh1PdNuczqayyKHtfqgyrCCdodZG9tbXX8FVYAgeNpAooW17BZg6JgBO4mHsMgvXqC
 A7f0//Q+uXDY2wlByz9RzdwG4ZFofdTEguJKAwYxvdgwv2BpjGPTEQjIJB6IKI1y1jz5iC
 kq4BVtx9bfWYAAxXawaUtMR5ziLd3Ig=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-qCQs6YokOueIaZyfBK1ClA-1; Wed, 09 Dec 2020 13:10:49 -0500
X-MC-Unique: qCQs6YokOueIaZyfBK1ClA-1
Received: by mail-wr1-f72.google.com with SMTP id x10so964066wrs.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EjFghi3WS2AvoBsu5lJuVir5yWvf/AU0cavtmFT/jVA=;
 b=KVSBy4lW8h8yhBELnD/3zy7FoUWuAXntfVGrVQYvV1exHn03VzcvGqA37sbiyXr38K
 LTmnR/VgalYO1VaRxSeHuEZ0OLh/oJCEsqUDCVJdd4J+PRZNOxgbErtK1Z/vaWIG5WlU
 wvqa+seM7DUyLwT4HsfMz4Ac45qB94jV8++KgA+9wIdfbKwRr5iE+R7gCKPpwP2g8I7l
 j2B5QDOelv2n/wuTw9atH6ODR/0VsevvoCwhRtFCZmXN/nf+N/17LwxtqTaL+kiCue8A
 MSfm8s50GBrYDXIb6TdA7MAXo7KwCcWtW8myiLzC/lDJANEZijxYlGKy8CALhROiJzLl
 531w==
X-Gm-Message-State: AOAM532PapkLDXv3cU9p4R2rVFDbLnf1oDNFcd62mNWIrjCAmTpR8X8Q
 6qgVaGoaeLQja7QeQurS9zD14zg0r9oiPmqzIpJGcscWx5cLBWVI/FOchgnAeGebqq+BaZzVtjW
 hnw/Y34ekkOES7PhLv92rF7EuuBUOnihcdjTNXid999y6zWT8/5f0/clvjz+M
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr3992046wme.63.1607537448236; 
 Wed, 09 Dec 2020 10:10:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsshw5avBF0qVQclh8VBW5VaDSADDr/Rl97wBnxSC0IOisKNxI8S29uQjkOpPYJF89PP2FPw==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr3992029wme.63.1607537448043; 
 Wed, 09 Dec 2020 10:10:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u10sm4679382wmd.43.2020.12.09.10.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:47 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 53/65] contrib/vhost-user-input: avoid g_return_val_if()
 input validation
Message-ID: <20201209180546.721296-54-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


