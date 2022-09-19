Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D15BD484
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:08:35 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaLC6-0003S3-AU
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKgI-0003UQ-2X
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKgE-0003Dw-Lv
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2juENqXZ9tAn1nL0v4LoFaAo4E6Rk3IU7RmOIiZ5244=;
 b=Db5hH1YV8SJsDELHLe+0Vw3ANL4wvPj3HWxD/ri9RTlmZe7OFUv6yMqocAmNDWPQHQ5WRS
 z/Jru7Hf4M+2ZgZ7w2q3Hb3m3LX6urISfJhre9fbKKYWpdw8maDY4hG4yvQUmEyofwYvA7
 5nF368cOLN/8c5eMmVIGVk965WoHPiM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-a9UErLVBPgG7XTR1Dvnc0w-1; Mon, 19 Sep 2022 13:35:20 -0400
X-MC-Unique: a9UErLVBPgG7XTR1Dvnc0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 o25-20020a05600c339900b003b2973dab88so15447651wmp.6
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2juENqXZ9tAn1nL0v4LoFaAo4E6Rk3IU7RmOIiZ5244=;
 b=bV0jeW6gqDg1gHFutIuE9htKjG+Q35NsVr9MqbOC8KtoRUpKpaZ5/ezAVyFwwtfhYh
 Io4mYncodae72Ry2PpXfChwHvsh6wXLJidrMGcCPoQ/dnSbYBmDGHJLTrsxrNx27fpse
 yqSWTqAfGyNJoGyzwEHNk8i0klmHS4VFANdohFJbt18vjCf+x08QD6fnMNl95fK/b3X4
 30w6SyFxqn94NYM85lsQCWP3dXBquLEQbEFatxVbN8ojInEUZ7wny7LYZl4muWlovXsP
 PF+k+K5x7PqO6U6beenQkWaAvE373TnGzEENLPopGsQbU9Qao0Q9afd6buvrrHTldY6H
 XfJg==
X-Gm-Message-State: ACgBeo1OWya081B6Q8SOpr/hXWvRmW6bdF92YUYK9A6IO2RXXw0moiIA
 YuqnEQWe0uIn2/pgfyog9g7BIxAQL5jPFuWOMPEnfIwEqTK431D2q+bue3SwKpHGQZsU3HtvXYf
 iu8Vh1VE1a0qs4ZMxAFNcvKxC9RXFDEvU8eXxtB14TbOG2GrNzc1xOtxed21HQ0fAGlE=
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr19027357wmp.19.1663608919036; 
 Mon, 19 Sep 2022 10:35:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ly6GQjod3Et5wV9FV9doJ8dq695/vPMPV6mtvElAdRMaWsf3XPmvW4PnVNUTT9EJaRiIj+g==
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr19027343wmp.19.1663608918683; 
 Mon, 19 Sep 2022 10:35:18 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 x1-20020adfdd81000000b002205cbc1c74sm10278239wrl.101.2022.09.19.10.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/21] target/i386: REPZ and REPNZ are mutually exclusive
Date: Mon, 19 Sep 2022 19:34:46 +0200
Message-Id: <20220919173449.5864-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The later prefix wins if both are present, make it show in s->prefix too.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5f31a59fb8..eaa56b0f48 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4733,9 +4733,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     switch (b) {
     case 0xf3:
         prefixes |= PREFIX_REPZ;
+        prefixes &= ~PREFIX_REPNZ;
         goto next_byte;
     case 0xf2:
         prefixes |= PREFIX_REPNZ;
+        prefixes &= ~PREFIX_REPZ;
         goto next_byte;
     case 0xf0:
         prefixes |= PREFIX_LOCK;
-- 
2.37.2


