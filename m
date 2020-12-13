Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA822D90A8
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:52:43 +0100 (CET)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koYME-0006Li-3k
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koYLC-0005kB-66; Sun, 13 Dec 2020 15:51:38 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koYLA-0007uc-MR; Sun, 13 Dec 2020 15:51:37 -0500
Received: by mail-wr1-x443.google.com with SMTP id r3so14460720wrt.2;
 Sun, 13 Dec 2020 12:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xoRsRraGjeDgZRGzOGCYxiblsxhknZvKZMbSLpX9or8=;
 b=QWR/rJ1LORUiUMxMbnZchgfZdNJWs2FoqKA4FzymeAnBUpJJ9LRi9daccKheYm+S/7
 S0+K+ASfE9czUMQof1nx5nqWaS/z8zkFcUC0kvEu5XlnqOUCYkNhK8Yd13DE0kx7e/+t
 NuUFvZbDoHSvIMzLkgUeUby32fWLWsytMrsWApe5IOOvxJdo+55pxgT1oWZiWaePTuu9
 PWexw7yUiuR/LPKwzzPSWIl42tLavQkupJEeOiK1bQqjGK52Ohfdc6h0hTpx1gD1TtXe
 +yy70xG6vcuS0xhOZNmtZbfL168S01G5OPbPgsX0Hb4eY3cN0FEA61RQHXSbN3zCCin2
 z1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xoRsRraGjeDgZRGzOGCYxiblsxhknZvKZMbSLpX9or8=;
 b=IQgKxFwl/iFQkkJTUSI/0J9D3lXdOfBq/Ub1pjKm/kv9jB6yIUOKGRO7zqdIj4w8P0
 T660W+lKEDA7n0sSZuybCrOuZnDVOAPucAA+iJVN4Yb5PpDlRI3CkL0DfBPrOAyuTq5h
 ds4/f9HuzNlzZ5EjBZ0SNQ35tC4o6QjCu5syLiyarOhdFne4UxVwcZaIjgtNqK45CRX3
 23IV08FoA8Cigt4Uv7msM9nSPa5/Fu79nFZlBeG86BkMlRpFnYwWl59S15ZfdfGgxYUV
 ne2Ur/tyT9HRABKlSsRzYaCSeT9fR/RZL/VFCQ46V2G9TM9VWOWC03p4HtG7Dl4K/szD
 9AfQ==
X-Gm-Message-State: AOAM5326r0Nso+3EZheW/IMHsoNsGFMKKm/5tGs2vu//Nc/GN8CKsYhc
 Fu7Yut28EQpYF33krNQHs1dkGmY+Icc=
X-Google-Smtp-Source: ABdhPJyTaVTtrJBg2RL324cci4mfZUtnBL0HavKuo8tLMpG2tp7xtktgB9C6ixPj9+2k+8PX/2cdmg==
X-Received: by 2002:a5d:67c1:: with SMTP id n1mr7939027wrw.205.1607892694425; 
 Sun, 13 Dec 2020 12:51:34 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u66sm28081452wmg.30.2020.12.13.12.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:51:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] scripts/git.orderfile: Keep files with .inc extension sorted
Date: Sun, 13 Dec 2020 21:51:32 +0100
Message-Id: <20201213205132.243628-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sort .inc files along with the extension including them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/git.orderfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 3736c1d6aff..b32203b7106 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -12,6 +12,7 @@
 # Documentation
 docs/*
 *.rst
+*.rst.inc
 
 # build system
 configure
@@ -28,9 +29,11 @@ qga/*.json
 
 # headers
 *.h
+*.h.inc
 
 # decoding tree specification
 *.decode
 
 # code
 *.c
+*.c.inc
-- 
2.26.2


