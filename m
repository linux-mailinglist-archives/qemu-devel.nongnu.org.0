Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBAE300E66
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:00:01 +0100 (CET)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33XE-0002tJ-3x
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33Jh-0005ZA-3U
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l33JV-0002xI-Em
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611348347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akWBsUKGoDy+pi5x2giqOPLb20R9HBrXt/LABrN7Sgo=;
 b=jSBmAdetehFVxNzTcHBwNoT9VlRFNvFM9reraaGAQi9HHlNFJ74dhgZBwO7iPFmH1d7c+X
 vAd2HxGzHWVn/3mEQ8WaA7DDm7Bn8qXhqSEOiuhn2em4om9bQI3DMKi1FcbnJE0wiy6sAd
 aXy8ClPbjL1bUm1z5WsBdupul0Sg5fA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ORtq220TPmKORJ3f118Cnw-1; Fri, 22 Jan 2021 15:45:45 -0500
X-MC-Unique: ORtq220TPmKORJ3f118Cnw-1
Received: by mail-ej1-f71.google.com with SMTP id h4so2694735eja.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akWBsUKGoDy+pi5x2giqOPLb20R9HBrXt/LABrN7Sgo=;
 b=EpKFAnMhUCrTSn3B3YPtnxh7NnQs3EWuw5waCta4mI/nTqRlX3mdwSEOs6YBanVoQw
 FWLgywR6ERhKsWWuteyvgcYzCRzCG3/R6a/fXau9cBknhr+JnlMqYwoWxB5tF6b2jYiA
 GvcOWAZxR3MdBXqXP2/XMC9Zt8Xc7nJl2Es0590htfrH0Bpl3HJ9QbKCP/HfuebXIhEP
 IO+ylMfXGNvZh7/ZehbDPng/+IPnidzJrsrBz58aG63Bilfe1ISZ+d1fXx960/WqGQsM
 DHbnkDTsslG4FibPnTLmOQhyWUX2qn3qtxMRfo5pe6WiVlmYfBa9TYE2ujUTuK9VGu74
 QhVQ==
X-Gm-Message-State: AOAM531AP4DL2mYhAvy1GlVMuFWwOKynv5sly50WBNJ+sOKqK32kdiyP
 Ze9gmSmfiPAuosGan8SgoORIsrlPATqTiseLSqgS9nDQ9/Kj9TfpdXbMVvcwx9Xa9UuYDs2G+Bw
 5+UEW9ChhaFYhwMq0gtDEAgnTHjamhL9Us2q9B0Vsed64zmlk9rADodhpOLZ76/Y+
X-Received: by 2002:a17:906:d62:: with SMTP id s2mr516683ejh.61.1611348344381; 
 Fri, 22 Jan 2021 12:45:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiqsyxPx+NUGXJhRSj4NU1nM/4+PTYSiRDqN+q1RCxiXeqH7GVJEGEBGPYrna8dSSWX2hacw==
X-Received: by 2002:a17:906:d62:: with SMTP id s2mr516664ejh.61.1611348344150; 
 Fri, 22 Jan 2021 12:45:44 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dm6sm4979020ejc.32.2021.01.22.12.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 12:45:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 11/12] qapi/meson: Restrict system-mode specific modules
Date: Fri, 22 Jan 2021 21:44:40 +0100
Message-Id: <20210122204441.2145197-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122204441.2145197-1-philmd@redhat.com>
References: <20210122204441.2145197-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index b301a46f04a..7aca8d50484 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -18,8 +18,6 @@
 endif
 
 qapi_all_modules = [
-  'acpi',
-  'audio',
   'authz',
   'block',
   'block-core',
@@ -39,14 +37,10 @@
   'misc-target',
   'net',
   'pragma',
-  'pci',
   'qom',
-  'rdma',
   'replay',
-  'rocker',
   'run-state',
   'sockets',
-  'tpm',
   'trace',
   'transaction',
   'ui',
@@ -54,7 +48,13 @@
 ]
 if have_system
   qapi_all_modules += [
+    'acpi',
+    'audio',
     'qdev',
+    'pci',
+    'rdma',
+    'rocker',
+    'tpm',
   ]
 endif
 
-- 
2.26.2


