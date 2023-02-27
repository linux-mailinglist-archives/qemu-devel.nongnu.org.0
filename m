Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379316A48D8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhix-0003Np-V6; Mon, 27 Feb 2023 12:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhiv-0003M0-S6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhit-0004MC-PT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytaSPQU0ovd9CMQ6ORSOR/f/EIubPcqWbMAN9HQCyHE=;
 b=iYmzvUeJZ8HO5sUxBzPjr4v23Rq+W0GRnCncL8lryyiFXTO7tgIPBkMaEVqyX9b2cRY2I5
 7tfJE3+DL0f0mqoHwh5LoVzCIVT1lnVKEFw8lhhiFoWuIODX2ziinB+hiTStXxF8qZ0LSU
 YmMFgPXXh3+CMsqTm6+i0T/5GG+XPJU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-KpQ6nTi6P3WQkwNTI3K63Q-1; Mon, 27 Feb 2023 12:55:34 -0500
X-MC-Unique: KpQ6nTi6P3WQkwNTI3K63Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so9745643edh.14
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytaSPQU0ovd9CMQ6ORSOR/f/EIubPcqWbMAN9HQCyHE=;
 b=vFtyIfagxw53kZU4z+5KaWouVTbdg0pN2RE+cDTVZ/HBOKr4VHrrErs+oZVZsAI9hc
 j1li3MZdRnvjLKTAPIefC0PtTsOgMkQBfxl32+ewYJ1lK4nqX/ei6c8wvugtwg8gvMHj
 GSUNgnuVdZGn5+vjJjHTvBBc8oedYEP+p15idTY0apPgUUlFEFwu/7nd4KHaXTGSqda+
 Qq5YH0LX5m2sUCWPWY6VGbSIz2RleW3Ql9bj55+/NNoi62zqnDNkzzWLARNGVUqkJMmd
 gdf1wK2tj7VEkpl0VniL6vD/BsMHXPd9PmRvF0ho1mLkBX2NuDwwp85QgsP7PVFHxa0I
 lAuw==
X-Gm-Message-State: AO0yUKXRNSrJ6WGAf7cZSpZtskz1ABdjwOpf/WDXY6fzA0bQefajisjf
 FmroN84yc/WtEFJAZmEkLIhhA+958AmewmvuQQOxkPOQ3OTZMsWYm4FL0BiStid9Ix6/7BvePla
 zipnEEiwuWRK+WxCsXU1uXF2H6WpdvW6grPTVOjdsj2TZd8WXDNnBQL2BnutStlFhlNLLidDY
X-Received: by 2002:aa7:dbc6:0:b0:4ac:c690:d637 with SMTP id
 v6-20020aa7dbc6000000b004acc690d637mr351631edt.31.1677520532913; 
 Mon, 27 Feb 2023 09:55:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+4E4OunPHNztDPMXS4v3BRIyu78q9y6l1er1//tC9BTJUN3GY4E0iiSdfGqgH7YD4tMLJLRA==
X-Received: by 2002:aa7:dbc6:0:b0:4ac:c690:d637 with SMTP id
 v6-20020aa7dbc6000000b004acc690d637mr351608edt.31.1677520532661; 
 Mon, 27 Feb 2023 09:55:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r30-20020a50d69e000000b004acc5077026sm3414074edi.79.2023.02.27.09.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/13] meson: Avoid duplicates in generated config-poison.h
 again
Date: Mon, 27 Feb 2023 18:55:13 +0100
Message-Id: <20230227175524.710880-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Markus Armbruster <armbru@redhat.com>

Commit eed56e9a89f "configure, meson: move config-poison.h to meson"
lost a "| sort -u".  Restore it.  config-poison shrinks from ~4500 to
~700 lines when all targets are enabled.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230206102037.3621709-1-armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/make-config-poison.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
index d222a0430435..18928542614f 100755
--- a/scripts/make-config-poison.sh
+++ b/scripts/make-config-poison.sh
@@ -13,4 +13,4 @@ exec sed -n \
   -e    's///' \
   -e    's/ .*//' \
   -e    's/^/#pragma GCC poison /p' \
-  -e '}' "$@"
+  -e '}' "$@" | sort -u
-- 
2.39.1


