Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C15FA2D2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:44:27 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwpG-0005Fs-7j
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaI-0007nA-PJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaD-0006PP-In
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hp8rI8ket4FMKJXRLF3s2rnrP8cE0bwnLy3PoafAv4c=;
 b=DUYSiBStfh3SHd8+QzXKHxloKBX91ht9u/W3Qkm4qE6XLhj1jsrgeMC/L8XybIQES1OI11
 n0p4/Y3w1dxnITsRlTjMwRvdEiBo0SmwNNNz3Dap37foRUC4qFc0jKEpUaOZHC/UwBYSDw
 kvoBZhK+Hd8E4dcv26U/SrekHgu8j/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-9lUqtD4aMJusv94hmeqVxg-1; Mon, 10 Oct 2022 13:28:51 -0400
X-MC-Unique: 9lUqtD4aMJusv94hmeqVxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 t20-20020a7bc3d4000000b003c6bfea856aso477717wmj.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hp8rI8ket4FMKJXRLF3s2rnrP8cE0bwnLy3PoafAv4c=;
 b=ira3tzNat8Zs4DAr0+7q9yos3U0nMs5I2p1jhkR5RQQli42Km09jgiVGNgEPF2gj2K
 7lI7c16Pz+bMAsYDh6OnruzcciQEf7wcT1oa9KwxVLCR0t5AdZeOPKeMWWzftm5bYeOT
 h3vl3BPucpGPMg/WhCE1UPbRmzRyeS0dzs4M+Q/if7jHtxWBg9koDRGzs/m4qw5x8nrz
 wMW8zE2i0hdrfc8rmsoC74pQzarPDFiSihxpkRF0BxzAuK2+263v6UerXwWHgdNj6jfW
 UGifTbeUwc0DjhV+lWnj4CPoc8SGkA1whmDFQekLNMyt+0YKa9T5yCbvN1vQBRqX0sww
 fhUw==
X-Gm-Message-State: ACrzQf2C5UJJvvOz3vDXHIsjfU7UG8XKy5HZya8dNAPpVTNTKqOtj+NY
 TPeSDaox8ef5u/2t7XL0C59iitxaCY/D3Zv3gY9BxkUO7rRjQVpSd2z6eC5Rkgul6CuH2NhsGil
 KWTYiEijZ6u4MKg3JffX6t0g8ZfyCSZUswsMZwZPSoPurqIG97jKQs40NOiFz
X-Received: by 2002:a05:600c:46c6:b0:3b4:cad4:7d3e with SMTP id
 q6-20020a05600c46c600b003b4cad47d3emr20971370wmo.78.1665422930123; 
 Mon, 10 Oct 2022 10:28:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Dm9en/jjeHV2XipC0LWI1ovN9z1j/SBjB70ziUg/9GGOoxRQg6hpSSir7UZotVl4g1kACjw==
X-Received: by 2002:a05:600c:46c6:b0:3b4:cad4:7d3e with SMTP id
 q6-20020a05600c46c600b003b4cad47d3emr20971342wmo.78.1665422929768; 
 Mon, 10 Oct 2022 10:28:49 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003a1980d55c4sm914699wms.47.2022.10.10.10.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:28:49 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/55] include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
Message-ID: <20221010172813.204597-3-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When debugging a new vhost user you may be surprised to see
VHOST_USER_F_PROTOCOL getting squashed in the maze of
backend_features, acked_features and guest_features. Expand the
description here to help the next poor soul trying to work through
this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220802095010.3330793-6-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf6b..9bb2485415 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -24,7 +24,12 @@
 #include "qom/object.h"
 #include "hw/virtio/vhost.h"
 
-/* A guest should never accept this.  It implies negotiation is broken. */
+/*
+ * A guest should never accept this. It implies negotiation is broken
+ * between the driver frontend and the device. This bit is re-used for
+ * vhost-user to advertise VHOST_USER_F_PROTOCOL_FEATURES between QEMU
+ * and a vhost-user backend.
+ */
 #define VIRTIO_F_BAD_FEATURE		30
 
 #define VIRTIO_LEGACY_FEATURES ((0x1ULL << VIRTIO_F_BAD_FEATURE) | \
-- 
MST


