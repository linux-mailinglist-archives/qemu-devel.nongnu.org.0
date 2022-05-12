Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F585525451
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:59:56 +0200 (CEST)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD6R-00014K-BC
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZh-0005Bb-LP
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZf-0005GM-Ub
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcyukTf9QrZXMp/VVcVEKKYBOTsXARL2jyIP6YpMfrY=;
 b=XCHuKC4S6tVOUx6ea8wktpGJuj7qvSPpo1ZF+JRaVx9MYc06AlZdSWl+4CFolfVIJlmD6t
 tQq8GBnlh/TpZkjSkKgEdgRGxkLf+jL5tgv7dKOiRXskIosrLREbxjGBgrDhq94CisEMTn
 NWfMI6jgucgE5Gn4+7ffNcgtmW829aU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-1KCYVcMCM8yuhXQfCq8FhQ-1; Thu, 12 May 2022 13:26:00 -0400
X-MC-Unique: 1KCYVcMCM8yuhXQfCq8FhQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qw30-20020a1709066a1e00b006f45e7f44b0so3177782ejc.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NcyukTf9QrZXMp/VVcVEKKYBOTsXARL2jyIP6YpMfrY=;
 b=k5iWkpebrCRaP7BXxGVJauL2lF3Kl7msMFZhnsowGn3puLDatYD9WHeTmXbMpYfZXT
 oKNkzERcR2A8F9KWHAQhPTnnf+UC6nBYNYEdKy83pSCP7Q/xmO+qvEJXyOCee5u55EL3
 K1BG1fushJlTmouwSGLCm77SlXU5laiGm5/9Q21MSqXFH8FECJsJNXuJNteA+Defqtle
 v8f6M7qUcTGJ5bEL3rgmVAQOALQz9hm+ih9CMLDl3cCnzZRbJlzhepKAw1uyy79Ho9ov
 /O8pFNB9eSp7TgQmARo3KaSIK4KL50Pw7ku6vXe4OBvzBCCU8pMdy+tubnJnwBNGlhzu
 ReKA==
X-Gm-Message-State: AOAM533pH9cSm7T1KgaEESaE+1laGf8QuzFZpvurRJW2p9fMRSEPrrX4
 w6TyAUjZSkAWhBS111rhO0Wq03DD7S75ZLp505uylDDPBi/ZhftS/p3die2eqGLfTX7IgbDBD2w
 81j3Uxfr+2xsMhKHjrrtAAwT1uxmw6kA3S9iffOArG8OmtyOLlR5SxapPEX2DNRcqAuQ=
X-Received: by 2002:a17:906:974c:b0:6fa:8c68:62a8 with SMTP id
 o12-20020a170906974c00b006fa8c6862a8mr880095ejy.293.1652376358533; 
 Thu, 12 May 2022 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbKbED0gi1YVf7xOk3C2DHqGnLXFanbcz2e8928vW1CWjlOynGNGbILHyB7ZW8ghm9egIzgA==
X-Received: by 2002:a17:906:974c:b0:6fa:8c68:62a8 with SMTP id
 o12-20020a170906974c00b006fa8c6862a8mr880077ejy.293.1652376358223; 
 Thu, 12 May 2022 10:25:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a50e785000000b0042a2e5e1a7dsm1576704edn.37.2022.05.12.10.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Dov Murik <dovmurik@linux.ibm.com>
Subject: [PULL 24/27] vhost-backend: do not depend on CONFIG_VHOST_VSOCK
Date: Thu, 12 May 2022 19:25:02 +0200
Message-Id: <20220512172505.1065394-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The vsock callbacks .vhost_vsock_set_guest_cid and
.vhost_vsock_set_running are the only ones to be conditional
on #ifdef CONFIG_VHOST_VSOCK.  This is different from any other
device-dependent callbacks like .vhost_scsi_set_endpoint, and it
also broke when CONFIG_VHOST_VSOCK was changed to a per-target
symbol.

It would be possible to also use the CONFIG_DEVICES include, but
really there is no reason for most virtio files to be per-target
so just remove the #ifdef to fix the issue.

Reported-by: Dov Murik <dovmurik@linux.ibm.com>
Fixes: 9972ae314f ("build: move vhost-vsock configuration to Kconfig")
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/vhost-backend.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index e409a865ae..4de8b6b3b0 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -203,7 +203,6 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
     return idx - dev->vq_index;
 }
 
-#ifdef CONFIG_VHOST_VSOCK
 static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
                                             uint64_t guest_cid)
 {
@@ -214,7 +213,6 @@ static int vhost_kernel_vsock_set_running(struct vhost_dev *dev, int start)
 {
     return vhost_kernel_call(dev, VHOST_VSOCK_SET_RUNNING, &start);
 }
-#endif /* CONFIG_VHOST_VSOCK */
 
 static void vhost_kernel_iotlb_read(void *opaque)
 {
@@ -319,10 +317,8 @@ const VhostOps kernel_ops = {
         .vhost_set_owner = vhost_kernel_set_owner,
         .vhost_reset_device = vhost_kernel_reset_device,
         .vhost_get_vq_index = vhost_kernel_get_vq_index,
-#ifdef CONFIG_VHOST_VSOCK
         .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
-#endif /* CONFIG_VHOST_VSOCK */
         .vhost_set_iotlb_callback = vhost_kernel_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_kernel_send_device_iotlb_msg,
 };
-- 
2.36.0


