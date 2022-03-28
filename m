Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F64E9ADC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:22:18 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrCC-0006Wc-5K
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:22:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYrAY-0005c5-M8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYrAU-0000RT-9J
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648480828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XqQhkl4K9hzigj8pIPh9KD+EcMNejVLlcJfRvHSvwE4=;
 b=WlqcMJz18N7urxeFVIylANxldbL+7bmLVYER3aPbh3Y6rV2lDOfoBR98cRSAPHfMzdRfTE
 bXUVCyq0T9AOPze1uANFfEeJ8HAYUQkF3hVWHRhwPnL947oCx7vJ4J9lM/sMnkK4Vspvxv
 vhZSkChWVKg4ppMRMCjt8UAEJJOyhAw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-Ndgnot8GNOKACKr5ED-5zQ-1; Mon, 28 Mar 2022 11:20:27 -0400
X-MC-Unique: Ndgnot8GNOKACKr5ED-5zQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 h11-20020ac87d4b000000b002e1c9a3ae51so12500489qtb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqQhkl4K9hzigj8pIPh9KD+EcMNejVLlcJfRvHSvwE4=;
 b=MLl9ZqyJS8FEyV1ztR0QzqoLfUjsqpqdyqFCBuGM2COeaGIg5OG9gwVYWodFavfwTS
 8hftKBIbPcfTFGrDdXziN4Kv7k2q4d1PIwU7zYhmv7rKV6CnLPx1BR/yLmhJqyBuADWp
 broxVVTBn7GyQTXhE809QxEjLi060nhwebvHzWsvoFZBOFtZ38dmamwIvVq9YtSmni6g
 oR2hbxveCriEGNq2R5FaKsaMbpkyORL4vvvCsG/oIjM9QTwxdKXmhlRRwsf4A4Jay4ho
 279uAqWCwu20aLFywnF4RcfEU2ghUzZg+PXYCgDpu24CMxFDATg5tm2oB+8YsFUe6/is
 1Y8g==
X-Gm-Message-State: AOAM531scb22XDlAV2K0fOLIoCDSWrUrrdxQM93crn1zqnlXtEpaxnNX
 h+6AYUn0uZ3F/9sAiLzOPnkb5NOMXqsSB3HbveqiUuL5Zfo8fTcDokbj9wH0EIIaYPrO6Fwx1F+
 w+jkDG2t/DVG3Kh2aN6NzLWL+e3cNNTV9nxUmZgPeT8PBBhe5YTsmYQ8AeXZ1vJhX1D4=
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id
 s19-20020a05622a179300b002e1ba410ed2mr22044778qtk.238.1648480826715; 
 Mon, 28 Mar 2022 08:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCxtEQ5rQE2Jyki1NBSuIViSi942YXAcGTBCOtSlRlbyaodoT/bHZqIs0YSpBSvpkN0t0F0A==
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id
 s19-20020a05622a179300b002e1ba410ed2mr22044750qtk.238.1648480826416; 
 Mon, 28 Mar 2022 08:20:26 -0700 (PDT)
Received: from step1.redhat.com (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 m1-20020ae9e001000000b0067d430bba8asm8013298qkk.88.2022.03.28.08.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 08:20:25 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-vdpa: fix typo in a comment
Date: Mon, 28 Mar 2022 17:20:22 +0200
Message-Id: <20220328152022.73245-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace vpda with vdpa.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3779..8adf7c0b92 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -299,7 +299,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     memory_region_unref(section->mr);
 }
 /*
- * IOTLB API is used by vhost-vpda which requires incremental updating
+ * IOTLB API is used by vhost-vdpa which requires incremental updating
  * of the mapping. So we can not use generic vhost memory listener which
  * depends on the addnop().
  */
-- 
2.35.1


