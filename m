Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F174FDF64
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:23:54 +0200 (CEST)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFYn-0006mb-Qp
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP2-0004wU-CQ
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neFP0-0001Nc-TB
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:13:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id e8so11030995wra.7
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TX8UXi4eFSnFUV2u4zCo4HCe7iBVlFy/t8He5jdXGC4=;
 b=blBtkvCSTRWnAnpmbWZ5+L+xqJxWHO3NRHux7Ym2aFOB5QP5JalkQm5397XBXt5U1/
 2vjf1PB2DJVPeDP5gbSSFcnYIQjDolKIwFA6yLVBMUWp5+NNXoe/0yfUvZE4peH9+gyb
 v4PDzveTRAG3BHlIxi7ZIFlJjhRMH6qLOd7VOaNmH4yCBdojlA4Amm1k0Vi3+BCj39RU
 +CDwzJyPnxLJwulLSZfcLf1oxu7giIt2aDBAiMDcCF56qyyChhnEJpQJXhY/2VjmvF4g
 w0CUjAG31gJ3LDeuykuzI/Idp1lLX3jdanl0c+dydak/PNfkY/V8ywq0pJ9i2GZSHkpp
 n7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TX8UXi4eFSnFUV2u4zCo4HCe7iBVlFy/t8He5jdXGC4=;
 b=LDIzN474AXhEJ0B/VLka595zoZ3LpbkFN6Qk8W6qH3f/vUsi/8BpYUNFQyOEypGhch
 f1i0er+2HHPMLzWYKayYwKQUXn0qkLChzyGF+RO9P4iUHGU8T+XkIO96ngzWctY03IJ4
 FOBek43pGBSzaJGNqPTnRnwM2cFtX3ayyzLho3IARpc50cFqcJWlD8verVTUoM/taGsf
 pUz64SymTzV8NRfPFXOc/umABeN0hnE+NbleLWTvNR/KKmKP9cSKD63o5w9+OKlUjgHV
 KMuxsssis0RWJx/7tQkdYmFbwDHznjKCqg5e8ph0g2TiyBrkNVgsVfnU4gDkmpvWEkar
 M1DQ==
X-Gm-Message-State: AOAM531qSTS8RejHXfFvIYzQe4m5jFrBaJKPr/f24zkm7yvTzMq2xRbx
 FwWTFJs5cbnQAa/iW5vRKp23YZ06IVfvfw==
X-Google-Smtp-Source: ABdhPJwAKRVL0SpmkwcjoNExmOHuTlGV//wbPQQMr9e2abNHFtEhClp1KyZuEesEitKZr+Q7mAbAog==
X-Received: by 2002:a5d:558e:0:b0:206:f7e:4634 with SMTP id
 i14-20020a5d558e000000b002060f7e4634mr29030890wrv.662.1649765625171; 
 Tue, 12 Apr 2022 05:13:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038e8f9d7b57sm2355805wmq.42.2022.04.12.05.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:13:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] net: slirp: switch to slirp_new
Date: Tue, 12 Apr 2022 14:13:35 +0200
Message-Id: <20220412121337.207203-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412121337.207203-1-pbonzini@redhat.com>
References: <20220412121337.207203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: samuel.thibault@ens-lyon.org, thuth@redhat.com, dbuono@linux.vnet.ibm.com
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



