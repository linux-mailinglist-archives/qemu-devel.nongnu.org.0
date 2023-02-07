Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A468D5A9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIm-0001vK-KQ; Tue, 07 Feb 2023 06:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIj-0001uT-Oz
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIi-0003yi-De
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80ioF1PilPSnjwNdMorXe4SR8mo0XpUL1Z0aUHRVZCY=;
 b=O4qKsnCG2nh+lB1jV6SswcaHbea9O/MRFX+hbJkqgclXyOsoBF52vk5JFGEF4A/dMuy6KS
 MIxiY1/6P/Oti9F83prdAH9XKQrwrW2Lc2dsaB7jV/P2a0Ip2aGxvOr8PUh8M8/DamVSG7
 FZzLJsrr2KcYffTauqP/kk/wKiNh7sY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-SXQv5y6mOFqzUSaefVh_Fw-1; Tue, 07 Feb 2023 06:38:14 -0500
X-MC-Unique: SXQv5y6mOFqzUSaefVh_Fw-1
Received: by mail-ej1-f71.google.com with SMTP id
 21-20020a170906225500b0088b953a6df6so11034416ejr.20
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80ioF1PilPSnjwNdMorXe4SR8mo0XpUL1Z0aUHRVZCY=;
 b=hV6LRiIDQyv4rLxj5TLnGh5aXDzh0AEExsAZzcogEdOxYGmPvVjBhKIgee1CzRBdhp
 +XY1Za8o4yzn0r+iKS5is1RWuZaJ0tD8q3fBw6BepLxZoLRjd+w/6jF1B2YJdLKQ2IUy
 skeIA7SrGZKXCN2FISY7C3PThaG4X3sCviheZEZrUkz7sqtC2vrWD7Nq8Hktz62V/S0y
 Nb1nEiCEPhZKc7EQWmQaFa0il+hYXLFAeVulfPDxROU49h9MBGPfco7FLCV6GsDdgSeQ
 U9n4rq1hDmBN+kf4XqspF2Rlo3KSwZcumKaLqU91tSV3jcwKMkYxnhveUy7CYHq/toVp
 1/Ww==
X-Gm-Message-State: AO0yUKWudbrW3pAThioudg/XyZJo7u2Vy0mWWfbv+SLElZDpWNL2RUra
 xiw3bKxcB1mTRPNoYRWm3pzNghYpIuZZ5s5UheAT0mENhjxBuvK+8Akpxw9Ud8DIHKuOwxcYbjO
 ajhB4Ac7WsfHy8aov9I8Gz5KOETb5Omo+pxdV97g5SkViVC8sHYTcNd0QE4V1ONG+FdgjOfzF
X-Received: by 2002:a50:a45e:0:b0:4aa:ba82:424d with SMTP id
 v30-20020a50a45e000000b004aaba82424dmr3107614edb.20.1675769892762; 
 Tue, 07 Feb 2023 03:38:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9H9+1eK0epwSaKHqmpagZuSqT/9Uk8FzQKLPHAPLvFmFiJa4UMXmUfb/eetdxTJ854kKhehg==
X-Received: by 2002:a50:a45e:0:b0:4aa:ba82:424d with SMTP id
 v30-20020a50a45e000000b004aaba82424dmr3107599edb.20.1675769892565; 
 Tue, 07 Feb 2023 03:38:12 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa7cc18000000b0049e19136c22sm6237243edt.95.2023.02.07.03.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 1/5] scripts/ci: remove unnecessary checks from CentOS playbook
Date: Tue,  7 Feb 2023 12:38:03 +0100
Message-Id: <20230207113807.67322-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207113807.67322-1-pbonzini@redhat.com>
References: <20230207113807.67322-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since this playbook is meant for a CentOS 8 install, no need to check
the facts.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/org.centos/stream/8/build-environment.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 42b0471634c2..fe8807b7b074 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -17,8 +17,6 @@
         option: enabled
         value: "1"
       when:
-        - ansible_facts['distribution'] == 'CentOS'
-        - ansible_facts['distribution_major_version'] == '8'
         - centos_stream_8
 
     - name: Install basic packages to build QEMU on CentOS Stream 8
@@ -46,6 +44,4 @@
           - systemd-devel
         state: present
       when:
-        - ansible_facts['distribution'] == 'CentOS'
-        - ansible_facts['distribution_major_version'] == '8'
         - centos_stream_8
-- 
2.38.1


