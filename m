Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E7B5BD404
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:45:48 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKq2-00069m-Ob
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfl-0002wD-Bs
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfj-000341-Vb
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNgKFC+0LeVv80K7QBVzhgcaEfabY+PLvf1MTEKFduI=;
 b=Q+GBDc6s5+IAKNt7r+UshlOAZZKgEbt+PcwbEYEKSgjfl0IBjLlh1+62vIVN2kra1/X71g
 JGe4SBnzSVFO81e0PUXiMXCSyjBhqo8ljiy67IDBA2eHIJpe+9SiJL90vEEYd3TivMV6Is
 tk2vILz3/JdMT9p6vBRL55YLEW8i6I0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-rtYXrE7TOiS0nojfjSEc3g-1; Mon, 19 Sep 2022 13:35:05 -0400
X-MC-Unique: rtYXrE7TOiS0nojfjSEc3g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a05600c028500b003b4d2247d3eso1416432wmk.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dNgKFC+0LeVv80K7QBVzhgcaEfabY+PLvf1MTEKFduI=;
 b=heRdeN3+wjzxdaettXjdjDDvYxrg7iv1f8+CUnNnSbKdF+c60RYr+RKvIWciDI05Xr
 lG9+gMTZDhKI7z1Hia7AG6yB81dKwfDc+85S0EW3i98UQuBfi06i19NxmLXk5Ip89Pcs
 uvNAyqaUEIqSX1vxEaSEdosCidqzBQZb+/lrBNuRattWsGlwmfI0+KIwruC8sxqQbfaB
 9mLzbsNQSBX4vdiDc3dDLeliBAHiU4rZnMoI6lpEHKE+L6KXqR5jJBu6aCjPUri4fkvO
 9Zu5esnm85eB86Grp4nKhkhNy+ODA2Ci4pZfxurysNmZoPr0K3PSgqZytWMW7eZQgPvq
 8emw==
X-Gm-Message-State: ACrzQf1I5vxlUl8oXU0hMZswuYHs9ePVr1gaPo/0XRg/Lky0n+dpo+LZ
 WHQSoIy8gjEDQXr3LSwiSMMZbppCtlxnI57D9iRCT0kKgEef3PZHy9XHj6z1Bc7d/mnfmrLbOms
 ebp1DpDAoldiFtzTsInf91KsNbtpqC2I1RbXoO7bXVCoRHlI+psYpOn9obBlcAc6H2MQ=
X-Received: by 2002:a05:600c:4ed2:b0:3b4:c8ce:be82 with SMTP id
 g18-20020a05600c4ed200b003b4c8cebe82mr8044010wmq.118.1663608903879; 
 Mon, 19 Sep 2022 10:35:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7AeEsL5O5ds5MAkeyD5gBEfnectmCa2x32EeOoT0sxoCb/32l4oeHsyYEfdiW2oiHaosj3KQ==
X-Received: by 2002:a05:600c:4ed2:b0:3b4:c8ce:be82 with SMTP id
 g18-20020a05600c4ed200b003b4c8cebe82mr8043992wmq.118.1663608903505; 
 Mon, 19 Sep 2022 10:35:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b003b48dac344esm14727526wmq.43.2022.09.19.10.35.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] coverity: put NUBus under m68k component
Date: Mon, 19 Sep 2022 19:34:34 +0200
Message-Id: <20220919173449.5864-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is only used by the Q800 emulation, so put it under that architecture.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index fc1608932e..0e6ab4936e 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -22,7 +22,7 @@ i386
   ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
 
 m68k
-  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
+  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*|(/include)?/hw/nubus/.*)
 
 microblaze
   ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)
-- 
2.37.2


