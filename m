Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF842FE6E1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:58:04 +0100 (CET)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wj5-0003Y4-6Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Whc-00029b-I6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Wha-0007bF-EU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611222989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vbZITXCojVqoLVlcTV8UhB9kZaRdFXoQTJGiK5zZPg=;
 b=UK9NBuPB0KLdTJKiykPbgy13+7S21CgCCpBfPIHB7Xjq6ayCoLFaX0fyzcPwjzLEJtF+K3
 qB11XN7ay6Ge538f2+2HuXzK3Rr9K4nV4s/6YiYyTpwxPqpFGr5CiMnEl5esV+rLPEqSVO
 C5U8PE7j/EH5FQW/J0jRF0bQU6K0vyA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-6odY0m7WPG2PfqO4jEcRzQ-1; Thu, 21 Jan 2021 04:56:25 -0500
X-MC-Unique: 6odY0m7WPG2PfqO4jEcRzQ-1
Received: by mail-ej1-f71.google.com with SMTP id ox17so546654ejb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vbZITXCojVqoLVlcTV8UhB9kZaRdFXoQTJGiK5zZPg=;
 b=CmLqFmhbmOlrmZEfzvvobrC8cy7JQlY4NA/MQqwzU6ScDWhPdtlcwFeVMF18NuJHsY
 mE38f/qiAex/+m6xAPyemxBBSxAdzo76P5r39e3BErWVocDG/k+kFfNvUyI8fywwvVAg
 JZsBQ3cuuz+F2+cj4vdmt1gF2c+KdIsMQqe0kFyccYJUN7yTTqA1dkd5LoGkhXjC0hHZ
 SPlLUUa4t0B4L36rkF9X2NCml2rV38EvtShygkSwxkH41gYwm0UqyOLF0gszPhUZc6hX
 w762OqNp41QoNCrXvItiasdUuCxC5CkZ/99b0hBvGlJ1FuA2hRYNwpDyBBRBjUvE5COq
 xDZA==
X-Gm-Message-State: AOAM532CjSRweA0iJYetb6NUArB9cg9KD+OP5TdQyxSTD2FRdW3MfrDR
 Gd0i5N0czeOmmO4J8dwOVKTYoKbrtcnjGqLZtWFWTb69F6kCVuMtUo4WUIF5RIY6nKuhtC3WKY0
 d5nlNL78ey4qrFFHlxyTWNmaqM5Sl9HljpOVuBRg11pyg65N1pF+FkESRu88Aq857
X-Received: by 2002:a05:6402:1b91:: with SMTP id
 cc17mr10931449edb.259.1611222984136; 
 Thu, 21 Jan 2021 01:56:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKGfGnsKczyzqbRrNSlrP6xKp5Hm2dVB1mI/vnlgmHdD7OwZQJ4HZAM2L9DYQZd4GQAxNUIg==
X-Received: by 2002:a05:6402:1b91:: with SMTP id
 cc17mr10931436edb.259.1611222983939; 
 Thu, 21 Jan 2021 01:56:23 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e11sm2002594ejz.94.2021.01.21.01.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:56:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] meson: Summarize information related to directories
 first
Date: Thu, 21 Jan 2021 10:56:09 +0100
Message-Id: <20210121095616.1471869-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8f5a8b997d3..a47c5f8ab9d 100644
--- a/meson.build
+++ b/meson.build
@@ -2282,6 +2282,7 @@
 # Configuration summary #
 #########################
 
+# Directories
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
@@ -2301,8 +2302,11 @@
 summary_info += {'Doc directory':     get_option('docdir')}
 summary_info += {'Build directory':   meson.current_build_dir()}
 summary_info += {'Source path':       meson.current_source_dir()}
-summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
+summary(summary_info, bool_yn: true, section: 'Directories')
+
+summary_info = {}
+summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2510,7 +2514,7 @@
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
-summary(summary_info, bool_yn: true)
+summary(summary_info, bool_yn: true, section: 'Misc')
 
 if not supported_cpus.contains(cpu)
   message()
-- 
2.26.2


