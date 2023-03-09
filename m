Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5F6B1E87
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtg-0000Fd-5f; Thu, 09 Mar 2023 03:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtc-0000EW-Uc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBta-00006c-KR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wl4naTWDpzNgHd3paa7L+qCQhzgR6ZXg+piNeVf5U4=;
 b=NZYwhJRiCrLnwc4CyYrKV7dk7YAp+MRpPFFNzivqChTiJw/TINTBqAtLiKZ+z9ECc/R6xN
 N/IghiMT52qwpQfYo6LQC9nWV8GGdvz8+oXTFfJTMRuzr6whPDML2u2lVe/yu6/Wtw3f6S
 A0jNH6jbKw+EYeq/sVdvZJHIA94aAAw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-Z9572B2aMIOJewZ3pDy-Cg-1; Thu, 09 Mar 2023 03:45:04 -0500
X-MC-Unique: Z9572B2aMIOJewZ3pDy-Cg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso1874330edb.16
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Wl4naTWDpzNgHd3paa7L+qCQhzgR6ZXg+piNeVf5U4=;
 b=ci9yGwc1A/orlIcn7Nl6apO1MmvkyEB870sxwrvwHluMPJUWMd+WU/a4FV8VHlMONx
 xU/oUiDPizQbFdD2tB/xSeCufAcL7i0dYQS4HpZFhgkGIIP27Y10/M478HqFCjEhQMqf
 tcsEDQeKxJHXqT/WHcmTq/scRuFbFOUM/v1KtPXwNCSCUwtWv4pu+EspowoC0vKGT7PN
 l6imxSwPUou0iih9CE1CxQtjMABh5hr601mbCcOK6goPuNqorM7znq34pYOzhTeHvbTZ
 UE1zHsM3qVK3I5KoHrk3kT8yaACHAORC7sgI6TEKLcddlZ4yH7uy92xD67c5AUUThqHD
 xEaA==
X-Gm-Message-State: AO0yUKXhzE5aCxrG4UsUctojp3sHBqlGlJRjo8rMLAcFlcosMhNK1e2x
 QwHRqzZ55Cp2dyPgbGt0AaiJIAAAaka52OwMT0WGineunoz3XZaxM1PkVj6kOh+ADEZQLbEaOgW
 eod/A2m/rZOAEWCAY0FYcjn6F3I8+iRzJeoOprQkv2PVN1nnL1OYob8sbOsbICX3+e4k2rw1V96
 w=
X-Received: by 2002:a17:906:794e:b0:8df:e176:4837 with SMTP id
 l14-20020a170906794e00b008dfe1764837mr25661718ejo.19.1678351502928; 
 Thu, 09 Mar 2023 00:45:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+8A55JeP2D90wY660Jy24uYfKqD892SggKuwBVnARREP3or3E2VtfjgJk6V2jUjK/8YvAl5Q==
X-Received: by 2002:a17:906:794e:b0:8df:e176:4837 with SMTP id
 l14-20020a170906794e00b008dfe1764837mr25661701ejo.19.1678351502647; 
 Thu, 09 Mar 2023 00:45:02 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a17090636c900b008c801141d58sm8570291ejc.109.2023.03.09.00.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 3/9] mirror: make mirror_flush a coroutine_fn,
 do not use co_wrappers
Date: Thu,  9 Mar 2023 09:44:50 +0100
Message-Id: <20230309084456.304669-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

mirror_flush calls a mixed function blk_flush but it is only called
from mirror_run; so call the coroutine version and make mirror_flush
a coroutine_fn too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/mirror.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 663e2b700241..af9bbd23d4cf 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -886,9 +886,9 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
 /* Called when going out of the streaming phase to flush the bulk of the
  * data to the medium, or just before completing.
  */
-static int mirror_flush(MirrorBlockJob *s)
+static int coroutine_fn mirror_flush(MirrorBlockJob *s)
 {
-    int ret = blk_flush(s->target);
+    int ret = blk_co_flush(s->target);
     if (ret < 0) {
         if (mirror_error_action(s, false, -ret) == BLOCK_ERROR_ACTION_REPORT) {
             s->ret = ret;
-- 
2.39.2


