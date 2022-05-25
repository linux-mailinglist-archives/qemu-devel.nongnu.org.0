Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02D53443B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:32:34 +0200 (CEST)
Received: from localhost ([::1]:42138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwkD-0007Lh-Gu
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgr-0004a0-U8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwgq-0003pK-59
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTuFEN5hmxoRk6//cGcJ956qKtBJxIwj3v7ZGjAuDK0=;
 b=N5Ye7M+sMV6ak/umvZskUK88OdgsdPW3vkO8QUAyOnvymnMKWuBLaOv2k0crjyyG3oL/II
 krOOOMGTpalppifC5vO/dKsKmBm9gpv+wakDeO4A5+CVGX0kMPl26hpQFLCd0CLiItmjv1
 qx0Iqo4NQWJTqSgF+3DAFBcqA2sw9sg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-BuD0p0ogOfGDHc6FUUzrSA-1; Wed, 25 May 2022 15:29:01 -0400
X-MC-Unique: BuD0p0ogOfGDHc6FUUzrSA-1
Received: by mail-ej1-f72.google.com with SMTP id
 gf24-20020a170906e21800b006fe8e7f8783so9597846ejb.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTuFEN5hmxoRk6//cGcJ956qKtBJxIwj3v7ZGjAuDK0=;
 b=K9ZBUMYrgmqZlIAiWrERsnIaGduxUgn/uDI6miwaaCdejPqU4aqK/kkDwh5nWFDGRg
 FtBR2K7nmid3+bWUhmpC+CnRaaMy5YRObSiczzV1/GwlTyyER//2X9SKJdWeLIkCi0gD
 2UEqliAJoasbhDYJJLIEBEudtUTl0fDTUXkr99UScOfUvHA6xY1fvewc60T8MGC0PF5s
 kxtZ3uC4zg3CA92+WIozPxgiD99hX4CyPSP/vtEoNGLqD68rlljDkjKJbGFaFCqLQ/vV
 lg2PNqddhwpj9RQ5oB8cgnFyZWRVsFiZOvBPpobct3imKTj7fwslFQ/IgRQoI2CFrJqr
 8BLw==
X-Gm-Message-State: AOAM531L0wgCX0ZnHHnIj2RTo9i4lbeNkh2FfClehQafo+Ixy0zz6jTP
 jb36bejyAICDqDOIbqSaA2+pnzX/XICfKFuL5XvpOXg2dscUfbvci4pxOZ5DCqnFPdw9m1/ix/b
 j6XM3N3U3Oq6FMEUnYvClR7jb74ev8HGfYXwUpFjFfdujSIEgjZFe7B4phZsp66Ej6AA=
X-Received: by 2002:a17:906:a5b:b0:6f4:55f6:78af with SMTP id
 x27-20020a1709060a5b00b006f455f678afmr30577640ejf.238.1653506939645; 
 Wed, 25 May 2022 12:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhws+uf3HelGIBGaITfXupbN63Bag1EuYj/e0TyA+2c3Q6vYydiicsWo8UaRaFxv5yV0p3vQ==
X-Received: by 2002:a17:906:a5b:b0:6f4:55f6:78af with SMTP id
 x27-20020a1709060a5b00b006f455f678afmr30577625ejf.238.1653506939391; 
 Wed, 25 May 2022 12:28:59 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 d1-20020a50fb01000000b0042617ba63basm10811098edq.68.2022.05.25.12.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:28:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jaroslav Jindrak <dzejrou@gmail.com>
Subject: [PULL 02/17] hostmem: default the amount of prealloc-threads to
 smp-cpus
Date: Wed, 25 May 2022 21:28:37 +0200
Message-Id: <20220525192852.301633-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
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

From: Jaroslav Jindrak <dzejrou@gmail.com>

Prior to the introduction of the prealloc-threads property, the amount
of threads used to preallocate memory was derived from the value of
smp-cpus passed to qemu, the amount of physical cpus of the host
and a hardcoded maximum value. When the prealloc-threads property
was introduced, it included a default of 1 in backends/hostmem.c and
a default of smp-cpus using the sugar API for the property itself. The
latter default is not used when the property is not specified on qemu's
command line, so guests that were not adjusted for this change suddenly
started to use the default of 1 thread to preallocate memory, which
resulted in observable slowdowns in guest boots for guests with large
memory (e.g. when using libvirt <8.2.0 or managing guests manually).

This commit restores the original behavior for these cases while not
impacting guests started with the prealloc-threads property in any way.

Fixes: 220c1fd864e9d ("hostmem: introduce "prealloc-threads" property")
Signed-off-by: Jaroslav Jindrak <dzejrou@gmail.com>
Message-Id: <20220517123858.7933-1-dzejrou@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index a7bae3d713..624bb7ecd3 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -274,7 +274,7 @@ static void host_memory_backend_init(Object *obj)
     backend->merge = machine_mem_merge(machine);
     backend->dump = machine_dump_guest_core(machine);
     backend->reserve = true;
-    backend->prealloc_threads = 1;
+    backend->prealloc_threads = machine->smp.cpus;
 }
 
 static void host_memory_backend_post_init(Object *obj)
-- 
2.36.1



