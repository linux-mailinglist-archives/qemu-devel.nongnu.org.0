Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6B5BF1BD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:10:24 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanJo-00023i-1X
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001S3-4G; Tue, 20 Sep 2022 15:42:56 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8c-0001rD-AT; Tue, 20 Sep 2022 15:42:37 -0400
Received: by mail-oi1-x22c.google.com with SMTP id n83so5069869oif.11;
 Tue, 20 Sep 2022 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Mioq5iBz6jvjTuxRIz3JQQWuUWCM2+SDRugMC5ZAyK0=;
 b=gV38NCT2dURCV8zSzwRUSlcoGY/+u2ZQJtvqW/bRcO3O/tUUswt8w61x1wvhRKB5cB
 R24I3pWE3dabcWijQYs4LSOrOA6pfxxMyu+UqoWA6fXA4WvFrebblom6+p/JkNJ/sEAB
 uNcsXtAYYhyeRG2RnOof14IglBv4BQO+c+kz3vXy3VGiWGPbDr8WzUE4clYcnlCdpopr
 t35FgpA17k5Ia+x/TUBipvlk+sX04kF2Ateby9FcuH9ZW7RzglYAZNo2vH/h18ScPimC
 yV3WjGR9fbx11EJDGbAhhaugdCe2QJALyvpG18rEQhJ1g7l5pmlaFuY54qncb3C9onnm
 8plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Mioq5iBz6jvjTuxRIz3JQQWuUWCM2+SDRugMC5ZAyK0=;
 b=YmJ0o8nxz5XaWbspNRDENREFXgEzK6RYeYz5X0qR+WXSqn46lAxt6qSes4bZlOgDPV
 T2+S8Nty8GoYAqjyhxCDAOzvX7j14jIFS08++Wt1LnIh420/dbFBU/W0iD8Q4JwmESF3
 RMdZkc15ipkkwuy2tJwfsm9Ve5GtlEvACHvQbHjWXnv9MyF2gY2YBNlqbXnwnY8WtGtc
 B/shCBDD7/Rhd8eY59SFST/tw7XNh4/i6P2w0IjGonPgSQKa9HJ57eURRya8pMImKCRj
 LlX8m7N7x4wQkEnDQkUMHFJuIzy+ueSTiRFFlt2wHvsJQAFk7lL7gQa8yuumcOvRIXvg
 7FoQ==
X-Gm-Message-State: ACrzQf2QS6+EoEInwo/L+etuhKw8gpOyh9jAdhUQ1XwgF2oGOapOpqMr
 XlMprU3yMvi3+DPR9wT9ku4k6S7u3E0=
X-Google-Smtp-Source: AMsMyM5eD5rp/e+Ua9G02Im4HFxoaw2p0KJLuZyEOzzRqUSh5yT523EqMGcDJN7SMVqByGvNCzEkrg==
X-Received: by 2002:a05:6808:5c7:b0:34f:d33a:cfab with SMTP id
 d7-20020a05680805c700b0034fd33acfabmr2397073oij.290.1663702951809; 
 Tue, 20 Sep 2022 12:42:31 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 08/17] target/ppc: Remove unused xer_* macros
Date: Tue, 20 Sep 2022 16:41:53 -0300
Message-Id: <20220920194202.82615-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The macros xer_ov, xer_ca, xer_ov32, and xer_ca32 are both unused and
hiding the usage of env. Remove them.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-3-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 602ea77914..7f73e2ac81 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1506,10 +1506,6 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define XER_CMP  8
 #define XER_BC   0
 #define xer_so  (env->so)
-#define xer_ov  (env->ov)
-#define xer_ca  (env->ca)
-#define xer_ov32  (env->ov)
-#define xer_ca32  (env->ca)
 #define xer_cmp ((env->xer >> XER_CMP) & 0xFF)
 #define xer_bc  ((env->xer >> XER_BC)  & 0x7F)
 
-- 
2.37.3


