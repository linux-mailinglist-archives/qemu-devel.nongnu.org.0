Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3998308BA6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:40:13 +0100 (CET)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Xki-0006o2-Q9
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJP-0003jO-T4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJO-0007Av-1H
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGaLyQslc+Drgg1yv7UeVmBjqIIoxzi36KdJjtdfFEQ=;
 b=Zfq30DCd0ysoRMtSnQeHCtN1ARuxCkmEsdcMDfTb5i8B1Yw374/38qqX8GbehaGzfS9ZOg
 BQpgbGp6ZDhMDDqjgct6rtQhPHEIPAIkf5AEpMd2WDXJK06K/D1RF8QV5m7DbNli+xVDPd
 pwWp7R7eb05ZpaULcIbqXl+mji3YRMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-Ip30pJf5NRa7FapVpd6Asw-1; Fri, 29 Jan 2021 12:11:53 -0500
X-MC-Unique: Ip30pJf5NRa7FapVpd6Asw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C9E802B44;
 Fri, 29 Jan 2021 17:11:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4806A8E8;
 Fri, 29 Jan 2021 17:11:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] docs: simplify and clarify the platform support rules
Date: Fri, 29 Jan 2021 17:10:56 +0000
Message-Id: <20210129171102.4109641-8-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The distinction between short life and long life Linux distributions
turned out to be redundant. They can both be covered in a simple way
by noting support will target the current release, and the previous
release for a period of two years or until its EOL. This rule can also
apply to the other UNIX based distros, leaving only Windows needing a
different set of rules.

This also clarifies that Debian LTS is out of scope, because the LTS
support is provided by a separate group from the main Debian maintainer
team.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/build-platforms.rst | 63 ++++++++++++---------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/docs/system/build-platforms.rst b/docs/system/build-platforms.rst
index 9734eba2f1..692323609e 100644
--- a/docs/system/build-platforms.rst
+++ b/docs/system/build-platforms.rst
@@ -25,55 +25,38 @@ software in their distro, QEMU upstream code will not add explicit
 support for those backports, unless the feature is auto-detectable in a
 manner that works for the upstream releases too.
 
-The Repology site https://repology.org is a useful resource to identify
+The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
-Linux OS
---------
+Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
+-----------------------------------------
 
-For distributions with frequent, short-lifetime releases, the project
-will aim to support all versions that are not end of life by their
-respective vendors. For the purposes of identifying supported software
-versions, the project will look at Fedora, Ubuntu, and openSUSE distros.
-Other short- lifetime distros will be assumed to ship similar software
-versions.
+The project aims to support the most recent major version at all times. Support
+for the previous major version will be dropped 2 years after the new major
+version is released or when the vendor itself drops support, whichever comes
+first. In this context, third-party efforts to extend the lifetime of a distro
+are not considered, even when they are endorsed by the vendor (eg. Debian LTS).
 
-For distributions with long-lifetime releases, the project will aim to
-support the most recent major version at all times. Support for the
-previous major version will be dropped 2 years after the new major
-version is released, or when it reaches "end of life". For the purposes
-of identifying supported software versions, the project will look at
-RHEL, Debian, Ubuntu LTS, and SLES distros. Other long-lifetime distros
-will be assumed to ship similar software versions.
+For the purposes of identifying supported software versions available on Linux,
+the project will look at CentOS, Debian, Fedora, openSUSE, RHEL, SLES and
+Ubuntu LTS. Other distros will be assumed to ship similar software versions.
 
-Windows
--------
-
-The project supports building with current versions of the MinGW
-toolchain, hosted on Linux.
-
-macOS
------
+For FreeBSD and OpenBSD, decisions will be made based on the contents of the
+respective ports repository, while NetBSD will use the pkgsrc repository.
 
-The project supports building with the two most recent versions of
-macOS, with the current Homebrew package set available.
+For macOS, `HomeBrew`_ will be used, although `MacPorts`_ is expected to carry
+similar versions.
 
-FreeBSD
+Windows
 -------
 
-The project aims to support all versions which are not end of
-life.
-
-NetBSD
-------
+The project supports building with current versions of the MinGW toolchain,
+hosted on Linux (Debian/Fedora).
 
-The project aims to support the most recent major version at all times.
-Support for the previous major version will be dropped 2 years after the
-new major version is released.
-
-OpenBSD
--------
+The version of the Windows API that's currently targeted is Vista / Server
+2008.
 
-The project aims to support all versions which are not end of
-life.
+.. _HomeBrew: https://brew.sh/
+.. _MacPorts: https://www.macports.org/
+.. _Repology: https://repology.org/
-- 
2.29.2


