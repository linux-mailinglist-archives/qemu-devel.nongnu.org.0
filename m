Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AA33A24B7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:48:46 +0200 (CEST)
Received: from localhost ([::1]:59792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEUf-0001jm-1R
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrES9-0007Tj-5C
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrES6-00055i-EY
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTE3q/L3zX2olanVbDbjGlNnVrM20+mQiCxT9CvYLMk=;
 b=ZjyKC/Jdx7f9XIprK3NVYO5iEeea4onjwnz2kRa1AsfAfXoQScX//FlIyZI8fMmVDsFCXR
 JhMvqILlkkCWA5bHWBbV5rtHfocVPEJRszs3XiuNYr0QV/trvNecdMPtka3cJpwIDMtvrP
 I5bAX5z54JQxtLeOq/YY26Z2oBv447w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-dSOsBZSRM5-AipSXHB-ScA-1; Thu, 10 Jun 2021 02:46:04 -0400
X-MC-Unique: dSOsBZSRM5-AipSXHB-ScA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so423694wrd.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KTE3q/L3zX2olanVbDbjGlNnVrM20+mQiCxT9CvYLMk=;
 b=Ux5uUB5GjPUWh8hPncEVe7vMz98ddEfgHhUYl8ZUGQxuk1VGQcxRUjE32Bpu/CZ8PW
 5yUQoYR+RikYkIbhbJ81mO3w5WpelOmm9JWGWrZfY8UcJPZck2MkzAoTIEE1ydsOG2YA
 BatIUnHUQJQ9fU3LeC5vJeFDvuDRsogohwjmkyOjsjgc5MQoS7zxhB/bAxMejG7l19i+
 lnuQBvWkTA2Wng3yfFCeGniPC7TUZ1QYK2PoS+eH5mkrkWSMoNRLMh1yEJ63Gfbxvfhh
 cHu7SB4SPg4L7gjlhC3FqDVjskCITC8HY/lciAhHjnraOuraU8Iepo6VWf0Qz/1NkgT9
 Zawg==
X-Gm-Message-State: AOAM530ylG70N9bp5R2rfmVGzITsut1Ojnw706lCzDVJY/0dsTfqzU8F
 1vJpCEIY79Vwy2Y5e67vdCCnGLXWts+NOutrj/0JVaJuoevvJHvgOfol8G5/S1Uw8V86J0lRGjC
 I7bkCbZLrpMvFkIVnNOyADFtbeqqzGIBEJC3n5d2oWPHkfqfDBlaNUPnYy/LnTThh
X-Received: by 2002:adf:82a3:: with SMTP id 32mr3458048wrc.136.1623307563190; 
 Wed, 09 Jun 2021 23:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3uVWgGvxAZag/6LTsU9LqoIL6Y+rsidBBSrloLYd7Hfw5JQlXWNY1orKvivVNb5ptzcztzA==
X-Received: by 2002:adf:82a3:: with SMTP id 32mr3458011wrc.136.1623307562959; 
 Wed, 09 Jun 2021 23:46:02 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a15sm2828880wrs.63.2021.06.09.23.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV
Date: Thu, 10 Jun 2021 08:45:46 +0200
Message-Id: <20210610064556.1421620-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

It may not be appropriate for me to take over as a maintainer at this time,
but I would consider myself familiar with AMD SEV and what this code is
meant to be doing as part of a VMM for launching SEV-protected guests.

To that end, I would be happy to volunteer as a reviewer for SEV-related
changes so that I am CC'd on them and can help share the review burden with
whoever does maintain this code.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <20210608192537.103584-1-ckuehl@redhat.com>
[PMD: Cover more files]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56888121ec8..a93f4ba1861 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2938,6 +2938,13 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+AMD Secure Encrypted Virtualization (SEV)
+R: Connor Kuehl <ckuehl@redhat.com>
+F: docs/amd-memory-encryption.txt
+F: accel/kvm/sev-stub.c
+F: target/i386/sev*
+F: include/sysemu/sev.h
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.31.1


