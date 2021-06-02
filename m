Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB54398E08
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:11:47 +0200 (CEST)
Received: from localhost ([::1]:60958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSX3-0001ZH-C2
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSTk-0003wf-5E
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loSTg-0003JR-Qw
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622646494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I6p+KBcPxhcxhCk4URhd00+j5agpaxomT4LMWyre5+k=;
 b=V+TmQ27dp+cHY4/WV0pQMBo86N2WWVE2gjNDK+Y2IjuxsT0zII3/OXKGVbsi11zZ8CY9l4
 RFkDRcEinRhSHI6drB6P2Qf+QrhOafiWazVd6aFJmzhbRlG6bQ+EYufOirIBPadQXIHUwr
 4+e94qjAPcIAqh5c3JTxwlG5JY4ir50=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-gLi98vToOxabTcioVL0-PQ-1; Wed, 02 Jun 2021 11:08:12 -0400
X-MC-Unique: gLi98vToOxabTcioVL0-PQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c24-20020aa7c7580000b029038fd7468047so1571530eds.20
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6p+KBcPxhcxhCk4URhd00+j5agpaxomT4LMWyre5+k=;
 b=bDAklMTYk4UwWtBEsE+1atdfVfy3sYxMRLLrTIK8UJfaFkIkEk+bbxs5LLXfS33x6r
 3nn5jq6EIlPVXxRGKkhGhzxx3jYdAQiwAp/pJCt9YZLBM+T/GP4Xt2Uklbokw0Mh8DP7
 E7XIEXIGvNHyuQPyNLMvZ+8xBv7fz4qIq5HTCAiYx0bJtGAHPMlqlWOVUq16HhV9wYJL
 o1+uuR12oY1pIkv/WFVvN/9JLd7D/IETeKVIh03bZm1n41rjIAVY/16SxQRe8wSYQetf
 yx1Wvll+5ZD/qVBupmZqG9rSDuWSWB/kLwxZMk9gM8+H3C509zh4/2DD23mjcxwQLPWA
 WT4A==
X-Gm-Message-State: AOAM5316BlohP6CMqL+1m1tnHMmvWJvD2cP1IYkPchNXSWMB1ZIEgXcc
 2l0vIWEcUMoICjU7gipzUyvxHfRYaqInKpTaprs9WJu/A+w0SYdCtF9uDEcaoZ27B/bTfX0opb2
 LnwXJqcTnHKvORGiKi8WoVxeUUsDpafKNrQ3cNe6aLWk3nr2zH5mYS4wgOwfH/b/e
X-Received: by 2002:aa7:c983:: with SMTP id c3mr17145809edt.58.1622646490928; 
 Wed, 02 Jun 2021 08:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywxDd0dgkgmafNVDTq+ze9DzFR2ULQoF2YeUlKQVLWcvYQAyMiZBlt2x27GrRNEplxneCouw==
X-Received: by 2002:aa7:c983:: with SMTP id c3mr17145775edt.58.1622646490679; 
 Wed, 02 Jun 2021 08:08:10 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v21sm108857edt.48.2021.06.02.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:08:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] buildsys: Restore listing binaries/tools/helpers in 'make
 help' target
Date: Wed,  2 Jun 2021 17:08:09 +0200
Message-Id: <20210602150809.2471467-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching to Meson (commit 7fd51e68c34, 2020-08-21) we lost many
targets listed in 'make help':
- target specific binaries
  commit 5e6d1573b49 ("remove Makefile.target")
- tools and helpers
  commit c3a0ee847a5 ("configure, Makefile; remove TOOLS and HELPERS-y variable")

Since 'ninja' is not officially supported, but 'make' still is,
restore a similar list of make targets (extracted from ninja).
The targets are not described as before, but it is still more
useful to users rather than nothing listed at all.

Now we get:

  $ make help
    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
  Architecture specific targets:
    qemu-system-aarch64
    qemu-system-alpha
    qemu-system-arm
    qemu-system-avr
    ...
    qemu-x86_64
    qemu-xtensaeb
    qemu-xtensa

  Generic targets:
    all                            - Build all
    dir/file.o                     - Build specified target only
    install                        - Install QEMU
    ctags/gtags/TAGS               - Generate tags file for editors
    cscope                         - Generate cscope index
    sparse                         - Run sparse on the QEMU source

  Tools and helper targets:
    contrib/elf2dmp/elf2dmp
    contrib/ivshmem-client/ivshmem-client
    contrib/ivshmem-server/ivshmem-server
    contrib/vhost-user-blk/vhost-user-blk
    contrib/vhost-user-gpu/vhost-user-gpu
    contrib/vhost-user-input/vhost-user-input
    contrib/vhost-user-scsi/vhost-user-scsi
    fsdev/virtfs-proxy-helper
    qemu-bridge-helper
    qemu-edid
    qemu-img
    qemu-io
    qemu-keymap
    qemu-nbd
    qemu-pr-helper
    qga/qemu-ga
    storage-daemon/qemu-storage-daemon
    tools/virtiofsd/virtiofsd

  Cleaning targets:
    clean                          - Remove most generated files but keep the config
    distclean                      - Remove all generated files
    dist                           - Build a distributable tarball
  ...

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/227
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 30f19d33bb3..f2c5ce2e5fe 100644
--- a/Makefile
+++ b/Makefile
@@ -286,6 +286,9 @@ print-help = @$(call print-help-run,$1,$2)
 
 .PHONY: help
 help:
+	@echo  'Architecture specific targets:'
+	@ninja -t targets all | sed -ne 's/\(.*\): cpp_LINKER.*/  \1/p'
+	@echo  ''
 	@echo  'Generic targets:'
 	$(call print-help,all,Build all)
 	$(call print-help,dir/file.o,Build specified target only)
@@ -294,6 +297,10 @@ help:
 	$(call print-help,cscope,Generate cscope index)
 	$(call print-help,sparse,Run sparse on the QEMU source)
 	@echo  ''
+	@echo  'Tools and helper targets:'
+	@ninja -t targets all | sed -ne 's/\(.*\): c_LINKER.*/  \1/p' \
+		| sort | egrep -v '^  (subprojects|tests|target)'
+	@echo  ''
 ifeq ($(CONFIG_PLUGIN),y)
 	@echo  'Plugin targets:'
 	$(call print-help,plugins,Build the example TCG plugins)
-- 
2.26.3


