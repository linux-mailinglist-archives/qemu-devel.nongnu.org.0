Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BB3BEA7C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Eg-0007Pu-KU
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195d-00028v-6F
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195b-0006oo-M7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5H0fdYuijAXulte1JclETA5lCUTHsEIrRVNFxTZaj64=;
 b=YNT6A5cemUj2uDdcoJCEH/AWJaSE0FhfUxAFXfV+Oxpwl0YpeSN96FbXLfunPbQnFImUGa
 2RX1eatBT7woMJAXiSLx6XTF7wGAXbAiECPjqh2Yp+WeH/hcIZBCJQOLHYGTqvXU0UanDR
 MKvWoe6PHYf+e2o63d2nKgBD4twSsOs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-O3dzKCYQOje-337HJYRAtg-1; Wed, 07 Jul 2021 11:03:49 -0400
X-MC-Unique: O3dzKCYQOje-337HJYRAtg-1
Received: by mail-wr1-f69.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so873479wrm.14
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5H0fdYuijAXulte1JclETA5lCUTHsEIrRVNFxTZaj64=;
 b=YnXhuO94b92G2uidWR2Y1kEfAhV3m5DCC1TySFH1IEYN2goJWZtoMqX7aFRwn5wQLo
 /KM5uR/vrD6BG8t0CTdWE6r1W0kfyEEjFvLBN+EYMyBnX97HZ5eMi84PhX6/vEl3Cp2V
 FP+Z7jEoDyD+TL+PwzUSEx94/QJOglcpXE39RdyXyPCfvy4khdUtbKeIBhIdlBuDrILh
 B+XS0oL/OJ0HfIGshU/4Cie3g0GvwJJIdokA+RKqDc5qCO1+Azi8j66WcKAoioj0EA3Q
 GAlThK7UzTUsYWpros5dIYg3JIqT/TtJ09RzGT2Fk7s3XP/W+ROZL6nIjBT/rMHaIr/B
 BsPw==
X-Gm-Message-State: AOAM531ksg8cCQijRwaXWlJwTUL27RlJN0QfP/GU6xijHfiNrGaJQTeS
 wl2jWMwi6HDUimtILMPV641Q2VXAgkNsIUKDjQ8wtitjFNtLPymPZ9+GwHCZ5lCCwUPVXSKdtJI
 JfeQ0U+uH+XYVbwPnlFh0+w0OmoxuVJEs0yNChmltuS1odNwnVbV62MYSnLnc
X-Received: by 2002:a1c:1f8a:: with SMTP id f132mr26241270wmf.56.1625670228272; 
 Wed, 07 Jul 2021 08:03:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhKhMXnsL89iDqH8LqEATh5mz29gfWeZ5jKuvOgLuZ2Ny05r9QCvOjlcu7VdPkxtah1SoaUQ==
X-Received: by 2002:a1c:1f8a:: with SMTP id f132mr26241240wmf.56.1625670228075; 
 Wed, 07 Jul 2021 08:03:48 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id i11sm7297835wmg.18.2021.07.07.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:47 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
Message-ID: <20210707150157.52328-14-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mathieu Poirier <mathieu.poirier@linaro.org>

This patch adds entry for the vhost-user-rng related files.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <20210614202842.581640-6-mathieu.poirier@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfbf7ef79b..517f22b2e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1949,6 +1949,15 @@ F: include/sysemu/rng*.h
 F: backends/rng*.c
 F: tests/qtest/virtio-rng-test.c
 
+vhost-user-rng
+M: Mathieu Poirier <mathieu.poirier@linaro.org>
+S: Supported
+F: docs/tools/vhost-user-rng.rst
+F: hw/virtio/vhost-user-rng.c
+F: hw/virtio/vhost-user-rng-pci.c
+F: include/hw/virtio/vhost-user-rng.h
+F: tools/vhost-user-rng/*
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
-- 
MST


