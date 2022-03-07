Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD54D0B5A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:46:48 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRM7q-000702-PG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5l-0004dp-Li
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5i-00057t-Vp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=LAwR8GZmfNZQaQWW3vJvcZ0q0hgeh8uMoNrHh3s63ZXLKb9rgEcRonPVYEfLp1xALs+K4B
 vZV43GwjOP+zx+GB9fgZrlIQcYZdT/PpfnXZNhCpZsV3Fvvav0td8KgWPEi/04uVxJT3Rh
 l7QuSFgcM6hpHEYkMQMUEg3+UTnMtFQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-WYYDBf0TPe6S5LULlz1vvw-1; Mon, 07 Mar 2022 17:44:33 -0500
X-MC-Unique: WYYDBf0TPe6S5LULlz1vvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i83-20020a1c3b56000000b00389a203e5adso1099546wma.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=OQ+MwGkRLnf7mpuWGQ9aUHxXSJTtZc63u5Lps+d0Jnym/S8l4wpMIAHJL1UXeIhiJp
 CizmbhF4K+mbZwr7jiSFk2huJdkTsvyHzdPbQCC+k5pNAugV3uC5Hp/lB674ID0e3YoO
 Udm0kio8estD7MsKHW1l0E26YqulXcNdJWpFdJF5AvntDWvLQeg3cTiAxfU0lTzbjBWo
 ImkCqzxw86kMFWfi6QWunWYWIy7QYxus+8HDg6Fl5YFHjx/pGQqxnIwzbXraxERzoFRC
 18wPhdjuI7ttnbGWXghwyqmQFDz4ewOdlSvsAAMqR0hhD00zQkvHKwzWdeCsobkHfk77
 JdSA==
X-Gm-Message-State: AOAM532cc6BWEmrI7Bp0sFEmG1nQ2oOd7pXZHshPmR61YNWdUGAcOIGV
 zLlBRfUa4qfAGmxgJttl7TcUtKY3tjQaT4YNpyxeMPQrSG4KIVMlg2JdJDIKJvY47JmPmMLM3WY
 V5X3+HdBlV5MQq4J33gKf+nLZif1bOoAK+jM2g0BsDNTjA729axhlwbLCivnp
X-Received: by 2002:adf:c792:0:b0:1f0:769:9ef3 with SMTP id
 l18-20020adfc792000000b001f007699ef3mr9542890wrg.336.1646693072033; 
 Mon, 07 Mar 2022 14:44:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3YVgoYHE33IK1MAB4NxcNb6Bt8HDOgyFgSjiZrYpJG41hGh69MyCtBC9LSE93xoVPgpC4eQ==
X-Received: by 2002:adf:c792:0:b0:1f0:769:9ef3 with SMTP id
 l18-20020adfc792000000b001f007699ef3mr9542879wrg.336.1646693071767; 
 Mon, 07 Mar 2022 14:44:31 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 n8-20020adf8b08000000b001f046cc8891sm12568893wra.24.2022.03.07.14.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:44:31 -0800 (PST)
Date: Mon, 7 Mar 2022 17:44:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 01/47] qom: assert integer does not overflow
Message-ID: <20220307224357.682101-2-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QOM reference counting is not designed with an infinite amount of
references in mind, trying to take a reference in a loop without
dropping a reference will overflow the integer.

It is generally a symptom of a reference leak (a missing deref, commonly
as part of error handling - such as one fixed here:
https://lore.kernel.org/r/20220228095058.27899-1-sgarzare%40redhat.com ).

All this can lead to either freeing the object too early (memory
corruption) or never freeing it (memory leak).

If we happen to dereference at just the right time (when it's wrapping
around to 0), we might eventually assert when dereferencing, but the
real problem is an extra object_ref so let's assert there to make such
issues cleaner and easier to debug.

Some micro-benchmarking shows using fetch and add this is essentially
free on x86.

Since multiple threads could be incrementing in parallel, we assert
around INT_MAX to make sure none of these approach the wrap around
point: this way we get a memory leak and not a memory corruption, the
former is generally easier to debug.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qom/object.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 9f7a33139d..a27532a6ba 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1167,10 +1167,14 @@ GSList *object_class_get_list_sorted(const char *implements_type,
 Object *object_ref(void *objptr)
 {
     Object *obj = OBJECT(objptr);
+    uint32_t ref;
+
     if (!obj) {
         return NULL;
     }
-    qatomic_inc(&obj->ref);
+    ref = qatomic_fetch_inc(&obj->ref);
+    /* Assert waaay before the integer overflows */
+    g_assert(ref < INT_MAX);
     return obj;
 }
 
-- 
MST


