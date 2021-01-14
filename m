Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501852F6907
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:15:34 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l079h-0000je-By
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071F-0001uW-Rd; Thu, 14 Jan 2021 13:06:49 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071B-00050U-3x; Thu, 14 Jan 2021 13:06:48 -0500
Received: by mail-qt1-x82d.google.com with SMTP id z20so4174410qtq.3;
 Thu, 14 Jan 2021 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Url9CQwejlSNVB8CBstuu6birLm2MnGqdFIb3oPOLow=;
 b=R9KkAeMSds0g9S7laCkAojnJqh3XtL0k9gtLlYVRWehi8VQfQCvVFzWEpkjm2hKlqM
 IHPT5HnkcIBfw54IrqmlOzdDXS8IFgXEl4cJeybdmpuV2iAsPBTUWJ5BZeN8B8r5AlEj
 6R82KoJUouRrQW2/HkARKUBD33MKgROXTzGGFNFQdf9ESF/Yuj/fJsxZvjiMtuAl90je
 WDvvKBovaXyRJ0Q/A+ymGH00x0qqPYMwY8tl5I5mq30mYOV4zQ41vOnl2gthF5hFdWIG
 GZLg/4XU9jJwPm+xriwC22DqTHD8h+6s3a+pI5h9caqrOKDfhtCvWBCQ/H4qljMrCvYk
 xbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Url9CQwejlSNVB8CBstuu6birLm2MnGqdFIb3oPOLow=;
 b=saro+wEqdFdEdSJN8OQCNAXwtO3JWccIlxxKp2n70Q3fGzqKLgugPCpH8pBDfYpsVp
 cFt1788lKmgzBYJse8n4eSPwOYblToeRtx9WpXlDyGXhi6jcfz5UGCsIea10NnD4oOj3
 Ks9R4b1CMpgo2gTH0QeSSs9yNQfzX7y/1IqsUoFxkmfETOA001LwOyX7I5iPdEtVkOTI
 9QyMOf/yT/c41vFzUTNGf37X4akAV/J/Cy0TRZbHdg6JmjVKNJ7Z384VfYEJq7vbtlKI
 SENiLvN0EvUXasr3i4pn+OXaONoBC0JT8tHh2g+ByhFCw9iBqdz1NmkjL0z8Lj+Tca5L
 q8Fw==
X-Gm-Message-State: AOAM530e0aa1DE+a/BQzJQHquMASTZouY7y8yOvQweYkOjbfbjR5Do9Q
 KJAdBr+nO1W3Nrp2SkrXzmdc4s9NYYY8GQ==
X-Google-Smtp-Source: ABdhPJylv6JhfEX4uUThu//Q5/yaHPFIXNKQ6TG9gwRl+TCtVV9UutB7raEevaiqDTD27/YN9PugHg==
X-Received: by 2002:ac8:71c7:: with SMTP id i7mr7887937qtp.47.1610647603193;
 Thu, 14 Jan 2021 10:06:43 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/7] spapr_rtas.c: fix identation in
 rtas_ibm_nmi_interlock() string
Date: Thu, 14 Jan 2021 15:06:24 -0300
Message-Id: <20210114180628.1675603-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_rtas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 513c7a8435..d014684d60 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -463,7 +463,8 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
 
     if (spapr->fwnmi_machine_check_addr == -1) {
         qemu_log_mask(LOG_GUEST_ERROR,
-"FWNMI: ibm,nmi-interlock RTAS called with FWNMI not registered.\n");
+                      "FWNMI: ibm,nmi-interlock RTAS called with "
+                      "FWNMI not registered.\n");
 
         /* NMI register not called */
         rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
-- 
2.26.2


