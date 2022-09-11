Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8489E5B518C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 00:31:53 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXVUW-0002P4-GJ
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 18:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPd-00060c-L4
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPb-00027r-0r
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662935206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOfvjRkEG8V4EiN/l5Zas0eIix+fi1TGCBANCIiUGiQ=;
 b=RSMzd5hN81nmzujfzX/Vk+An0Nq1YRRhNZyhLRYiKsEfCFZ0mzVoJBCftrjqSxredMVDcY
 hZOHhg3Oh4IASQo8YF0Q5buvFDuIVyNrRQtFO7p2O+3ENUQqTKhT6TIoeE7t8jBFpnYHIL
 TixIuCp8LbmkbewKbiyndHk4TBIZuvA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-bvabX4P-Oru_y4FZcAxUUA-1; Sun, 11 Sep 2022 18:26:43 -0400
X-MC-Unique: bvabX4P-Oru_y4FZcAxUUA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so5016992edb.22
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 15:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LOfvjRkEG8V4EiN/l5Zas0eIix+fi1TGCBANCIiUGiQ=;
 b=x3EtsWzlZOPtWJ5D+b+TFhnPseIBQAcMnCrbmYkQ/nY3IQkOIJhHvfE0VOhQDsu3bz
 CBRySG6zP3x1ancGuvsVjGfje4QMVY/ysGf2tRF/nOCpwp5uKj/OfAqFRrmje2h/Nwmx
 9c9ItvcjFxfHXDQfss0eQyL/Q9hvER8NW+KOL43uianY23RYl+1R4lk01WrPW40xKzYI
 NXd4a0M6gVYbcr1SpJJoxEbsv08USmxwz8MWrhMzOmvDmKoK6PW9lk/ZhG/I7BRRwJfJ
 B76yCNCED8X9sGSm7/A0mSByfnW6jnklKeMxG8H4SBP7PrlBkVuoxsy7Ocaf0zbZ4+4M
 Yhmw==
X-Gm-Message-State: ACgBeo1Kmlv9a/d37xppsfAOtBufew+wpadBrYWj0M9XfdjOroT3ubRq
 CvIzpPBlXQ4YID74Qh8gF1AXgjdNk8uFaHm2dSwhpETDFLCOETsLbRPmbx5+TKWYXrneirH8tg8
 BZiSor4o46Zp5cvX/gXluoM/1nR/ladOuO4ngZZ4kU+AdF19zl6f0Or8YbqIXU/ka4hA=
X-Received: by 2002:a05:6402:e94:b0:443:e3fe:7c87 with SMTP id
 h20-20020a0564020e9400b00443e3fe7c87mr20491044eda.144.1662935202487; 
 Sun, 11 Sep 2022 15:26:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5vwemiek8y4uylKb6WHQREsrTB/3RwhfI4aSuUMvDdEGvg7FCaSu7UDkcdeLwWKOakYm6gEQ==
X-Received: by 2002:a05:6402:e94:b0:443:e3fe:7c87 with SMTP id
 h20-20020a0564020e9400b00443e3fe7c87mr20491036eda.144.1662935202253; 
 Sun, 11 Sep 2022 15:26:42 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 fp17-20020a1709069e1100b007794a742094sm3497640ejc.111.2022.09.11.15.26.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:26:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/i386: cmpxchg only overwrites ZF
Date: Mon, 12 Sep 2022 00:26:30 +0200
Message-Id: <20220911222630.338330-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911222630.338330-1-pbonzini@redhat.com>
References: <20220911222630.338330-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Do not set all the flags, they are untouched other than ZF.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0e9237d627..488a617d14 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5548,10 +5548,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     gen_op_mov_reg_v(s, ot, R_EAX, oldv);
                 }
             }
-            tcg_gen_mov_tl(cpu_cc_src, oldv);
-            tcg_gen_mov_tl(s->cc_srcT, cmpv);
-            tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
-            set_cc_op(s, CC_OP_SUBB + ot);
+
+            gen_compute_eflags(s);
+            tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, ~CC_Z);
+            tcg_gen_addi_tl(s->T0, cpu_cc_src, CC_Z);
+            tcg_gen_movcond_tl(TCG_COND_EQ, cpu_cc_src, oldv, cmpv, s->T0, cpu_cc_src);
+
             tcg_temp_free(oldv);
             tcg_temp_free(newv);
             tcg_temp_free(cmpv);
-- 
2.37.2


