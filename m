Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E668AE36
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWKm-0000Qp-0V; Sat, 04 Feb 2023 23:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWKg-0000Om-79
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:50 -0500
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWKd-0002lX-G9
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:49 -0500
X-IronPort-RemoteIP: 209.85.166.198
X-IronPort-MID: 256812067
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Pq0FJavVxtLTU+QPETg14oO4c+fnVOhcMUV32f8akzHdYApBsoF/q
 tZmKWqBPaqLY2unc4siYI3kpksOsMCGm9RnS1Zo/CljFyga9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZmOagQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqU09flFX2981
 8UoNRELTR2klfyZ0rKkH7wEasQLdKEHPasas3BkiDDdVLMoGMGTBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2ePVsWawd/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwboqMIITUGq25mG7B+
 GTaon/HLS0mE/KV2Tioy3SKlP7myHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmqSoC4UUTp8DiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7qfamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:Zjp6wKtJi4lsHS8A7qulpuGu7skDpdV00zEX/kB9WHVpm62j5q
 eTdZEguyMc5wxxZJgfo6H6BEDtexPhHP1OkO0s1NWZLWvbUQKTRekI0WKI+UyEJ8SRzJ8/6U
 8ZGZIOceEZCjBB4PoTt2GDYqwdKMvuysyVbfS39QYRcShaL5xt6x59AhuWe3cGPDWvFfICfq
 Z1/KJ8yAZJAB4sH6KGOkU=
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:08:46 -0500
Received: by mail-il1-f198.google.com with SMTP id
 i23-20020a056e021d1700b003111192e89aso5898490ila.10
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaj0P5NfDOj0aUUjOgS+QNvT8LrWmHCX1h2HgFRSCw8=;
 b=iaWD72LH/CAletQXbBr1KVCUHAxY1DGpPgSf59OI6axHIFaR8cNzb4KT1K9Y1Rw+KY
 FUJN7JaA5bcjVfKKnLphqFdxmhq8OoWCFuePnD1scVMmm2TP3v4szAtu040z9HFlAxJi
 VNIwgKVbQH/OIlRmKU//2V1HocqPUolJgu6fR9K6jTmHDzaanXLNTup2zIUJT1KeT+ej
 mbsGdElbfHEF3YoWKgf4q+Jhn2fPgQNeEdPyi6vhD3BSaHbGutRcet1GaHW+c/P5oyv6
 3y7Hk48hgs+jMrHY6maTWbVqocREgyVJDcQ0gia5nm/1VllpGxE6L4oDqlB0CB68FgGU
 bAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaj0P5NfDOj0aUUjOgS+QNvT8LrWmHCX1h2HgFRSCw8=;
 b=e5sq0SFnSyDTcykfGBvRCvEYOfmEmiOl9gnPxHzDz2vhao2CX4QyDSk35r9riPowuD
 Dh4uZbFMBcMU8yivKfel2+pWw/1P/iWWeA3TurM6GMpuS6aOcIi2K58omkkIwu5c06PK
 uzqnra4ZRMeIT3bDOM7lU3aoHjCxw+B6tHqHNzNujsiPErmRrEcJmqiX4NfeGhr2/kYq
 2n2sTsQ6GW671NO/O4UBcQ3zOtCx2KcOh4lSvpWQM6KiH1aeGgb+w0e9PJ/ZyG04nlMd
 hoRULP/7Ga1wQVtS/yqAz9SFPf6pgyShse+GtldkLNxZpundsYC17qYsiaRTizjMf0I+
 Enbg==
X-Gm-Message-State: AO0yUKVwroY2pbklUu5/LwpUZskqNAEu45nSiMhnZZBeJNz/JtHWmyKR
 jIMHwpFJoGiS9f9G2Nr4+QSjdQ2Q+sH7Hb/+IpGAQU7i4d2j+YUX2gDeMGBMgJ3mZZ2vk/HxxEj
 H6a1qZtB7qA4xUdJMlly9k0VSWL4bPg==
X-Received: by 2002:ac8:7f4e:0:b0:3b8:6c8e:4f8d with SMTP id
 g14-20020ac87f4e000000b003b86c8e4f8dmr29735341qtk.68.1675570114446; 
 Sat, 04 Feb 2023 20:08:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9mVHm/Tk+DydRlTWDKhXZMECv1AAgq7duHEV6Bv94/D3oL7YUPLYNrpnvegLZrmMkGMcNnvg==
X-Received: by 2002:ac8:7f4e:0:b0:3b8:6c8e:4f8d with SMTP id
 g14-20020ac87f4e000000b003b86c8e4f8dmr29735322qtk.68.1675570114193; 
 Sat, 04 Feb 2023 20:08:34 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05620a0d4200b00731c30ac2e8sm1387104qkl.74.2023.02.04.20.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:08:33 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v6 3/4] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Sat,  4 Feb 2023 23:07:36 -0500
Message-Id: <20230205040737.3567731-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Advise authors to use the _guarded versions of the APIs, instead.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6ecabfb2b5..fbb71c70f8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2865,6 +2865,14 @@ sub process {
 		if ($line =~ /\bsignal\s*\(/ && !($line =~ /SIG_(?:IGN|DFL)/)) {
 			ERROR("use sigaction to establish signal handlers; signal is not portable\n" . $herecurr);
 		}
+# recommend qemu_bh_new_guarded instead of qemu_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\bqemu_bh_new\s*\(/) {
+			ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
+# recommend aio_bh_new_guarded instead of aio_bh_new
+        if ($realfile =~ /.*\/hw\/.*/ && $line =~ /\baio_bh_new\s*\(/) {
+			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
 # check for module_init(), use category-specific init macros explicitly please
 		if ($line =~ /^module_init\s*\(/) {
 			ERROR("please use block_init(), type_init() etc. instead of module_init()\n" . $herecurr);
-- 
2.39.0


