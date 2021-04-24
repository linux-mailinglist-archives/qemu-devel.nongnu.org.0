Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29736A22A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:40:40 +0200 (CEST)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLKh-0001cZ-M1
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKik-0005sb-MN
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:26 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiO-0004Ld-Bx
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:26 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p8so3349620iol.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VAS9sE+mTu7+251DSMTeCpBzI+coYUq4leMgoBBIuEY=;
 b=oTBeHnaP/CFvCgvkZSrveJDjkt4D6ZfB8Ke4u0hFh1fb9nc4yw0FWlQiCzFv5APUwL
 EGNKaopckFUGa5geAKZ8rz4JN4KYFUnbEcBJkfzmOUnFmC5kCeOj8Q0iviQugaxqdfZg
 1xkrvdKSWqPnN3qFHhUDONISK6jJLvGcT9EuR1hQ/aENKXuVObCN1mkX84zRdn3fpoW+
 VlHnX1lIz5+Oe+IaQLiSDtR+9/4JQrhKQ8mVSERoFNloRpD24UgB2rZlLSJMYh+Q8T3Y
 7k14xcxIe+Z69WWkgwnLlMqINBfGYQNb/iXO+ouBJo6EKRpWMzIkrhu/Z3resGH2ZSIe
 uYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VAS9sE+mTu7+251DSMTeCpBzI+coYUq4leMgoBBIuEY=;
 b=fby5ML4g9DdbPpJpzW9i+5qj+JgK1jeQfFhi5Aoa/W3MyEPAxc+NDxdNdas2jGX1K7
 4rvwM2Ay7dOlJM3nXPQB9g/pM6X5Si+Dq5Rnc5hqwOcKl2AoSPR0p6Z+beJmzMniHJRT
 NomjabIyZ7elWPzyo7EQEzYkX2f0pEOiwHafsdbA4LVsB/T8fiJZZTHA7gBxluebMGQi
 NRFn5PlH1qLkcCPXp8ptENRju+AnBulw3kq4Xd1ocKh4VYSbJuU92RPKK7V2QQt9ASID
 6p6ouazfalYLe860Fdx7ubujPJAI4EtSgeY0Zse7BSsng5jT9Vr1HKH4IuyiV4eLaoAh
 0IVg==
X-Gm-Message-State: AOAM530JJP1DasshI59aTQ2ivNFVyQrX22cVwBci1qhwxdb8zDm/V+kz
 5g81tplZJMHNN1cZYJK36MHvJRLu05Q1DNUz
X-Google-Smtp-Source: ABdhPJyPF145Gzb5I6+6mSyegzYaTgLhofANi243/P36xYTy3eqh2R4S6joZfdqnTt4gvrDhuofuGw==
X-Received: by 2002:a02:c492:: with SMTP id t18mr8232719jam.59.1619280060895; 
 Sat, 24 Apr 2021 09:01:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:00 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/48] bsd-user: style tweak: don't assign in if statements
Date: Sat, 24 Apr 2021 10:00:09 -0600
Message-Id: <20210424160016.15200-42-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/strace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index aa4ab8cee7..94f2b59565 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -80,7 +80,8 @@ static void print_execve(const struct syscallname *name, abi_long arg1,
         if (!arg_addr) {
             break;
         }
-        if ((s = lock_user_string(arg_addr))) {
+        s = lock_user_string(arg_addr);
+        if (s) {
             gemu_log("\"%s\",", s);
             unlock_user(s, arg_addr, 0);
         }
-- 
2.22.1


