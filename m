Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACD43351C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:52:30 +0200 (CEST)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnfQ-00039b-K0
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnB4-0000k5-I6
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAz-0002dS-K7
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ovgGFzduCrnIeJvjYt5D1svpWOkcO96pV6pxkCNnsKE=;
 b=e8nIWM32dJSpndpAZYU0iurmtw8oMHL2bo6sHf7dFTlJsXBPJesdVAva08PGsHkBxG27cF
 WhMI55nzuSpawQbG53ScVtVdLOkK2qNOLiEvt/5Gz3F6cDdyZSmZY6wEk4FODzzskpDI3j
 zVtxZyqlfytvw1GgVt2NQbDMogRkjPE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-PcXqAgkiPV2Y6d7UeInKIA-1; Tue, 19 Oct 2021 07:20:53 -0400
X-MC-Unique: PcXqAgkiPV2Y6d7UeInKIA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so17255843edl.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ovgGFzduCrnIeJvjYt5D1svpWOkcO96pV6pxkCNnsKE=;
 b=7UH5ow2wDlixb8ogk7QSBsCAdKSq02emFVOaKxHJ3yJ5tSoCj8fWxQqZLLR5ohYayY
 8YkYo4IZy1Nkut7thhY9FZe3zCVHkik4hp4L6Zu0WEHvGfZKFFeiXiuUJKDRFJyqy4hC
 +4hmUd2j2gfDrkCwKkxcjwMOH8rrMqit8fKl3S/hnUThyDVrY8nCBwG0nFzuRan5u0Y5
 w0MyVbEdeJZPUtaA1nwyYIbJnghyKeCdj9lWxtLB0n+809q3hMYE1X0UuCtZyFUNZ7w8
 o7Rls2BgCut2h5YLCubh00yTtprwTMD4Fbx2v+NAPqjJF7ig+iHp2erINvLMKmzo8I/M
 Lw+g==
X-Gm-Message-State: AOAM53173+9R7Ax+uEP8bE++c5UP1EwgdqpbXA3/5BMlC0zgk3T7j9IO
 d42u7DdEw078+qxxziLFp8BxS3pjm+7opmmyN3IDyHt7c4kg2l7399sAyggCfuURyjYHyAUOE44
 shA6Y6ppHRvOI5uDdqXYrrRxXJOx1LE0z6Cy2xxeHGbNI5+frE5agapBdmcCV
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr51337789edd.129.1634642451436; 
 Tue, 19 Oct 2021 04:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyewMuWocjk0/FD+gTzUsib4hz1UpWS737TqpTyqr2q4vpzGyoKpnflaXRZWTGRWYgDbzmdUA==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr51337756edd.129.1634642451166; 
 Tue, 19 Oct 2021 04:20:51 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id l23sm10083531ejn.15.2021.10.19.04.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:50 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] docs: Add documentation for vhost based RNG
 implementation
Message-ID: <20211019111923.679826-25-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

Add description and example for the vhost-user based RNG implementation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20211012205904.4106769-4-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/system/device-emulation.rst       |  1 +
 docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 7afcfd8064..19944f526c 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -88,3 +88,4 @@ Emulated Devices
    devices/usb.rst
    devices/vhost-user.rst
    devices/virtio-pmem.rst
+   devices/vhost-user-rng.rst
diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
new file mode 100644
index 0000000000..a145d4105c
--- /dev/null
+++ b/docs/system/devices/vhost-user-rng.rst
@@ -0,0 +1,39 @@
+QEMU vhost-user-rng - RNG emulation
+===================================
+
+Background
+----------
+
+What follows builds on the material presented in vhost-user.rst - it should
+be reviewed before moving forward with the content in this file.
+
+Description
+-----------
+
+The vhost-user-rng device implementation was designed to work with a random
+number generator daemon such as the one found in the vhost-device crate of
+the rust-vmm project available on github [1].
+
+[1]. https://github.com/rust-vmm/vhost-device
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
MST


