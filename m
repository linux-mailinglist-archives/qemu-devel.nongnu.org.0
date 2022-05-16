Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB152838E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:53:27 +0200 (CEST)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZHy-0001Vn-Tf
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY85-00012b-5v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY83-0005Zg-Ha
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCZfFEZiDEm4ScBYpz8PskytD5Sf+SXWO7kU1IanCUs=;
 b=RFDrOxEhSWYuQKVwH9ZoYuSlNpfez+G6XgEpaM+u6uDbdA8TOLaFB4IvNXYtMvYg0ri+1q
 3uXv1E8iV+hHPoRIFFRqHyMDx+uy7dTe72EHhqTvtgSFTHvJa3d/rvxjOJ23fe83iCITtb
 +Kw3EIjLMVSBi507Cg1fRma7Nthh8TA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-mxfBNJxxM_W05RWZnwDlKw-1; Mon, 16 May 2022 06:39:02 -0400
X-MC-Unique: mxfBNJxxM_W05RWZnwDlKw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so6563679wmb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UCZfFEZiDEm4ScBYpz8PskytD5Sf+SXWO7kU1IanCUs=;
 b=kRXhEPxyZ+pmxbDzq9WQOZ6vLu+4UYF0nV+gg2/oU5Q1H51aB74f6hHBIUtn3urPgK
 rM9e8psnHWC8sme/8TlKI9bBpNDMrs5pG2x1DhKL+2VCETGOgbIS7KytyC1HUGsMqzKa
 CoBjthm9v5QMZRpsZrsDMQPhCo6NI0OBY7HQ2/bfoIqvQSt4qgBnDdjokJ6rfrrYQwlX
 Q4PmGlDXwyMcYcqKGXgSXuVeveYWiA3TG3vKA1G3jdH2gHhTBSlxMiDnsu5gpqS3fDx1
 BV01il4ZrcXyC/2yu65AABrRlOAHSEr6xEDyXbcMpHYru4Dio91fY92adMu5paSmNp2A
 smyg==
X-Gm-Message-State: AOAM533zPjPfOBuElqHRgOJ1cnFqGo/lKnpwuhAr2pXkcy4J0zGQ0nw1
 eVOczA0Vz8zSWV4fn1OAmnfdSTePlhLAPaLnYDXHZhBk4RnQ2fF+1Dci/MZOLTrgDu02Qkys9gz
 DrGHtD6CwMtBrvrVu4p77RRnAebKCGZvoojMDxLiEzeu6cjINdpGEn39MzXMf
X-Received: by 2002:a05:6000:144a:b0:20c:6b73:804 with SMTP id
 v10-20020a056000144a00b0020c6b730804mr14178245wrx.88.1652697541211; 
 Mon, 16 May 2022 03:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQL2UWlaBMYdN8vkgQKZzJK6j2xB4djo8MhaReEaKleRYVFAaPpKnjhMhis90hshwdW+rICA==
X-Received: by 2002:a05:6000:144a:b0:20c:6b73:804 with SMTP id
 v10-20020a056000144a00b0020c6b730804mr14178221wrx.88.1652697540918; 
 Mon, 16 May 2022 03:39:00 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 t11-20020adfba4b000000b0020d0351dbb6sm4819616wrg.80.2022.05.16.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:00 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Maximets <i.maximets@ovn.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 57/91] vhost_net: Print feature masks in hex
Message-ID: <20220516095448.507876-58-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Ilya Maximets <i.maximets@ovn.org>

"0x200000000" is much more readable than "8589934592".
The change saves one step (conversion) while debugging.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
Message-Id: <20220318140440.596019-1-i.maximets@ovn.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/vhost_net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..df0f050548 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -201,7 +201,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
             net->dev.features &= ~(1ULL << VIRTIO_NET_F_MRG_RXBUF);
         }
         if (~net->dev.features & net->dev.backend_features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                    " for backend\n",
                    (uint64_t)(~net->dev.features & net->dev.backend_features));
             goto fail;
@@ -213,7 +213,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
     if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
         features = vhost_user_get_acked_features(net->nc);
         if (~net->dev.features & features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                     " for backend\n",
                     (uint64_t)(~net->dev.features & features));
             goto fail;
-- 
MST


