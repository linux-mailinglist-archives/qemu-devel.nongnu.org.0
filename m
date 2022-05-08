Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5219651EC8A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:37:54 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndMP-0001Aa-79
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGP-0001ec-JP
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGN-0008Pt-Vm
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uv+wMdkn8fKZ5tfLdhBHRhBzVWdj1htzdQqNI2/aivk=;
 b=MtL2+znj1fsftslcGWCt8xiaysyUEJZARnxnUn61ycVjuhWZfiL3P17tKL0SWbD9uSN//g
 yE0B00cmfUVZgFtGlIlloAIRHr1+ieZs8Lu0k8jvhw3dbSY7qEJeK28uvEFz8S1c51OEUq
 Rjs6UpksnfkfVh0LzmjagxEpN1iFQe4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-c2dpe1-dOVqhrDfjYel6-g-1; Sun, 08 May 2022 05:31:38 -0400
X-MC-Unique: c2dpe1-dOVqhrDfjYel6-g-1
Received: by mail-ed1-f72.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so6550496eda.5
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uv+wMdkn8fKZ5tfLdhBHRhBzVWdj1htzdQqNI2/aivk=;
 b=Pda2zY95rdCH6T3RDFs1kfKGnsSwbS9evkiNBdCXhOXL4LaAFfDCXmrfyb36WCVGfN
 sn2GJic2WS4g4V66lrhlN6iz9jb7JJkjxRFYMU5dKF1erF/VQhS4Lt+Xc0OV54/uBNeq
 +jhFlbZ9mSIAYbS+sfCPHoKXRu8Ryeq23hDUuh+XaYMFQihjOQvOe+8/n9tk3tm1+9Dv
 /MAM/1u9wU0jb4ZuGocH+7nx7Wk90xbkpzmfUZ/+5LtQ5DKoBmljUw6eS2gF75yqUeEz
 UeDoJJhOBLznaEcbDT4O/ZhKieX4kPFG3nm25tnMkdU+7oZJTcuwNFYS2116BLCLpuml
 Dx+A==
X-Gm-Message-State: AOAM532PEh1RNdG3a8N4B3YgwEzkyxDbqz2pW6pyYcLBGpdbHJVgGm31
 gAg+d19BjEaEaz7HGVgCigI2NXjYFX1VNE4Q6R43lh+a8wcc00sfZM3zF6g9iOfl7quIYtDalZT
 6eG2uDFW9cYqZdqADBUprk3U+zetJhZzKMVEZ4qLsAF3+ALZAr1lw4Ewljy3Dq2Fort0=
X-Received: by 2002:a05:6402:4414:b0:419:28bc:55dc with SMTP id
 y20-20020a056402441400b0041928bc55dcmr12241248eda.130.1652002296703; 
 Sun, 08 May 2022 02:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm0PUOGB+YUnEq6W1eShEhzWHO7UnokoDYBkn5b0igLeQxmnApkSb+gByrNfwmzfhhdKfbxQ==
X-Received: by 2002:a05:6402:4414:b0:419:28bc:55dc with SMTP id
 y20-20020a056402441400b0041928bc55dcmr12241236eda.130.1652002296489; 
 Sun, 08 May 2022 02:31:36 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 vf20-20020a170907239400b006f3ef214dabsm3829117ejb.17.2022.05.08.02.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	malureau@redhat.com
Subject: [PATCH v2 3/5] net: slirp: switch to slirp_new
Date: Sun,  8 May 2022 11:31:18 +0200
Message-Id: <20220508093120.173131-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508093120.173131-1-pbonzini@redhat.com>
References: <20220508093120.173131-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace slirp_init with slirp_new, so that a more recent cfg.version
can be specified.  Only support version 3 of the configuration for
simplicity, corresponding to a minimum slirp version of 4.3.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build |  2 +-
 net/slirp.c | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 1712ea9e46..264a5fb5ed 100644
--- a/meson.build
+++ b/meson.build
@@ -2638,7 +2638,7 @@ if have_system
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
     slirp = dependency('slirp', kwargs: static_kwargs,
-                       method: 'pkg-config',
+                       method: 'pkg-config', version: '>=4.1.0',
                        required: slirp_opt == 'system' or
                                  slirp_opt == 'enabled' and not have_internal)
     if slirp.found()
diff --git a/net/slirp.c b/net/slirp.c
index f1e25d741f..b7464be86b 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -389,6 +389,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 #if defined(CONFIG_SMBD_COMMAND)
     struct in_addr smbsrv = { .s_addr = 0 };
 #endif
+    SlirpConfig cfg = { 0 };
     NetClientState *nc;
     SlirpState *s;
     char buf[20];
@@ -577,12 +578,26 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
-    s->slirp = slirp_init(restricted, ipv4, net, mask, host,
-                          ipv6, ip6_prefix, vprefix6_len, ip6_host,
-                          vhostname, tftp_server_name,
-                          tftp_export, bootfile, dhcp,
-                          dns, ip6_dns, dnssearch, vdomainname,
-                          &slirp_cb, s);
+    cfg.version = 1;
+    cfg.restricted = restricted;
+    cfg.in_enabled = ipv4;
+    cfg.vnetwork = net;
+    cfg.vnetmask = mask;
+    cfg.vhost = host;
+    cfg.in6_enabled = ipv6;
+    cfg.vprefix_addr6 = ip6_prefix;
+    cfg.vprefix_len = vprefix6_len;
+    cfg.vhost6 = ip6_host;
+    cfg.vhostname = vhostname;
+    cfg.tftp_server_name = tftp_server_name;
+    cfg.tftp_path = tftp_export;
+    cfg.bootfile = bootfile;
+    cfg.vdhcp_start = dhcp;
+    cfg.vnameserver = dns;
+    cfg.vnameserver6 = ip6_dns;
+    cfg.vdnssearch = dnssearch;
+    cfg.vdomainname = vdomainname;
+    s->slirp = slirp_new(&cfg, &slirp_cb, s);
     QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
 
     /*
-- 
2.35.1


