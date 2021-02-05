Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95D310CE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:06:42 +0100 (CET)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82gz-0005YO-Ax
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eC-0003db-7b
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82e9-0002tC-Id
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b12CtRnbl7Nqs3gJjcv4tUQW0ofPPzvIUK5DBHZsRyc=;
 b=Luwo2wU6YugSEDu5VUVxLRJES38giuSlP9T9797WGQITS+RviPjY2cQnEOjSr7Orbk8o8r
 f7759M+OtnoDFiOSghxUAKEe3y7v+9OBLs4UOcsQyQVAXaUTDXUkPzKOzBIyMI41r4uvl4
 fr5BAnBQnp2p5WOWJuFb9poqgqBC7qk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-PNkEbhexNBiIlQmrRXdLuQ-1; Fri, 05 Feb 2021 10:03:42 -0500
X-MC-Unique: PNkEbhexNBiIlQmrRXdLuQ-1
Received: by mail-ed1-f69.google.com with SMTP id bd22so7090684edb.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b12CtRnbl7Nqs3gJjcv4tUQW0ofPPzvIUK5DBHZsRyc=;
 b=tK90aGtHMYJTHHLprGvOSStAsCXZEuVNgbH3E/fwsUzTYzbL74QtpuiHGJcFzk3sdh
 lX4NubWS18MtOvYMOFskjW5VT1tbBMNLOkEDsBPAbVguZJbHa5r1NITSo74nqZqWdlSQ
 5XefvPgA88kdyElHU1qxcOA3D59nv14GzhJmNw21qyaiyRD64UueGD/7sgRYYbLxQbra
 pht63v6ZyTJtwi4eJ+jeyBNQAed8R8N0Kb8yIxHY1eTReKXcS+o4MmjZ4V2pgV4xB5AT
 yFw7L0lOraCSpH9Qw1NWYD7KkVEjhn0MunqzmMwJvhUosUAccZ/xeA6RYQH9PfYhphNV
 n0zQ==
X-Gm-Message-State: AOAM531qej4yHh6fEjapt8qhH+S6Fux4obMhNGpIviBSXyPj+k65Uzqe
 0iiB92hV8FeCiAWCjz3CQtQSr9NZqKoK7vxG/T/9kLjz7pZHa0lxKjFgiEKTlyqMMH+AU3bhlf0
 51YCXuqAm/pMGqe9cyUOuKIch5Vne6bO0H9/9UDmHDPSJQgHhSYdjop6oqeFD
X-Received: by 2002:a50:9310:: with SMTP id m16mr3955883eda.94.1612537421179; 
 Fri, 05 Feb 2021 07:03:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnY4WJainvY5Z3F+kZcKRpf2oQgQrkf+/fKQ61K9AHz9lX53ouYWk+PtCIqmKkVI+ykjElzg==
X-Received: by 2002:a50:9310:: with SMTP id m16mr3955840eda.94.1612537420784; 
 Fri, 05 Feb 2021 07:03:40 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id v20sm4115787edt.3.2021.02.05.07.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:40 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/16] virtio: move 'use-disabled-flag' property to
 hw_compat_4_2
Message-ID: <20210205150135.94643-4-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


