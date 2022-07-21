Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2657D1AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:40:01 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZDU-0003Bh-HS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZA9-0006xE-MU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZA6-0007fa-Qv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBu5tHYZdH4qg2e4NKv+20LCbKvedmiAv3FHARj7E+c=;
 b=cp/OQhhCG3h9xuSCwnmZN/N6ecyFC9dQlgHc2/GzUG5O4C/C7+P7q7BUNUc4dZYLjjDVvI
 mey0et+EeCB4LCvjEhO2ziNDaRkbJ9DCW4nC/z53YMFQtdrzurrO+wIPrNRF/yRcGWFsRT
 L/uSD9rgbVhbbnLO0mCC0KXeSTTFrMo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-8_NBZV2VMli4BFlsKootrw-1; Thu, 21 Jul 2022 12:36:28 -0400
X-MC-Unique: 8_NBZV2VMli4BFlsKootrw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hb41-20020a170907162900b0072f044ca263so980152ejc.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBu5tHYZdH4qg2e4NKv+20LCbKvedmiAv3FHARj7E+c=;
 b=CygRwmNIpQbkVqWv08x2lyemo32qdzSnDGpzZ0iL63rwmsBcFewgnSA2+4FJ/fqz++
 80UznA8pMMcOYz8nbf15ZvUlmOQymAy56ppi6MTK0VVBPdu4fLcCldAHMx+Ep8OgNjsn
 8FQMwSfj8oSXzLxx8JA2H1ipoD3PcPGhz+Ny8sY7M/fgEYzrBu1WmlOAn3bXKREpwdUM
 //qlJjlqUTU/j45Sy3WLNDkop6o10PMDJ0VkDhRAItqiO2n+iSzGtGovAL8SgrNXA1rN
 ix9bEDEhKmHzG3EVYkqYGzWvVEGRhuc5lodAEBOyUcsdUhq7YYCPQg8LWuWwJc4Mzsiz
 NtIw==
X-Gm-Message-State: AJIora/nx//8Cv9WwYCZuFy0Q1+ws2eovKMdh8Zez2hPrTHFTKBJDAK1
 eeYBuJAMJhYSyy1btjqR0ksjJ3HCjj5veVBC6NE/LvK2OxfyqtiZIqF0YqGDSC7fp2Hj+5TDwex
 y1ZGt4Zjrh1zx4U6Q40T7V/2ZCdF0/kjRbfC1kbhkN/i/D+dmqv+q8iZp4MdyukY2xQo=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr40351288ejc.572.1658421387280; 
 Thu, 21 Jul 2022 09:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKrjJ30MY4FB1Z1QbwohiKQ/rnVwG4gEnDRY9w9E+SuQGrjBJHSAYGmwP4mDGFXu3AcV4R3Q==
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr40351274ejc.572.1658421387030; 
 Thu, 21 Jul 2022 09:36:27 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 a18-20020a170906191200b0072ee9790894sm985334eje.197.2022.07.21.09.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/9] accel/kvm: Avoid Coverity warning in query_stats()
Date: Thu, 21 Jul 2022 18:36:14 +0200
Message-Id: <20220721163621.761513-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
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

From: Peter Maydell <peter.maydell@linaro.org>

Coverity complains that there is a codepath in the query_stats()
function where it can leak the memory pointed to by stats_list.  This
can only happen if the caller passes something other than
STATS_TARGET_VM or STATS_TARGET_VCPU as the 'target', which no
callsite does.  Enforce this assumption using g_assert_not_reached(),
so that if we have a future bug we hit the assert rather than
silently leaking memory.

Resolves: Coverity CID 1490140
Fixes: cc01a3f4cadd91e6 ("kvm: Support for querying fd-based stats")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220719134853.327059-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ed8b6b896e..eb7fceb336 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3980,7 +3980,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
                         stats_list);
         break;
     default:
-        break;
+        g_assert_not_reached();
     }
 }
 
-- 
2.36.1



