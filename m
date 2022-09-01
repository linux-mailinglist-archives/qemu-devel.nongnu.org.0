Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B375A9F6B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:51:14 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpHV-0003GY-NP
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosL-0007qs-8r
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosF-0008W5-R2
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfQur2uncjUeIy3Y96znDigVEsnG5bChp/eK5hMKJvg=;
 b=WkuEF/M1/uwh7W3sFufvhy8G//AIW2iraiScP+vR8MOgg8KXt8biidinBEDYyq0Zz03nXM
 sCSwRSIbs6JRUwGR05sLcLjtCUQGdrfSyOjhzrw3mpr7UTa3NZ2dRFLMpHLY+/2st3kQ6P
 60bP6SHsmqrgezndWxVlgCfdPtEs7ao=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-SPeXQRx1MEqiRCAmUME9vw-1; Thu, 01 Sep 2022 14:25:05 -0400
X-MC-Unique: SPeXQRx1MEqiRCAmUME9vw-1
Received: by mail-ej1-f72.google.com with SMTP id
 gb33-20020a170907962100b00741496e2da1so6267689ejc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OfQur2uncjUeIy3Y96znDigVEsnG5bChp/eK5hMKJvg=;
 b=aNM3mN7JxcoI6P199mEza2ZN9XQ/peS2TshU96qg8Z0+0MlJEW/EDuXP4cUe6FrhJ1
 SH0vRShnVn+cAXe0yn3Qj+FWF7a4aPnBnlbmq12xewmG2pLr/epAJS/NMAjmP30G7xvB
 vEQOQLZn+l2tr13L4wBaUrptjyXzJO/4TFe13DLwFxp0dN9OMG/l4MxjR9DWciBN57gs
 njx1+oCrZvnzDBuKALbMeSzaMfFDWibkgRc77HgXCQJ9U5MUTjVy3McirQu14kxjMj2A
 WbcEHYHqthRyBtUmRELLynDfjsi3QIg7g4ivJz8IXujHVYQ8gWWuL6CnW58uUtia8afB
 mEQQ==
X-Gm-Message-State: ACgBeo0+9Mf35S69tgAZAms/XorCeYc7yVZrTUltzYq6zAXmnX8RaGKY
 Dn1yjDmXLa7pSG+i0wVfeouQGjn3zc8iD5Uf+jHGD1Jy6vTa+eY01pf0k4szHEfeLwb1eQ4r7K2
 8OHDCJ9+gxwv7g8POuDJXh2kk1yZAnH26CVJ1+cDNSMmLZazF9tMITENreZ1PNgbKOFU=
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr30245348edc.108.1662056704535; 
 Thu, 01 Sep 2022 11:25:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7DZlMVxZUD/oJiAQ/qj+JOZ1+hOzAvon/nCISiUQ1SxD49tO+dX+PZodtf8/Xcc1/ctbBpgQ==
X-Received: by 2002:a05:6402:3408:b0:43c:2dd3:d86b with SMTP id
 k8-20020a056402340800b0043c2dd3d86bmr30245336edc.108.1662056704262; 
 Thu, 01 Sep 2022 11:25:04 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a17090618b100b0073dc3acfe26sm609002ejf.65.2022.09.01.11.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/39] target/i386: do not use MOVL to move data between SSE
 registers
Date: Thu,  1 Sep 2022 20:24:06 +0200
Message-Id: <20220901182429.93533-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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

Write down explicitly the load/store sequence.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..3237c1d8f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3295,8 +3295,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             }
             break;
         case 0x310: /* movsd xmm, ea */
-- 
2.37.2



