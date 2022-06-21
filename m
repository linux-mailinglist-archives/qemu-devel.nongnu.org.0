Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBA553BCD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:48:03 +0200 (CEST)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3kn4-0006NT-8X
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3kkY-00056N-UY
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:45:26 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3kkV-0000mb-Nd
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:45:25 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 207000792
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/6TleKqaVgiPruxMXN5Joq92pP5eBmKTZxIvgKrLsJaIsI4StFCzt
 garIBnVbqyMMWLwL4ggYNizpExVv5fcyYVjHVNq/39jF3wa85acVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHvymYAL9EngZqTVMEU/Nsjo+3b9j6mJUqYLhWVnV5
 4mr+5e31GKNgFaYDEpFs8pvlzsy5JweiBtA1rDpTakW1LN2vyB94KM3fMldHVOhKmVnNrfSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/HKbhNq/0Te3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWy4wD5fqw/QmAzpqM3xOOY1ko5CaGC3q2SCT5xWun3rExvxvCAQvI9Rd9LkvR25J8
 vMcJXYGaRXra+CemurqDLkxwJ56fY+0ZOvzuVk5pd3dJf8iUZbPWY3A+JlV0CpYasVmR66BP
 5JBNms1BPjGS0JVZVYOJ4sQpdaTpnynIzMEsHau4rVitgA/yyQ0itABKuH9Y9GPWIBZk1iVo
 krA+GL2BAxcM8aQoQdp6Vqpj+7L2DrlAcccS+X++fltj1megGcUDXX6SGeGnBVwsWbmM/o3F
 qDe0nNGQXQanKBzcuTAYg==
IronPort-HdrOrdr: A9a23:y4xvJ6hbOQkF5GuP2APdHu82JnBQXgAji2hC6mlwRA09TyVXrb
 HLoB19726PtN91YhsdcL+7Sc+9qB/nhPxICOoqTMyftXfdyRKVxehZhOOIsl7d8kXFltK1vp
 0QFJSWZueAaGRSvILRzDP9Pewd4OSqxoiVuMa29QYRceioUc1dBsVCZzpz3ncZeOA/P+tAKH
 NU3KUnmwad
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 16:45:14 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 b2-20020a0cb3c2000000b004703a79581dso8669258qvf.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3flwv5H42e3u1sxBuf2Tsu7X5rDnxqMaIyq6OQiSss=;
 b=TIXozH5o5XmCymIAb5v64J4CZy8wQnb5J49LtwWZesdE/WspR5qQO33XedOz1LdO8O
 orssaHzl9ObnXPVpvmTxA1ZYsHcG5ubXA/vkdJf1W3GCsa9g7e76/lTGkTo5wy+jWstY
 5ATA21NlKCzvBngcly3LLHD+xPJQ1uzPzsCD/cc4RAl9DBdveRGOB844Iotkfcn6OvKw
 fnQayrsOU91gFL5MWYcdIIyZUQIbL1T/wNhlUQUlhGN5CQwYl2pGxpvO3VHRN4f+trj6
 FazRO6nOnCn0Lu7MRU2EWvUtJcs5djA5woyPGr2mQ34+SkYnyMz//tar0xQQNnI8wwh8
 VMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3flwv5H42e3u1sxBuf2Tsu7X5rDnxqMaIyq6OQiSss=;
 b=FKS0Xaum/sLKZ0lPs5Xi19ysjjiPMdVA1Lu4sYkFs8qGg544N4wWD3yjiWP/IEY5q1
 pf3K95SjWUrxI0FXjjBJVoiiKzTxuAWOS1PNyakrqwwWONRlZdWI4VmFxqTfm4gEIlY5
 2EQVtfRnuV8gX5KmZWccrQxkA/Cj8hqxje6uKk9w0onmasJ9vOC7h5TNrC7pSM+gcLgc
 BErlqZhivsr0/+vx/s75aCPijS4nj7CGwanzu2pi+WkOeXB+6X8C0M0HIME1azPosYdQ
 jF/AqDCwdZEzuawSobhsvRYDfYXhR8o3te2ol2PZAhb87wMZzU1DBpJsODQJDzjXDgHY
 wEGg==
X-Gm-Message-State: AJIora/hwe5h7l8T6/DbSe8XA4RXu7cdFoDBAVwFdLx5cMZDYQsbgGf/
 i2CIKi6ulfiU1SUEizsSa47Wff7mPfOzclla0CMW3pBDq3TU0n2874jgHcYGrp3dNLQPcMIpWE8
 bF6NoUlcFk1WSAh6TyidFqwOWHgUsWQ==
X-Received: by 2002:ac8:5d93:0:b0:305:2b38:af70 with SMTP id
 d19-20020ac85d93000000b003052b38af70mr78080qtx.383.1655844313650; 
 Tue, 21 Jun 2022 13:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYlUb74zc4eDcMQhLvQJVKU9xvhgceLVkxoH1BYp6ngYg6YCb0TBm+ZiKnFYN8E60gTuizJA==
X-Received: by 2002:ac8:5d93:0:b0:305:2b38:af70 with SMTP id
 d19-20020ac85d93000000b003052b38af70mr78058qtx.383.1655844313415; 
 Tue, 21 Jun 2022 13:45:13 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006a6bb044740sm15724654qko.66.2022.06.21.13.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:45:12 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH] build: improve -fsanitize-coverage-allowlist check
Date: Tue, 21 Jun 2022 16:45:07 -0400
Message-Id: <20220621204507.698711-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The sancov filter check still fails when unused arguments are treated as
errors. To work around that, add a SanitizerCoverage flag to the
build-check.

Fixes: aa4f3a3b88 ("build: fix check for -fsanitize-coverage-allowlist")
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9efcb175d1..1b255f91ef 100644
--- a/meson.build
+++ b/meson.build
@@ -212,7 +212,8 @@ if get_option('fuzzing')
 
   if cc.compiles('int main () { return 0; }',
                   name: '-fsanitize-coverage-allowlist=/dev/null',
-                 args: ['-fsanitize-coverage-allowlist=/dev/null'] )
+                 args: ['-fsanitize-coverage-allowlist=/dev/null',
+                        '-fsanitize-coverage=trace-pc'] )
     add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
                          native: false, language: ['c', 'cpp', 'objc'])
   endif
-- 
2.27.0


