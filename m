Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD89938FF84
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:49:51 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUdC-00024P-Bw
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUac-0008UO-Dy
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUaY-000574-7q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621939623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7A269897TQHErU9WbJXfMk/uAZNuHmK+c3XTxBzrjZk=;
 b=T11a0bjF9MtfvhCqmmCx8tOERhbKeLGdn77LK8bG1oaMJmSn+PiLKwXgu6LPnICJ5TnMT6
 Ec2/7XjRmxKRkKQuOa74MK0jBcLaKXQNb0p3IMfSBQPlxH5AjwaA+n4cAbf3uEDUdbihc1
 ncMJVWFUUv1GZ9QpPz9YmY5oCj6hpOE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-dxg2Hn5NOtinppEQk6_bYg-1; Tue, 25 May 2021 06:47:01 -0400
X-MC-Unique: dxg2Hn5NOtinppEQk6_bYg-1
Received: by mail-wr1-f72.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso14412707wrq.21
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7A269897TQHErU9WbJXfMk/uAZNuHmK+c3XTxBzrjZk=;
 b=kN0T4hMhJyme9Pr1SVhojlyTB+RvMwfnfiSKm225s0sXfhYkWfb5+yBTmYTbrzHky9
 eBRSIt0j1WgxtYOaHDj/rOUttAKrY2ZBwKK5hh2k6wF7w0wDOTZBqsziJ/gGDLLEX/xu
 jE17miQ8qp4p6fffYXh0XvcnxszZT3t1DqGpYa+GsKX6QFX38FowSkkR/9uYBcWrHOvX
 TqEOBkNFcHHOakc++6uERmvX6udal6G3WQMQKBSuOfOENOMQacggUNpS5B5zaGhZWvut
 YpmghM7lDR00f+X0A40Mnh/7DPuFQyl2zZGWk6c42QB/NPZvlFKXLnoe0duq6kVvQMPC
 0Dyg==
X-Gm-Message-State: AOAM531Dj7iAwFFffDYGlVx/6ufXMjOxcV9ZEkr1hSUQtwqqtgSEpUWD
 LcL+tWcsFrhb9GpX/sdttfhkxQzARteoA2lhLkMG2XVPfg7UcWU0wvoOaolIchD6at7nth5Vh30
 Bo/T+5mqoL+DYvrHhaxt9KiQGiqiXquU5Uhsle2pOOOH8S7cjllrNJVD22JEXw0NE
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr10872057wra.367.1621939619990; 
 Tue, 25 May 2021 03:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZUQiLdVLbScMQLuzUMsZ7yiQc8Sis8/EgNY359Z7er1dlYckc+Go0c3hetoC1OtEZqyRr/g==
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr10872039wra.367.1621939619835; 
 Tue, 25 May 2021 03:46:59 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r11sm15929864wrp.46.2021.05.25.03.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 03:46:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] meson: Only build virtfs-proxy-helper if all requisites
 are found
Date: Tue, 25 May 2021 12:46:46 +0200
Message-Id: <20210525104648.4060904-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525104648.4060904-1-philmd@redhat.com>
References: <20210525104648.4060904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We first set have_virtfs_proxy_helper depending on have_virtfs,
then update have_virtfs... While this might work, it is not clear
when looking at the code logic. Move the have_virtfs_proxy_helper
assignation *after* updating have_virtfs to make it obvious.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 632b380738d..2a7d69cf428 100644
--- a/meson.build
+++ b/meson.build
@@ -1081,8 +1081,6 @@
     libattr.found() and
     libcap_ng.found())
 
-have_virtfs_proxy_helper = have_virtfs and have_tools
-
 if get_option('virtfs').enabled()
   if not have_virtfs
     if targetos != 'linux'
@@ -1097,6 +1095,8 @@
   have_virtfs = false
 endif
 
+have_virtfs_proxy_helper = have_virtfs and have_tools
+
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-- 
2.26.3


