Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E6D5AB4D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 15:07:44 +0200 (CEST)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhD4x-0001SX-NV
	for lists+qemu-devel@lfdr.de; Sat, 29 Jun 2019 09:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41207)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCyA-0007zA-5p
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy8-0003bx-KG
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hhCy8-0003Jr-1w
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c27so1283323wrb.2
 for <qemu-devel@nongnu.org>; Sat, 29 Jun 2019 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WY4Omz8Ex3i46XNqwNpqR1lB6EPhNajmxe4fSGYDIiY=;
 b=xolziRgkwLjU5eO/hYooBcYrePyLuD63CCIA/oVQJZY0sdf2SnifrT1BcFtVkci1p0
 dEB3SMY8AHt/if8An24O6O1quolRKLUbpeWmAXoLnbCOc1WNUCtO+6AJ3d/ssgc6lpY2
 noH1oOc+G8nZ5tU+w3mYDfdX3OiNp6ySWwp5P8GT0OlNI/FptO1T90ZeMyKIqGKXO/Rk
 MGy05sO7eMF33/xaA3ypmawibHl7H3Am2VgLAHfDvCVjLKOoMpJ91ta/scNWi+/vIuuw
 T42ZRlXhwCwfPiMRxMcBptk7oZIwtTuVZlZ/nbyD687EYccSmyzG+HHRrfa0wTLYZ5XF
 eqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WY4Omz8Ex3i46XNqwNpqR1lB6EPhNajmxe4fSGYDIiY=;
 b=JxeZQQEBa2ZW/RRmi6SL3ALvQUMDp351EFh07uCVGZ74DffTLlmBA4k07jMDVbSqYJ
 noEKfm6y1PAQDHMtwSzRNavFj5BSFEFDCbREUbX/fehI+Dne883CqL/li7MUiwgGcLCy
 aTUNsdrJZszomXAaDXeCMU1WwaGq00e/z8GBcnTB3GaQ219dLjs0VcYDkZjL+Ui+bbiT
 gl+AP92TBWKoMTQHHWMA9NGflDUe6+lMClvQnT/NigM8pzJw0icmhpRxOXQt5Da5oeJ5
 8iJwo1II9KqC/8/Ia/PWIm3b0uLl9zuZ6EXzB2SK4JhDyEh/xOWD941QxJaqkyWEOBMY
 TyJA==
X-Gm-Message-State: APjAAAUQqsjRRsPmuQ5xK9cGxsABXb1kmZNzDg37VtL44jT29TL1Xi6e
 2f+XiN+vB9xJ9krkjr54sxsrVw1WvzBZpg==
X-Google-Smtp-Source: APXvYqwvFKx9xonn8BTitB4v320TCbn/uiYoAG6t9Wi0DCRITHt9OmrxUzO4yW/ruHVlpTB/oN2DkA==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr11523581wrn.54.1561813222027; 
 Sat, 29 Jun 2019 06:00:22 -0700 (PDT)
Received: from localhost.localdomain (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id d10sm4937676wro.18.2019.06.29.06.00.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:00:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 29 Jun 2019 15:00:04 +0200
Message-Id: <20190629130017.2973-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190629130017.2973-1-richard.henderson@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: [Qemu-devel] [PATCH v6 03/16] tcg/ppc: Introduce macros VRT(), VRA(),
 VRB(), VRC()
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
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce macros VRT(), VRA(), VRB(), VRC() used for encoding
elements of Altivec instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.inc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 9e560db993..cfbd7ff12c 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -473,6 +473,11 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define MB64(b) ((b)<<5)
 #define FXM(b) (1 << (19 - (b)))
 
+#define VRT(r)  (((r) & 31) << 21)
+#define VRA(r)  (((r) & 31) << 16)
+#define VRB(r)  (((r) & 31) << 11)
+#define VRC(r)  (((r) & 31) <<  6)
+
 #define LK    1
 
 #define TAB(t, a, b) (RT(t) | RA(a) | RB(b))
-- 
2.17.1


