Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605537550B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:46:39 +0200 (CEST)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeKs-0001OG-3R
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeD9-0007rT-4N
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeD7-0007xy-Gb
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4PLS6ZKiwbiAj4ntOkzSZGX4ZG/Ux0v+1o1vvVJrYM=;
 b=fXK2Y/P9RYah5H5Usg5XD7ROW3+c224PC1hsDZg5WY20szqAyp53YtvBheJC5PVPF5TsU5
 hgY7bylhkWSMTg6H6RbwlkuzzflSaZqnLEuT/RatR7SE3Y5lPRN6LqyoXJp5TfYW/qwlwA
 gisZvPU/Vsr4RHGxWQ6Gvt0jGKpBSns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-iCuQ031DM9K9Lq9ikN_D8Q-1; Thu, 06 May 2021 09:38:35 -0400
X-MC-Unique: iCuQ031DM9K9Lq9ikN_D8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso2680310wme.8
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4PLS6ZKiwbiAj4ntOkzSZGX4ZG/Ux0v+1o1vvVJrYM=;
 b=iAe9qcs0WRuPNQD3rzJ6ESQUWpmBBMrft4yLXhGYZoVXoT2zPKqjkX+kxT092tMWgz
 +b/G/5AUpKarSTJ7n2x+uPrmBPITgxTChgU8lDza1yuyaoeiIs84RbWAavfT83M/QvYN
 3Dn5cjpzG+IwpeKalc6J55m1dkmG1RdPZEL2g80aDxTjaaJL9Zpbkd/znJJ33EX1EvHc
 crQ/+Jiarj5DzAoYKUxDgp2Ko3q5A8igZFlG5mKLPk9JWu3qHFNsl3rz8OJHSicF/2Mz
 IgA5EhKcD9+CeoIW2QA1gDz4VSE8ojSrtZ+e4YGYSWtkv6fbW0WhHIw+/vP6ICFe/jAZ
 bclQ==
X-Gm-Message-State: AOAM530Ks0XE6kpNHPEWZlAyVC4sg0b+hFqi8XxT1DCH5KUZUHK5Gggi
 Rz0X8dHV2/ADoZNk+JC0yGIdVNI2lwT0p1V3c8mf8P/7t8GcpI2jB5DuS46HH/xGJlGi10ELk+e
 p8Z+Y1T3u7ggLBKR6WMnO1I10x2yza/N3dh7GmPVa3KNEXrhnfG1UMIqgyS9GyHqd
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5273922wrq.137.1620308314059; 
 Thu, 06 May 2021 06:38:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9OkIRdMCjajJ35Xqm95nwOIWcYI/GC6OCGDnowdoEynI2VdSlNOXJBaO3mbso8BQyxIbuGA==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5273889wrq.137.1620308313868; 
 Thu, 06 May 2021 06:38:33 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id j13sm4830339wrd.81.2021.05.06.06.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] gdbstub: Replace alloca() + memset(0) by g_new0()
Date: Thu,  6 May 2021 15:37:56 +0200
Message-Id: <20210506133758.1749233-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace the alloca() and memset(0) calls by g_new0().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 7cee2fb0f1f..666053bf590 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1487,14 +1487,13 @@ static int process_string_cmd(void *user_ctx, const char *data,
         if (cmd->schema) {
             int schema_len = strlen(cmd->schema);
             int max_num_params = schema_len / 2;
+            g_autofree GdbCmdVariant *params = NULL;
 
             if (schema_len % 2) {
                 return -2;
             }
 
-            gdb_ctx.params = (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params)
-                                                     * max_num_params);
-            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
+            gdb_ctx.params = params = g_new0(GdbCmdVariant, max_num_params);
 
             if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
                                  gdb_ctx.params, &gdb_ctx.num_params)) {
-- 
2.26.3


