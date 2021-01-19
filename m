Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99D2FC053
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:49:26 +0100 (CET)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x0H-0007Ao-Fn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5H-0003Po-A1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w5F-0003S4-2w
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGNthqpctOSRIgJCcWCg6Ab82EhZmV/x23XdKEQrF9E=;
 b=Vj2P20OE9v7tZoJedfvtTx1npo4srVyN0BSJZM5gI+xP4KENSn630C+4gS0HMCoTNj+0HP
 5VG3lLzMpnDNCFJuBUTR7JNc+govcVRsatHwKnECQnvzTRPyw4cDqUW7nEQ0IhrDqpRPMO
 SCPwRoBCRg3saE/hHuSsBz/fD142cPo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-WBV8cDU_MLuKXqMdboIm3Q-1; Tue, 19 Jan 2021 13:50:25 -0500
X-MC-Unique: WBV8cDU_MLuKXqMdboIm3Q-1
Received: by mail-ed1-f71.google.com with SMTP id g14so9902760edt.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OGNthqpctOSRIgJCcWCg6Ab82EhZmV/x23XdKEQrF9E=;
 b=kgUlXPCc3A23wPDkQclmqGqtWlLxRvtuHs4K9kyPSvxDa+nwjHDm1TeS2lI1K+wDYD
 sMHQm49SLPEOLxes3xkQstfyfEFp6BAmOW83eXOO5UolkNvaL9G8HJsrNi6JtFVumFTd
 UzmKodt0GEWwqyeXnE00v0Tl24Af/d995HYVokdAEJIilr1/70094qgBVybLwlFeCOAi
 hTGqxI/M9aOvTtTngCNkyrZ26pM6JVNvYg+cHpbexieBywyYQQRdzU7ea7BtOCLzcV52
 2kKJ3SP5BBhdsRNz1lWG80eaM6k6YbNkjz7UbLS0AxPLXuC2J26V6RSiBYSKArg6Az94
 321A==
X-Gm-Message-State: AOAM5338LJtzeIqFks5rC4iw+SI2Z1lpiQNU1+q/dg6tXmVUR2S3yRrD
 kK2pWHE8oxNLSFqP0OO+6cD81KmmAhGntXl2mZrA2+/OD7Fwe2hiu/NTJ/qmeJZlCcMbO94NuyW
 pSqF3GLHCcYYBM2pHL7B2n4U4758aMvVVZUdeiyWuPa2KLji4J7iodYVIPtHzhNo/
X-Received: by 2002:a05:6402:1597:: with SMTP id
 c23mr4612187edv.212.1611082223214; 
 Tue, 19 Jan 2021 10:50:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFGRGTggKVtxRBfR0pA11G/Yxndqai5KRyZ+39mZUGZz8EInHEAWJdP5Nn3NPw5/WkUsJt+w==
X-Received: by 2002:a05:6402:1597:: with SMTP id
 c23mr4612172edv.212.1611082223023; 
 Tue, 19 Jan 2021 10:50:23 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x25sm12271580edv.65.2021.01.19.10.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] meson: Summarize host binaries altogether
Date: Tue, 19 Jan 2021 19:49:59 +0100
Message-Id: <20210119185005.880322-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119185005.880322-1-philmd@redhat.com>
References: <20210119185005.880322-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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

Display host binaries altogether in Meson summary information.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 27a2b67c42d..73c8d04bbf0 100644
--- a/meson.build
+++ b/meson.build
@@ -2360,12 +2360,16 @@
 summary_info += {'make':              config_host['MAKE']}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
 summary_info += {'sphinx-build':      sphinx_build.found()}
+if config_host.has_key('HAVE_GDB_BIN')
+  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
+endif
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
 if slirp_opt != 'disabled'
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
+
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
@@ -2505,9 +2509,6 @@
 summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
-if config_host.has_key('HAVE_GDB_BIN')
-  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
-endif
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
-- 
2.26.2


