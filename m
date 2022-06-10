Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F15462A6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:40:37 +0200 (CEST)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzb88-0002jo-Vl
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYb-0002tp-IA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYY-0006Te-VE
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vNpi+lv9eUeu1Vt5Hknt5gq0K5cS6eTghz588WqWk28=;
 b=Wc6MuxFY66BX4Vu3FELj/pV0940INbkQ2a3ua7qSXj8EcRvv5vxy9ckzcPLjGMwD3yDVJZ
 EqZiXOtW5AWzWMsv91Sk8pngpkWUYaOSDx0BkJ+/8GNit/TnYimvyAHeSKIrzJHzqlTe/R
 eqwQLfRUXT6hd+toRiainET9uhfl/S8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59--C4eB1a2NiemjdzdB029TA-1; Fri, 10 Jun 2022 03:59:45 -0400
X-MC-Unique: -C4eB1a2NiemjdzdB029TA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c1d0400b0039c60535405so3370454wms.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vNpi+lv9eUeu1Vt5Hknt5gq0K5cS6eTghz588WqWk28=;
 b=lF28bypkTHaDtTjb4Wl8CEzX5F5/OlIBC+221m+BUF92MZ/37yyYvPd2m5sEJjx0Q1
 oXTfxFKvRZDehfYb6lmVbOK+lhjZlGWm04BPJKZRFRsq6yPyp1s04PVjVCfhD8Bl1627
 +gdyX3KnmrLaGNTXkyJMt8ldiCOW1wdOygaDIn+dpJUYRgZr6d0Hz3tg3K0+rRdFNL9F
 eV9dmGYCyHUy4SEXJUGuLl7QyL/S5Un2kPzyhLdTrxez4jSYNw4or/sPkHTGXKTngrZQ
 3sLgOOtioSKjQS1PkEvwK6FkMIHyiY2kEJ1fU0eyUHi9nMzqz5J5WZb7nX8hmYYdK9k9
 lwLg==
X-Gm-Message-State: AOAM532WVZ8o7qNnhB48Au+uQEWedM82nuS2WhpIprxCQxm9fkr8H/bz
 IV5IDafxaGUb0DvMa93Os85sCGVjzfduCT+IM8vXavry1UxeKfBset+rDnmQece3xUMsUqnjUmp
 UE0aCm5RKSKD2MSLRZwxvs6URSEtTNXlnddq2KYzamlrV9fTWiWatg6YrOvra
X-Received: by 2002:a5d:6091:0:b0:210:3e16:c600 with SMTP id
 w17-20020a5d6091000000b002103e16c600mr41220609wrt.456.1654847982696; 
 Fri, 10 Jun 2022 00:59:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRKVNJvAlea7XLwfLaJrLdAZG3ZxaT9XSHywd7uUyex/CiZhk2XehQ8wVCcjpiqu4GZVGXYg==
X-Received: by 2002:a5d:6091:0:b0:210:3e16:c600 with SMTP id
 w17-20020a5d6091000000b002103e16c600mr41220578wrt.456.1654847982395; 
 Fri, 10 Jun 2022 00:59:42 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b0039c6ce32a2dsm2153858wmq.33.2022.06.10.00.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:42 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Changpeng Liu <changpeng.liu@intel.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org
Subject: [PULL 53/54] hw/vhost-user-scsi|blk: set `supports_config` flag
 correctly
Message-ID: <20220610075631.367501-54-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Changpeng Liu <changpeng.liu@intel.com>

Currently vhost-user-scsi driver doesn't allow to change
the configuration space of virtio_scsi, while vhost-user-blk
support that, so here we set the flag in vhost-user-blk driver
and unset it in vhost-user-scsi.

Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
Message-Id: <20220525125540.50979-2-changpeng.liu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>
---
 hw/block/vhost-user-blk.c | 1 +
 hw/scsi/vhost-user-scsi.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 5dca4eab09..9117222456 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -337,6 +337,7 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
 
     vhost_dev_set_config_notifier(&s->dev, &blk_ops);
 
+    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_USER, 0,
                          errp);
     if (ret < 0) {
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 9be21d07ee..1b2f7eed98 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -121,7 +121,6 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.backend_features = 0;
     vqs = vsc->dev.vqs;
 
-    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
-- 
MST


