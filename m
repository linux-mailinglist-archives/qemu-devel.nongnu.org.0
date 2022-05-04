Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDDD51B01E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:08:52 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMEt-00027P-On
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6c-0006Yg-8T
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6Z-00068z-7h
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TX8UXi4eFSnFUV2u4zCo4HCe7iBVlFy/t8He5jdXGC4=;
 b=HtQ1Itb2T2gWynCRa8hao9PfF8YryQFzH6YA442gqdHsxxLYijnMkKpx7zvChysoIIdVSN
 VtUd0rPQAFQTqvCvP4glW9ocLwi2c4MgXScphwLN1LSRdGgnWf0CYGZDBZckp9dTySvus8
 ReioCBxtno2LKe/0HarF+nn9QmLq0Fs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-zRBs6WCJM9S7Y3qPb9H3mw-1; Wed, 04 May 2022 17:00:11 -0400
X-MC-Unique: zRBs6WCJM9S7Y3qPb9H3mw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s24-20020a05640217d800b00425e19e7deaso1400550edy.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TX8UXi4eFSnFUV2u4zCo4HCe7iBVlFy/t8He5jdXGC4=;
 b=qxSR8DFz0Jntb4sks0MxeiyQEi2yKNC2hfe9MVeztDECY30GUhzurdKbRHJjZVBITr
 8i/Gv+WC3RAgs8h88RyO5KXFRbjp0A5bYmytZqlkAPKlq2jDGeVlVhBR1t9TFo2rg1cJ
 mWnIek+BBuWPd0XoL2zluYnV15SIAhjdu2Ns6sZ1FhyMgAN6cCGmrBPMGhKSoeQTUrvT
 6wFmUclVc8HYh8T0zXhu/2L37b+5kbnlKXnifUyFCj6ooU79ihXXfOrUoK85ZSnRgNBk
 jSpXYM0GIwynaVzP85XkpL5m3cCm5+vLm8aIcWkx02uxJhLM7RWDxm1NwvhGGjW5ateh
 zrsg==
X-Gm-Message-State: AOAM530stfBgINvmKyau9EyUVNoikMCNZWNBPr/vWyPsJCNbRVJdwjOp
 3XNocyA03CW3ljYFtCJkW0M8ICLX9RGJSklYezwLznl0vQ+uPUfTwU264F9TTS5dzSVZtIf1Ouw
 o0VTomDPZspFNhTMaQ5iwEDJo0Wd+Buhg5rgE/BChfo2NTraKTjaswOrw41MaEf6KUn8=
X-Received: by 2002:a17:906:3ec1:b0:6e8:aae3:90de with SMTP id
 d1-20020a1709063ec100b006e8aae390demr22397687ejj.127.1651698008628; 
 Wed, 04 May 2022 14:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvqWSg/G/xRGO9IEc0gfqrQk+QNHFVfdrfdxjDRMz10PMheGfbWuiu1aXmhlTTIKVgwwcGqw==
X-Received: by 2002:a17:906:3ec1:b0:6e8:aae3:90de with SMTP id
 d1-20020a1709063ec100b006e8aae390demr22397660ejj.127.1651698008357; 
 Wed, 04 May 2022 14:00:08 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 bo9-20020a0564020b2900b0042617ba63a5sm9593030edb.47.2022.05.04.14.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 3/5] net: slirp: switch to slirp_new
Date: Wed,  4 May 2022 22:59:59 +0200
Message-Id: <20220504210001.678419-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504210001.678419-1-pbonzini@redhat.com>
References: <20220504210001.678419-1-pbonzini@redhat.com>
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
can be specified.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 net/slirp.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index f1e25d741f..b3a92d6e38 100644
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
+    cfg.version = 3;
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


