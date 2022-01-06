Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C534865D6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:11:07 +0100 (CET)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TTu-0000Pp-5I
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:11:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfM-0006O4-5X
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfK-00017N-Hy
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=gmDsEo3v+Gy4/9YIc888wjuZy/kOQt048Nv6g+U5j4KjtDl0kwjiNFDQispOsabKZMmbqb
 UrzulOFAEZV07KFHRmEtJyTqQFTp9o9LXCHYS2phBdeArNM+WrxjBNrVI19N2xhSEop+Lz
 hnjIdeml8rcF3kxcecmfV1Dl9+IsRFM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-Sk6p2j8lM-20DYa8KcUEwA-1; Thu, 06 Jan 2022 08:18:49 -0500
X-MC-Unique: Sk6p2j8lM-20DYa8KcUEwA-1
Received: by mail-ed1-f69.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so1912498edc.18
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tDeLlyz26ezikC22VaRSSlTH90Iv9SaCxPq3k3DQzw4=;
 b=zrhYOcmHXPP2ogPYa3myR2gkCAYbTAkalfA61DlidQ2EPG/aFyd3BQW8AlTHMOIZHG
 Zmv/XmW+VzPtW6P+x7GXdmcABc9eygJ9yv7ugzFb4AYZE3IQFtVXT7h1NswNJ4ABUcZQ
 OUkU6LFJgh+20O5Mzf5NnfjajqUDpdlXGw+ZLVWukA/dZkQwZqJbBsrZeQujwNWVfxNu
 dF9PKK5Qm3tOtIvitGaYZ2BCNCcUjrkEOjpaWZxRhrOVUN92/9aTX5sSH/O9Our9C/ol
 fX5T8ihxkkOZDUU9KFZ2jXqE54rDuetTgv7NlJJIdx1YYbdsuVSpIehbxrpwi5C8tRaq
 /1jQ==
X-Gm-Message-State: AOAM531KhbAWQvFuQQUuOyyb9IO//7zSLPQRXTedD5p+D/WXPtimGFeZ
 GZq8Gif3BRjUWqsPkO3+/5TmYbeBoz4xx1xnsiqzdPL+kO75D+1nBIRrfJlQICD+iKz3gbAltG2
 Lscm2Hr1ce+j+iIM6xxiyPvTa+gk1x7jjq6syKZ2z8pdw90BAfjMV58u1RHH/
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr46219824ejc.88.1641475127433; 
 Thu, 06 Jan 2022 05:18:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMmPAqtaWaWqFOf9Q1kCxF0boyOH1N8Vl2Tewwfoih+wHwU4eX+kcn52fYCipQuWvJrpO5Ug==
X-Received: by 2002:a17:906:c144:: with SMTP id
 dp4mr46219808ejc.88.1641475127199; 
 Thu, 06 Jan 2022 05:18:47 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id r17sm500271eje.15.2022.01.06.05.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:46 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/52] hw/scsi/vhost-scsi: don't double close vhostfd on error
Message-ID: <20220106131534.423671-52-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


