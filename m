Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0237551A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:48:43 +0200 (CEST)
Received: from localhost ([::1]:50332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeMs-0002ab-Rc
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeDQ-0008Ps-GH
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeDM-000889-8C
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLFve6Y/zmLo3HdgEB/9T6FDXcQ0p9jwbmagngeIlOE=;
 b=F5Vr3FMJQ7xv27amGMqSXc3RbxftkPCS+83nuNu+yMM9qjXlkuq7pIsX0JAoo56BmzS3Nn
 FcBYL50w47y4pAxA2N2tGqz0qIFiT387JaP3vExFAPh3Bk85qFwjwebdSRAdNf4tOqI5br
 x+BIq01hFiesUSvF5R/jLCU2v5VNwT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-r3v2TUwqPSu95vB7d5C24Q-1; Thu, 06 May 2021 09:38:45 -0400
X-MC-Unique: r3v2TUwqPSu95vB7d5C24Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so2679460wmg.4
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLFve6Y/zmLo3HdgEB/9T6FDXcQ0p9jwbmagngeIlOE=;
 b=adz8cJ/jfj4YbmUxtMEGTZ3H63OjLDCTsbK3e9183HKaLTVnw6jq2jPgBDxu3OxQcF
 wgc2RSyGbLlg+qgmxevla9tZPT/mV8XpVHtgGySyni4mj3rcm2CbO4gsU8yD76Omfkxy
 3jYe9tVCnjZN/qHDVIw4Z2lyTqCLgu4ZsW1O5UmtVhF+f1ckTpdvsFe1FiA0mSQw11jv
 x4SIJNP7TyLQxUjbvktVl2Ys6acr/64Vfl8lqw1KcVpLzX8xsICKIfmdtmBgte0zou5E
 S5Vcm7O9Q8xQ0c8/zq10N50dr6sK+olWXuxIeT0gQyoQnnqlHmsU/Cj2Qrvw9oiKyR45
 Qa2Q==
X-Gm-Message-State: AOAM5323y22K/Laf/gQ1aGWquXvMKYBy0Rt4+LgHjZaFyNcCVqp7+Iy9
 mcUvNA024PZJVN2Jl9T2AOoUchD+2gre38EgSVPRHbvSpWR6jr43HFmetHmTIwNr3EIoTBbgmek
 4BhSlWh7iRzMKwthn95uQdFAiwuQaGzNAYjq84RNwBDaajljeqwnQaCw1tKWNdztj
X-Received: by 2002:adf:e348:: with SMTP id n8mr5215097wrj.209.1620308324040; 
 Thu, 06 May 2021 06:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvsmJHX73t3ak/OC4xbrrBRJCZcdb4T22RK9A3SSLmm4vJNsQC6Ff+qwwaWbT6aA16s1zISA==
X-Received: by 2002:adf:e348:: with SMTP id n8mr5215061wrj.209.1620308323810; 
 Thu, 06 May 2021 06:38:43 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id w25sm3208909wmk.39.2021.05.06.06.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] target/ppc/kvm: Replace alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:58 +0200
Message-Id: <20210506133758.1749233-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_malloc() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..63c458e2211 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2698,11 +2698,10 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
                            uint16_t n_valid, uint16_t n_invalid, Error **errp)
 {
-    struct kvm_get_htab_header *buf;
     size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
+    g_autofree struct kvm_get_htab_header *buf = g_malloc(chunksize);
     ssize_t rc;
 
-    buf = alloca(chunksize);
     buf->index = index;
     buf->n_valid = n_valid;
     buf->n_invalid = n_invalid;
-- 
2.26.3


