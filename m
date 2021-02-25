Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE92324BF2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:24:07 +0100 (CET)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFBwL-0004Xf-KV
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lFBvC-0003jl-84
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:22:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lFBv9-0008L0-Pi
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614241369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYFOgyPgGGdf8PqZwTcY6gcW88oO048kT5jhl8lqKTo=;
 b=L6v8bPMTPXQgxSGZfKHivZSetGaq5LXM26PrJRJL5H7VLDV9Xty4exOv+B86157DytOP+c
 v3/CUnKhlJsJnDE4bIlyemoJuXgdHRFpT33vu/5ku5sbTKj0kvP8f73XltEQTM7V4Nm/v9
 mG8vmOS4mhq+yj9dKUd0YrMG8wiWYow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-n10Qx7T_Mle8qROtA689Hg-1; Thu, 25 Feb 2021 03:22:47 -0500
X-MC-Unique: n10Qx7T_Mle8qROtA689Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3B7D79EC1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-74.ams2.redhat.com
 [10.36.113.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACCEE60855;
 Thu, 25 Feb 2021 08:22:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] libqos/qgraph: format qgraph comments for sphinx
 documentation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224101810.52851-1-eesposit@redhat.com>
 <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
 <919d2c24-92f8-53e8-5598-97166add3083@redhat.com>
Message-ID: <6ac6ecf9-ea88-56f5-43c5-645627ff5d9e@redhat.com>
Date: Thu, 25 Feb 2021 09:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <919d2c24-92f8-53e8-5598-97166add3083@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/02/2021 11:59, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 24/02/2021 11:49, Paolo Bonzini wrote:
>> On 24/02/21 11:18, Emanuele Giuseppe Esposito wrote:
>>>     qtest
>>> +   qgraph
>>
>> It may make sense to add instead a "toctree" directive in qtest.rst.  
>> I haven't checked what the result looks like, though.
> 
> Current result is
> 
> - QTest Device Emulation Testing Framework
> - Qtest Driver Framework
> 
> but I agree, maybe with an internal toctree in qtest.rst it will be 
> clearer. I'll try.

After trying, I think that simply adding a toctree in qtest.rst is not 
the prettiest solution. The end result will be something like

Qtest driver framework (title)
	- qgraph (link to qgraph.rst)
QTest is a device emulation testing framework... [qtest.rst content]

The qgraph link will be also visible in docs/index and docs/devel/index

What about this:

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index 9349c45af8..62a45cbcbf 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -1,5 +1,261 @@
+.. _qgraph:
+
  ========================================
  Qtest Driver Framework
  ========================================

-------

Add anchor in graph.rst


  .. kernel-doc:: tests/qtest/libqos/qgraph.h
diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index 97c5a75626..b7201456b6 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -2,6 +2,12 @@
  QTest Device Emulation Testing Framework
  ========================================

+.. toctree::
+   :hidden:
+
+   qgraph
+
+
  QTest is a device emulation testing framework.  It can be very useful 
to test
  device models; it could also control certain aspects of QEMU (such as 
virtual
  clock stepping), with a special purpose "qtest" protocol.  Refer to
@@ -24,6 +30,9 @@ On top of libqtest, a higher level library, 
``libqos``, was created to
  encapsulate common tasks of device drivers, such as memory management and
  communicating with system buses or devices. Many virtual device tests use
  libqos instead of directly calling into libqtest.
+Libqos also offers the qgraph API to increase each test coverage and
+automate QEMU command line arguments and devices setup.
+Refer to :ref:`qgraph` for Qgraph explanation and API.

  Steps to add a new QTest case are:

-------

Add hidden toctree because the new file must be linked by at least one, 
and reference qgraph in the text using the anchor.



diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 1dcce3bbed..f0038f8722 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -12,6 +12,7 @@ Contents:

  .. toctree::
     :maxdepth: 2
+   :includehidden:

     build-system
     kconfig
@@ -24,7 +25,6 @@ Contents:
     atomics
     stable-process
     qtest
-   qgraph
     decodetree
     secure-coding-practices
     tcg

-------

Allow showing the hidden toctree in the docs/devel index, so that the 
link is visible

End result:
- no visible change in docs/index
- qgraph link visible in docs/devel/index
- qgraph linked as text link in qtree

Thank you,
Emanuele


