Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5794B6535E2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qk-0001Z0-PV; Wed, 21 Dec 2022 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QO-0001N2-QR
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QM-0004P2-Tj
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZd3HzAjJ9xPg38fGQkpD3Zut3j+7V1bMLg8fvGz+vQ=;
 b=PQ05ZYX/kixVQE/SWtZScdpKq0DBDUloq415W2KhU4g4/OJN1CRaOPQluHlKlbh2ve4SBl
 /1L0F3/Sece+rXr8Xldb0kO3pFN44TLBCHtk/lKGm/Pm7SISkUTmUO72gl/EfLuo0gX/XR
 S+QFAnqJJq4DBAKR1aUEG/KqxhsUuB4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-kEMm7T3tNROM8XuvxQ7hRA-1; Wed, 21 Dec 2022 13:02:36 -0500
X-MC-Unique: kEMm7T3tNROM8XuvxQ7hRA-1
Received: by mail-ed1-f70.google.com with SMTP id
 q10-20020a056402518a00b00472a255eef7so11849411edd.15
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZd3HzAjJ9xPg38fGQkpD3Zut3j+7V1bMLg8fvGz+vQ=;
 b=0/hn9kdQTuy107xkuqeRhWnIVPCBmp7Tow9aKNzWl/jRDiilYV4dkrJ0jrCZp5wg4h
 uBph+rS2ImhoXZ/92saUX7+ergWOPxOagBBqcw5Blu4PAa0ykRwphEtH9hJa/eL6h18l
 gEAFPsFuS9G691IXtigLBCN5d381yj/zpZg9PQLZ5TOmeCIrtuTT8bPXwMHxuvrHIBtR
 pZw/mJCKroxhX3zyxjGDs9lZ/TJ6MjNXoktqWcTYwRRpgLoAbKoxkq9PDstzehBP24vK
 1WFrIc2dAZA5IYXJq/fb0NXtDCtjUi96utdLkoKwcsFjjhBPWJezY4EuXah8ozoFLyam
 wrmQ==
X-Gm-Message-State: AFqh2krnqMIpy6+hF86q1O1wCSsD+px4DUHPhXM1mGD7NdFgBmm6Ri+k
 wbETUCfri8Px3GFle4gs59jLClwc95G79gMOWsonxb0bh8XrpO10yfGXAJ82vKgLU6amuT9Whla
 Ht1eK+1WJpNIaAatnjQVzWsLd1TIRcfR9hw0NW7T51WAZei3XXoRBPWqFD97VW0Vu2YE=
X-Received: by 2002:a17:906:b08b:b0:7c4:f8fb:6a27 with SMTP id
 x11-20020a170906b08b00b007c4f8fb6a27mr6228075ejy.0.1671645754919; 
 Wed, 21 Dec 2022 10:02:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukehTQanpTJLaAQAe7+KkmShGlzM0/wK6j2KU7SM9C/+6Ffc8LXi/oIezcUFP4y+V/dXy1Xg==
X-Received: by 2002:a17:906:b08b:b0:7c4:f8fb:6a27 with SMTP id
 x11-20020a170906b08b00b007c4f8fb6a27mr6228050ejy.0.1671645754601; 
 Wed, 21 Dec 2022 10:02:34 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a17090604d100b007c0e23b5615sm7331579eja.34.2022.12.21.10.02.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] docs: do not talk about past removal as happening in the
 future
Date: Wed, 21 Dec 2022 19:01:36 +0100
Message-Id: <20221221180141.839616-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
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

KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
the sentence describing it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/removed-features.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 63df9848fda2..7e12145c120d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -565,9 +565,8 @@ KVM guest support on 32-bit Arm hosts (removed in 5.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The Linux kernel has dropped support for allowing 32-bit Arm systems
-to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
-its support for this configuration and will remove it in a future version.
-Running 32-bit guests on a 64-bit Arm host remains supported.
+to host KVM guests as of the 5.7 kernel, and was thus removed from QEMU
+as well.  Running 32-bit guests on a 64-bit Arm host remains supported.
 
 RISC-V ISA Specific CPUs (removed in 5.1)
 '''''''''''''''''''''''''''''''''''''''''
-- 
2.38.1


