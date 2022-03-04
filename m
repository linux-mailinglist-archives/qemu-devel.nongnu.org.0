Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B04CD5EF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:08:46 +0100 (CET)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8bt-0005Hu-Uq
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87V-0006xw-A4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87T-0000HU-6X
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=ci8V0gLkMrj0Pe9qxJwzH2EVdEBMUOKxlGyDJYOiBXeQTKDRn5dVNy5fIRqouKkzPcOuK1
 OPIpPD6MgIYsbjhux22wuFuCQHEFnddCdIFrr4Qj13yLRyyW0hkTMABU1BYWQU28d64HUu
 haDcltcBCWRQrIpDxkvqYIyU0uZPUrY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-qQlbR6FbMO-Waa_aHGNrVQ-1; Fri, 04 Mar 2022 08:37:17 -0500
X-MC-Unique: qQlbR6FbMO-Waa_aHGNrVQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a0564021e8900b00412d0a6ef0dso4589619edf.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=Ik8stclaqeTuKZN+rpkOM+NGN0t3nXPJCO93KKbn7b2TKos3/dG6NDS+o294NI+U+G
 sICJuW6ICSZRxc8t45UlMTQXh33z05tvbV2l2oS/xaA6N7ABfBGtr6WqeWRgudnLSvZG
 AqrTz9yQU/e+jVdHDgOdRw/fGUEtOB3gUFCQ7Co4VZD8kKYI5InYQIkRjL6e0sGye5FE
 oo1JsgAG/Kkr6XheRh2QWiztK9Qn181aDM4QFvRqy1GdD/9FUQF78aud+7bkgaiS7sR4
 f+Y5LVQR95E7Cc6zq0tLvNrTJRc5Rvz0xxWUpbfuBRRfyWCM9eEcX4zqbA5ny9lR5X9S
 skvA==
X-Gm-Message-State: AOAM5335zf3a/uBAw0157hro3gMlnxXAUAN81LJg9KcXsCnDo8oeTXNC
 Rq+iWcVRO3LX7frXB6cBxrgZX9Sm2FwgD7FwYDesqfiDD1M+Y2F42v/kvIfE7U5NaLKdDpkajDR
 0AI6jNT/kOYIDBkqSMggYskAF6MBQW0CE0KvJFubbbW4VsUCtgwD8TCV9GCv8
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr31546206ejd.9.1646401035714; 
 Fri, 04 Mar 2022 05:37:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVxyTGld6UZpShB6KPXGAuDYfPHONDJ2gPnKkLBdRZrUSe9cB/no9LyVT3HnAhxSEman5G8w==
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr31546188ejd.9.1646401035408; 
 Fri, 04 Mar 2022 05:37:15 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f6-20020a50fc86000000b0040f614e0906sm2072299edq.46.2022.03.04.05.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:37:07 -0800 (PST)
Date: Fri, 4 Mar 2022 08:37:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/45] qom: assert integer does not overflow
Message-ID: <20220304133556.233983-2-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


