Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C34DEE6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 03:59:00 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he8pP-0008H1-ET
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 21:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a1-0006Wv-QW
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8Zu-0006Qs-6b
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8Zn-0006IO-HD
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id n4so3676934wrs.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pHLIgPBm+zklyrM5916BeOxRgjfHZTPjTZ6RZlLuMzk=;
 b=QZoGYQ+wPiFfxw8CXgKtF95ZYdnGWC4RXOM3Pb59DuOqK3HIaYhfe7NL2DKKrUAONd
 gImYMh5LnG8lM9vGmi3VfncLJdCMkaKLAo7jpGK/0t6kD37eofv5xLZ/7pF0sa0cyla9
 1AMP82b0jUAKgk4nOYeAaJ+rHG9Kf6cs7yag7oJZKvIHwLkOUZpx8iO0fDTTh3O6BSTf
 dC7LXp3wRuw2Cm1V2cl4Q+bT5BjZ1PGdzxhZGLLiKuAFI3h7Be1ep31JSnZe9nXyLfSb
 8LrTq0+Q6oNJcO0L0BtODSU0UEpVqg4wkzfAjwGu30yXpukD6Jyeax1r4n7P3T/rJnn1
 SIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=pHLIgPBm+zklyrM5916BeOxRgjfHZTPjTZ6RZlLuMzk=;
 b=oSzzff98n0OT2ZfEAOUuCwfSTtkHm+bhhPNXqZ6+bunV01KhHTBsPzlP5Es5yHtEKD
 QzTImDIC3o2E9W7yGKZpO0yiH0TfXne6LPs82bWKDIN5/uGNbtNxUxWD1Zsj3MaNC+Ry
 leMdgfCX184V6qktCr41+8FCJ9D9BknVBdyXIMss+GZpsKMkELUxiNhLIHsJgyPg+rxx
 9MvigpKmzf0U4DmSmFgS9TMI5aEpv9m8YMjhY0LwPBzk91/uFUXkf+n6ngwesIwpemv6
 3irlxaARC1rYYD1m3AXh7HVRaqvA+K1UP5R/Q6L23HI6swLHXwjDSzFrKR0vlTuphdnM
 jtxw==
X-Gm-Message-State: APjAAAUgjDiDFYhPF6CCcmTB4q3mOS1COBqM1sI0DaDcT3tj1HJ27Umt
 StKkr2DhyaQDme3fwdYHOWYegRiw
X-Google-Smtp-Source: APXvYqzvn8gwHCAjH3PrZQ3Q45HZ8ya3TLgL1MhOr/9wIArXEu0EY9JthNuF1yeS/3NTYQWB6jNzvQ==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr17299955wrr.235.1561081363341; 
 Thu, 20 Jun 2019 18:42:43 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:15 +0200
Message-Id: <1561081350-3723-11-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] [PULL 10/25] i386/kvm: hv-evmcs requires hv-vapic
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Enlightened VMCS is enabled by writing to a field in VP assist page and
these require virtual APIC.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-9-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 1dfa282..86de510 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -790,7 +790,8 @@ static struct {
         .flags = {
             {.fw = FEAT_HV_RECOMM_EAX,
              .bits = HV_ENLIGHTENED_VMCS_RECOMMENDED}
-        }
+        },
+        .dependencies = BIT(HYPERV_FEAT_VAPIC)
     },
     [HYPERV_FEAT_IPI] = {
         .desc = "paravirtualized IPI (hv-ipi)",
-- 
1.8.3.1



