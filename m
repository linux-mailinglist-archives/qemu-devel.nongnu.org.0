Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A054EAEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:02:59 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZCR0-0006AM-6d
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:02:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOi-0004HG-Sa
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:38 -0400
Received: from [2a00:1450:4864:20::532] (port=37431
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZCOh-0001bd-AY
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:00:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id b15so20831307edn.4
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xq+csYMPSeBAQWu8555fZDjmWrN7KhSCIKwBmvXE5Ro=;
 b=kRg+fUcakYqrxPN7maTZ//0sA9zhTrDvAas0PaBDNAl0QWyL6utLCDULTeZJDUoXdU
 4gKFS7vgVLtqsJ4nEc6iBa55l55+rn8a0bm5hVv4hFP9QM764B2g5Rebud59QfP7RwBg
 4sIyuOp+x4ygFiwSKbwj3hmoKu6mnRymt6CCbsUY8LDOjjci7hW6f5386S+zXl/gNXHM
 7m+SBewc6abR+2sIGWMgqPRGy/5YVyelQbW3Q6Vf3svhPE8HTATqazRpXUOAofymsAF/
 csMsFDPpr1vjdKQHbGhOPHU0blkxuRBAWKCf3xzNH2iORQOWCaKOiZroquws+wU5FkSg
 L+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xq+csYMPSeBAQWu8555fZDjmWrN7KhSCIKwBmvXE5Ro=;
 b=QjilwIUiKxSSl5/prCL2+xDkraWT47bNfB2i6QzxQ92rhu4tydl7nGjBC9ZWuaOhQx
 TO7vVfVRueaQxLJ4kQ26f9AqwVun4cIFw6d5GqZtwYxjx0xLwmlKLDjtGPeVwwBclTIa
 i6vyG3LO3X2d9tyR0NeAniQbGIOxqykE+tlmHoDsMakexdUbV/dFCxJzsd68UydOBMoO
 CJ8cyvDS124h+bJtePX0tWWt+Y6msb+Ni+ce3zVCPs8dHmKFGd4kib5dU1r5beuYpvBB
 LoWix8Q9akQaHL6/T1kBtVbr0X19Lr0qO1xnf+bfmuB9WXrUBRpE0gqwJzYXQYakIEcH
 O4sw==
X-Gm-Message-State: AOAM533aFG44UGrk0ZyINwnMxiVljxzVHpUk5MELQFVO5vukwYsDUPv2
 6W8xMb0XT6tG4yrEc0fZ1IF4TwVNX4I=
X-Google-Smtp-Source: ABdhPJy8I01bl2GQxG+j7VcumQUkibhnjH6I4O3izbmZza3qxwDbFgEpLXhlt1wTIOmw57QGPay/CQ==
X-Received: by 2002:a05:6402:3548:b0:419:6a02:c5cd with SMTP id
 f8-20020a056402354800b004196a02c5cdmr4741803edd.290.1648562431670; 
 Tue, 29 Mar 2022 07:00:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b006a625c583b9sm7117506ejd.155.2022.03.29.07.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:00:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] virtio: fix --enable-vhost-user build on non-Linux
Date: Tue, 29 Mar 2022 16:00:26 +0200
Message-Id: <20220329140027.869953-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329140027.869953-1-pbonzini@redhat.com>
References: <20220329140027.869953-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-shadow-virtqueue.c build requires include files from
linux-headers/, so it cannot be built on non-Linux systems.
Fortunately it is only needed by vhost-vdpa, so move it there.

Acked-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 6047670804..67dc77e00f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,9 +11,9 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
+virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
-- 
2.35.1



