Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DA525469
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:03:16 +0200 (CEST)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npD9f-0003Us-3B
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZS-0004z8-0l
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZQ-0005D6-Bx
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPbmkxkihom2P3TfPTyKc75NVVMU3lPyHzHUkmx1pMc=;
 b=AtC21KL4tlKbBAOBUSDG+Z79h13cTiv5Lh8TXh9vulaqWdfTZndyhZSG48oN3NUnnu3Idp
 QHWZGBBUPF75JVy4r2hlVnikCn09GfFjdIEEhaYBQvEKDRksiyPkJTJXf7hFsW5L6dqlrT
 Flvylcee6vMteleBxT4Paz6P6hjw6LU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-RdcO3ReCOQ-Hf9RnoyoHhw-1; Thu, 12 May 2022 13:25:46 -0400
X-MC-Unique: RdcO3ReCOQ-Hf9RnoyoHhw-1
Received: by mail-ej1-f71.google.com with SMTP id
 ox8-20020a170907100800b006f9dc6e4a22so3181726ejb.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPbmkxkihom2P3TfPTyKc75NVVMU3lPyHzHUkmx1pMc=;
 b=K5nGTxPF/cLtuBSzOJZmVCL6dz7M+FbUhUPs+IDLVO7Rlr8s3R92wfyAY7jp8srQgb
 HTiJ7LwuLhOjxTO07S7A7OYfzwyKM2go0J7YabPFCzX8MyeA6PlOScWJXB/1vtfYVm9F
 wGgLdcez/5YUXYxgYXagQzOgNW11m+YD1Tw9s/nMIGuWMKQywGaYj5WUblxA0EWkp2Ih
 3YhlPBKrtIF2V3Cr/3eRZHKwkndVKfcB/KP1wSxAQX1zyWHofNL84/E7poRvfmIZCuwX
 KDx+DOsJXXUOVU7m2WeMJn0NWbPiKmHVLkzJUL/H+CRCNfIYxBt1E7Q4D0s2WHEaEG3n
 u82w==
X-Gm-Message-State: AOAM530r7EWg7Ao3G7Z9i22QEn44Exdiivmaaxg0NcHQz2HtKLUOZQyd
 qhWuLiu9InbVlMF+ZK9e912yhJUdJoUkjabwrtliVUreeX0vKkNYro3QCJnqPYYPwqyt6H7JaY1
 Da317Spv+xYKbFQtzFcz3lNLsbbXBJfRZv5nHEw11H2D+98aI1csLvHmyZ1UG7LSd+oY=
X-Received: by 2002:a05:6402:2291:b0:425:deb5:73be with SMTP id
 cw17-20020a056402229100b00425deb573bemr35840352edb.392.1652376345045; 
 Thu, 12 May 2022 10:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS9MjhMw2pBrmD419DdY/J9dvSBMnkUTq5O7bV+nMP47YIvS7qVKcmXDAtp9LYgMt9afPU2w==
X-Received: by 2002:a05:6402:2291:b0:425:deb5:73be with SMTP id
 cw17-20020a056402229100b00425deb573bemr35840329edb.392.1652376344779; 
 Thu, 12 May 2022 10:25:44 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 bm15-20020a170906c04f00b006f3ef214dcesm2256508ejb.52.2022.05.12.10.25.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/27] net: slirp: switch to slirp_new
Date: Thu, 12 May 2022 19:24:56 +0200
Message-Id: <20220512172505.1065394-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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
can be specified.  The function appeared in version 4.1.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build |  2 +-
 net/slirp.c | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 03f63e95e2..ea72ba7c2f 100644
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
2.36.0


