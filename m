Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C372B82BC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:14:11 +0100 (CET)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR22-00023V-91
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz3-0007i5-W7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz0-000131-D0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=0/nIBpoeA+ZXOrJjzGLqNxrNPozNurteKJgZoaNK2V4=;
 b=dRZ5KS9ZBOAMPG0eilptaQty6TzG+SuQVOWn50BCgoxQtMuHANm0aTaQdqKdQ4IrozvZUr
 V2Iaa7tzlpaKxPHf+YTkMCeKSqT2STGp6TNIeQvdUvZdk8RUZs6SERyIOuZ4dqMOKHUN8O
 MB5C8xtR3vnF/53xG68SjI6FRgmnv+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-wHRvNz9UN-yCeCQ7A89C9A-1; Wed, 18 Nov 2020 12:10:58 -0500
X-MC-Unique: wHRvNz9UN-yCeCQ7A89C9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955F318B9EC8;
 Wed, 18 Nov 2020 17:10:57 +0000 (UTC)
Received: from thuth.com (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8799E60BE2;
 Wed, 18 Nov 2020 17:10:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/6] configure: Remove the obsolete check for ifaddrs.h
Date: Wed, 18 Nov 2020 18:10:47 +0100
Message-Id: <20201118171052.308191-2-thuth@redhat.com>
In-Reply-To: <20201118171052.308191-1-thuth@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code that used HAVE_IFADDRS_H has been removed in commit
0a27af918b ("io: use bind() to check for IPv4/6 availability"),
so we don't need this check in the configure script anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index 714e75b5d8..6c8f56c514 100755
--- a/configure
+++ b/configure
@@ -3094,14 +3094,6 @@ EOF
     fi
 fi
 
-##########################################
-# getifaddrs (for tests/test-io-channel-socket )
-
-have_ifaddrs_h=yes
-if ! check_include "ifaddrs.h" ; then
-  have_ifaddrs_h=no
-fi
-
 #########################################
 # libdrm check
 have_drm_h=no
@@ -6199,9 +6191,6 @@ fi
 if test "$auth_pam" = "yes" ; then
     echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
 fi
-if test "$have_ifaddrs_h" = "yes" ; then
-    echo "HAVE_IFADDRS_H=y" >> $config_host_mak
-fi
 if test "$have_drm_h" = "yes" ; then
   echo "HAVE_DRM_H=y" >> $config_host_mak
 fi
-- 
2.18.4


