Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929A575614
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:01:11 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC51K-0000pk-6c
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC4ze-0007YR-0H
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 15:59:26 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC4zc-0004IS-Ay
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 15:59:25 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10c8e8d973eso3792368fac.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKtmHW7TbJ+sA/FJrSJqZi+DT4mkZ/x6sUJWspipASs=;
 b=gUaGM1+ykNFuprOe1L55dkh02XIuqviyxTe6BhLkX+C5jbesopz+t2hGG77oPc41Hu
 k0sJTw51KZzLzvEp8PNpDZakaduOiX1XKU36bUC8MeDqyb8qserwpDTpnfvipR/piSrU
 WgLbgxmeXVjf5Nzxvaf2pxJRfftv97+Bn858pDfY2HeXjomDn9rFOtKaGYHkiXEI+ivt
 Uxk9vMcm+0wp4ddi1tm/fDzRsVFtCT8sbr38vNs0PGgb0OpgDW9lY5tTVgzCjY51HMzO
 Slt4w6TQCOqSO9LoRt3zHYAueQ+CAk/8jBFLDJ8D73X/noAzQNSr3xN7g6igMVnPpXFv
 tIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKtmHW7TbJ+sA/FJrSJqZi+DT4mkZ/x6sUJWspipASs=;
 b=neCbMk3wsmk+qu9L6AGgX9Mm+8pA/pVuxmZEFWNulc5qLWT4IFDOum9aDLe7eCbsVM
 WsCrzoSnA385oe9Kk8VhTURx6Ef3OhGw112vVVFuS3ct5KsE95DsErYYhY568vhYtnev
 u7qJwp4/deCcVXMmyKjpcSjhX5Q3oKTFtoCS2vmSSj9A6TizHp+VARCHm8gPY3ygNy2J
 FlGCgmIjn/k4yWU55yenwlG3PIN1eIKiD9ww/cN/b8CKT/wIvJWZN5W47Nu5g+z+b8x6
 QWsnSIIUHv48EE3NI9QA54J7m1HHTHbFKDgU0Jqo2mPqfnQYGBQZyOgMyCgIEjiGY05W
 hBBQ==
X-Gm-Message-State: AJIora9fzH0ieWPZjdVz8N2bOF6Pgpb9zMXX3p5S8BptrPEAK2urhyxH
 H1/3t09ltI+yevCnE2Kjm2Rlet15ykg=
X-Google-Smtp-Source: AGRyM1vMkMKmkrV/YB9SiO9BAJ7tyXDo35BboEF8hy7urhXb+sB6zkmtTtHc7c/7N7S6rQ+qycPcBw==
X-Received: by 2002:a05:6870:e612:b0:109:d5fb:144c with SMTP id
 q18-20020a056870e61200b00109d5fb144cmr5445870oag.195.1657828762830; 
 Thu, 14 Jul 2022 12:59:22 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056870618f00b00101cdb417f1sm1284272oah.22.2022.07.14.12.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 12:59:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH] decodetree.rst: add hint about format reuse with '.'
Date: Thu, 14 Jul 2022 16:59:17 -0300
Message-Id: <20220714195917.1013395-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This observation came up during the review of "Move tlbie[l] to decode
tree" patch [1] and it seems useful enough to be added in the docs.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg02195.html

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/devel/decodetree.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 49ea50c2a7..6bcb94f449 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -110,7 +110,9 @@ A *fixedbit_elt* describes a contiguous sequence of bits that must
 be 1, 0, or don't care.  The difference between '.' and '-'
 is that '.' means that the bit will be covered with a field or a
 final 0 or 1 from the pattern, and '-' means that the bit is really
-ignored by the cpu and will not be specified.
+ignored by the cpu and will not be specified.  The same format can
+be reused in multiple patterns by using '.' and let the pattern
+decide whether the given bit will be ignored or not.
 
 A *field_elt* describes a simple field only given a width; the position of
 the field is implied by its position with respect to other *fixedbit_elt*
-- 
2.36.1


