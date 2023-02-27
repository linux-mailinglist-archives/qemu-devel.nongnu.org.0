Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78C6A43E9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6L-0000Aw-Tx; Mon, 27 Feb 2023 09:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6F-00089c-Tw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:34 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6E-0007p3-93
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id j3so4317185wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hNlq0z7v8fGXrKo5qebTFeTRFjOGloH/Fy/CTfeeYb4=;
 b=S5TiaoVtTAkBeGgcrvMhUebnHH5RtdvsUAPo/ZRtG0xSYFyrBj5WxX15hhGwLpag+s
 peq1EqRNwF3EAX1xloGnUPZaiCEk5aQmgn0dt4wuYzKMLOVcNpnvvpYMZONMbyiY7nZ1
 EGOIt/KXOWu3D/lXrmbIfzIrJyjXia4DLTFAaHbxO4FkQOskiFhBePMZwrzJvDnmgFEP
 /0+QBgBa960xArDwjcMrv/6od04SK7dMYwuU/3r6okMx5CXgbCIPFvuq+iUXYIB0gJ5f
 HAvAyZ5Z748XWMce0eoT/XKko/dYzGAv63sLVi/WndjeYl4+oSgijH713ep1QQWmxUwY
 6xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNlq0z7v8fGXrKo5qebTFeTRFjOGloH/Fy/CTfeeYb4=;
 b=ADGWfLSt1MlzLxJ6L8uoyzxUNhJwKbT/TSFyuiQ+vFal4exKXBSWHTS5IiwgoXEsc/
 i8Hev6vWA3NeXo8KvkU+X4WnNUbIHvrU7xaUrgGgzVDczY+gJcKAVNdPeHLmqqZBY2l9
 jinsvUBwQijDQzxteM8vlm/hJv+VWR+orrjNTTQ3doxGOnNrAQc0eVDOc6p1ElkqU9x9
 We1MHHkrEamn1lz8cAeYKs61DVK49IBCEIId7Hr08WwOtluQnJmCeKeQPcU6eb+hK8A7
 M+oSCDnrgwbYqK/htdgEOVoFAOKU1Yyx1CwDrMsLspxbR4kzQlCqJmTqsbh5IBuOeUsN
 yuoA==
X-Gm-Message-State: AO0yUKXEh9O9MdLb2X4RkstlfRsaBKVcv6LmtyU7qSYLqTNWPQejyuur
 rpporUFJ1xJZBunhU7jKN7t+/9TjSuvleeWR
X-Google-Smtp-Source: AK7set/7gurUpCim7MSSjkoySk8VdFIRxKqQQWTU1yScmVqkHf9ATKOTgm2jJQQlhVreclmWzBGpUA==
X-Received: by 2002:a05:600c:929:b0:3df:3bd6:63e5 with SMTP id
 m41-20020a05600c092900b003df3bd663e5mr18215721wmp.12.1677506609033; 
 Mon, 27 Feb 2023 06:03:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003e21f959453sm9368241wmi.32.2023.02.27.06.03.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 023/126] trace: Do not try to include QMP commands in user
 emulation binaries
Date: Mon, 27 Feb 2023 15:00:30 +0100
Message-Id: <20230227140213.35084-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QMP is not available on user emulation; there is not monitor.
Besides, since commit a0e61807a3 ("qapi: Remove QMP events
and commands from user-mode builds") we don't generate the
qapi-commands-trace.h header in a user-emulation-only build.

Remove the QMP trace commands from qemu-user binaries.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221220150417.26751-1-philmd@linaro.org>
---
 trace/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index d565948b09..8e80be895c 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -89,4 +89,6 @@ if 'ftrace' in get_option('trace_backends')
   trace_ss.add(files('ftrace.c'))
 endif
 trace_ss.add(files('control.c'))
-trace_ss.add(files('qmp.c'))
+if have_system or have_tools or have_ga
+  trace_ss.add(files('qmp.c'))
+endif
-- 
2.38.1


