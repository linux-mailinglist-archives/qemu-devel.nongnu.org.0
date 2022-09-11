Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D5E5B51CA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:09:47 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW5D-0006l5-0A
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwB-0004m4-TP
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwA-0006Nr-BG
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDX1UMHUn3xQ6hIBz5bc12HygCihV0paTI0fj1irANs=;
 b=MYtOW5/nSDglpLUCS92bP8smV/KYoiTMJPhXgDj1Vp8L49w2HEn0MQ7i6FtxQtDSK3R+Kn
 k0B8ojTaTZ+lEWY8/2f8MQju2OwR0dIsyW8wvmv0fw+3z41vFVxqzwnipLF619Cgr5/p4r
 x/uLil5XVSVHxAVmBj1bK93QrHrCeLg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-laSDWz1tMxeGVyY_D52wkA-1; Sun, 11 Sep 2022 19:00:23 -0400
X-MC-Unique: laSDWz1tMxeGVyY_D52wkA-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020a05640251cb00b004516feb8c09so2147737edd.10
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QDX1UMHUn3xQ6hIBz5bc12HygCihV0paTI0fj1irANs=;
 b=Vgxz7Oph03Tr/CPUnhmSPO0bJtXKJDj+f0XpV+79S07hUMouRRYpkRBwcAR7c6X0QG
 M5eqkqQAz3QVyq7W2WsJISwB3M2i+ARqZR3XxCKD2DJaaRctdC5HNj1ChdH6NBIVWjzB
 XMcnVKzg16ovAucR/e68wWlFeo/Omk03Mwc8q7QotAysUIKU9POo/+bK29UUyCLOY6VE
 LcDfVP9tOkJr4uso7/JqIAFVgozQwFcJxTmoI6M/fcWU3tvd6wxO3cYTkn6Z+EPLhWRW
 N6M9SKZQRhBm+A2LnCbvwWJNhT7q7Bii0A8I9dF6fe/cjVMNGorIUjZ//vBf+StX8OrY
 uOyw==
X-Gm-Message-State: ACgBeo0HHBfIkN4FgwzWY2XFyCbF2/QxXpAJ43k/I5C4qna11MMKjJ7Q
 MGjFH6s52ty7gocIgcI95MR2nEPh3tYD/1RR3CXz7c92ZDdjUSmv20mRAU7pYUqyXiKGhzjzl/N
 o31hrbTJQItPZopesA6QSqgoxncbHD/BagUqz/I/iv+lZrVg4iTmJLoXaxDk2kxSg/5o=
X-Received: by 2002:a17:907:2e0d:b0:77e:8a08:96d0 with SMTP id
 ig13-20020a1709072e0d00b0077e8a0896d0mr360665ejc.378.1662937222543; 
 Sun, 11 Sep 2022 16:00:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6R0qZWDCxgZCWvijxMaVHX9mq2Eubr/btUWTIzmzdCkNhFMss93bog8XT5A/90/JYilSjWhg==
X-Received: by 2002:a17:907:2e0d:b0:77e:8a08:96d0 with SMTP id
 ig13-20020a1709072e0d00b0077e8a0896d0mr360648ejc.378.1662937222208; 
 Sun, 11 Sep 2022 16:00:22 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 23-20020a170906311700b0077958ddaec6sm3442659ejx.186.2022.09.11.16.00.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:00:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] tests/tcg: i386: fix typos in 3DNow! instructions
