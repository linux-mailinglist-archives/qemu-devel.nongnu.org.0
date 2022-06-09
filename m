Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0B9544995
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:59:42 +0200 (CEST)
Received: from localhost ([::1]:51060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFt7-0000UI-3F
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGV-0006AN-Ul
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGT-0007NU-5G
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AjyGuQezeKikgDuRN2R4hv5pDYm8zS82pA6jrH0p6tQ=;
 b=Yovj9Ek1zpEgY1LGvbJ4Rl5PyZi6DDuRcub9GJiPT1jiHOjc5+3UU1uA8T3GXYVEW8PoRh
 4jGRk4RpS0l7qPS32SS8yioxRcz3L4z6fKOzZeKaRHj5Fc1jv2Xt0jjMux45ne0rz42nLO
 2AKlnbDN/+5eSHoFoe3eWMJzin4ajw0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-o1dGL8ltPxqMo_06wy2Pzw-1; Thu, 09 Jun 2022 05:15:38 -0400
X-MC-Unique: o1dGL8ltPxqMo_06wy2Pzw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i20-20020a50fd14000000b0042dd305d0f7so16721724eds.18
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjyGuQezeKikgDuRN2R4hv5pDYm8zS82pA6jrH0p6tQ=;
 b=JmRozsePTtAowAjvbu2yXQDyGb9MWgtUzAnfJ9Y1/MlrKDhlTlK4yS1d+/AIPuczBK
 WdYKod56tjCwpoqfzI298L4HUWiXFGqdBu1bJkqIhXbnVB4te/8HY96hmBO3a8Bm/XCb
 +g3jQZV71TzhT5LM3Tzs2kIQOabb0FvwHN5iGjkDjg09R6gcKkmzzE14nk+Ceeoahpas
 KMy1IeEeM0L5H+kahOV9Nxa3pJOicWA6XXuLF5o8ONWb1h0wXzAqHXvJIk2jTaatYxN4
 iz7TzUPmxRTEgDeNIxaZ+ZqhxhovgGVFMF3SJcjmFubev+GuNg6nMLa3T7eIlyc7jp6K
 mQWg==
X-Gm-Message-State: AOAM531UOCtJwThqum2yJNLmvyrsbkx5AJYDzQpk+Nd52Ns2k8kj1iRW
 SjWLio9bz5zXAqQ4xzSqhIXbhvTEAFz5kMcak8exc1LwsIt4hNnRgrpH7g8eKF7gz3+cZvYVFK7
 8H9utNcc9kAregSZlVyHiKPCdVpeRgdzeuSO3zDqUOtEh5cGYX5wVoQ4IiPR0qIuw2sw=
X-Received: by 2002:a17:907:629a:b0:6ff:8cd8:2192 with SMTP id
 nd26-20020a170907629a00b006ff8cd82192mr34402532ejc.30.1654766136919; 
 Thu, 09 Jun 2022 02:15:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO9qyhWGqwP6wtM3gfCNFy2MxynIbg++ZtZrs0gklXYwq/p0+84S962s+gL4l5GOMsQF9lHA==
X-Received: by 2002:a17:907:629a:b0:6ff:8cd8:2192 with SMTP id
 nd26-20020a170907629a00b006ff8cd82192mr34402512ejc.30.1654766136653; 
 Thu, 09 Jun 2022 02:15:36 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bf8-20020a170906c50800b00705cd37fd5asm10244914ejb.72.2022.06.09.02.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:15:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	thuth@redhat.com
Subject: [PATCH 0/4] virtio: various cleanups to reset code
Date: Thu,  9 Jun 2022 11:15:30 +0200
Message-Id: <20220609091534.1416909-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Patches 1, 3 and 4 are cleanups with no functional changes (intended, at
least).  Patch 2 is a small fix to legacy virtio-mmio reset, whose
behavior differed slightly compared to zeroing the status of the device.

Paolo

Paolo Bonzini (4):
  s390x: simplify virtio_ccw_reset_virtio
  virtio-mmio: stop ioeventfd on legacy reset
  virtio: stop ioeventfd on reset
  virtio-mmio: cleanup reset

 hw/s390x/virtio-ccw.c   | 12 +++++-------
 hw/virtio/virtio-bus.c  |  1 +
 hw/virtio/virtio-mmio.c | 18 ++++++++----------
 hw/virtio/virtio-pci.c  |  1 -
 4 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.36.1


