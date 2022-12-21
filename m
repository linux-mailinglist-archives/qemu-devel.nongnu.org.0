Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED9653147
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymZ-0004rh-GD; Wed, 21 Dec 2022 08:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymX-0004mm-2G
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymV-0004BC-FU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBO1emW4emjWgJNkqbwYbIL4X85na4dvr4bspfy6T/o=;
 b=WvT6VAodGwGoKA3+uXeBRaSUTpeQCxEk4xhJ5cn2ba7Flq1z4vtdTVq1iBOYNbfm8dzwbS
 etC4S/zXWmM40EEUY+h8oAnHCTo5HRs/EEO+n4GYrvawdLFBxFaOPoZGILG/zoMvZHjo6U
 3D3LSVXGV8vPyKFkK08y7BvEZddRha8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-TB9L2p06NqWAV304EG8a_w-1; Wed, 21 Dec 2022 08:05:09 -0500
X-MC-Unique: TB9L2p06NqWAV304EG8a_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 125-20020a1c0283000000b003d1d8d7f266so7912318wmc.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aBO1emW4emjWgJNkqbwYbIL4X85na4dvr4bspfy6T/o=;
 b=ZdaxDPxXMEKMyvtAnz+ksuI1DZKO6tP8cPzwNzFbpg4LtzPz31sMqnq0YLUxJO0gzN
 u2gNs0YpVzs85ObRhSad+hhvTfYBxHjXfG7dHTcSLu9dQtse+ZqyPL3muv+UWBhMUR5J
 W5zpZWXdUTb6TvPTEMBrj8mWBjJh29I9k6jhPW/Wltum1Iy8LCQDZ/xtZRBuWgdWovVD
 UHvg7obhjBwEdOLj/VCa5mJzsRBumxRnLjARu8vXOi4kuFjT0GtffOuINW7Rl8BIjTX1
 5EFDmbakqVDSypRuwtVaRNGq3O4rdde94fXwbxstfniu8vTe3h0oqU2y8h04dvYj/U7Y
 Olvw==
X-Gm-Message-State: AFqh2kpWq4VS/7gP/ND5bMnBX8aJ4jfPuyf2SxsQ3aN4r9XuYZ+W5VAU
 Q07h5DmKIxr0KeciDEuWusDDZwDE3Pn+yKsPeLGEIa2RtfqOgX0ieRXcFMgwNaVVKU3dLE6MzRq
 ajJHmPnPRvtp8ZmvFawG9wN2aiopV1hbRM4Gbx6A8eOfuH71uRB/L25vZumVV
X-Received: by 2002:adf:ce82:0:b0:25d:d262:5f4 with SMTP id
 r2-20020adfce82000000b0025dd26205f4mr1364332wrn.63.1671627907349; 
 Wed, 21 Dec 2022 05:05:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvveeqmtz5KYemCYJqbOGuH6b6Q02EKsLIrTlR4LOZ57/eDU+gOCXbrZtv0CezwxAIalNvbQA==
X-Received: by 2002:adf:ce82:0:b0:25d:d262:5f4 with SMTP id
 r2-20020adfce82000000b0025dd26205f4mr1364310wrn.63.1671627907076; 
 Wed, 21 Dec 2022 05:05:07 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 ay8-20020a5d6f08000000b00241b5af8697sm15241705wrb.85.2022.12.21.05.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:06 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 12/41] vdpa: use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
Message-ID: <20221221130339.1234592-13-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

This function used to trust in v->shadow_vqs != NULL to know if it must
start svq or not.

This is not going to be valid anymore, as qemu is going to allocate svq
array unconditionally (but it will only start them conditionally).

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bc1c79b325..220a9a2e6e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1029,7 +1029,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
     Error *err = NULL;
     unsigned i;
 
-    if (!v->shadow_vqs) {
+    if (!v->shadow_vqs_enabled) {
         return true;
     }
 
@@ -1082,7 +1082,7 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    if (!v->shadow_vqs) {
+    if (!v->shadow_vqs_enabled) {
         return;
     }
 
-- 
MST


