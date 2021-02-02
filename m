Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1930C3A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:28:16 +0100 (CET)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xbD-00005N-8I
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM6-00080K-1v
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM3-0006jm-0n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b12CtRnbl7Nqs3gJjcv4tUQW0ofPPzvIUK5DBHZsRyc=;
 b=eDVlOONn72iuJY7YHtitsLmLREOfgOeaIuTMjVOGHaNYyKZedUgi5uV/Stx/9m3jzPfOaB
 y4IDZwGe/bjQXCNzEErFHW336C1t5K4MXOqjYfqzvUqxDXYfC/ISmY/L1edFMXKV1NLCZR
 JuAQ4E/FG7RUono/SE0hEbL+4Vb5tzc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-Zz3VB9WnOsWTQVAivQxd-A-1; Tue, 02 Feb 2021 10:12:31 -0500
X-MC-Unique: Zz3VB9WnOsWTQVAivQxd-A-1
Received: by mail-wm1-f69.google.com with SMTP id c189so1090844wma.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b12CtRnbl7Nqs3gJjcv4tUQW0ofPPzvIUK5DBHZsRyc=;
 b=j+Lt1XMPyS+EeMXUMQrmzJiLYr6HmLemaCQqfEk/wyA7Jdf2hJLWnfvS5bdQO8Uujm
 GMP9qPOm2Mv4m3bQttTT8/AcGWLwfK6Klz8W8xcP5FGOPt/rFU3iH3+8jHcYsiJ1oyqj
 0me28sI3pqC7oTWfxSKdli+0LDHT/iqydX2FYUQq4q1jlSBvYult9aMQvz6CwBCWWG+B
 a7XDDPzsA2MxWiJmIYK+lLaXft1LPplSr4FtwuRV/wG/CFtMMhWA3dDrn9xpzP8SuM2z
 7nSP7dARUI4i+sSUx9zec5fAHDGTJoB0Noyr7/m5zSG030PtT95Bc3uBIGdZpLy1SXAF
 UeDw==
X-Gm-Message-State: AOAM533H59kvCAzu2RGHm5RqV3hYv10OmkvkBu6Ibg3JusfQIKZedIHu
 aVF65urYKWoQBHB9XFtD/yrNrIV4VmHZnP9/5EUvy58E5+Z+CNSZCI0yWFzeVjLbPjz7fKXWnTF
 94K2QzfYQ2QXF9m/QPxq4jpH7FpjrujmQs+t9eMQnH+ZTI5XIy2uMjxWdAqvE
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr4098534wmk.72.1612278750219;
 Tue, 02 Feb 2021 07:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo4q8PHo5oqesNHzj9b4SLtgH/RZ/DgL0Ci8iL9eo4BcgZv3KA9ZgyNR/Ro51OXiv8n8Xx3w==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr4098506wmk.72.1612278749878;
 Tue, 02 Feb 2021 07:12:29 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id c9sm31635464wrw.76.2021.02.02.07.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:29 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210202151116.1573669-2-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-stable@nongnu.org,
 mdroth@linux.vnet.ibm.com, Jing Zhao <jinzhao@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
set to true by default.
To allow the migration, we set this property to false in the hw_compat,
but in the wrong place (hw_compat_4_1).

Since commit 9d7bd0826f was released with QEMU 5.0, we move
'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
will have the pre-patch behavior and the migration can work.

The issue was discovered with vhost-vsock device and 4.2 machine
type without running any kernel in the VM:
    $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
        -device vhost-vsock-pci,guest-cid=4 \
        -monitor stdio -incoming tcp:0:3333

    $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
        -device vhost-vsock-pci,guest-cid=3 \
        -monitor stdio
    (qemu) migrate -d tcp:0:3333

    # qemu-4.2 output
    qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
    qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
    qemu-system-x86_64: load of migration failed: No such file or directory

Reported-by: Jing Zhao <jinzhao@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
Cc: mdroth@linux.vnet.ibm.com
CC: qemu-stable@nongnu.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210108171252.209502-1-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index de3b8f1b31..5d6163ab70 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
     { "qxl", "revision", "4" },
     { "qxl-vga", "revision", "4" },
     { "fw_cfg", "acpi-mr-restore", "false" },
+    { "virtio-device", "use-disabled-flag", "false" },
 };
 const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
 
 GlobalProperty hw_compat_4_1[] = {
     { "virtio-pci", "x-pcie-flr-init", "off" },
-    { "virtio-device", "use-disabled-flag", "false" },
 };
 const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
 
-- 
MST


