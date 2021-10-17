Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF429430CDB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:13:23 +0200 (CEST)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFLG-0005tn-Uc
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2V-00052C-H0
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2U-0000hC-55
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id o20so37913174wro.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdfW+2Fy/Jo2WjZ+b7J2DKNaJQHEsPw1hJ7QxxRA4jo=;
 b=ISxTmcDeJGRzAakXDnuthC82AuemQzyNEJ+gE10INR4bvfI7SLcMuX+uSc3BUCNRiU
 /FAu3cIk29ggnqjsiax/HNU6xkNtg6HXDIvZWF828T/lrXoDBZihYwEJsCXZN5uPQXlH
 WhIHuI8Fo5Uzu2NdIu6WLRRm/uRE3Q4alVGwXfFVILhMdlBCJscP8tB6cEok+vzIASnE
 9R0gNWhN3/JUiakyfAvuG/1UIKs378S7UJuLlAILJje/6MJy5LZUqkJBpovtg05Rzunp
 efrVx22Hqd6wLCOiyQT2YRwJj5s523lHln0t1Hp6V5PS/1IYRqUqoyF8OZG2wJCrNoTQ
 XsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xdfW+2Fy/Jo2WjZ+b7J2DKNaJQHEsPw1hJ7QxxRA4jo=;
 b=1BBZ9GmN+zQvu4D1knP/JaPVwsXEv90LsCQ+KnZEhUBOkxiBu0RFECEcn0XN0RuzuZ
 8uqJmP2rU9jfFlNRbgr66u1YKK3c3aXt5bfdiKaurrcYLHtZl8leEXci4fMB+ktZIcJY
 tSsOGdsofaQSyfmDR/z9vM2eLT71wYMmy85yefaqPQbbvbDCfNIVP2n8m5+A06EQdeZ7
 M9MJsRo8gQIoaR6gI/zgz+QIaD459/zi+fEdCoZZ7RKw+6ZAcILv8Eo9RMw9pJF90vnu
 k1C5u1aAlSs+jT4cfpoHCnFsux2gXZzgHzPQg0wfGeXAXU+LAVUgs/6CwvHm6aBqOPme
 CC2w==
X-Gm-Message-State: AOAM532mzuZYU3z/lx9s9GHlLOj0/asHBVgYdFGgX3/wYKPBWPrY6SVr
 7XY+JvrqhuW4cfvHUlhkg/JMppYL3LY=
X-Google-Smtp-Source: ABdhPJwctVCd9Odll9VjvhqVmiSH4mXu72/0aCSHJlKfNwpAipCgTPtZXUZvoBdQA3vb3ULXMNKxhw==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr30137469wrb.259.1634511236651; 
 Sun, 17 Oct 2021 15:53:56 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id u2sm10576354wrr.35.2021.10.17.15.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] via-ide: Set user_creatable to false
Date: Mon, 18 Oct 2021 00:52:42 +0200
Message-Id: <20211017225245.2618892-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This model only works as a function of the via superio chip not as a
standalone PCI device.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211015092159.3E863748F57@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/via.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 94cc2142c70..e91dad632a9 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -217,6 +217,9 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
 
     dc->reset = via_ide_reset;
     dc->vmsd = &vmstate_ide_pci;
+    /* Reason: only works as function of VIA southbridge */
+    dc->user_creatable = false;
+
     k->realize = via_ide_realize;
     k->exit = via_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_VIA;
-- 
2.31.1


