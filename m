Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F2604ADD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:12:54 +0200 (CEST)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAkW-0001wr-Bs
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeR-0000cb-5S
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olAeG-0000Mo-TP
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666191983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuBYYCTu711F3O4Pd3gFFZg+LifHJmKsK8N/H7Zo/9M=;
 b=KJAiiImDgB7ByYnNIWSgov2neRV9YThqDsFAPghpbFdz1stwOveZ3RnfGYGLr1VYmnV8tS
 jMkgkVaKq9602jC9lQP7r9mYVTugfkR9WdmiQMiTbZbfAa78PknQq27noCKH5TQ4ALobMf
 YjNZQ6wgkepueN5Wx2B9/cKqaEkWvqE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-cQlpJ28cNBGcse-K0jlWbg-1; Wed, 19 Oct 2022 11:06:22 -0400
X-MC-Unique: cQlpJ28cNBGcse-K0jlWbg-1
Received: by mail-qk1-f198.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so15188323qko.22
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wuBYYCTu711F3O4Pd3gFFZg+LifHJmKsK8N/H7Zo/9M=;
 b=yMbjLyt0WaXA9lhco/5m+hc58tcEGq3eFX1sApKDn213LHsj6PzMpSskNJonJ+zoh8
 lEzyC1QiTpRmts5qVTM3rSkjw6I1AYLvDo7an+ILhLWqCBl2/3Eix3X80rtTgEqTGBG5
 TTacePc1Sj6tNEFk1Rtp7naKgzdCVLXFzp6n/CBMC4NEOsZ30WbptIPAOMWGjKj/hW07
 Tc+6oMuJZQphfhZAjIOW2cwsg/D2kGIXmekuNkJT2M64yYFnk2zu/kGBXu0K8Q6fU9J5
 GoVwdEGEzMEajJJuspou0BtEI0mjA6a5bGhq9+InJohu8bDO+ggqQJS7OHJOpXaWKukJ
 BwMA==
X-Gm-Message-State: ACrzQf134Mi/B+iF94IarBrUL5h8S0m6VM+wVpD/VwNlf4isBR4zZuSU
 LPmj4Wt4nJcaJfqQItFYliDG6E+JN8T3vfQKEn1EDJew12B7jLblsSM6HfUT3ZtaameDBxHtfnn
 tAamtd2ne6U9zfPNiHgyPskwiG3PTblwLhinU1tfknL049dFjKATXcBD/HyLN3u/z2JU=
X-Received: by 2002:a05:6214:1d09:b0:4b1:cd48:c95d with SMTP id
 e9-20020a0562141d0900b004b1cd48c95dmr7148887qvd.73.1666191981464; 
 Wed, 19 Oct 2022 08:06:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rvspYFSC6cK0BRnp1ju0/GC9rKvj+6lzegjJY3Sak6k+HxrAtPe4G37a9oG7nNYzNpvoVWw==
X-Received: by 2002:a05:6214:1d09:b0:4b1:cd48:c95d with SMTP id
 e9-20020a0562141d0900b004b1cd48c95dmr7148837qvd.73.1666191981030; 
 Wed, 19 Oct 2022 08:06:21 -0700 (PDT)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 c1-20020ac87d81000000b0039a8b075248sm4338563qtd.14.2022.10.19.08.06.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 08:06:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/i386: decode-new: avoid out-of-bounds access to
 xmm_regs[-1]
Date: Wed, 19 Oct 2022 17:06:13 +0200
Message-Id: <20221019150616.929463-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221019150616.929463-1-pbonzini@redhat.com>
References: <20221019150616.929463-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

If the destination is a memory register, op->n is -1.  Going through
tcg_gen_gvec_dup_imm path is both useless (the value has been stored
by the gen_* function already) and wrong because of the out-of-bounds
access.

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


