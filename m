Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC8514FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:37:19 +0200 (CEST)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSgI-0007r3-RP
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSw-0002Ka-I8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSu-0006AM-Sz
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bv19so16100074ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVIHrWb0QymKV8unddHVw3luRnSSMYN+wzhu25/ExSM=;
 b=e6tWqpywTB0lCofPQx54gY+0ZpKz5nCs9+lP/lg9UpPuO4LuvlV2HujBU4kJPS0Jhr
 PTMryi2jPtcFoIh3Yu6c3Wi84buwXOika4wG/KlLyaUvrKy4tXXkGmtPhSMymXHdHTsY
 lh/zJkkdB10bW2UFmcFCPME+SGK7ICrRYyv/zL1g2wRHOqVUu3hVg5Id032qCZmPMuKI
 YoFXz+2s5PutQ9qK+D+W7tVAhyXhwCjcGDIuR6Wo1smqPRR6IFt3omztIRUJnhGe8nmO
 sAZiSw3NYKp+YExynfPt+ReMVq/0zTP22nWKswKV8hNpyE4qSLMryK1+ANC2zKXsXmYv
 d6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pVIHrWb0QymKV8unddHVw3luRnSSMYN+wzhu25/ExSM=;
 b=I4O92HnzgFuM/1bON3X8VdTIWxzrYoBVtMDD7P037kfG8S5UbLLUFy4RgUDbN3/rR7
 Nw0b5aKhScsO8CAiaBNm/S+Ftd1jAoPV9qT6pm1XiWcuiPVjkTFTuFjZp1a0pSx5a2MS
 GzhY0UvGyvRGCpt4wAb+jIaAiD3A11F5iQq3li9vnHwdbLXXrbtGx7WMvTdRAMSBssQ3
 dqCD3FMuLHvJkdPzazCFp61ki7SN5XlzH/BbgHZ615eIOpUUoHmdiwhvjfKmGThMFzBf
 D/D6ItInr9CvTva7m4zgprx1htn12Bynsq1Uj5atK4OL39610uavzWZfzBqJu6nQLCMk
 g86A==
X-Gm-Message-State: AOAM533/mmTMMm9wMZG1d6ktmX/RITIYS9DQNMJDbFcV5pwQMsC6prO9
 HgPhvLTkxYYuYe7fwfxf4lAnLBYoGqc56Q==
X-Google-Smtp-Source: ABdhPJxEH+HV6h1Tx/aTRSjOCR3pc/rW7piCfdL7IWAUoMI/KUFOpHk2uLtsxzunrDoroYiO7u5o2w==
X-Received: by 2002:a17:906:594a:b0:6f3:d242:8d64 with SMTP id
 g10-20020a170906594a00b006f3d2428d64mr11173342ejr.34.1651245807584; 
 Fri, 29 Apr 2022 08:23:27 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] meson,
 virtio: place all virtio-pci devices under virtio_pci_ss
Date: Fri, 29 Apr 2022 17:23:04 +0200
Message-Id: <20220429152312.335715-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since a sourceset already exists for this, avoid unnecessary repeat
of CONFIG_VIRTIO_PCI.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/meson.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 67dc77e00f..f371404b04 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -16,9 +16,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
-virtio_ss.add(when: ['CONFIG_VHOST_USER_FS', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-fs-pci.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
@@ -26,17 +24,20 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
-virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
-virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
+virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
+
+virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng-pci.c'))
-- 
2.35.1



