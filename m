Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB12B6B13
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:07:57 +0100 (CET)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4SS-0007TD-30
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Es-00033K-P7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:54 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Er-0007GN-3K
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:54 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so2630405ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8iCIsS6iawpdK6Fw8H0eciTPNsaXNfuGScuB1cNwv4Q=;
 b=BUfDXxRQpHAxeJStCXJwMfOD+Z1c0ypMLkhDrZNv8XnfwlTPvQYRi+j8/2btF8auEi
 /mlYnHltJKbs5kitmebDgtlKaldgQtfs29rCY6E5kGduSw31nYPhZXAxUWIIClXsWsVx
 03VMnoUZsl2ZGQ3jZD32s7ZikTdIMZtJPffxW+2rXq7WRKX50+5vExgSfL8CYR9t+kax
 Z/f9zvMj/mjMuU2NtWfFQMDbvzNT1/A4+0MQqmeZT1CvkFxxVhfP/gFpBem5Dux0pBjc
 52gl3h9fXjOxgRnC4Hh73EPTpjUOYJwv4LKv0WiERnD1E+A95n1bUE9uKly16CnfOPAy
 XGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8iCIsS6iawpdK6Fw8H0eciTPNsaXNfuGScuB1cNwv4Q=;
 b=pyIc1FB07x6UdiBeRHWbfnbklisWRgTKnnVpeFOS8B6SGQ5B2e4t6bkC61AL1MI5L7
 tJzOatCHo6KPjJY1bmRdfVpHB4gEX1q6Nia/wKk825jsOPWsXrAaFpkxxx9cZEefDe+p
 xcec9H/gpVkOg2llkHhtdrZSOrNMG7SUhYZ21lWLggVe6Pd2v+n+t0TjJfC1I5OLWvxq
 rgqM4IDTpwK85feALLYrqSoErJp6T+a04KVS2aNffmaahP9Cc8cLSTLih1oJrwII9Fpl
 Jri+q0n+S58Dd/YLBEc7S3XPzrk5DQn9rUcB0/SIa+Lm2dfMFXx82FHih5w2rJgn12SV
 tz9g==
X-Gm-Message-State: AOAM530LBAbbL6rw8LA0CP/kQNHdRG2pixL8k7H3jzjjoSBnjKbgrXvY
 LU7VmI7BcYI4GMcEm7R+3knplY3YlfI=
X-Google-Smtp-Source: ABdhPJzT/EB5ZJN2eVWmVjte7wkqVCmpVWRmXiYtSonRLCC2dsuGswierfDUGC1fQ+03OBawBE+Zmg==
X-Received: by 2002:a17:906:6013:: with SMTP id
 o19mr19585693ejj.348.1605632030933; 
 Tue, 17 Nov 2020 08:53:50 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/29] Revert "kernel-doc: Handle function typedefs without
 asterisks"
Date: Tue, 17 Nov 2020 17:53:08 +0100
Message-Id: <20201117165312.118257-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 3cd3c5193cde5242e243c25759f85802e267994f.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2d56c46933..780aee4e92 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1434,7 +1434,7 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+\s*\**)\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+    if ($x =~ /typedef\s+(\w+\s*\**)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
 	$x =~ /typedef\s+(\w+\s*\**)\s*(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
-- 
2.28.0