Date: Mon, 12 Sep 2022 01:00:11 +0200
Message-Id: <20220911230014.340601-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230014.340601-1-pbonzini@redhat.com>
References: <20220911230014.340601-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/x86.csv | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/x86.csv b/tests/tcg/i386/x86.csv
index d5d0c17f1b..c43bf42dd3 100644
--- a/tests/tcg/i386/x86.csv
+++ b/tests/tcg/i386/x86.csv
@@ -1469,16 +1469,16 @@
 "PFCMPEQ mm1, mm2/m64","PFCMPEQ mm2/m64, mm1","pfcmpeq mm2/m64, mm1","0F 0F B0 /r","V","V","3DNOW","amd","rw,r","",""
 "PFCMPGE mm1, mm2/m64","PFCMPGE mm2/m64, mm1","pfcmpge mm2/m64, mm1","0F 0F 90 /r","V","V","3DNOW","amd","rw,r","",""
 "PFCMPGT mm1, mm2/m64","PFCMPGT mm2/m64, mm1","pfcmpgt mm2/m64, mm1","0F 0F A0 /r","V","V","3DNOW","amd","rw,r","",""
-"PFCPIT1 mm1, mm2/m64","PFCPIT1 mm2/m64, mm1","pfcpit1 mm2/m64, mm1","0F 0F A6 /r","V","V","3DNOW","amd","rw,r","",""
 "PFMAX mm1, mm2/m64","PFMAX mm2/m64, mm1","pfmax mm2/m64, mm1","0F 0F A4 /r","V","V","3DNOW","amd","rw,r","",""
 "PFMIN mm1, mm2/m64","PFMIN mm2/m64, mm1","pfmin mm2/m64, mm1","0F 0F 94 /r","V","V","3DNOW","amd","rw,r","",""
 "PFMUL mm1, mm2/m64","PFMUL mm2/m64, mm1","pfmul mm2/m64, mm1","0F 0F B4 /r","V","V","3DNOW","amd","rw,r","",""
 "PFNACC mm1, mm2/m64","PFNACC mm2/m64, mm1","pfnacc mm2/m64, mm1","0F 0F 8A /r","V","V","3DNOW","amd","rw,r","",""
 "PFPNACC mm1, mm2/m64","PFPNACC mm2/m64, mm1","pfpnacc mm2/m64, mm1","0F 0F 8E /r","V","V","3DNOW","amd","rw,r","",""
 "PFRCP mm1, mm2/m64","PFRCP mm2/m64, mm1","pfrcp mm2/m64, mm1","0F 0F 96 /r","V","V","3DNOW","amd","rw,r","",""
+"PFRCPIT1 mm1, mm2/m64","PFRCPIT1 mm2/m64, mm1","pfrcpit1 mm2/m64, mm1","0F 0F A6 /r","V","V","3DNOW","amd","rw,r","",""
 "PFRCPIT2 mm1, mm2/m64","PFRCPIT2 mm2/m64, mm1","pfrcpit2 mm2/m64, mm1","0F 0F B6 /r","V","V","3DNOW","amd","rw,r","",""
 "PFRSQIT1 mm1, mm2/m64","PFRSQIT1 mm2/m64, mm1","pfrsqit1 mm2/m64, mm1","0F 0F A7 /r","V","V","3DNOW","amd","rw,r","",""
-"PFSQRT mm1, mm2/m64","PFSQRT mm2/m64, mm1","pfsqrt mm2/m64, mm1","0F 0F 97 /r","V","V","3DNOW","amd","rw,r","",""
+"PFRSQRT mm1, mm2/m64","PFRSQRT mm2/m64, mm1","pfrsqrt mm2/m64, mm1","0F 0F 97 /r","V","V","3DNOW","amd","rw,r","",""
 "PFSUB mm1, mm2/m64","PFSUB mm2/m64, mm1","pfsub mm2/m64, mm1","0F 0F 9A /r","V","V","3DNOW","amd","rw,r","",""
 "PFSUBR mm1, mm2/m64","PFSUBR mm2/m64, mm1","pfsubr mm2/m64, mm1","0F 0F AA /r","V","V","3DNOW","amd","rw,r","",""
 "PHADDD mm1, mm2/m64","PHADDD mm2/m64, mm1","phaddd mm2/m64, mm1","0F 38 02 /r","V","V","SSSE3","","rw,r","",""
-- 
2.37.2



