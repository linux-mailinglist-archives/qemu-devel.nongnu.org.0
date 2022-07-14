Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B2574879
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:19:16 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv08-0005ZA-16
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujq-00053O-Mt
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujp-0005vt-6o
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQMelrrZCdqb6pU7FgE8aWy1KpCK3c50YrAQsET7jbs=;
 b=JhUx9pn+mnCnGcasBTJzv3xg6tiCNWtJ3UnexhGOq3alzSFAkkCASstecRYbuE4ye3P0Gz
 TcSHc780dxhB/q9DLCQemKPsnCPf2HGEswPKutQWObDrzNn/vt36tViX0kE4L6I3cl3hfW
 uHi45D+ybctjMao2LlbdlUPnZTGvKFI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-K37zrS7ANxKl2712PDqqfw-1; Thu, 14 Jul 2022 05:02:23 -0400
X-MC-Unique: K37zrS7ANxKl2712PDqqfw-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh39-20020a1709076ea700b0072aa3156a68so498192ejc.19
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQMelrrZCdqb6pU7FgE8aWy1KpCK3c50YrAQsET7jbs=;
 b=C+lLQ0H7pyD/9wyHRBW1MYbxD8R4FzoOhgON37Qbb0Vih2qy5kSARtpg2Nfl+fwRvW
 geV2nPDGm+L6q1TFei4qPfG91NExAEDficZnAgXSAImeapJMyuBP0JFNgpuyPWKZBE9H
 7m7FCHQx0uPeBTHEq6S452iJD8UKsBoiCY+0nlrwxuDD7mpgNGfcmK1Smm1QxUmByUUz
 UXMx9SEjROZcm5tXKLfRhtP53HZVLtJoIaZvA5BWJkEx0ABUBmXK09knEbnWm4WMjj4T
 iyhaVTXtNCICC3TYjbWZJeVLxxoj+7PRKpFPB9fS/KKvXF4zTyocua7BgapzFJCvshxd
 HOyQ==
X-Gm-Message-State: AJIora9GMm4AQCg50KEMJkX88U/4I1WGbHtbSHz/cvKpwKAvEg2xhZWR
 FTQldN4Slj/3+xWCKVz27onrZTR6rHmIEcNGF9lu+GiwCszY/IvMFFuaeSSS8OzyHLSaBN/Q2tR
 QuFQ6ZPOOzLCPzyPYdKrnxhLE3WBHi5zf82nxkdXSD93LuyZjNf28h6wAxHe2GWaXN6A=
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id
 c3-20020a17090654c300b006efd07bc8ecmr7356042ejp.687.1657789341806; 
 Thu, 14 Jul 2022 02:02:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMmoWsYHiRjzd1YfWSO7F/YFTdKEDTzMlgPk3Hfae0oCCU7iWRwIELRbJSM8RjgdsPU/forg==
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id
 c3-20020a17090654c300b006efd07bc8ecmr7356026ejp.687.1657789341521; 
 Thu, 14 Jul 2022 02:02:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 x21-20020aa7d395000000b0043a21e3b4a5sm674097edq.40.2022.07.14.02.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PULL 04/20] module: Use bundle mechanism
Date: Thu, 14 Jul 2022 11:01:55 +0200
Message-Id: <20220714090211.304305-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Before this change, the directory of the executable was being added to
resolve modules in the build tree. However, get_relocated_path() can now
resolve them with the new bundle mechanism.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220624145039.49929-5-akihiko.odaki@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 6bb4ad915a..8ddb0e18f5 100644
--- a/util/module.c
+++ b/util/module.c
@@ -274,7 +274,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
     }
     dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-    dirs[n_dirs++] = g_strdup(qemu_get_exec_dir());
 
 #ifdef CONFIG_MODULE_UPGRADES
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-- 
2.36.1



