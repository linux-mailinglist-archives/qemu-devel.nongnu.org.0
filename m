Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357C528449
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:36:52 +0200 (CEST)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZxz-0006Ps-4j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9h-0002tg-3v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9f-0005pO-Kw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GTH59JWKOeRS7zqFMCuFUwNlALdgVyHqFli+h6OjD8=;
 b=QJ7WhYSRLUiTCmdfk1PXx5c+0M7elk2G6PQPE9YWAcqKbvnQi2b9dDnc1AUGGHZ8xWCRP+
 05Kwj1fqQiCkQDHf7OM/663H8YIqmkGedg6moK5Qh+ZNTPZvJsbUz4ozK2orji4mpBe2iE
 eXdVxzNsWYOfR16hyZxbGFw/JsRNbHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-D1j8uFs1MaaUdWpWyDXeZw-1; Mon, 16 May 2022 06:40:45 -0400
X-MC-Unique: D1j8uFs1MaaUdWpWyDXeZw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso10141448wma.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0GTH59JWKOeRS7zqFMCuFUwNlALdgVyHqFli+h6OjD8=;
 b=QRlwrzLswi9lfRObRUNMKriIY3l5d7thqghSkhfwIXhjb8Nuq+Z+qcclHgQVpcKyH3
 vLzaAkpZQlTqyhLeyCFEuOx4F5aCEIH4Dw+1rpA5ODTuvTNrfD+21NjAEPZHb39f465V
 ixoOPrIZIPhfQAqZFHqwjUalP8Z6utzeOH2P5am/qDogNdZ7QY44S9mflQs35O7GZmhg
 HtLdLK0dT8+G3UDHl0634QMJw0uic20tf6Jd8oNjx8ETGMqAtAF4pnbt5VVfeM4Gso1j
 TgRoYOqwkwSDhUvp5/+BkYzAx2wG3084DiWeSH7/Qv9gSoL57m/QsKYnJ2O7z/qwTSCd
 HKKQ==
X-Gm-Message-State: AOAM5317d/CpoZ0NhtbB9n64wqRYfWzLL3Nl5XxFI8J4e7Q0UIzNXBeA
 TomHwby09DutRqefeJyBzcc1OANefAaU40P+i+RPZveeV9esfW5Qs4rISR4dKP58JNdDNzVgJsQ
 nLuAeSk+3VGs4XqfETSeA4yjjOEqASjWEtOas4E5gjH1XbLxLaIGhNtjee22R
X-Received: by 2002:a5d:4e8f:0:b0:20c:dc46:9848 with SMTP id
 e15-20020a5d4e8f000000b0020cdc469848mr13583950wru.268.1652697644493; 
 Mon, 16 May 2022 03:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc/xhaRW3axAjrEyuhmS0CCQ6efngXqTmYJvq05cOtprIhu0SlnBuJSo4IWzQ7gTg34dVTog==
X-Received: by 2002:a5d:4e8f:0:b0:20c:dc46:9848 with SMTP id
 e15-20020a5d4e8f000000b0020cdc469848mr13583933wru.268.1652697644218; 
 Mon, 16 May 2022 03:40:44 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r7-20020adfab47000000b0020d0a57af5esm2105107wrc.79.2022.05.16.03.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:43 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 87/91] vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
Message-ID: <20220516095448.507876-88-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-4-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47c03..df1e69ee72 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
MST


