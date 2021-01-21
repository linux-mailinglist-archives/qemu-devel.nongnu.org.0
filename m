Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0ED2FE719
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:08:33 +0100 (CET)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WtE-0005Hq-Rj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiJ-00031K-Lh
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiG-0007uS-NM
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOiKAVPJaGqfgYBnZppGE6/hxz+oN+0H/H9woJ7QvuA=;
 b=QNqFxFdQqrvjgaXqFHmu7icGPByvrM3yZkskhMliRRbN6I87QL63GchmgAibmwOraWq0Nk
 BfRt5u9zLet/gXf5e0PnWl3Aefpl0Q28g/UCzsrj/WVh1G/dhJt7LcAGAjefe7revgyl4+
 0U3RjWiyN1UT5mH2PUhqEoRife1ZSbs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-6edPOGdTOied3YEHrElmzg-1; Thu, 21 Jan 2021 04:57:08 -0500
X-MC-Unique: 6edPOGdTOied3YEHrElmzg-1
Received: by mail-ed1-f72.google.com with SMTP id dg17so825660edb.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOiKAVPJaGqfgYBnZppGE6/hxz+oN+0H/H9woJ7QvuA=;
 b=KRrUEmh9NLGr+/T4S14QV330+2+e1yB0p/q+eHjE+CwlM9A7/v53YwQqcdKpCHvFDy
 GnxPpuUcynyrjuz595aCKjagFpv5fMgPYPDsVkPIDMy7Mbqk0yArn2+BjFEVf3mVtBqW
 l225ldst+j5rJJOOzaENwLiH2xj5bzMSDg2Ljnk81j3K6prl6wpFixFGtF/2n6+KIcKR
 6fvpf2tA7gqupnnF4iZg5zlsj+NcABiHrW0uXLrBEJ0a/pkvY4sot7r2vizTh3AvkT43
 mpNCqlqQi8sbtcsmbZVzn+rqzRujezIl5twvTz2AdyHsJCkq3OnR87VMaqar92eOEkOK
 nd2Q==
X-Gm-Message-State: AOAM533dey72YR/eYTAK4qOx9v7xYzjoFvw/HRYHM2F/NnYv2NWL4Phn
 +YbbVzXWgasbBgiyCM64N3xBDgReY3h6K4Ziko9pddXeXCdMxx6BIZn9jHQFzPvyohhnbTyvD5b
 NWszJp2t6D+wkcuDRUQC4DJS4CqK0Bu8/an58pia3oFml+biUCWtOqd4Gs9z8wfcw
X-Received: by 2002:a05:6402:4242:: with SMTP id
 g2mr10641290edb.103.1611223026553; 
 Thu, 21 Jan 2021 01:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/4cdX5p6YhDC5NKcg738yMfFrtubErtywTuwzry63QqAxSB5jQ2WqOpS/iLkKmrm3Dbh25w==
X-Received: by 2002:a05:6402:4242:: with SMTP id
 g2mr10641268edb.103.1611223026306; 
 Thu, 21 Jan 2021 01:57:06 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r18sm2551211edx.41.2021.01.21.01.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:57:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/8] meson: Display block layer information altogether
Date: Thu, 21 Jan 2021 10:56:14 +0100
Message-Id: <20210121095616.1471869-7-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display block layer information altogether,
when it is relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: qemu-block@nongnu.org

Should coroutine be displayed generically (here, in Misc?)
or restricted to have_block?

There is probably more features I missed...
---
 meson.build | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index a0945749f94..e372b69f163 100644
--- a/meson.build
+++ b/meson.build
@@ -2325,6 +2325,7 @@
 summary_info += {'Documentation':     build_docs}
 summary_info += {'system-mode emulation': have_system}
 summary_info += {'user-mode emulation': have_user}
+summary_info += {'block layer':       have_block}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
@@ -2427,6 +2428,31 @@
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
+# Block layer
+summary_info = {}
+summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
+if have_block
+  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
+  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'VirtFS support':    have_virtfs}
+  summary_info += {'build virtiofs daemon': have_virtiofsd}
+  summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
+  summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
+  summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
+  summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
+  summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
+  summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
+  summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
+  summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
+  summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
+  summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
+  summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+  summary_info += {'FUSE exports':      fuse.found()}
+  summary_info += {'FUSE lseek':        fuse_lseek.found()}
+endif
+summary(summary_info, bool_yn: true, section: 'Block layer support')
+
 summary_info = {}
 summary_info += {'sparse enabled':    sparse.found()}
 if targetos == 'darwin'
@@ -2460,10 +2486,6 @@
 # TODO: add back version
 summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
 summary_info += {'curl support':      curl.found()}
-summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
-summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
-summary_info += {'VirtFS support':    have_virtfs}
-summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
 if vnc.found()
@@ -2509,14 +2531,11 @@
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
-summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
-summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
@@ -2524,24 +2543,12 @@
 summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
-summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
-summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
-summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
-summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
-summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
-summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
-summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
-summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
-summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
-summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-summary_info += {'FUSE exports':      fuse.found()}
-summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true, section: 'Misc')
 
 if not supported_cpus.contains(cpu)
-- 
2.26.2


