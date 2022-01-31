Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9A4A4CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:11:22 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaD3-00086H-CS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:11:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6k-0001gW-Ve
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6i-0007Si-Ow
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKdf8yOehZE/jWOSlPC4m+igdOOgUTO7o0AQoQ84QBM=;
 b=CV4rtbf3JE/HGtxhAozMhZd85cCoVOZE0kRhrCqBf8Y56SLf/IoHQINu8jqmejuldcsmwG
 JWRRqELjYUk0gjqpIRY57G8NtJrlh+XtzC9azxYcW+jRwW++c05fv5/QuI2CN8ShrnUd7V
 bg6AGXkCKoctlwUWxWD5D2D6+O/fpZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-sBi0eKICMGOi1IJjhmaTsQ-1; Mon, 31 Jan 2022 12:04:40 -0500
X-MC-Unique: sBi0eKICMGOi1IJjhmaTsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF85A100C672;
 Mon, 31 Jan 2022 17:04:37 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936A210A48D5;
 Mon, 31 Jan 2022 17:04:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/5] docs: Only mention curl in the man page when available
Date: Mon, 31 Jan 2022 18:04:10 +0100
Message-Id: <20220131170411.125198-5-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-1-kwolf@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If curl is disabled in the build, the man page shouldn't contain
information on how to use the curl block drivers.

This patch is best viewed with whitespace changes ignored.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/device-url-syntax.rst.inc | 114 +++++++++++++-------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index 84a8145292..d55622847a 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -128,87 +128,89 @@ special URL syntax.
 
    See also http://www.gluster.org.
 
-``HTTP/HTTPS/FTP/FTPS``
-   QEMU supports read-only access to files accessed over http(s) and
-   ftp(s).
+.. only:: not DISABLE_CURL
 
-   Syntax using a single filename:
+    ``HTTP/HTTPS/FTP/FTPS``
+       QEMU supports read-only access to files accessed over http(s) and
+       ftp(s).
 
-   ::
+       Syntax using a single filename:
 
-      <protocol>://[<username>[:<password>]@]<host>/<path>
+       ::
 
-   where:
+          <protocol>://[<username>[:<password>]@]<host>/<path>
 
-   ``protocol``
-      'http', 'https', 'ftp', or 'ftps'.
+       where:
 
-   ``username``
-      Optional username for authentication to the remote server.
+       ``protocol``
+          'http', 'https', 'ftp', or 'ftps'.
 
-   ``password``
-      Optional password for authentication to the remote server.
+       ``username``
+          Optional username for authentication to the remote server.
 
-   ``host``
-      Address of the remote server.
+       ``password``
+          Optional password for authentication to the remote server.
 
-   ``path``
-      Path on the remote server, including any query string.
+       ``host``
+          Address of the remote server.
 
-   The following options are also supported:
+       ``path``
+          Path on the remote server, including any query string.
 
-   ``url``
-      The full URL when passing options to the driver explicitly.
+       The following options are also supported:
 
-   ``readahead``
-      The amount of data to read ahead with each range request to the
-      remote server. This value may optionally have the suffix 'T', 'G',
-      'M', 'K', 'k' or 'b'. If it does not have a suffix, it will be
-      assumed to be in bytes. The value must be a multiple of 512 bytes.
-      It defaults to 256k.
+       ``url``
+          The full URL when passing options to the driver explicitly.
 
-   ``sslverify``
-      Whether to verify the remote server's certificate when connecting
-      over SSL. It can have the value 'on' or 'off'. It defaults to
-      'on'.
+       ``readahead``
+          The amount of data to read ahead with each range request to the
+          remote server. This value may optionally have the suffix 'T', 'G',
+          'M', 'K', 'k' or 'b'. If it does not have a suffix, it will be
+          assumed to be in bytes. The value must be a multiple of 512 bytes.
+          It defaults to 256k.
 
