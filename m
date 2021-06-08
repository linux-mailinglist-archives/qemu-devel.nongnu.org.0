Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E239F4E1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:25:10 +0200 (CEST)
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZr3-0000b7-C1
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp6-0006Of-1s
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp3-0007w1-TO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so1593748wmg.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4B4UDVuWyPphMAFqZApEmUz2lUeY3/nAYqP7YZ5Zp90=;
 b=Esioscn3SozQQh9SkUYwcrlq/QNbaVslIy3Y+Nmnhly74pb5uJP77j2KK+s9/RR/Qn
 tletnWiobiWxth0WMCuQ24E18i2WVvw6ZVYa24FJ3iFa8wsCBp5dqjjqFmxu6wWey12O
 TM6q01g8W5E0GkBYtheygALni3djwRKOYdUBNACL/MLZIxJYfUJrjCvXrs+J4Vea6LSE
 xefHiVNZ0D+2czBxAwEXbfCxZd5WtfJ+a2+LZj/YhTsE7If1G3ydOvL7ox+yTeKWWpIY
 Cz/MOwsfGlpTMp9cXGSfKTa6fjnWZamWlA+6HKKc82CPtV+fRwEjaHU7igxAMiBHs/Al
 wT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4B4UDVuWyPphMAFqZApEmUz2lUeY3/nAYqP7YZ5Zp90=;
 b=ETXntyR1tQ1p3+SEmjX+H36c0buLQzEni8lNWt4v0rSx6Qf0XVOic39EQiLSqzHo9c
 ThRwLKWZGZfOBtGr04SG2MghHKOHs0Xfaf2lZ0IU8ZeOcnPZQ0+jOWhihELnhygz38LO
 hwse/yPfhOUY9C6X01S83ABalWGDO4SQRtoejxLrAzYp0s53rzv87qK5tbOMUAp6XOa7
 xpyBNvgfnSyaS7OwOoBXp3RixH53evPFR+uVwLl4KDh7Idurh6ZFd30QNwedK4JGrgmU
 ypBDq1QChZaYrsAX1xvAEGzg+JUYDM7A6gVBLGJYfWr6rc8yZee9rhwn5wE2pWI9iYFM
 G5YA==
X-Gm-Message-State: AOAM5320PgR1aLnfBHUir1C7pBSVSUuL/uhHGDoBQopEg4plmbgV5FKX
 u3ZsMBlxgInrrzODVTNpM6FlsRYY9WzIzA==
X-Google-Smtp-Source: ABdhPJw7oMryLeX2IqS3uifHCdmLNiFmVyvKu70swK2FxWjizIKE1b5xztGoMcHGxi5txlPjWmvYaw==
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr3640391wmp.162.1623151383969; 
 Tue, 08 Jun 2021 04:23:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] meson: drop unused CONFIG_GCRYPT_HMAC
Date: Tue,  8 Jun 2021 13:22:36 +0200
Message-Id: <20210608112301.402434-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_GCRYPT_HMAC has been removed now that all supported distros have it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index 7e3902b5c8..43e9c4590e 100644
--- a/meson.build
+++ b/meson.build
@@ -2677,7 +2677,6 @@ summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
 # TODO: add back version
 summary_info += {'libgcrypt':         config_host.has_key('CONFIG_GCRYPT')}
 if config_host.has_key('CONFIG_GCRYPT')
-   summary_info += {'  hmac':            config_host.has_key('CONFIG_GCRYPT_HMAC')}
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
 # TODO: add back version
-- 
2.31.1



