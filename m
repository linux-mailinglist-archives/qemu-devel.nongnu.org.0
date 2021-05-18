Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB391387FDF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:46:49 +0200 (CEST)
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4jw-0007Sh-GZ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bG-000229-Su
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bC-0008GP-UD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4UOKckP4V9oUzE7TpxZ0flVen5pbcGekiky6msHo58=;
 b=ILaTOsnyIOz3hFK/MX5KaEyLipq1wJtVA0jK2vZ9K8jMIrwnZuZYIcK++cP7bylp0sMyZg
 HcCx7HT/Ur/ug95GMjKY2jWsrLcMxt682hk+CPWlcyAxSHlZ7Tg/+GgqBVRkcy+TxJTu6n
 XODVQmoDkiHkU1uVs3cbu/NpKAFAk/c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-uelf8BKlPwmBcEDi3nn0jg-1; Tue, 18 May 2021 14:37:44 -0400
X-MC-Unique: uelf8BKlPwmBcEDi3nn0jg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso6246214edd.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4UOKckP4V9oUzE7TpxZ0flVen5pbcGekiky6msHo58=;
 b=TfIObXdc4frhgHa7fYBEBvkB7//ZmdQWyGr54gQ8SNRRWLXmIgGWySNDfHDm1GaObe
 2CHk0nmMlPbcRrs5x3y470KrTy73QCD6AW8CcOZKuYK0JO79ktZHZF+s5FCMLle70ZGw
 zIR2Giw/6MVdGYyNH8G1yA8KklMiM5wWR4pXH5HxVPHZP5FANMkuQLq/4h1zSjExTzrh
 zW+2QP5VOcsavMCuRizFicaO8IxCZ3ZUyhP7fQPOQ7k1ZuF5aCDXp+rueie6Pb3Dz8yH
 2yPCihDpcEEFKmzV2n8xMtlNAT8STutJFM+FW+fPDwHgqcAJv08AI59oH7uwYgr4jaZR
 5yHQ==
X-Gm-Message-State: AOAM531HS1QpGGtZcVLO7VU+YbJy6gxK9EK1QcM90bvlp3FFLoq82XwF
 kILywEpY0yaZtWvJUrfJ+DJ5YSUFv0V240AqdHLmFeFSQU8fqSTXrTZkL0mnFiKRNAjFDv/Oq6H
 pmuFen+kw0QLAlVdP+Ol9G+1p8PLZtO6dlHfJ7lupYhBkk5xKmMTL2XhhUn4VuTu/
X-Received: by 2002:a17:906:1c46:: with SMTP id
 l6mr7488888ejg.328.1621363063448; 
 Tue, 18 May 2021 11:37:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqtEhOspP41DPZl6H/khJhmutvLtF3+XqB6Cf1cI3Y7PnU/TrJhpIdULKfyUr5/8vL3YheXA==
X-Received: by 2002:a17:906:1c46:: with SMTP id
 l6mr7488869ejg.328.1621363063273; 
 Tue, 18 May 2021 11:37:43 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d11sm5184859ejr.58.2021.05.18.11.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/25] qemu/bswap: Introduce LD_CONVERT() macro
Date: Tue, 18 May 2021 20:36:39 +0200
Message-Id: <20210518183655.1711377-10-philmd@redhat.com>
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
introduce the LD_CONVERT() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 4e2bd2e97ee..c2fd4f31d20 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -434,18 +434,37 @@ static inline void stq_be_p(void *ptr, uint64_t v)
     stq_he_p(ptr, be_bswap(v, 64));
 }
 
+#define LD_CONVERT_UNALIGNED(bits, rtype, vtype, size)\
+static inline rtype ld ## size ## _he_p(const void *ptr)\
+{\
+    vtype r;\
+    __builtin_memcpy(&r, ptr, sizeof(r));\
+    return r;\
+}
+
 #define ST_CONVERT_UNALIGNED(bits, vtype, size)\
 static inline void st ## size ## _he_p(void *ptr, vtype v)\
 {\
     __builtin_memcpy(ptr, &v, sizeof(v));\
 }
 
+#define LD_CONVERT_END(endian, bits, rtype, vtype, size)\
+static inline rtype ld ## size ## _ ## endian ## _p(const void *ptr)\
+{\
+    return (vtype)glue(endian, _bswap)(ld ## size ## _he_p(ptr), bits);\
+}
+
 #define ST_CONVERT_END(endian, bits, vtype, size)\
 static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
 {\
     st ## size ## _he_p(ptr, glue(endian, _bswap)(v, bits));\
 }
 
+#define LD_CONVERT(bits, rtype, vtype, size)\
+    LD_CONVERT_UNALIGNED(bits, rtype, vtype, size)\
+    LD_CONVERT_END(le, bits, rtype, vtype, size)\
+    LD_CONVERT_END(be, bits, rtype, vtype, size)
+
 #define ST_CONVERT(bits, vtype, size)\
     ST_CONVERT_UNALIGNED(bits, vtype, size)\
     ST_CONVERT_END(le, bits, vtype, size)\
-- 
2.26.3


