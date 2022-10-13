Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319B5FD97A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:47:06 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixc8-0002kc-Ms
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSt-0001Ue-De
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSp-00040e-Kh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YIetAdnpI8D+qyv00c/9xWcDCY1sjCYTaxA6hToEUXQ=;
 b=SgqAg+T9kPREgdbYL4FQ1YxbLsDn1DenuDKqnSJIXDIu+fprDTfYduA+7wbZfUBeAoEofp
 v+M1qEG+ZCjapvJqkRJsryKmULC6tIzGhyrYOQ/XMTYi8I0PxUktbeSWy4/1FQAgQs18xS
 GJPFZm3T7r0x7phbnozBcA0vDcg5hw0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-nrIF_gWVMieMiZ9XNfQ6rQ-1; Thu, 13 Oct 2022 08:37:21 -0400
X-MC-Unique: nrIF_gWVMieMiZ9XNfQ6rQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ho8-20020a1709070e8800b0078db5e53032so829038ejc.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YIetAdnpI8D+qyv00c/9xWcDCY1sjCYTaxA6hToEUXQ=;
 b=O9yYl1WIsq8TpJEt0A5Oy0kTVjv+WUMsUTq38CXnfwzjHYBe5qtthvNsg0hyIBsSJ0
 n8T04JtvMoQ975VIU59kuCTX1k2YPlArDFGOdes79PJ2HfKnZV+TBTnNPFrcsfDBC+XY
 oYvDwru59b2hWwYvQyEaO8JvthZX+N76JIDApjAjPXI5u8j2n9OfCKgjWB00mos3IR2n
 u4G7Bwx6Vx/i8MhjI9+HDSW0352XgJwL1svRxqKXNQkIl9u2wdrLtfj3dxUzY+IfJkyL
 o7gFxNxdVJytHow4GDjao/Y4iP0S7E4y0YNoWqd2XdR2W4KHLHZWfXWVtc1vsLcnMhhF
 CEzA==
X-Gm-Message-State: ACrzQf0wSVnfMuV9tZmByDFiHjHA7dxXXgWY4lbG++B6MdE9Nng+88QD
 le2NaD7909RjtXfPZ1pIcWVsPcJIp0tipwGPrFxDjg/+bhd53yNtVClefnGjzzqduatOicElJiS
 NSjMtDU/6+3hNbiIc8lFsv3uSz7LMezZ9A/9PXD8R0jyTJX45mgkumYek6oF6CS4ha/U=
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id
 f13-20020a0564021e8d00b0045479a9201fmr32479933edf.176.1665664640416; 
 Thu, 13 Oct 2022 05:37:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZCDpKcMMuag0627gqqxTmy9QJiqwkJHvwyVIlmk2zYXo3/hRdeQ9sskHtjFot4iGjaT8zqA==
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id
 f13-20020a0564021e8d00b0045479a9201fmr32479915edf.176.1665664640152; 
 Thu, 13 Oct 2022 05:37:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906219100b0073d71792c8dsm2926580eju.180.2022.10.13.05.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 02/24] block: remove incorrect coroutine_fn annotation
Date: Thu, 13 Oct 2022 14:36:49 +0200
Message-Id: <20221013123711.620631-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index d30073036e..236b12da2a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2739,8 +2739,8 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     return (pnum == bytes) && (ret & BDRV_BLOCK_ZERO);
 }
 
-int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
-                                   int64_t bytes, int64_t *pnum)
+int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                      int64_t *pnum)
 {
     int ret;
     int64_t dummy;
-- 
2.37.3


