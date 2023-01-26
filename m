Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69667C449
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:27:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKumH-0007LO-Q3; Thu, 26 Jan 2023 00:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKumE-0007L1-U9
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:22 -0500
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKumC-0000rp-Tn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:22 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 253344971
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:45ruM6u3vyiqGR+KIbDXxsNCGefnVOhcMUV32f8akzHdYApBsoF/q
 tZmKWGAOv2DMzf0fd10aYq1oRwD68CByN5rSARq+y9hFn8b9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVkO6gS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqVC9sApDE5A6
 cUCDwsGTjWcu+Gt3ou0H7wEasQLdKEHPasas3BkiCjFVLMoGMGSBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2eO1sWawZ/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwa4GJJo3VHK25mG6zq
 3jGoWD7CyhAbua9wAqa4lKRvN7AyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyUoC4UUTp8TiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7afamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:0LcDGKA1Y7nu9yrlHel655DYdb4zR+YMi2TDGXoBLSC9Ffbo6/
 xG+c5w6faaskd2ZJhNo6HjBEDEewKmyXcX2/htAV7dZniehILAFugLhvqA/9SjIVyFygc078
 ddmsNFebrN5DZB/KPHyTj9OfobhPe8zICUqdH380pNJDsaFJ2ILD0UNu9YKCBLrcV9a6bRbK
 DsnvavbgDOGEgqUg==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:26:18 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 br26-20020a05622a1e1a00b003b62dc86831so364176qtb.8
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1xbLBwy3u4pgrDFz3PbIvoPbIPQ0shmdeGzEwb5b28=;
 b=n/p4K7Ha1MskIdvl9utinTNncF9vVOYpqSKiC7ASjHp4DsgZHmfDS5ghMwcO0dSotn
 xKbKCYl7zvvDc8SclL3hfvb58YsmAzY0ujIm7NAe2zGd2oU2MO0qlkkhNuOAHbSCz6M1
 tiB4X5/MgCHtsFqZbbz6hE3FSOMgdtEtSqE8WDLjVnI3TnodErFu1VtZQRkHrKABL3ic
 u8pTaJ+pf3kIKWcqHOIRbNwJvOLJ2h7cSI7vZLiEoepJqKqfMk1iz8J5ST90Fs9A3wtV
 RpnyXtftlqiZPBMGRNjicTOUdlb67t7LywJyjyTynWhxifvYCSnMErevUWd9pL1PF3cP
 1Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1xbLBwy3u4pgrDFz3PbIvoPbIPQ0shmdeGzEwb5b28=;
 b=VKzBRtlqWIO4HlvlHSX9avng6K6q7BiKMG1rBEQVCBiV3vvVhrHN5LSdNSY61rLBi0
 80+dUdMACbc3ulgfI3w53L1ZTe25l9ynZAyQrlRAHsVRWjZ+Olwxb25F6ZmE4lGdnL1X
 hg+4UhjP28T80Y7lqnt190PsWkujb8VEMnZK26CpYv0hyk4NFlbB6cKPkySkkUVs8at1
 guXr+M11M+1jMEM8dxrGjCdkaLjSTggAxY5DG5l8/VWZCuO4qdI9kSsoqewt2CWTB07s
 unBwBX1O1RodyU7BrZozq8iOKEdly14pQecsr54QSeGFee7g+wu0Aa9syVSN5mSBbMG8
 UI3w==
X-Gm-Message-State: AO0yUKVK9kiiK5Q6DHF2tjXfVtQ+WVNnw9KLppA4fZcFnhxGaYiVWLpJ
 x91LnvI6vAsGPxIrjPKydJ/VO4JvVMwSZXdW+zNsMBmDb/MinWNuZ7nrcFSt2BKQs8NV9Vtl53y
 kSbdbaAxq+yh3WTcWFi+MObtZfJXoPA==
X-Received: by 2002:a05:622a:1001:b0:3b6:3133:4499 with SMTP id
 d1-20020a05622a100100b003b631334499mr9103538qte.1.1674710777184; 
 Wed, 25 Jan 2023 21:26:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/hTz49ErW5kmhlLjUhXEaSlLbSfuytObJCeDir8q9zn1qLdfLg1tHaVraNATFLK3sg/2c5Kg==
X-Received: by 2002:a05:622a:1001:b0:3b6:3133:4499 with SMTP id
 d1-20020a05622a100100b003b631334499mr9103500qte.1.1674710776905; 
 Wed, 25 Jan 2023 21:26:16 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 u4-20020ac80504000000b003a69225c2cdsm149208qtg.56.2023.01.25.21.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:26:16 -0800 (PST)
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
Subject: [PATCH v5 3/4] checkpatch: add qemu_bh_new/aio_bh_new checks
Date: Thu, 26 Jan 2023 00:25:57 -0500
Message-Id: <20230126052558.572634-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126052558.572634-1-alxndr@bu.edu>
References: <20230126052558.572634-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
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

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/checkpatch.pl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6ecabfb2b5..61bb4b0a19 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2865,6 +2865,14 @@ sub process {
 		if ($line =~ /\bsignal\s*\(/ && !($line =~ /SIG_(?:IGN|DFL)/)) {
 			ERROR("use sigaction to establish signal handlers; signal is not portable\n" . $herecurr);
 		}
+# recommend qemu_bh_new_guarded instead of qemu_bh_new
+        if ($line =~ /\bqemu_bh_new\s*\(/) {
+			ERROR("use qemu_bh_new_guarded() instead of qemu_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
+# recommend aio_bh_new_guarded instead of aio_bh_new
+        if ($line =~ /\baio_bh_new\s*\(/) {
+			ERROR("use aio_bh_new_guarded() instead of aio_bh_new() to avoid reentrancy problems\n" . $herecurr);
+		}
 # check for module_init(), use category-specific init macros explicitly please
 		if ($line =~ /^module_init\s*\(/) {
 			ERROR("please use block_init(), type_init() etc. instead of module_init()\n" . $herecurr);
-- 
2.39.0


