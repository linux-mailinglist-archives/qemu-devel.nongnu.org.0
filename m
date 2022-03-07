Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4F4CF997
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:06:46 +0100 (CET)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAGL-0007FL-7U
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABL-0008CA-Ne
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABK-0002ZA-5G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=Q53VB6CihdhEZSB9qcgnLzs9nMdJQ0oYzzLlC4s+7GSTSB/J1yLxAgt9C8FeP9ezVifndY
 p+iCO/2QnBVYk4sppTYT1zeJLfS91GYQyJY9JAsHmUN2x8u6lop68jEW/Bif8e0iJop0zX
 07YmfpLeFb1CtlsYkFvqkwPSGIQfTPQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-hAyIPbIbP8WJdkDJ__RwRQ-1; Mon, 07 Mar 2022 05:01:30 -0500
X-MC-Unique: hAyIPbIbP8WJdkDJ__RwRQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a50ba85000000b004161d68ace6so3201528ede.15
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4EYi98Ftt5LJhR9VhEfDFIVBGMtEa4o0BZ3KdoQjXY=;
 b=XpRxQiyM2lFUTStiRtmCOpyd4/qkv8EJR48se/zyPQwpn45QuIs7NwGOMytIkbP+2t
 D4k8rSmuc97R+vqoHcqFaw6QC7Dam/kOceIWkl5gMSbcxyebcfcUeDPTZLz/JSuzRssw
 7F1mjDEmu8w66NimIwAby8Q9QjP4OwtYGkJQA/q+LBPdBlQGmBbvcpeM7HfspThZrTCh
 f0+J8Vq9G+FUCeER0LTQO7SH3QwcA6vMy4W6HF+pjohsQ1gx/IoZVhg3k2X+t6EDgF4Q
 wH2pudtxX/vmig9ANo6b62Td79rHLSI06tGDQW4856sORIHeSAsQSPROqpyaNdGy2/hW
 6Umg==
X-Gm-Message-State: AOAM532Uqx/l8L90mIatY29akilPy/BAhpoxv/Fw4VddRiKtAJfcZAMa
 yv+FspExWK9LjO0FqenPNzWwrD6H9MDguQKG0JNUuCewVc4S5IUt50fhLKoaPlhTtJKTLQJphhp
 uzAO6A6aTsUhr6ceoyP/sL2E3aAAj7Ak2Y/W4fUuoF+mH0X0cC/vGD5YaRYC6
X-Received: by 2002:a17:906:ae0c:b0:6a6:a09f:f8d5 with SMTP id
 le12-20020a170906ae0c00b006a6a09ff8d5mr8487198ejb.627.1646647289156; 
 Mon, 07 Mar 2022 02:01:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCRRHMlUARz0l1l3mioZ3vmuqS7OUgWlMkE2ysEDGtleKnjF5ve3XO/uW6BaZRadJwpqMO/Q==
X-Received: by 2002:a17:906:ae0c:b0:6a6:a09f:f8d5 with SMTP id
 le12-20020a170906ae0c00b006a6a09ff8d5mr8487176ejb.627.1646647288868; 
 Mon, 07 Mar 2022 02:01:28 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 bn14-20020a170906c0ce00b006c5ef0494besm4527622ejb.86.2022.03.07.02.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:28 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/47] qom: assert integer does not overflow
Message-ID: <20220307100058.449628-2-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


