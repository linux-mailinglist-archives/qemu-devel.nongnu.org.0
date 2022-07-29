Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0A585212
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:07:47 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRac-0007kX-5W
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXp-0003d4-9U
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXn-0005Zg-Ss
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozqz6NgN5UrYIkgbF2IKICsewj9wf4h4U4xk0uoexgQ=;
 b=XANpWWf8kaoEBqrzrcKzLzrjGjU3jUCT5UbGVzvmdBjqTt8TCdth+nL8elE8qpRd83OXds
 k0VfACbAGZjn4PlUVEPkabbJNZHuQSI3iJCn0/Py8uF7q/ljCj7VikosSx2VpArEwKVZ0u
 LsbUuk8Wl/WgXQMn++j/SrLpW0YhbMY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-vGuavOalN3KrOQBqPDv-UA-1; Fri, 29 Jul 2022 11:04:49 -0400
X-MC-Unique: vGuavOalN3KrOQBqPDv-UA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z1-20020a05640235c100b0043bca7d9b3eso3048772edc.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ozqz6NgN5UrYIkgbF2IKICsewj9wf4h4U4xk0uoexgQ=;
 b=FM55gtArGkB3nY98KyVaw3hqNOdIQHbyG9Xx8KCP0BJkuyccWCGQCQf11+r4kYCuCM
 5tn9JG+a+4s3Bgr5Zv6PBCSGb7HX8/fxCqu4JbMIqmE5bRwwXZzArNg7sg2d75AaKlNO
 ++4ksuGm4jHreK03hgZdWrmRfH8CRAXFJIEDixl1aZATl7n2gyYrBPg2xNCVK6uT2KPF
 ukeiQ0yvCkiayvMt5WwwHAYu2brW/4ozBww3vKJRngxYuat3buWp/TwQ54KQb/VPdiY7
 HBj1BsG7Od/8M9+r/c2IJpccdcP5j3O5GV0/wXA/Qd39f5DVndaEruIX+3WqY7nOa5z2
 0rMw==
X-Gm-Message-State: AJIora+AqeVhNd2U2S3fBCbqGjjhyu3uTZHV8oj85CkNu9LH3AKzEYFs
 oRFVvc/x2QIuuTf2kpk4jFG4sAGH4vC+HWmB64rAStwCTvmXH/HzB2eq4uUJE521ViVY1hthGjN
 xIu6aT3kf7Z4a2YjjwP9yKYR/Pn+0B01YpmlWhxQ4WL4QYUFRCEnvi+jTmgRORqVa4B0=
X-Received: by 2002:a17:907:7e87:b0:72f:18d7:6094 with SMTP id
 qb7-20020a1709077e8700b0072f18d76094mr3209420ejc.77.1659107087733; 
 Fri, 29 Jul 2022 08:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1syQgae0m9dbxCOgnKpp9zq0TFSMZvShAZzB0b19gmX854veh363PQkjv40htozJFGaU+09WA==
X-Received: by 2002:a17:907:7e87:b0:72f:18d7:6094 with SMTP id
 qb7-20020a1709077e8700b0072f18d76094mr3209390ejc.77.1659107087254; 
 Fri, 29 Jul 2022 08:04:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gq12-20020a170906e24c00b0072aebed5937sm1762505ejb.221.2022.07.29.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 4/6] configure: Fix ppc container_cross_cc substitution
Date: Fri, 29 Jul 2022 17:04:36 +0200
Message-Id: <20220729150438.20293-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

When moving this code out of probe_target_compiler(), we failed to adjust
the variable in which the target is located, resulting in e.g.
powerpc64-linux-user-linux-gnu-gcc-10

Fixes: cd362defbbd ("tests/tcg: merge configure.sh back into main configure script")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220728183901.1290113-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2c19329d58..c4c02b8438 100755
--- a/configure
+++ b/configure
@@ -2028,7 +2028,7 @@ probe_target_compiler() {
         ;;
       ppc64|ppc64le)
         container_image=debian-powerpc-test-cross
-        container_cross_prefix=powerpc${1#ppc}-linux-gnu-
+        container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
         container_cross_cc=${container_cross_prefix}gcc-10
         ;;
       riscv64)
-- 
2.36.1



