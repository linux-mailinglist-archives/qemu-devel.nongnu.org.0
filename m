Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95865BEF48
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:41:08 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakzM-00057n-0w
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzp-0006HF-D8
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzl-00022d-TI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zmNqQLse27todSNojwG6cPQ7ioarN00Tl0IZY7IVvsY=;
 b=OB2sMWZ9kfEHrMcSO2mWQIWUe9pw4ZfDITrUgH3t7SCpZ4XHMvLbpUzyYYtCYgWEAAN49s
 ulZvAmQM+aXPyMLIb8BiK+sz8IGRD+UpQvENy1D7XQHEGXQADmlmj/cZissQeZDXTZo+Kr
 Ik2TsYYo9u/+/prt5wktDvVqfOFxkQY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-ts6OWSYPPBquvCS08LXckA-1; Tue, 20 Sep 2022 13:25:15 -0400
X-MC-Unique: ts6OWSYPPBquvCS08LXckA-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn33-20020a1709070d2100b007815bfd2c44so1782352ejc.16
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zmNqQLse27todSNojwG6cPQ7ioarN00Tl0IZY7IVvsY=;
 b=rlRE9LmsTY/oSfioDl+f13Xrm1UXyMchuFfphvXUR635lz0F3kK/IrDEAYW/V77FCi
 q4uAXeIUhWFB7X/MvBASH3o8zEnyAM12LjbjMev15sea0oZxEWbx0VVhhhAlap+UbE2N
 CSInQExfa4hJQDpHW7P9snl3zKUkXgwJJhYTeJNYWVBRUmGCLEXxhP5Hl50gN83t+loS
 j7NX4XPt+0x7y01il/MsWkeAkL3Yb6ry2TWDb0nx1HAlGTQsfWmQ/ixc3IcIHh0jTdCU
 CIwFuiSkVNUBUCUkzmNGjQAeJkYde97lK/aaUxBGFbyV7WG+eiROhVSnqGZObqrm/HgT
 8kiQ==
X-Gm-Message-State: ACrzQf21hxzwnxnpfnzJklaJjprV6aMO+6K3lkFYJvgBAVwuMXAaz53s
 F7RRFENrq5CqKHwn6cNooyA9WKZN707a7sFZzAJgrau7giynhujRL3pORMKguW1uQaMfFrC8/qj
 oMPZa5l4B7LAepuGrlbtMBuT7LH8cqCFvCDn+k8axq+ewVBTdpdBI0p+dNdCgd9SWUAk=
X-Received: by 2002:a17:907:70c:b0:740:33f3:cbab with SMTP id
 xb12-20020a170907070c00b0074033f3cbabmr17669743ejb.600.1663694714379; 
 Tue, 20 Sep 2022 10:25:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65Py8nKyfgdAw0fcgsYuE6ahIQgbZp7x6ONOJfBJfYaEuAbNgBwAx+vxct6yOLse5b2PT9Kw==
X-Received: by 2002:a17:907:70c:b0:740:33f3:cbab with SMTP id
 xb12-20020a170907070c00b0074033f3cbabmr17669716ejb.600.1663694714101; 
 Tue, 20 Sep 2022 10:25:14 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a170906768300b0073ddff7e432sm210543ejm.14.2022.09.20.10.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 03/37] target/i386: REPZ and REPNZ are mutually exclusive
Date: Tue, 20 Sep 2022 19:24:33 +0200
Message-Id: <20220920172507.95568-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
index 6802c5a96d..0f45a9f5ad 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4753,9 +4753,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


