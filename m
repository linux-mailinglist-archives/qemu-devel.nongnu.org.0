Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F832EA347
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:23:32 +0100 (CET)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc0Q-0002QX-OL
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyE-0000nE-VG
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:15 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:45450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby9-00020h-EL
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:11 -0500
Received: by mail-pf1-f179.google.com with SMTP id q22so17506170pfk.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9kFQE4hJuNgJVApR0o9VqLxa8LiAtZL/Wn+gwDxVWA=;
 b=S6PvgYs3uK4epWCu6BokH3oO5imQAAGm77FqxMeLTFMxorpheubUnSFLKqUzXqMorC
 FaaGoaO2+v02YjoICzp9RptV+0DF7cPYHQuT96V/08Dg7hE7JkUQRoEy8Ekr+bEPWoh9
 c/+wISoYMatIYLMVhuprC8RDyDMMFyjixDGrm/VrxKy1N8x9HGoMlAU89lQ1WOgWJrgU
 76wPSPFKwy0rZwATrQREgevxoEcAqZozDiLEkLHaRbWHv7VRCvJU2vgKTCX9kxQWHKq8
 7Tncz6eA06xcENs9RVSzeXmUA3fUkyLtDTnBs3/KkmGaYUonpWnjJefLKvr9PBAvQMzo
 NPCQ==
X-Gm-Message-State: AOAM531Ln+w++O6LK6fVx4Ptg+UORFccExPMMQga3GQWSVxu1QdZs8Uf
 8hL4WCgDWm0KMfSOKZMXT8hAqW++Y98=
X-Google-Smtp-Source: ABdhPJzejx6CXr8UCZ+NW3uPMdBRBLhiQG4pozpYXQlZxl95TPXgC3URx2yYUyuPflkYiYEkado1eg==
X-Received: by 2002:a63:1626:: with SMTP id w38mr72860661pgl.278.1609813265710; 
 Mon, 04 Jan 2021 18:21:05 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.21.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:05 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/7] slirp: update build flags for iOS resolv fix
Date: Mon,  4 Jan 2021 18:20:54 -0800
Message-Id: <20210105022055.12113-7-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.179;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A future libslirp update will use libresolv on Darwin systems, so we add the
flags in QEMU build now.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 900dbc36c8..d8951d4d6c 100644
--- a/meson.build
+++ b/meson.build
@@ -1205,6 +1205,8 @@ if have_system
     slirp_deps = []
     if targetos == 'windows'
       slirp_deps = cc.find_library('iphlpapi')
+    elif targetos == 'darwin'
+      slirp_deps = cc.find_library('resolv')
     endif
     slirp_conf = configuration_data()
     slirp_conf.set('SLIRP_MAJOR_VERSION', meson.project_version().split('.')[0])
-- 
2.28.0


