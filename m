Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4665BD494
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:13:11 +0200 (CEST)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLGY-0000Qd-LQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg6-0003Ib-CR
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfq-00035Y-VX
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDX1UMHUn3xQ6hIBz5bc12HygCihV0paTI0fj1irANs=;
 b=MW0zVmsvnOMedyoWMQzjPAFBJMGks2TGGNcsX3yVTWJvbmC/u4/UT/M8opIDW4PkuKLHZG
 RrtlVEuL5z1TyZDxyv8oOp9ozgzJP9esa4AnOVozZcvRXUj9MuwppG5j+9okvEcZABhW1/
 o5+rtVpz9hSvHzrGnYkU+o5QOPlcUKI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-o2lw-1PIPvm_gidJWcJTmg-1; Mon, 19 Sep 2022 13:35:13 -0400
X-MC-Unique: o2lw-1PIPvm_gidJWcJTmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r128-20020a1c4486000000b003b3f017f259so8410wma.3
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QDX1UMHUn3xQ6hIBz5bc12HygCihV0paTI0fj1irANs=;
 b=qp93dPfEQqCmUSz3DR5oUAyRRi7AGdKsBkP0ejeHADfvOHsrUuJC9Apy/RnlGeMaN8
 bO5HnTS5wHNejMXeHP1Z4vPS0es8LKJgyyg/wFY3F+E7PmHu8ZpdwpWZSsH9Ho2YxR3t
 JGZ9KjzFBbhW4igEKvcOx1kC9kizocmFQaFg2cqhT0Zl+AlZYbZIRi+bWB+fLPq+cYaD
 eNOV3FYAGPbd1nV7elAw9H/YSTfBGL0+ntrc4c2LFkdoIlrecwPiAa2aV9Y9GW0H8Unp
 uXpJBtK+tMVhreUgtP1ImC3giNBEWWHfWw1KDkePy4GL4khmr/F7/EQoaHAkXRzTdu47
 Jdlg==
X-Gm-Message-State: ACrzQf0qFAUNZiMAfqTLY2zfdS8rimkKreVBFFqkN0CFO3gyECkfjb8W
 RTU9Vqva/MGfR6DpdSoLQIfv6hifKLZYwp9uksm/VTl6KlldatJjGz9wYsFcoy2LBN0rjjWomIY
 4UbCKSraoWDq5vvj3bFwdWW8RJXTgD6BVtHc/H3yZOx0oRCpVwMEerfLBtT3lUd5lqLs=
X-Received: by 2002:adf:f2c9:0:b0:228:63f6:73c2 with SMTP id
 d9-20020adff2c9000000b0022863f673c2mr11309917wrp.554.1663608910262; 
 Mon, 19 Sep 2022 10:35:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6YWKTJqOsNJ1tIMu2mFrogNkf+kCWS2lwlA0mPB3aEsK1POaXeeGTbLZFLvxAIf+rdOqal+w==
X-Received: by 2002:adf:f2c9:0:b0:228:63f6:73c2 with SMTP id
 d9-20020adff2c9000000b0022863f673c2mr11309901wrp.554.1663608909916; 
 Mon, 19 Sep 2022 10:35:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfef01000000b00226dedf1ab7sm14425979wro.76.2022.09.19.10.35.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] tests/tcg: i386: fix typos in 3DNow! instructions
Date: Mon, 19 Sep 2022 19:34:39 +0200
Message-Id: <20220919173449.5864-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


