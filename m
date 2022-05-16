Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D898C528416
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:22:12 +0200 (CEST)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZjn-00064B-RX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8N-00017C-LB
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8L-0005d8-LY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TBSwgl4erp1QVjV6hUdkH53hYVNMfCm5ztMd9UNMOM=;
 b=IMpupAlJseCLmp7ciMqYBzEpZcgFfr0y7QGt5/+hlJdyekJ+eO7y/IrdsWZAlJi5T6/iyT
 ey21yNpDWQbRCT4U073RxdPjg362mtDgDIH52tK/BYyov+X7sHIO9mhDTN2zp4ikinuL3t
 xEgAYqWYt5CbtD9Qkagp2PQzRYVHTyY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-o3EmsFxFMxypjK0KWqklqQ-1; Mon, 16 May 2022 06:39:23 -0400
X-MC-Unique: o3EmsFxFMxypjK0KWqklqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso10139666wma.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6TBSwgl4erp1QVjV6hUdkH53hYVNMfCm5ztMd9UNMOM=;
 b=pbfk4tWT+YopzYcGsMGbEH6TkBFkp2EFKz/f9Jj/TfleidMSdk6+VCLWsh0jhIgF23
 4OmhsGkecdlgnN40/+KnI+xOdBFX+oKq4f35u3ELRQFO5FtoOEzu1GT1uZT/IbO9xrfG
 JlTA/yFeNmQomuuc8HIC4XG+EhyEoR9EB8bxuezMqlskeCBQXLKoW7+WpoE8iMucloNv
 Mv06G4KPruic7B+sYsF4jfNw+G0LOJg3ZuO3crSyI5g5q9+cqyBd9aj4vUVRVYKFoDvG
 c92SLfuCtcqsDuia9D2csg45OGkjjwAlRGZmWcOsD+w1dbG51ZVYV0Q7mRFk42DmwGH+
 AfqQ==
X-Gm-Message-State: AOAM531o3+duMEt7EcWRy9NNKSqcogFSOdfpbTqGV8CzOY2ng8QQLpFg
 6Epc/YCYfPPt1JR8fwheGqrbu+C3+OBPywlEo2rvlUJIpd6n3/eKg5Y09cnstED2CtPc+TNtl6x
 LzVAcqlcsi3Ui2Fj7uyeWBnV3lqaOnMhY7VAfOiB+KH5jT9OPGZQlNelCuz5z
X-Received: by 2002:adf:e842:0:b0:20d:db6:9e7 with SMTP id
 d2-20020adfe842000000b0020d0db609e7mr1554569wrn.276.1652697562495; 
 Mon, 16 May 2022 03:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZC6e96aih/Ihp+3HHwQGBGuWqyMzLpLhfCiZEVG3k9/ZYu2xOWBCIsadylUkrGo/i2mAlYA==
X-Received: by 2002:adf:e842:0:b0:20d:db6:9e7 with SMTP id
 d2-20020adfe842000000b0020d0db609e7mr1554551wrn.276.1652697562221; 
 Mon, 16 May 2022 03:39:22 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 u23-20020a05600c00d700b003942a244ec2sm9676936wmm.7.2022.05.16.03.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:21 -0700 (PDT)
Date: Mon, 16 May 2022 06:39:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jiang Liu <gerry@linux.alibaba.com>
Subject: [PULL 64/91] vhost-user.rst: add clarifying language about protocol
 negotiation
Message-ID: <20220516095448.507876-65-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Alex Bennée <alex.bennee@linaro.org>

Make the language about feature negotiation explicitly clear about the
handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:

  https://github.com/rust-vmm/vhost/pull/24

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jiang Liu <gerry@linux.alibaba.com>
Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-8-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 9159476678..73e710fe32 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -332,6 +332,18 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
+Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
+bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
+<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
+VIRTIO devices do not advertise this feature bit and therefore VIRTIO
+drivers cannot negotiate it.
+
+This reserved feature bit was reused by the vhost-user protocol to add
+vhost-user protocol feature negotiation in a backwards compatible
+fashion. Old vhost-user master and slave implementations continue to
+work even though they are not aware of vhost-user protocol feature
+negotiation.
+
 Ring states
 -----------
 
@@ -890,7 +902,8 @@ Front-end message types
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
   ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
@@ -906,7 +919,8 @@ Front-end message types
   Enable protocol features in the underlying vhost implementation.
 
   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-- 
MST


