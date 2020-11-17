Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1802B5C70
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:00:50 +0100 (CET)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexn7-0005vB-Qv
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkS-0003Q0-6P
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkN-0003Vq-He
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8VKBAAQh54vYBa0H9TjHn/zaztYybUd1IJuwM8EANY=;
 b=Cy77PB1UaiXzYGesWzuh0N/AgAEn7oaf5GJXA9+HQda3WY+hL/ua7KOVRSuK7+RDF3xdaM
 T+foKWawTCbtfq5K0ax/NH84dFfACvbVKaqn84phvimxosQJRSaap0anB8G/Pwcsevty0v
 3H/bszXAXSWd6ykTm7DIzVyl0Lgw88k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-v8kNJ2UhPpOEnAW_7zZNXg-1; Tue, 17 Nov 2020 04:57:56 -0500
X-MC-Unique: v8kNJ2UhPpOEnAW_7zZNXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B4AA10866A6;
 Tue, 17 Nov 2020 09:57:55 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7475B4BF;
 Tue, 17 Nov 2020 09:57:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/12] configure: Do not build pc-bios/optionrom on Haiku
Date: Tue, 17 Nov 2020 10:57:39 +0100
Message-Id: <20201117095748.122371-4-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compilation of pc-bios/optionrom fails on Haiku with:

   BUILD   pvh.img
 ld: pvh_main.o: in function `pvh_load_kernel':
 pc-bios/optionrom/pvh_main.c:73: undefined reference to `GLOBAL_OFFSET_TABLE_'
 Makefile:57: recipe for target 'pvh.img' failed
 make[1]: *** [pvh.img] Error 1

Let's simply disable it, like it is already done on macOS and Solaris.

Message-Id: <20201114165137.15379-3-thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index a273a93377..c0acda164d 100755
--- a/configure
+++ b/configure
@@ -5842,7 +5842,7 @@ fi
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
         test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
-        test "$softmmu" = yes ; then
+        test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
-- 
2.18.4


