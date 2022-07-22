Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DA57E50E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:08:07 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEw8E-0007yc-4j
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5N-0002J7-Sr
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5K-0000r7-Ak
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSUM2NDNv4NaibUEm7aBjFt1X3em6iClOIhPAVNOYu8=;
 b=A02b6fB2cHqa+XGDG3j++6aggnQk0DM5Omdsple/AG1r+FhI5Uof63lmsl7obV5NC4/8rJ
 eSjygYpaijFPX8wD2JkKmOoRBwbNXVD3423/rdq0vPyD2GIhMPC/j6fY3jF/AxuI4xtI9+
 UT7TrBP7rdeHjK8i9aTYFG8iuJnEj+s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-xvYVDGY1NSmnc4_VXx6LnQ-1; Fri, 22 Jul 2022 13:04:57 -0400
X-MC-Unique: xvYVDGY1NSmnc4_VXx6LnQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 l16-20020a056402255000b0043bbb1e39c3so3239330edb.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSUM2NDNv4NaibUEm7aBjFt1X3em6iClOIhPAVNOYu8=;
 b=C6a2+Hn06OZpeB+EN0ThBcGNZj37nS897bwDN9zNX2EUzjGn48ZiFJXM7cK2+/LFFa
 6uGvUJmJ7w19oJu9UA1T3eF9CEmG00vuUnIIR954x2VBXumQnzgwJwtkqQqsqM9/KUn9
 4KnvnJmP15xzqIJB7OLS/8szEAKOsX0UxGdyJupTJdbLf++EoLPi+s8XvQVbYAcDv+DX
 E1nr+IkLiL6hUniWUO4TtGQS95HopA4X34gvicpRMuNQbIPoCOBIs6msMRA5PQsEpPUi
 B+a4WE1bR9zf9mxVd24qC01fAA7a1Wic6UPOiBm0A6c9iAdbl+CCCQprrXEAa54whCOx
 C2Aw==
X-Gm-Message-State: AJIora9CqkrOGiqy2yU2IYNWiuH3O0IfQ3v6+gfkRrxDEaADXAfv7G0v
 3lETwVYvXf4ZEtsS4CHK/idyqtkm4RAAMmz7KRLUy1se0cb4MLo4Gw1NnfyJazl+8ux1KWK+6tf
 0qmCKVL0roQiHfXZiq74UkTWZOeUC1QSpI4NkA+UIU3BnBuk2wPpNSnYlPYcHW3+gnWg=
X-Received: by 2002:a17:906:7e43:b0:72b:52de:b039 with SMTP id
 z3-20020a1709067e4300b0072b52deb039mr665216ejr.198.1658509496189; 
 Fri, 22 Jul 2022 10:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkJcbgpisA42oX98fQTKg26RV8hMqp4ZjPqy0ksqUjDB1tbtVrkSR0sWoAVrjGRh82h+deYg==
X-Received: by 2002:a17:906:7e43:b0:72b:52de:b039 with SMTP id
 z3-20020a1709067e4300b0072b52deb039mr665197ejr.198.1658509495840; 
 Fri, 22 Jul 2022 10:04:55 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b0072ab06bf296sm2223294ejg.23.2022.07.22.10.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/8] accel/kvm: Avoid Coverity warning in query_stats()
Date: Fri, 22 Jul 2022 19:04:43 +0200
Message-Id: <20220722170449.853222-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
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
index 99aede73b7..f165074e99 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -4014,7 +4014,7 @@ static void query_stats(StatsResultList **result, StatsTarget target,
                         stats_list);
         break;
     default:
-        break;
+        g_assert_not_reached();
     }
 }
 
-- 
2.36.1



