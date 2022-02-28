Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C154C753B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:53:09 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkCq-0005ia-Ph
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAI-0002AP-O5; Mon, 28 Feb 2022 12:50:31 -0500
Received: from [2607:f8b0:4864:20::32e] (port=34536
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAH-0007tH-CK; Mon, 28 Feb 2022 12:50:30 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 40-20020a9d032b000000b005b02923e2e6so808141otv.1; 
 Mon, 28 Feb 2022 09:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sv6PV5zO6SxCyrgKDKbOdeQ/0Zn4Tq3YRWmr8mzA1H0=;
 b=EbaT4gR7540h+wYcWGIjhIYq5QjnL30VrNQPt1DxLfZFaJFY2XkK1UsGCnjDJglkcH
 Am3ZX2RcX2+JUKZctVLKFN1Uqw6r57dXbr4hDueOBRCd/tNE4yjPA2KQYRA0kpivriPD
 MZ937w0zwyEKKp8vSCsSrfE4eeD2xExAZg6lRN7M/OH1uyEr2G1mBZAcM04P+g3nK7kx
 725wwBlHhQZP4oVdfiD+uAkgnx+CtuiyHoo4+vngcvhZEOAlB+7UXPIeQeu/yP2Xlq7S
 egDhAQp2pXhcyv/yjYxzTie4T6TTtHdziA4ql/ShqyEUKpaQV6Wwi6XdnPQ63ouAMvUN
 BcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sv6PV5zO6SxCyrgKDKbOdeQ/0Zn4Tq3YRWmr8mzA1H0=;
 b=ARtTWnTyG8TYf9EWxoWpnFRHjwxWNPuoP7CP1KVIaFyOGd8dQRs3Xsll8PM/zQeEgi
 kvrnvRrG15bbYMJxzoV63D+EEAFe0dap5az4wheU9fbyGFiwoqC9MisxrLkZzCXpJqRw
 V422/fPIsh+q8CJuKgJ/urN99NJ2GL3VWH+QgGjrFqM71uMYQcEzr/LL/MzPzsRVAXlB
 oELEz/1MlZmj9bpU/tFcr51AyXVJSa9+uY5iAGZSsxeNOtt8svwZ9Cpf9GUjVDAXEvdr
 +CyR4w8ehQ4/sYTHyqdRzATvNQ2qUEeEgHdSs1sUdCGS7mmkd7yg0sOYy8hxLaLCMY1h
 MPfw==
X-Gm-Message-State: AOAM530nSfQzcZKLGzDJrX5AyrLeG/ga/Yn3S1kuXqBDLXoBBQajRjdA
 KGxoQ5Jil2yg82ICoUKslwYCpQgeJhU=
X-Google-Smtp-Source: ABdhPJycV4ghV1QDOgD1Rhxaou6RvOhcPC4ZMYu1id6/ZroHuW1fyX8Y9y3QsGYSP5FJ2cWswna7Pg==
X-Received: by 2002:a9d:6f82:0:b0:5af:1555:5a9b with SMTP id
 h2-20020a9d6f82000000b005af15555a9bmr10434721otq.289.1646070627362; 
 Mon, 28 Feb 2022 09:50:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/ppc/spapr_caps.c: use g_autofree in
 spapr_cap_get_string()
Date: Mon, 28 Feb 2022 14:49:54 -0300
Message-Id: <20220228175004.8862-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_caps.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index aab313ffb1..2773f9db9e 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -95,12 +95,12 @@ static void spapr_cap_set_bool(Object *obj, Visitor *v, const char *name,
 }
 
 
-static void  spapr_cap_get_string(Object *obj, Visitor *v, const char *name,
-                                  void *opaque, Error **errp)
+static void spapr_cap_get_string(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
 {
     SpaprCapabilityInfo *cap = opaque;
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
-    char *val = NULL;
+    g_autofree char *val = NULL;
     uint8_t value = spapr_get_cap(spapr, cap->index);
 
     if (value >= cap->possible->num) {
@@ -111,7 +111,6 @@ static void  spapr_cap_get_string(Object *obj, Visitor *v, const char *name,
     val = g_strdup(cap->possible->vals[value]);
 
     visit_type_str(v, name, &val, errp);
-    g_free(val);
 }
 
 static void spapr_cap_set_string(Object *obj, Visitor *v, const char *name,
-- 
2.35.1


