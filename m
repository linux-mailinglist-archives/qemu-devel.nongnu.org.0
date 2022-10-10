Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693E5FA315
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:01:28 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohx5i-0006Q9-Ld
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbK-0001vX-9o
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbC-0006e2-P6
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ+3Ym4q6e4cRDvqrMY+ao2NcRPn7bSMxNJxA/MOCSY=;
 b=Mf7wFhSDT2Igw+5L7HjUxurjSM3FPGMSeSHelj7OUh0T6TkioGHhp34ySg82VOQEFuJtii
 Amo6SDPNSXxyC4CIor4sSsmJu/iZZc2mgoNH9r2uvlNOkqk9rD6cEZxCgDdi1mpcz1D6+e
 KXsGX66Ay010pgm6M4iWWaUejM7QPyw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-fvOY0u2zOPGu41F1xT9XSg-1; Mon, 10 Oct 2022 13:29:53 -0400
X-MC-Unique: fvOY0u2zOPGu41F1xT9XSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso3259018wmh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yJ+3Ym4q6e4cRDvqrMY+ao2NcRPn7bSMxNJxA/MOCSY=;
 b=YMiKikjqgIT8/Z6uETKvl/DXUg04ggmWqYPqLBUlYG5IF9gc7Au93zvYEMUjMt3ZfO
 /4n30cUgsTQLD5RX36q0nbZH1FhF/p0XaAE0aT4mj8AUbAXOJg1jXWRZhVxaAm28DfoT
 wkDwrsywmi8Jyc3GNGMcKJUWdU1PrqxiKSU7Xxhc9rMmRstrcUjgnndLQJOTn4lxRe6x
 Fk0sErzufCOR2eZuX1/wfNtBZB4EuisAXxwbW3DTnRRvIAV7ealo6H9oXprmuofvVqQc
 TY2teRwlhIDU5w3YuZbWUhmcDuJaiGdIM2XEkFYzP7/hIEuSso9McjyQJ4P05rXSsyQH
 vZtg==
X-Gm-Message-State: ACrzQf2om6G7CSxTkXhaWrBlalKZTPRXyScFP7GDPN2AKI8MHAjB/6gR
 /phwJSODLXw7mPUpqhxjyo2RiGK+HbxGzF0JKYhHugujkCpDIEC787Zfn+acduwOkI1Mn6Wo4PM
 gq3iNu0jzyrSV1KTvfQsDSbHxEEIiJ5R0TNnog95aFFx3NO2zdT65J2smDToq
X-Received: by 2002:a7b:cc0c:0:b0:3c5:a58f:afbc with SMTP id
 f12-20020a7bcc0c000000b003c5a58fafbcmr6586031wmh.169.1665422991706; 
 Mon, 10 Oct 2022 10:29:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LfPAgfih40uMo+LiehqdDgi4yBz67QObpgJR6UqC6ELJWckp/f6PbAK/OgCotXRh5o52PTA==
X-Received: by 2002:a7b:cc0c:0:b0:3c5:a58f:afbc with SMTP id
 f12-20020a7bcc0c000000b003c5a58fafbcmr6586012wmh.169.1665422991374; 
 Mon, 10 Oct 2022 10:29:51 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b003c131c5a997sm11680579wms.7.2022.10.10.10.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:50 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 16/55] tests/qtest: add assert to catch bad features
Message-ID: <20221010172813.204597-17-mst@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

No device driver (which is what the qvirtio_ access functions
represent) should be setting UNUSED(30) in the feature space. Although
existing libqos users mask it out lets ensure nothing sneaks through.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220802095010.3330793-20-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqos/virtio.c b/tests/qtest/libqos/virtio.c
index 09ec09b655..03056e5187 100644
--- a/tests/qtest/libqos/virtio.c
+++ b/tests/qtest/libqos/virtio.c
@@ -101,6 +101,8 @@ uint64_t qvirtio_get_features(QVirtioDevice *d)
 
 void qvirtio_set_features(QVirtioDevice *d, uint64_t features)
 {
+    g_assert(!(features & QVIRTIO_F_BAD_FEATURE));
+
     d->features = features;
     d->bus->set_features(d, features);
 
-- 
MST


