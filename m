Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D1447C97
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:12:23 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0hS-0007iO-Tf
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Z6-000100-4n
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Z3-0002X4-Ul
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uaiDoJgOQGQvis10bJGSk5/g9IeVC9PME07gxiv+5oY=;
 b=SveCdOIDOjX3ERQCL0gOFk83UiXHOMVA5k015E9vpI0qzfBk7tdnYfSeH1J3Q0KcYEG1ra
 TXP/GWqYYqr2X69Wj4NZza+D1G1K+j2tFtAU5fuNvHhfpLMaKhg64IIzj36HfHXuJRB5UF
 aP9ZYze5wAnSVig/sx+ffWs0CpUsTBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-jzxTLfbuNL6jaf6tCAvQnw-1; Mon, 08 Nov 2021 04:03:36 -0500
X-MC-Unique: jzxTLfbuNL6jaf6tCAvQnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E770804140;
 Mon,  8 Nov 2021 09:03:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08AFB67842;
 Mon,  8 Nov 2021 09:03:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/11] docs: (further) remove non-reference uses of single
 backticks
Date: Mon,  8 Nov 2021 13:01:54 +0400
Message-Id: <20211108090155.371357-11-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The series rotted already. Here's the new changes.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
[ extra backticks fixes ]
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211004215238.1523082-3-jsnow@redhat.com>
---
 docs/devel/build-system.rst | 16 ++++++++--------
 docs/system/i386/sgx.rst    |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7f106d2f1c2f..ae536ef75db4 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -47,14 +47,14 @@ command line options for which a same-named Meson option exists;
 dashes in the command line are replaced with underscores.
 
 Many checks on the compilation environment are still found in configure
-rather than `meson.build`, but new checks should be added directly to
-`meson.build`.
+rather than ``meson.build``, but new checks should be added directly to
+``meson.build``.
 
 Patches are also welcome to move existing checks from the configure
-phase to `meson.build`.  When doing so, ensure that `meson.build` does
-not use anymore the keys that you have removed from `config-host.mak`.
-Typically these will be replaced in `meson.build` by boolean variables,
-``get_option('optname')`` invocations, or `dep.found()` expressions.
+phase to ``meson.build``.  When doing so, ensure that ``meson.build`` does
+not use anymore the keys that you have removed from ``config-host.mak``.
+Typically these will be replaced in ``meson.build`` by boolean variables,
+``get_option('optname')`` invocations, or ``dep.found()`` expressions.
 In general, the remaining checks have little or no interdependencies,
 so they can be moved one by one.
 
@@ -298,7 +298,7 @@ comprises the following tasks:
 
  - Add code to perform the actual feature check.
 
- - Add code to include the feature status in `config-host.h`
+ - Add code to include the feature status in ``config-host.h``
 
  - Add code to print out the feature status in the configure summary
    upon completion.
@@ -334,7 +334,7 @@ The other supporting code is generally simple::
 
 For the configure script to parse the new option, the
 ``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make
-update-buildoptions`` (or just `make`) will take care of updating it.
+update-buildoptions`` (or just ``make``) will take care of updating it.
 
 
 Support scripts
diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index f103ae2a2fdd..9aa161af1a13 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -77,9 +77,9 @@ CPUID
 
 Due to its myriad dependencies, SGX is currently not listed as supported
 in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
-Control) to a guest, you must either use `-cpu host` to pass-through the
+Control) to a guest, you must either use ``-cpu host`` to pass-through the
 host CPU model, or explicitly enable SGX when using a built-in CPU model,
-e.g. via `-cpu <model>,+sgx` or `-cpu <model>,+sgx,+sgxlc`.
+e.g. via ``-cpu <model>,+sgx`` or ``-cpu <model>,+sgx,+sgxlc``.
 
 All SGX sub-features enumerated through CPUID, e.g. SGX2, MISCSELECT,
 ATTRIBUTES, etc... can be restricted via CPUID flags. Be aware that enforcing
@@ -126,7 +126,7 @@ creating VM with SGX.
 Feature Control
 ~~~~~~~~~~~~~~~
 
-Qemu SGX updates the `etc/msr_feature_control` fw_cfg entry to set the SGX
+Qemu SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
 (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
 i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
 assuming said firmware supports fw_cfg.msr_feature_control.
-- 
2.33.0.721.g106298f7f9


