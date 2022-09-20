Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCD5BF1A9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:03:10 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanCm-0007Yx-GF
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8X-0001Oe-HK; Tue, 20 Sep 2022 15:42:31 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:37865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8N-0001pn-Hh; Tue, 20 Sep 2022 15:42:29 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 h1-20020a4aa741000000b004756c611188so554127oom.4; 
 Tue, 20 Sep 2022 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xd7qgz5EXg1nfUENgP57u+TinL2OMi1lHaQwYs1oXRA=;
 b=GEiY8DtzRPT/m4bIHqYh1giDOD+u8WkCpKiehKVNFg0sSnfrhHQ3o5e+3rGMqUgNGA
 FgG89Z5rMkaX6RBcgekmsmJORWUOLihBjBqEWs1n2MJFJy/s3MitJuJaz+a5yLcpzPBO
 8uEg50u2AZMZzarrPowujVUtjsk2K/V99+IhKy0vlb3UPy50aNo72EfCPg1mx8Ny6Vaa
 2tk/De1OO5Q/pDBRlZsIpj4igejJAjxBkchyybPQuXkWYZ3ixT21b8WWrA/psVu9xzIq
 QosMu3P/z+ZT0nymMOGMsRkcWuJccfXlXIUjTH7GTfkExxYRVr2l9WRC3qeYYIRoRbkK
 Wq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xd7qgz5EXg1nfUENgP57u+TinL2OMi1lHaQwYs1oXRA=;
 b=jLxwiiuKu1c1gXvMomcxBwnT4IvihWH2pxelWHy+hVffgTPRz38laF76r2YjNdp5Ba
 CN1H3xnFVqPOiSS6ayB+j0pQ2CS2MdvS8EpRMpVzKziwFN0f3dbHiBV9nu6436fHjZy+
 6/QgfQhTQX8k7Vkrb/n3ETlsMDhwo1ON0jC9LMw/IQmpKPJNhmRcKeqbJYMUMrNuso8M
 bjYhbW3jQ0dxbHva22zqxIo6KsnAIs17ZYshQFZZdL5kFCdAsPBOZJxf3bwQabsEHV8y
 D/ux9mh4O5bnSc2ClNtRPQIYrBB/t/qyXXnyqhuABDrPvvuN1RT1UIJw5FdebuAjpbo1
 Qb0g==
X-Gm-Message-State: ACrzQf3gYi4J2pb3MbGmNZIEb77nyYwkb9IsT4GQ6wnpnVQSbTrou+v3
 EppAbkRNHqeMgxhAUr3wQFNVTN5iCHc=
X-Google-Smtp-Source: AMsMyM7STis0A2SoE9Dk5OiNgpmZJydQ0dSfpbcaefAqRZ1R65CjTQBUw3MUpqQemfPTeKsNJ9dr4A==
X-Received: by 2002:a05:6820:44b:b0:476:3049:3d32 with SMTP id
 p11-20020a056820044b00b0047630493d32mr495013oou.92.1663702937780; 
 Tue, 20 Sep 2022 12:42:17 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 03/17] target/ppc: Implement hashstp and hashchkp
Date: Tue, 20 Sep 2022 16:41:48 -0300
Message-Id: <20220920194202.82615-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Implementation for instructions hashstp and hashchkp, the privileged
versions of hashst and hashchk, which were added in Power ISA 3.1B.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Message-Id: <20220715205439.161110-4-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c                   | 2 ++
 target/ppc/helper.h                        | 2 ++
 target/ppc/insn32.decode                   | 2 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7a16991f3d..214acf5ac4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2253,6 +2253,8 @@ void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
 
 HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
+HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
+HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5817af632b..122b2e9359 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -6,6 +6,8 @@ DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
 DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
 DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 544514565c..da08960fca 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -330,6 +330,8 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
 HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
 HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+HASHSTP         011111 ..... ..... ..... 1010010010 .   @X_DW
+HASHCHKP        011111 ..... ..... ..... 1010110010 .   @X_DW
 
 ## BCD Assist
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 41c06de8a2..1ba56cbed5 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -572,3 +572,5 @@ static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
 
 TRANS(HASHST, do_hash, false, gen_helper_HASHST)
 TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
+TRANS(HASHSTP, do_hash, true, gen_helper_HASHSTP)
+TRANS(HASHCHKP, do_hash, true, gen_helper_HASHCHKP)
-- 
2.37.3


