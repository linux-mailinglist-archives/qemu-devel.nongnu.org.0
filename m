Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453752FE6F1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:01:13 +0100 (CET)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wm8-000751-9E
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Wi0-0002sN-Ua
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Why-0007nF-W9
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMRHdatQvFJJHTrRNL0ricoa4ffVDtfXxWu6LR7jnq0=;
 b=PrA8zZqykcq/C/GaL4xws4Bu1tSQRokCQ8yMcH18P8rthu7K2L/Oubuwj0UAL3rA0LoIiS
 RWuAl+hOvofbKBDYu7Yc82xKOfzjB+yK8eZ/S91L9rnnwSxn0s6LkT8OsffSJXj/RqnZRW
 TXu59+GRbegnpCzlKNwCgU+mY3PpfWo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-EN5GplCNN0WaaNYvg8ozOw-1; Thu, 21 Jan 2021 04:56:52 -0500
X-MC-Unique: EN5GplCNN0WaaNYvg8ozOw-1
Received: by mail-ed1-f70.google.com with SMTP id r4so828814eds.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMRHdatQvFJJHTrRNL0ricoa4ffVDtfXxWu6LR7jnq0=;
 b=E9d+FvQ1833/9Opbzmj2zCYW1X0BimceKU01R46lwAlQ52zmO7ja9QIIyhVlNOFS3C
 wRr+t3cqBfWULmcHH+oF+jz4Q8xq4dRKygnBgAHGFpqqPiBvEVd/GrRrEBlybeZKhWaM
 WlTJsIv3qKWX8hmvXz7CzOGHO8M12Ol7EsvAtyOkvVH5q/GLT1kYbgcn/yNuTBvhgvgc
 7mHoPhvsm1JCxfFuNFB4YFJJzfGvommteHfVgKwlg5HgGk+NDnfOPjnjGalOsdt135SM
 RSEgP/oHx+CKDePviJALploockNkej85ZUKlROvmPTpczpvsa7QLkiuZqyBNWKn77kOW
 PbLA==
X-Gm-Message-State: AOAM532qa1KEWs88ZQZKzpyzY60dJla86Lm5qZfBOiMpH4CKZGZwNdM4
 LdcyyJ4ZaAs+uVNx0MwKBrREjxg3XuzCmgmWY/N3fR3iBf1nO+qeZJ3CMiU/I6Gxq2awlz4LU0/
 btUg00q3h+8NTIDZ5Y4MprePporwLyykwbeoYZPKaMLP7Utsotgm0EFwFu01qP7h+
X-Received: by 2002:a17:906:7d4f:: with SMTP id
 l15mr1222495ejp.95.1611223010618; 
 Thu, 21 Jan 2021 01:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK4gEaaMRdFQCH3M6H1bMmCz/8+Q9Nl83VlK/CfH/2673k7cgweAz0sqz8Ubd2Zs9bSc3WOg==
X-Received: by 2002:a17:906:7d4f:: with SMTP id
 l15mr1222481ejp.95.1611223010454; 
 Thu, 21 Jan 2021 01:56:50 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w18sm2017493ejq.59.2021.01.21.01.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:56:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] meson: Summarize overall features altogether
Date: Thu, 21 Jan 2021 10:56:11 +0100
Message-Id: <20210121095616.1471869-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 614eef82c37..4b600315ba4 100644
--- a/meson.build
+++ b/meson.build
@@ -2320,6 +2320,27 @@
 endif
 summary(summary_info, bool_yn: true, section: 'Host binaries')
 
+# Overall features
+summary_info = {}
+summary_info += {'Documentation':     build_docs}
+summary_info += {'Install blobs':     get_option('install_blobs')}
+# TODO: add back version
+summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
+summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
+if config_host.has_key('CONFIG_MODULES')
+  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+endif
+summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
+summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
+if have_system
+  summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+endif
+summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
+if config_host['TRACE_BACKENDS'].split().contains('simple')
+  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
+endif
+summary(summary_info, bool_yn: true, section: 'Overall')
+
 summary_info = {}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
@@ -2347,11 +2368,6 @@
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 # TODO: add back version
-summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
-if config_host.has_key('CONFIG_MODULES')
-  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
-endif
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'target list':       ' '.join(target_dirs)}
@@ -2393,7 +2409,6 @@
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
 summary_info += {'mingw32 support':   targetos == 'windows'}
-summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
 summary_info += {'VirtFS support':    have_virtfs}
@@ -2410,14 +2425,12 @@
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
 summary_info += {'brlapi support':    brlapi.found()}
-summary_info += {'Documentation':     build_docs}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
 summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
 summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
 summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
 summary_info += {'ATTR/XATTR support': libattr.found()}
-summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
 summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
 summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
@@ -2447,10 +2460,6 @@
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
-summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
-if config_host['TRACE_BACKENDS'].split().contains('simple')
-  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
-endif
 # TODO: add back protocol and server version
 summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
 summary_info += {'rbd support':       rbd.found()}
@@ -2511,8 +2520,6 @@
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'default devices':   get_option('default_devices')}
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
-summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-- 
2.26.2


