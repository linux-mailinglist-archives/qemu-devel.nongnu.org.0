Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D3607109
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:29:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmTa-0002i2-DA
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:29:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH0-00036o-Up
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGq-0002yN-HO
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGo-0005dR-Tu
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id d24so1583323pls.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WQZzPRazLKJGEWz/VuQ3kFYrNgQhqvNUOfet5eTrD4=;
 b=B4hkVi7Lwa8mwbU7h+eN7W6dirVbhXHKVW/DFysm6huMUbbVPhJ31propZbPBxsMOS
 vcVf4Rgr9ZRtBwa1C+KrrljYr5MAGpqpZ6H6x7F9bAtHPR0d9AiyBuV6fiuqULUB6z9U
 lLsBAOOlCqAdNWxFZo2YKIcQn1rEPE6DLF1DqFe1LFANGh+gKMgJ/e46f0/9sRzxeWYv
 g0rxBfEbp6R1duYZKjch6NYjJSI99z6wDSOTwDq+jnilhh/HpXnOHPJZWybD1rbzS2Ey
 p5kK4LxneXmQvziuuBpM1FoAQTsUJ2P0Ka/BZZU1GEIlHnezvnxSEOiXDjfW2wY4dM68
 Sn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WQZzPRazLKJGEWz/VuQ3kFYrNgQhqvNUOfet5eTrD4=;
 b=EyiEpk3plNj5g/vevcfLBTZh2+MEO+YApu9MlHRhjxd6raUd7cdORCDTUCwhL/7sra
 luTlkqONkBIAuDZuCRVlgkdaylqWmmYtxmAi/ioxNagblN2IrodNyhqGMglHD1kaxM6S
 OlXtEDXFnw/ngFThpcKLi49qb+5S4sHVLDh+PTvrvul0mY/UOtW3ub1tLft8iXfU+Mpi
 ido1cYGt+J0pW8BwBM6H3Mn7ytoHeYtl7YKlJUtqwimd8C3j2CR/8aPwykRs3ooiApLg
 eVyai0qhZ7zg8GkXeXeWM2kpowcIdG2fw732kVZrVtb7qiby6Y0RLsD6AINujoTajM3n
 KSXg==
X-Gm-Message-State: ACrzQf35Kp0VVle6Bm/Ufc3CCpNH7OyUYRsYMfIgEv31MPI6a7S1DrU+
 2847OtBre2sAZEDao6f576oDFX4trM2VIhVl
X-Google-Smtp-Source: AMsMyM5/GVvtAKm0WSXpxG6o30zONxhUJKM05Ga6efhnjp1NIMnbWena+BYQNN6y2wGS5Yx6w5VNEQ==
X-Received: by 2002:a17:902:f7cf:b0:17f:9081:a3f7 with SMTP id
 h15-20020a170902f7cf00b0017f9081a3f7mr17730445plw.3.1666336601644; 
 Fri, 21 Oct 2022 00:16:41 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/36] meson: Move CONFIG_TCG_INTERPRETER to config_host
Date: Fri, 21 Oct 2022 17:15:19 +1000
Message-Id: <20221021071549.2398137-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Like CONFIG_TCG, the enabled method of execution is a host property
not a guest property.  This exposes the define to compile-once files.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 1ec3f72edc..64c87d45a5 100644
--- a/meson.build
+++ b/meson.build
@@ -469,6 +469,7 @@ if get_option('tcg').allowed()
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
+    config_host += { 'CONFIG_TCG_INTERPRETER': 'y' }
   elif host_arch == 'x86_64'
     tcg_arch = 'i386'
   elif host_arch == 'ppc64'
@@ -2507,9 +2508,6 @@ foreach target : target_dirs
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
       config_target += { sym: 'y' }
       config_all += { sym: 'y' }
-      if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
-        config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
-      endif
       if target in modular_tcg
         config_target += { 'CONFIG_TCG_MODULAR': 'y' }
       else
-- 
2.34.1


