Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1042E7AB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:24:12 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbElQ-00012l-05
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYq-00078Z-1x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:12 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYo-0000Ga-AQ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:11 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so6666915pjq.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=yfhKZec0LDBGBWcz/SFkgmWe4Hxqy1jeUB83z/VcalGpDi0LPuHI7ZhGxNuTB+8SfS
 bpPDNIbLbNZeGdNWdTfz5lwp9LTw1HE7gTd03TWio4q0tIrcwPvSBH5xCAT+y3BNFyf4
 C2sjKa5+F9Ssw7cAzsYypfzbDXEUBVmM2OrMwteuFhgt9zef0Hn5B2be0Hluu6E85fiq
 wBTyU06C1/tzYUmCE7AtGoMHOUJU7apE7SZh6dCmGg01NHlkNoDwnGejk+MVbOoug3nQ
 xB3vyntKNIqfJSn/N3SczcJzki2dwjs9aY8WZEIxQ24tqosIDidie49OF2ncn733dbi/
 1IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=pGfFnf8BcEE+Z0wqZnBsHr92/c5nrgiSE5QgcXvqqiV5/HRxGFdxcQ5fE9fvukHMNv
 vugCP0pozRFHnJXvPjBiGL1iFiC2qG+FxmQPplcBktFTViO94qCJWWh8qVtSkBAvLajP
 vf4g2nGgDfPGtDAemPXeHZY2t0LG/IU8P6kjFULV7pf8mT171W3jGWZ/IGLZZKI/Ddvu
 mh6kEOp4PexpsEkGbzogcvSC9ywVhsMKQyf7SRE3vz4RA0jf1TylSAZs3UMsrsuo5/5o
 vM8+VI59zOklEoVEFd/4G5RbHhWqhraUwiu0dLToQJfD8T3fA8tOGKIdVIzqE/eRluL7
 rJCw==
X-Gm-Message-State: AOAM532tOc8or/rsE4xz7G45VYq/Sx2ND6JT9m4WIUH70kj5ihEFyDiQ
 g0PXRgBn8N4i5Pl5sf8XHuAAJKV0sw744Q==
X-Google-Smtp-Source: ABdhPJymKCu4iLVqmVSkph3rYdEqul0TU58eykJoGhtsgsHLO78jjszR1pSpIuMVwQdSqc2FWdZHXg==
X-Received: by 2002:a17:90b:193:: with SMTP id
 t19mr25128945pjs.95.1634271069025; 
 Thu, 14 Oct 2021 21:11:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/67] target/arm: Fixup comment re handle_cpu_signal
Date: Thu, 14 Oct 2021 21:10:02 -0700
Message-Id: <20211015041053.2769193-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1


