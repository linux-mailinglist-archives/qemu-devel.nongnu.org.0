Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF946732
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:12:15 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqgR-0003Ta-4N
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58669)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqj-0005bZ-71
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqf-0007A5-Ac
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqe-0006o3-AS
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id n4so3355612wrs.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2oEJPPTu0XotTJyTG/icubFdccUFHMYcxjFSxZmE7E=;
 b=zV9KljVm7HRXtaa5nQ3r6/hpHMVfa5fDVTakmt+t8rjZR0BRKWZyEbYhLGfmcdhEN9
 xXU1hgnVM2SntB/EYjF74Ai8teDFM5m3VneiW+Dm6CaR+1JZmbiCZQmbF7g53BEulpxK
 /B1UNrQA/eACnE+0TeGJNCpOjijTwgdua/U4aCQzPoM5WNOVLJTvconYfVW1u0tnl/A4
 fc5upEoumWoxstCduCLtwNhbxdJO1VijqOlCDJWda4vdsio9qQd0pgp7dHSP607nNeHw
 VobWLqwpHxdP8aVawH/8U7oGPJVkpQSg5cUzqdzL/BtguJ6bRGfEi7Fu3GxikRR4+F1/
 kklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2oEJPPTu0XotTJyTG/icubFdccUFHMYcxjFSxZmE7E=;
 b=Q7uabZkr32tvzF0c5c+JoJu+AKcdc3+CgeBIp52J940XfVOuzpm3aFG+AJUAOT/T/U
 pSkJoIrR/w+yUACe/bemq+rnkVShYvCI2ChRLYVQUky/leLdbvFrmEiyc8nlamb2QIZa
 fVtqsaN0pNPXk9ybeD3MhiXbntpPTRq1+z/UGWPDATQjSF99sruXRWh4zGpor0jl5fv5
 u93So6At83UeQdnvdUmN+WYbZqejJg6CFgozbYEH07V10aHET0aAWgFxcc8FS9QVejZ4
 BhIRrzFUNZzwiymuIJGBK/suN7zwDkPAfP+Z0+fyQad9L0DrsN0aRA7zt5qvngAbW5Ll
 xbiQ==
X-Gm-Message-State: APjAAAXnc+5EYB2AdcVTftvJxEKYKhKbaBVLDqh0/M4qacJ5f9hd5bex
 Dl7U+blXvf9bwCPnXyRWnW+NSg==
X-Google-Smtp-Source: APXvYqwJNWKxqA9UsjX/FQ+SgmC03tf1hyTlBPzQju3SBUCxIhlsRWlQQjNy0RNYGEkhgWM13n5qBQ==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr13474318wrt.227.1560532716650; 
 Fri, 14 Jun 2019 10:18:36 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id i12sm3588188wrs.43.2019.06.14.10.18.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:34 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D28DC1FFCA;
 Fri, 14 Jun 2019 18:12:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:59 +0100
Message-Id: <20190614171200.21078-50-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH  v3 49/50] include/exec/cpu-defs.h: fix typo
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/cpu-defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 354788385b..b529c2013e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -241,7 +241,7 @@ typedef struct CPUTLB { } CPUTLB;
 #endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 /*
- * This structure must be placed in ArchCPU immedately
+ * This structure must be placed in ArchCPU immediately
  * before CPUArchState, as a field named "neg".
  */
 typedef struct CPUNegativeOffsetState {
-- 
2.20.1


