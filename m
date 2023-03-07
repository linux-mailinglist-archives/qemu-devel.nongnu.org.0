Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CA6ADDD4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjk-0007O3-Pl; Tue, 07 Mar 2023 06:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVja-00073u-2D
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjX-0008H2-60
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmv4GODEo+jntdE66L5djocg5OACgVqeZY4tkfhD1zA=;
 b=PMiMP8PY8ysHbmCKZyhCX2tt6pTB4k4kGzA4J7D+Sl2I0pvcp/uMCe8PsqtJbzK6iBjsru
 dXfxyXw89swImGjucmstIuV07FG+d4+KevGjxGDuslcw/HsaA2xGPJ6vDB8bGpmrnF99iV
 H/Dijd+SPK3y6IkGf9a9/RNjtoE5XaQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-IFNesTBmN6-ufbNQHsgPjA-1; Tue, 07 Mar 2023 06:43:52 -0500
X-MC-Unique: IFNesTBmN6-ufbNQHsgPjA-1
Received: by mail-ed1-f69.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so18415609eda.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pmv4GODEo+jntdE66L5djocg5OACgVqeZY4tkfhD1zA=;
 b=rgSTG8dazCBX/lO7saEmorQjqf6zADMA8rJWrIdiWES1/twaVAX2GkNK2Lbr+pNEF+
 q206rFIWLFkbgtT80QGGFaxYOwBGdcCXOoWt3u2dDlaGmUwugwcJdHjhg5GjWgcKnPkG
 yL6YARErrcZp4JwWupmMTDHSPko7sYWMo86hT/YBwbVVCG139RBXaAy+yGXLdpQzgQSt
 JhysqHqjYUqVrPZqmxw/wVnWtbyuYZlPRkJUwx+V8opuZCK3mcuDuj0Un6hsiBJsCOV7
 atr/Gr6HH3cwD4Nlg3u14c+04fOThvCY9TjkOCX9KgpO1oGeh77ngO+pE9Ie4s8/qtXJ
 ayYA==
X-Gm-Message-State: AO0yUKVP6Q7enWQI6QFWA8ri8QXtrAkvV1ECB+NU5c1Yplx0DT2Jiz3K
 5JvRtEaSzok6TaLblUk2WKtLTe5XWe1KMd0JKGmu/dlzQeGk+V9/bNzgg3FDqfOs4OUAlEzqT6w
 69saMj59QfzAZ6kOZUGqXCy07HwDg5YgacMo/aY5WfOL/f7jRUW3CRV2N3Dk3C3LQQ3aFO/pxhJ
 g=
X-Received: by 2002:a17:907:8e9a:b0:8f1:da18:c6ca with SMTP id
 tx26-20020a1709078e9a00b008f1da18c6camr16932941ejc.3.1678189429980; 
 Tue, 07 Mar 2023 03:43:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8qWi2Xo795TngyvcTQt/8BsrfCLQZ8ehs072IX9XXWKxBBT3XDOdetj9ou8CfeAX4TAP3oYw==
X-Received: by 2002:a17:907:8e9a:b0:8f1:da18:c6ca with SMTP id
 tx26-20020a1709078e9a00b008f1da18c6camr16932924ejc.3.1678189429738; 
 Tue, 07 Mar 2023 03:43:49 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 gj14-20020a170906e10e00b008df7d2e122dsm5925722ejb.45.2023.03.07.03.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 7/9] physmem: add missing memory barrier
Date: Tue,  7 Mar 2023 12:43:27 +0100
Message-Id: <20230307114329.158094-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 47143edb4f6c..a6efd8e8dd11 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2927,6 +2927,8 @@ void cpu_register_map_client(QEMUBH *bh)
     qemu_mutex_lock(&map_client_list_lock);
     client->bh = bh;
     QLIST_INSERT_HEAD(&map_client_list, client, link);
+    /* Write map_client_list before reading in_use.  */
+    smp_mb();
     if (!qatomic_read(&bounce.in_use)) {
         cpu_notify_map_clients_locked();
     }
@@ -3116,6 +3118,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
     qemu_vfree(bounce.buffer);
     bounce.buffer = NULL;
     memory_region_unref(bounce.mr);
+    /* Clear in_use before reading map_client_list.  */
     qatomic_mb_set(&bounce.in_use, false);
     cpu_notify_map_clients();
 }
-- 
2.39.1


