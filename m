Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECC515009
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:57:54 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkT0D-0002Q9-9G
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSt-0002C9-Bb
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:27 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSr-00069l-Mj
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id bv19so16099763ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWAwsqKOe3j1GZap7a55orVSPdGjnlY3ix6FNOt7dY4=;
 b=J2j/ou3a8c/diMO5wb6VbaJ9NjzKznn2qo5zlYURLbNRN20eIxvk+7IukH8wz2MHtv
 xIwn23OvWGsubuxP7iIPB7CE3o8HmwbZlCntVnMt7wqKjCLs9zWE+E+7uTPba1FUXq6q
 HsfqberLfPEUwBso9j0I5NA7bGr5rdQHuLGbISgUqdodjQ2jldNORXQY6fE9uxQMXAnA
 VJ0dd8VvAH1qatUE/Ud6OymMUZQrUkT4LQypCPaC8iU4jufZi90596sSPyEXlLkLFDje
 fdhd1LUrKBGRf/61ER3yJT0cqZ/RIxAjIeyQr39+qfzLL1NyWu6NRgk0fRTv3IA6cLJt
 /neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mWAwsqKOe3j1GZap7a55orVSPdGjnlY3ix6FNOt7dY4=;
 b=4iMvshFWPduWiRGQFAghQ32ko+satch3hy61grFijJak/UI0qSRbkjPyJ3wDJlhbWp
 w+jSrvaRRbnj1Mlg2W102FrWdMvzNP3cPS6nOZG8hfU0P3uNuvouNfe8MpUU4TlvrvcR
 uClDL1mHcvHBahOugHUYKh/7nZWVS/SeWJZ98yiH1H+Eqbyt5dVM+vRU9SeYiZgM0y3i
 VtA/3PoIQfH6OEMR4RWLVfZN6B2SsWwekHUQXqTzVczOPSruZ1j4BSYc5bnKlaQ363nR
 3IhjVLej6BUz0V/LnYb75/utc1+sSRtX1NTXrKNZ2O9yLQRNLDxylh5YWZHQeZtNybUh
 v8Hg==
X-Gm-Message-State: AOAM531DO5D6uA3JLD3+FJb8r2lIcZgwEWxygubxtc7My7Z2Gxj/icWW
 GGnVlNJ+DWg0BhgJx2hmJ5vyBqYFpkQfrQ==
X-Google-Smtp-Source: ABdhPJzUSBLkuWDKB46EtGU5On6FhiAO76ldXbuzs9dO/rTI7jeQ4c6NzFJD4rQDoV2NRsMWGLYAUw==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id
 nd6-20020a170907628600b006da6e245e43mr36310600ejc.449.1651245804344; 
 Fri, 29 Apr 2022 08:23:24 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/25] meson: always combine directories with prefix
Date: Fri, 29 Apr 2022 17:23:00 +0200
Message-Id: <20220429152312.335715-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson allows directories such as "bindir" to be relative to the prefix.  Right
now configure is forcing an absolute path, but that is not really necessary:
just make sure all uses of the directory variables are prefixed appropriately.
Do the same also for the options that are custom for QEMU, i.e. docdir and
qemu_firmwarepath.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meson.build b/meson.build
index 83b06ca611..21135fbc52 100644
--- a/meson.build
+++ b/meson.build
@@ -1620,7 +1620,7 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
 config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
-config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
@@ -3628,20 +3628,20 @@ endif
 summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
-summary_info += {'firmware path':     get_option('qemu_firmwarepath')}
-summary_info += {'binary directory':  get_option('bindir')}
-summary_info += {'library directory': get_option('libdir')}
+summary_info += {'firmware path':     get_option('prefix') / get_option('qemu_firmwarepath')}
+summary_info += {'binary directory':  get_option('prefix') / get_option('bindir')}
+summary_info += {'library directory': get_option('prefix') / get_option('libdir')}
 summary_info += {'module directory':  qemu_moddir}
-summary_info += {'libexec directory': get_option('libexecdir')}
-summary_info += {'include directory': get_option('includedir')}
-summary_info += {'config directory':  get_option('sysconfdir')}
+summary_info += {'libexec directory': get_option('prefix') / get_option('libexecdir')}
+summary_info += {'include directory': get_option('prefix') / get_option('includedir')}
+summary_info += {'config directory':  get_option('prefix') / get_option('sysconfdir')}
 if targetos != 'windows'
-  summary_info += {'local state directory': get_option('localstatedir')}
-  summary_info += {'Manual directory':      get_option('mandir')}
+  summary_info += {'local state directory': get_option('prefix') / get_option('localstatedir')}
+  summary_info += {'Manual directory':      get_option('prefix') / get_option('mandir')}
 else
   summary_info += {'local state directory': 'queried at runtime'}
 endif
-summary_info += {'Doc directory':     get_option('docdir')}
+summary_info += {'Doc directory':     get_option('prefix') / get_option('docdir')}
 summary_info += {'Build directory':   meson.current_build_dir()}
 summary_info += {'Source path':       meson.current_source_dir()}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
-- 
2.35.1



