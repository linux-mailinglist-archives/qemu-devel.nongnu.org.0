Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DE3B19CA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:21:41 +0200 (CEST)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1sy-0007M0-8f
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m3-0003rR-UR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:31 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m1-0001yx-7c
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:31 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bg14so3647588ejb.9
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NaoA/Gz5B3VaHjNe4o2mJuay6G0a5kmwmmXcYmBXU30=;
 b=Gvb3XDcbe0hiI8n5pi01XgqBTRl+rA8ANzggSIyvpVTzFPep/ZfTE3xFqszlcEpIMR
 6Q1c6Us51Nq8zF4+6b2527ad9hU/dJG6VXOLdleLl3VZuTBGbJXo/NxFaQ6+KeC+8UQ/
 IdCjp4MowyZcT/W3IqJ4RqnioS9vogFOKlq8/5vREIGgwwrrLbfA5fYBh/8vBOowUeYq
 PDbaOyXvjrj7hMagqxUnOQewV7mSKMd6YgHrJFw2nXfu418fphbq9oW7pz44kM1iO27m
 reuweGvjXQl3Jc05cSymvK0BZB1aIx2ejUY3T/75//kQxis5jEAtGjL98zESjGiOX98I
 fqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NaoA/Gz5B3VaHjNe4o2mJuay6G0a5kmwmmXcYmBXU30=;
 b=rFSr8DWMK6Y2V7Kq911Q/v8FAY5t8t2hQQZQXV8a7pvruZWmP9qIUomLFWc0+UgTaT
 4CeuoFIyM1LRDAijsBHiNkE6XZhEK0B/IUbSeOgbGj1k3Mhe999MA+xsIi/IuVf/px2T
 Ev7XxdHUtlNyDBfQo4Hy3/Bj/4QBAdkTnIiJ0ynclPIkFePKJkw/clfNMzzYgle82My3
 PWr53bAZkdyu5QXkNPVI6XTmi0MV+2yyhaB93yNK+AjHppNpiDg6wBy4b4X6BnAJIGbZ
 lbFYZyjwL6cAZVrSOD4uT2i1Jq/CGXRdS9XJMDfuGKqyZby0JV9UwWRvwdsq4OIOWE6s
 4Pcg==
X-Gm-Message-State: AOAM531prDZAAsaZX+A3E2YZMPmeEfeeOcyEpIzDlSdT/2aoU2z8ErCK
 ANEXfdvoIP07cazfnh3ZoMVU98lfAH8=
X-Google-Smtp-Source: ABdhPJwuQCnRx1fgGlbEvvX7941gm9xeddO7Ilq2jCe/iPs41FyQ1I/KO58gs3wwM5zdjFzGXLSkxw==
X-Received: by 2002:a17:906:2b85:: with SMTP id
 m5mr9856466ejg.141.1624450467053; 
 Wed, 23 Jun 2021 05:14:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] meson: drop unused CONFIG_GCRYPT_HMAC
Date: Wed, 23 Jun 2021 14:14:14 +0200
Message-Id: <20210623121424.1259496-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_GCRYPT_HMAC has been removed now that all supported distros have it.

Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index d8a92666fb..87147a5f3f 100644
--- a/meson.build
+++ b/meson.build
@@ -2664,7 +2664,6 @@ summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
 # TODO: add back version
 summary_info += {'libgcrypt':         config_host.has_key('CONFIG_GCRYPT')}
 if config_host.has_key('CONFIG_GCRYPT')
-   summary_info += {'  hmac':            config_host.has_key('CONFIG_GCRYPT_HMAC')}
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
 # TODO: add back version
-- 
2.31.1



