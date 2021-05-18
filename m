Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B7387FE1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:47:09 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4kG-0000Kq-WD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bC-0001qB-SX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bA-0008Ej-1u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8p69QDofACFxeVoOjBjmu/iSzxD1vYfqseZWJ45KjA=;
 b=B/6dNRjr+cCf6POByA9MXZyOI8tnPMIzQauhNJtHeXoMueNON/+gvsGO3QGpGAWgIvPrJX
 KgDOIsw/A3vNDAte0kfNQp6X8ce9vifoBFn4D8PbzHB2H39WwP5U5v75CwndclmEdwQCyp
 lFWrg8ISPudCDbWRhK8zjLrweKL2l+0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-tmTXbe8UNw-nAC6H4Kbq1Q-1; Tue, 18 May 2021 14:37:34 -0400
X-MC-Unique: tmTXbe8UNw-nAC6H4Kbq1Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 s20-20020a0564025214b029038752a2d8f3so6253532edd.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8p69QDofACFxeVoOjBjmu/iSzxD1vYfqseZWJ45KjA=;
 b=d9wsjmYfHrPtBUk/WooAL27S4IYrX9N4zZq6EjM5jOKWVnWDmwYXRR6uQl0EM7mthx
 m8ShEJYkJoMx+cmkTbkuaL5BwVWyDGgv10UPzahXs7m4HP8ZX0e9bWhMXTXs5TfvmYGd
 vLmJ3xVsnd6T4L3WD/Gpi4Kq3w8fKZ7KbTpEM6/Kt+g+iZSO4xeCouw4CvhbfbdCdnfy
 Hw0S4c7W4VOjjDsg1a/AqHkDffoRURpoCDMZ39jYgMsHYTywRDIRCmJGBZ1MrqNaQ79l
 qsYiKGjId7/56tqr6cGgMtCatxPdodDe6+8KIJyPkOJJVEmkVc/9SRPzkPkLhy4FofJs
 x00Q==
X-Gm-Message-State: AOAM532TQyJlidB0Kvj6vYQRRBlSMbrr7MiQ9bcYDzJRtI1s70Tf6Ky1
 cqUNn9QgfasoH2pDv/gSZ1hyj1exgOEw7ierW1zdc9fVgoVJEZT3lQ/q8Rak3ylIBooWlcw3Kqo
 AfB22GTZ3Jrv4259Lywl0aq8F025gnGtECKN9Pzq3fQuHmmsJ7+dxm7A0hMOI4X3E
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr7301661eju.508.1621363053277; 
 Tue, 18 May 2021 11:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykOVKW+em7Z/NJNkl5QhdilcRxADFmTY/4hw9WkTbkkisaLTwsB+C+UB6B7l5E9MHkml9scg==
X-Received: by 2002:a17:906:4a81:: with SMTP id
 x1mr7301636eju.508.1621363053065; 
 Tue, 18 May 2021 11:37:33 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h9sm13225232edt.18.2021.05.18.11.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/25] qemu/bswap: Introduce ST_CONVERT() macro
Date: Tue, 18 May 2021 20:36:37 +0200
Message-Id: <20210518183655.1711377-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to add more load/store operations,
introduce the ST_CONVERT() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 2d3bb8bbedd..86f5ded6acf 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -449,6 +449,23 @@ static inline void stq_be_p(void *ptr, uint64_t v)
     stq_he_p(ptr, be_bswap(v, 64));
 }
 
+#define ST_CONVERT_UNALIGNED(bits, vtype, size)\
+static inline void st ## size ## _he_p(void *ptr, vtype v)\
+{\
+    __builtin_memcpy(ptr, &v, sizeof(v));\
+}
+
+#define ST_CONVERT_END(endian, bits, vtype, size)\
+static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
+{\
+    st ## size ## _he_p(ptr, glue(endian, _bswap)(v, bits));\
+}
+
+#define ST_CONVERT(bits, vtype, size)\
+    ST_CONVERT_UNALIGNED(bits, vtype, size)\
+    ST_CONVERT_END(le, bits, vtype, size)\
+    ST_CONVERT_END(be, bits, vtype, size)
+
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
 #if HOST_LONG_BITS == 32
-- 
2.26.3


