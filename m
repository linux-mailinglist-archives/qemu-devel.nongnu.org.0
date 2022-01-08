Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9D4880D0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:07:50 +0100 (CET)
Received: from localhost ([::1]:50006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6193-0006TP-Qn
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bh-0006TK-E3
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bf-0002uk-UT
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=Pym1BfDDKbwJrCY2jP95tMZv2k/36AaeQQVNt2JlkNVh5jbh4ARWEhJN1E0/ZkDJWfWrQp
 phfTahDb4I0MZCXcYPzGToNEj1bO3y83mzv3hsYfj3UXJDfciaHmsFTg234OFIpIz2YM8m
 rhJ3C9DSEPk3F2YbiU4BvoBClxbi9nc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-qRlydOy2MgqpnyZ79uyXDA-1; Fri, 07 Jan 2022 20:06:26 -0500
X-MC-Unique: qRlydOy2MgqpnyZ79uyXDA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m15-20020a05600c3b0f00b003465ede5e04so2503908wms.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=SrmPyO3o72gokhzrnc9iQ+P5Y0i8PCrys2qeBrmdKWPFXyV+NFu6fecQI0QYpLtnMt
 lFHHnzX7cczHAM0ppBmB09QAOSrphg7FCDjMDCwHcz7iy2buIoV3drRFkebKm8+aT0Qv
 f5EWddZaqHW+8Mo7jGGt0GLcZxR0osQp4tQrH7/Zqb7wIYWaE6xp6+nw/9e97Sq5U+lj
 qAw+3Fms0wCpu7quIpLmt4vU/+/er3Aly2+DRXJmhFCrzktZfFm9iDqr3ZXpP2gfmWVz
 /Z62PKbHaw0JPuicL7YHnIFmAq7NLgv459WLK75At3J18hnjyMgaiKY9jrdKKJrw9CDO
 eABA==
X-Gm-Message-State: AOAM532JVqBhc1ijqMUJmduEz6Q0dLOW+Tudu85aSBZnB5Kd8NrGPtKb
 Zw/j3+iyO5B2pDMHboVG9dV7fAG7cSOyy1vEDbV7MUR/fnVUYdi6EPJA8fdRy8WuZ/brlyeRVSQ
 5TUi+L6+KXssIJHH+Wwi6SVYS2t69zTGmimuDvl6ioX3mSXiQFlsA3MTNYsqk
X-Received: by 2002:a05:600c:3d0f:: with SMTP id
 bh15mr12987811wmb.27.1641603985172; 
 Fri, 07 Jan 2022 17:06:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywu17lMSpD9J9bOmD1iGymx0xZYq/1Mcvx/0kY6st6019EK6QY95xynk1GwFHwUXsfRlO1rQ==
X-Received: by 2002:a05:600c:3d0f:: with SMTP id
 bh15mr12987795wmb.27.1641603984921; 
 Fri, 07 Jan 2022 17:06:24 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id x20sm225711wmi.43.2022.01.07.17.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:24 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 51/55] hw/scsi/vhost-scsi: don't double close vhostfd on
 error
Message-ID: <20220108003423.15830-52-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

vhost_dev_init calls vhost_dev_cleanup on error, which closes vhostfd,
don't double close it.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129132358.1110372-2-d-tatianin@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index efb3e14d9e..778f43e4c1 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -222,6 +222,11 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vsc->dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhost_dev_init calls vhost_dev_cleanup on error, which closes
+         * vhostfd, don't double close it.
+         */
+        vhostfd = -1;
         goto free_vqs;
     }
 
@@ -242,7 +247,9 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     error_free(vsc->migration_blocker);
     virtio_scsi_common_unrealize(dev);
  close_fd:
-    close(vhostfd);
+    if (vhostfd >= 0) {
+        close(vhostfd);
+    }
     return;
 }
 
-- 
MST


