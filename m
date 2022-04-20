Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012F508C7C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:52:30 +0200 (CEST)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCd3-00026L-6h
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLu-0001py-Ka
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLs-0000zK-VA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id q3so2782016wrj.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdKcMO6vaTvNB393UuNsGUCbzGTBLou5Txn3tS0z+To=;
 b=Q0/bYZBAItZaCGYVZU+17DxPtixee3cEqsvOVe25QmNMFmwjCgHxKE7OPwPRTy3MUp
 jf9i/4qCveFydjxVaa0pmQ5wsLtUyM4MAZkgC0O1YpnlpPGlJuL/u1VKDQA5CP5bLctB
 e8vLcTZ0K41/pxdVBcIgi1OW1Y+jQW7XO1aB7Agg38XG9wOw4q9IWc9BWPznSl4uBHsK
 nuc09rp2t9E4R5rkDBNddktPN5bWTV1JGSD7HizRjXHmEd2H8L/+Xt/yKSrHEoze1TU4
 IDB9+eLTCY84n3apAlk4izKhJe+KJ6bNgE+do/6+dtsZihn8OK+KD7aUybU+V5uyxx9C
 saHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kdKcMO6vaTvNB393UuNsGUCbzGTBLou5Txn3tS0z+To=;
 b=AfvtZJrTmxlV1TGXrJ/Gpjb+8/nWG3PPGpRvT12Wd3+YsMcQt/7PhAvoylDdsEYVec
 z0CBaZhzBdNB46XThx4ajwO/6TyeJ2RlxsroeqxdTGXbC8HHI14NsoLwNrFtWi13BC7N
 zHtY+ItzIFf5wsxMPwnMVZBVAog5ERHRN2vnsL5oXkq0N0/RsZa/V0c312yd4AUC14pw
 p5OS/0kFIjWF/Bh+lwwDb1BZTkyuUDwzmRdAmrxeJZHMO2Wit8z92hTKOUiPixDGMXlI
 zOLJQuJLh7XrjHCrCTlSTgvrwskZtWIvyz5K522H4ufAPljRCscfEi9xc3KDi1PzdtcR
 nP5A==
X-Gm-Message-State: AOAM530gL1UHYUzGGx/Sj2aGh9nY+ZX19/VALJUr02vbfoWbutljTx+o
 URTcW+sUtFn40Z0aiZ/SQDFFKfIEKO0Etg==
X-Google-Smtp-Source: ABdhPJzfoxkU3V59xhoT2Oymhyl6L3kzcEd1vRhSz79SDtB9eBXgGHJ9/U14+7NXGWLqyMF/JllUxQ==
X-Received: by 2002:a5d:6da9:0:b0:20a:8d08:9977 with SMTP id
 u9-20020a5d6da9000000b0020a8d089977mr13948547wrs.24.1650468883622; 
 Wed, 20 Apr 2022 08:34:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/34] meson: always combine directories with prefix
Date: Wed, 20 Apr 2022 17:33:56 +0200
Message-Id: <20220420153407.73926-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson allows directories such as "bindir" to be relative to the prefix.  Right
now configure is forcing an absolute path, but that is not really necessary:
just make sure all uses of the directory variables are prefixed appropriately.
Do the same also for the options that are custom for QEMU, i.e. docdir and
qemu_firmwarepath.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meson.build b/meson.build
index 869cc10128..2545ac2848 100644
--- a/meson.build
+++ b/meson.build
@@ -1618,7 +1618,7 @@ config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
 config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
-config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
@@ -3615,20 +3615,20 @@ endif
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



