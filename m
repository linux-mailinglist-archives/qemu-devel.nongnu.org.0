Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6961E115
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:54:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPc-0001ZO-2h; Sun, 06 Nov 2022 03:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPY-0001XW-Pz
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPX-0002xT-7c
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=055A0vSCcobr2GhlSNQ92pfF5PD/FKIEYNgE8rl1sUY=;
 b=SuP/6aouN8ChmeG0Stp8tFEhWYAQFcWybGbmwElxqDDm0wpj2kRK/PGl8aJp4QPTaK4Jtk
 PgyT4vqU+4AMZA99YJLB4UpnSxeBcGhVk3pIi3gB89Ag9G1OJEREwOQxwlFeD79Fzs84V5
 XMecFmfWCWO1tMcTfxDJNA1CRR20AKQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-Kv10QKzVP2mg0ySRU-n0ew-1; Sun, 06 Nov 2022 03:53:45 -0500
X-MC-Unique: Kv10QKzVP2mg0ySRU-n0ew-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so4512705wmb.7
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=055A0vSCcobr2GhlSNQ92pfF5PD/FKIEYNgE8rl1sUY=;
 b=IFJ3UY0jymwPTozi+1X1MKtBXGqxKT1qOVfoGQRroUmShOlZ+MSzOiOAaddLtuYkq1
 BngPo5U9cbnQInARFujz7Xnn3Hme4h//D/JJHrUIlvqyIzyxGb3JCod3PoZn+pgzejdP
 x7Oy/Wv5CSqj+WaHQF9U4f7zpAUUA1TPsUBCW6BIvrnWUUtp877aYpWSeZ08RpWXKM/N
 p0DCF9b9VwbY79Nil/PbYxruokNmZwsRMOWf1qo+XNabpK8p8FHZk5P4VttKco2I4Hel
 9kYak0nA1sdpnJiN+ChK0mNSMkiU8RbrlafP5KvmXXifQ4M0bsuS2Qg2iF3HO8HJvRR+
 a5Wg==
X-Gm-Message-State: ACrzQf2fSIMdF+PRD5IAjycLoVty6Wx0QNXicJBCcKugDTdfuT+T+JZn
 Rqvvt7A0SquBIadBQrnHZ83QFNGP0aYvvtrYH1soHzgywCGaEkHme1TlOUjz2O5JgP03SGFIEsW
 +dxb/CV3xQCd0fa9akNog4Slhui1rPxxLHpqktetKCRWIU7hFWmiKt6SHPB0Co/5U0qQ=
X-Received: by 2002:adf:f051:0:b0:236:70db:20d9 with SMTP id
 t17-20020adff051000000b0023670db20d9mr28049016wro.91.1667724823872; 
 Sun, 06 Nov 2022 01:53:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5j3I3SSspnRCvtk2hRbs2+UBw328q7rZZJkykdDcp1AU5GauEe+ZJdnz2ThmP0VA0RFm+WoA==
X-Received: by 2002:adf:f051:0:b0:236:70db:20d9 with SMTP id
 t17-20020adff051000000b0023670db20d9mr28049008wro.91.1667724823613; 
 Sun, 06 Nov 2022 01:53:43 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a5d460d000000b002366f9bd717sm5139761wrq.45.2022.11.06.01.53.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] meson: avoid unused arguments of main() in compiler tests
Date: Sun,  6 Nov 2022 09:51:09 +0100
Message-Id: <20221106085115.257018-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

meson.build has one test where "main" is declared unnecessarily
with argc and argv arguments, but does not use them.  Because
the test needs -Werror too, HAVE_BROKEN_SIZE_MAX is defined
incorrectly.

Fix the test and, for consistency, remove argc and argv whenever
they are not needed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 1d448272ab88..cf3e517e56d8 100644
--- a/meson.build
+++ b/meson.build
@@ -2165,7 +2165,7 @@ config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
 
 config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
-  int main(int argc, char *argv[]) {
+  int main(void) {
     return mlockall(MCL_FUTURE);
   }'''))
 
@@ -2210,7 +2210,7 @@ config_host_data.set('HAVE_FSXATTR', cc.links('''
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
     #include <stdint.h>
     #include <stdio.h>
-    int main(int argc, char *argv[]) {
+    int main(void) {
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
@@ -2327,7 +2327,7 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
       __m256i x = *(__m256i *)a;
       return _mm256_testz_si256(x, x);
     }
-    int main(int argc, char *argv[]) { return bar(argv[0]); }
+    int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
   '''), error_message: 'AVX2 not available').allowed())
 
 config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
@@ -2341,7 +2341,7 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
       __m512i x = *(__m512i *)a;
       return _mm512_test_epi64_mask(x, x);
     }
-    int main(int argc, char *argv[]) { return bar(argv[0]); }
+    int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
   '''), error_message: 'AVX512F not available').allowed())
 
 have_pvrdma = get_option('pvrdma') \
-- 
2.38.1


