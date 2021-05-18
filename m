Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1B387FE8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:49:24 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4mR-0004rV-Cl
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bJ-00028K-C9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bH-0008KV-LJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPTuZOZaAUyGNk5xJrzvkHAhCtxsbeJLCsray2K+DT4=;
 b=ZNk4lHc7cxI4kMuUgdfvVwLxfE6f4aNoLCMxqZTEdm5l1bZx4BvqR5RJICmSRxUa6aMtu8
 6uiXkuE0+5SFVfR4wXE2i0V60RTBuviLh8OgHi76iiUJq/OH97MryHI0OmGY5PePc3aXq7
 O5HrLzANdUqdSZuhA1cjYzlYO+ua1wI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-Zar_3bq5Moiuw2iGGlA47g-1; Tue, 18 May 2021 14:37:49 -0400
X-MC-Unique: Zar_3bq5Moiuw2iGGlA47g-1
Received: by mail-ej1-f72.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so2741240ejd.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPTuZOZaAUyGNk5xJrzvkHAhCtxsbeJLCsray2K+DT4=;
 b=JSAbVs2fIIEVdB2NTM70ZWKcGYmp1rKXFS89X8Qj4dUP5xo65G6wx1jcRjzKvJJakF
 J3HLO9pOi4Ik4l5zT82pfqiLo4y/a4KamapCvQlVd9z8liU3EVVIGvYNkreOKLW25EFA
 BGbRVQKGILjoJUkPdFDUG11ZrGekYQxG8HQxmwAlYndP5OW63X8BlKoJ3NnDpnOmuOOZ
 y9zhvHXn+JC11B2CoEMOxOj/unkmHT2zuP17tll6ybPM39cuB6XH+lCM7pa2Fhj8GMPM
 LLaya1yotip+dnXhjNIIJzz6hguuT7UDLU7jjm6tIVQBnn0/GaCho13mAUrT4KYjUE4p
 l4Qg==
X-Gm-Message-State: AOAM530Y+7DM2nM2yo3NZMDxveKfdWXpyr6tTVoQauTu+yM+HfGa0Dmu
 jjPAcIQGmlNw7OTcoOCM0iW5+hA2ZjTCTGx85M3nnRwvStPbhLNmWnU8Bp06jAPJ/A/b9Lji/gc
 B9qJZXjcwnabToTu7EOKFXZPKYt/aYODNFUL7Vs14UCeTK/BJdOObzPmlMvZU+dsa
X-Received: by 2002:a17:906:b14f:: with SMTP id
 bt15mr7721544ejb.126.1621363068335; 
 Tue, 18 May 2021 11:37:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCSastuJp7jB4TQ7qYkPlmgKXuzOrv/bYGUDd6cIUowFmAO0Px/5FQ1QvwF9VSzTiYjSwltA==
X-Received: by 2002:a17:906:b14f:: with SMTP id
 bt15mr7721521ejb.126.1621363068133; 
 Tue, 18 May 2021 11:37:48 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m13sm8129927eds.21.2021.05.18.11.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:37:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/25] qemu/bswap: Use LD_CONVERT macro to emit 16-bit
 signed load/store code
Date: Tue, 18 May 2021 20:36:40 +0200
Message-Id: <20210518183655.1711377-11-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index c2fd4f31d20..af9b18f373d 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -343,13 +343,6 @@ static inline int lduw_he_p(const void *ptr)
     return r;
 }
 
-static inline int ldsw_he_p(const void *ptr)
-{
-    int16_t r;
-    __builtin_memcpy(&r, ptr, sizeof(r));
-    return r;
-}
-
 static inline int ldl_he_p(const void *ptr)
 {
     int32_t r;
@@ -379,11 +372,6 @@ static inline int lduw_le_p(const void *ptr)
     return (uint16_t)le_bswap(lduw_he_p(ptr), 16);
 }
 
-static inline int ldsw_le_p(const void *ptr)
-{
-    return (int16_t)le_bswap(lduw_he_p(ptr), 16);
-}
-
 static inline int ldl_le_p(const void *ptr)
 {
     return le_bswap(ldl_he_p(ptr), 32);
@@ -409,11 +397,6 @@ static inline int lduw_be_p(const void *ptr)
     return (uint16_t)be_bswap(lduw_he_p(ptr), 16);
 }
 
-static inline int ldsw_be_p(const void *ptr)
-{
-    return (int16_t)be_bswap(lduw_he_p(ptr), 16);
-}
-
 static inline int ldl_be_p(const void *ptr)
 {
     return be_bswap(ldl_he_p(ptr), 32);
@@ -471,6 +454,7 @@ static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
     ST_CONVERT_END(be, bits, vtype, size)
 
 ST_CONVERT(16, uint16_t, w)
+LD_CONVERT(16, int, int16_t, sw)
 
 static inline unsigned long leul_to_cpu(unsigned long v)
 {
-- 
2.26.3


