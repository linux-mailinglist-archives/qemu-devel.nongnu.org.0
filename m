Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF46481EB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bX5-0005k3-HI; Fri, 09 Dec 2022 06:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUs-0003ya-4Q
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUl-0000zh-Cn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1mbLHMn/wYtFExtFcVSyZm7+5Wcq6+nPQCFkIbbgYs=;
 b=E2jyXAzWUWSWEFVI/HqR/aNCMGmYpn9nw/f1oHYI1FE1ArQqqpkB1zBuGFqheFp6m5oQnF
 0duLyNcS5Gn3PkcLZhNs8R7NHl5nGgm5ccF4YfSvShaDn2KPj0MUTDXeWlvLsETJWRedG+
 AQD8pjTqcaG2TpMfClTfSWDwrROM2co=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-XMbVRo_XNo-mDLGyJfSGdw-1; Fri, 09 Dec 2022 06:24:43 -0500
X-MC-Unique: XMbVRo_XNo-mDLGyJfSGdw-1
Received: by mail-ej1-f70.google.com with SMTP id
 oz34-20020a1709077da200b007adc8d68e90so2918968ejc.11
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1mbLHMn/wYtFExtFcVSyZm7+5Wcq6+nPQCFkIbbgYs=;
 b=XOCMyX1lS2IkbEzr1D+0BZZj/KBTt2/qVZ4e21MjydAXa0woD7qM2vfd+8yp8xRSqL
 r3cpmyZLjcHEV3kxPjjTXzYvjQ47o2m48SbCnsXgq/nh8twmKY0ZfGc7fJsL03M1LWZj
 ilC1E+TQ+bricQg1lbyMT1BKUNosNp1mMiAq/GEk46/BIbzpqS5Rc2HY1ozdked03BiK
 m3hrNxEEvC6WQsVOjiZ6Mw4Udv05Gz1tGzukF/mRWXvPFu7lHZfuTVM+3grtzgNOMwCP
 2Gjp0FO2RR1+T3jqJWQknHxYETIRl2Ctfhjpg+4i5Cp+jodVuI69Rl9diq8KxQeSsCsI
 ISRg==
X-Gm-Message-State: ANoB5plQVdI+MOuZkwc1kjM+NFJ2I874NHwnX/yZV5qY+Aez32nvXE/W
 6aE1yfNYQBWMfG4dn4BwVRHmNQEf2LOQsKw0iXtSK4c7lVdyBkNyx4gC4ICMegEQ5aCFDhiTHCT
 LbjgZAoW8RNweKfG6FT+nDq++Hj0IEWttDIjOeActktRu39Sm8T7wkCnTs6uozLI4ZSA=
X-Received: by 2002:a17:907:d687:b0:7b8:882d:43ff with SMTP id
 wf7-20020a170907d68700b007b8882d43ffmr5593281ejc.0.1670585082445; 
 Fri, 09 Dec 2022 03:24:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7bTlByQP6WD5WDtio1YGDDj1ig2BSOXNta8zhOGEcQEt1hXlGD1Hc5r5iRVIIum15vn9BngA==
X-Received: by 2002:a17:907:d687:b0:7b8:882d:43ff with SMTP id
 wf7-20020a170907d68700b007b8882d43ffmr5593259ejc.0.1670585082129; 
 Fri, 09 Dec 2022 03:24:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ha26-20020a170906a89a00b007c1027ed6b5sm448892ejb.75.2022.12.09.03.24.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/30] meson: cleanup dummy-cpus.c rules
Date: Fri,  9 Dec 2022 12:23:50 +0100
Message-Id: <20221209112409.184703-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that qtest is available on all targets including Windows, dummy-cpus.c
is included unconditionally in the build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/meson.build | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index 259c35c4c882..3a480cc2efef 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -11,10 +11,5 @@ if have_system
   subdir('stubs')
 endif
 
-dummy_ss = ss.source_set()
-dummy_ss.add(files(
-  'dummy-cpus.c',
-))
-
-specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: dummy_ss)
-specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
+# qtest
+softmmu_ss.add(files('dummy-cpus.c'))
-- 
2.38.1