-   ``cookie``
-      Send this cookie (it can also be a list of cookies separated by
-      ';') with each outgoing request. Only supported when using
-      protocols such as HTTP which support cookies, otherwise ignored.
+       ``sslverify``
+          Whether to verify the remote server's certificate when connecting
+          over SSL. It can have the value 'on' or 'off'. It defaults to
+          'on'.
 
-   ``timeout``
-      Set the timeout in seconds of the CURL connection. This timeout is
-      the time that CURL waits for a response from the remote server to
-      get the size of the image to be downloaded. If not set, the
-      default timeout of 5 seconds is used.
+       ``cookie``
+          Send this cookie (it can also be a list of cookies separated by
+          ';') with each outgoing request. Only supported when using
+          protocols such as HTTP which support cookies, otherwise ignored.
 
-   Note that when passing options to qemu explicitly, ``driver`` is the
-   value of <protocol>.
+       ``timeout``
+          Set the timeout in seconds of the CURL connection. This timeout is
+          the time that CURL waits for a response from the remote server to
+          get the size of the image to be downloaded. If not set, the
+          default timeout of 5 seconds is used.
 
-   Example: boot from a remote Fedora 20 live ISO image
+       Note that when passing options to qemu explicitly, ``driver`` is the
+       value of <protocol>.
 
-   .. parsed-literal::
+       Example: boot from a remote Fedora 20 live ISO image
 
-      |qemu_system_x86| --drive media=cdrom,file=https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly
+       .. parsed-literal::
 
-      |qemu_system_x86| --drive media=cdrom,file.driver=http,file.url=http://archives.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly
+          |qemu_system_x86| --drive media=cdrom,file=https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly
 
-   Example: boot from a remote Fedora 20 cloud image using a local
-   overlay for writes, copy-on-read, and a readahead of 64k
+          |qemu_system_x86| --drive media=cdrom,file.driver=http,file.url=http://archives.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly
 
-   .. parsed-literal::
+       Example: boot from a remote Fedora 20 cloud image using a local
+       overlay for writes, copy-on-read, and a readahead of 64k
 
-      qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"http",, "file.url":"http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2",, "file.readahead":"64k"}' /tmp/Fedora-x86_64-20-20131211.1-sda.qcow2
+       .. parsed-literal::
 
-      |qemu_system_x86| -drive file=/tmp/Fedora-x86_64-20-20131211.1-sda.qcow2,copy-on-read=on
+          qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"http",, "file.url":"http://archives.fedoraproject.org/pub/archive/fedora/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2",, "file.readahead":"64k"}' /tmp/Fedora-x86_64-20-20131211.1-sda.qcow2
 
-   Example: boot from an image stored on a VMware vSphere server with a
-   self-signed certificate using a local overlay for writes, a readahead
-   of 64k and a timeout of 10 seconds.
+          |qemu_system_x86| -drive file=/tmp/Fedora-x86_64-20-20131211.1-sda.qcow2,copy-on-read=on
 
-   .. parsed-literal::
+       Example: boot from an image stored on a VMware vSphere server with a
+       self-signed certificate using a local overlay for writes, a readahead
+       of 64k and a timeout of 10 seconds.
+
+       .. parsed-literal::
 
-      qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"https",, "file.url":"https://user:password@vsphere.example.com/folder/test/test-flat.vmdk?dcPath=Datacenter&dsName=datastore1",, "file.sslverify":"off",, "file.readahead":"64k",, "file.timeout":10}' /tmp/test.qcow2
+          qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"https",, "file.url":"https://user:password@vsphere.example.com/folder/test/test-flat.vmdk?dcPath=Datacenter&dsName=datastore1",, "file.sslverify":"off",, "file.readahead":"64k",, "file.timeout":10}' /tmp/test.qcow2
 
-      |qemu_system_x86| -drive file=/tmp/test.qcow2
+          |qemu_system_x86| -drive file=/tmp/test.qcow2
-- 
2.31.1


