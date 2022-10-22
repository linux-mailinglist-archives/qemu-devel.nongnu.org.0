Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48933608D12
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 14:00:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omD7O-00036G-DH; Sat, 22 Oct 2022 07:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD6x-0002z6-EB
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD6v-0006hQ-BO
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666439776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7120nVrCZQMXVeIhLGCLXbQpCT5M2DSZeitOQvwDDh0=;
 b=M+yFraUJSFBovW+Re5EPRKzssMdSeXRtaD3w/VV7UzNIAAnYm9XMY0u5jbg7BES+3Cd8xC
 iB0YRGc3cVy4ein57nrSYm/QJNd1QNli6Ed+8lE8CuEErlgZ2b+qapgK8iLnN37mfTisjX
 DZpnb3ePJrmOYI9ZdPtg4HjP04cwXrQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-arWC5HrrOEultrqdfNFPug-1; Sat, 22 Oct 2022 07:56:15 -0400
X-MC-Unique: arWC5HrrOEultrqdfNFPug-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso5140727edb.3
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7120nVrCZQMXVeIhLGCLXbQpCT5M2DSZeitOQvwDDh0=;
 b=MQUMFejNBZ2EdBF0Rzw7GbUwMoG7ZGxfItSz/j7S5SZsRzFxUhQnCF9at9u+e+q/5O
 B+0ImRA8Etq0siSHJAtZrIc/4cdawm3mITe9W9wfkW+c476PwImMT2CzMz9f6gpbTNaC
 ZUcb4XTpYML0SsYCZeMbJ64AII7aiKR7jt03nCq86hk6qygKLCVEF1X4BJcmnDelEJ7X
 JuSFncjbdQvQDZUiKyNTz0jCQfsextPpsPNbBQJszHwoB/c4ya1mmk+1mmrUpOf8TTjE
 tGv3Z2bWgFvNaDCtfx2EKzbaoZpCRAydY2/c9aED/XWNGGCoEw9I8l5zgQZe7/+aFp/E
 4TYQ==
X-Gm-Message-State: ACrzQf0KPf2Qjyr4i9B/fcr3Pc8S6YkqWuuatHEDQe07VbHkWc7+AGEy
 wb+tc0UMQTvSLj/BkWWcTe6nlr7jbHQVRRUP77mdJGgQmsXrW92wVjl6pNvd560K2L0mrimwEpZ
 ypSN/lcl2RweW/KHvrPtsSX0nvM8FwD/ORYitVx38IjiT219fshlDwdO8Qr7LMG2UElY=
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id
 hj1-20020a1709069fc100b007619192504fmr19951443ejc.116.1666439773710; 
 Sat, 22 Oct 2022 04:56:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gqGaUt1p6qSK2mSLoesU//fYbiqLA88ZafhSPNFpjSXiho/mNbV8aCVKSUJyAnAXHWqgvqw==
X-Received: by 2002:a17:906:9fc1:b0:761:9192:504f with SMTP id
 hj1-20020a1709069fc100b007619192504fmr19951427ejc.116.1666439773417; 
 Sat, 22 Oct 2022 04:56:13 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a056402061a00b0045c010d0584sm14879055edv.47.2022.10.22.04.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 04:56:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/4] target/i386: decode-new: avoid out-of-bounds access to
 xmm_regs[-1]
Date: Sat, 22 Oct 2022 13:56:05 +0200
Message-Id: <20221022115608.152853-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022115608.152853-1-pbonzini@redhat.com>
References: <20221022115608.152853-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If the destination is a memory register, op->n is -1.  Going through
tcg_gen_gvec_dup_imm path is both useless (the value has been stored
by the gen_* function already) and wrong because of the out-of-bounds
access.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 27eca591a9..ebf299451d 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -296,7 +296,7 @@ static void gen_writeback(DisasContext *s, X86DecodedInsn *decode, int opn, TCGv
     case X86_OP_MMX:
         break;
     case X86_OP_SSE:
-        if ((s->prefix & PREFIX_VEX) && op->ot == MO_128) {
+        if (!op->has_ea && (s->prefix & PREFIX_VEX) && op->ot == MO_128) {
             tcg_gen_gvec_dup_imm(MO_64,
                                  offsetof(CPUX86State, xmm_regs[op->n].ZMM_X(1)),
                                  16, 16, 0);
-- 
2.37.3


