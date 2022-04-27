Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F114251188F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:55:55 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nji94-0003cV-IC
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nji5S-0001c1-6A
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nji5O-00020m-U3
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651067525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8EkPS2IUAk0KSOGzcc9KgJm8VoirNtrLOOM2EbR+Wps=;
 b=Iz4S3cb2B1BC/ViWSgYPKxEGVWxxPOqhDMTJoinEaDsfzDFGYv7OiFjMM4/JzQ76eOUgYh
 2LxAJy7axcWou+aWzdYjshhG01n8toe8iSDj9gsdJ9vG2E2D2cCmRd8STOhTZ/1Al32I88
 wxA2s8e7+bac5Ig1aEkCWoZ/PFyOB4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-J3rmO6yhPGOqXgq4FZf4pA-1; Wed, 27 Apr 2022 09:52:04 -0400
X-MC-Unique: J3rmO6yhPGOqXgq4FZf4pA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B60B101AA52;
 Wed, 27 Apr 2022 13:52:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49E82167D64;
 Wed, 27 Apr 2022 13:52:03 +0000 (UTC)
Date: Wed, 27 Apr 2022 08:52:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 4/4] iotests: Add regression test for issue 945
Message-ID: <20220427135201.bc7ohvh6i7lxqy4l@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
 <20220427114057.36651-5-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427114057.36651-5-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 01:40:57PM +0200, Hanna Reitz wrote:
> Create a VM with a BDS in an iothread, add -incoming defer to the
> command line, and then export this BDS via NBD.  Doing so should not
> fail an assertion.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  .../tests/export-incoming-iothread            | 81 +++++++++++++++++++
>  .../tests/export-incoming-iothread.out        |  5 ++
>  2 files changed, 86 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/export-incoming-iothread
>  create mode 100644 tests/qemu-iotests/tests/export-incoming-iothread.out

The test looks sane, and appears to match the formula posted in issue
945.  When applying just patches 3-4 (skipping 1-2), './check
export-incoming-iothread' passed, but './check -qcow2
export-incoming-iothread' failed; so the image format is important.
And the failure was rather verbose, which is a GOOD thing - our
efforts to make the python framework point out abnormal exits is
working!

+WARNING:qemu.machine.machine:qemu received signal 6; command: "/home/eblake/qemu/build/tests/qemu-iotests/...
...
+Traceback (most recent call last):
+  File "/home/eblake/qemu/tests/qemu-iotests/tests/export-incoming-iothread", line 69, in test_export_add
+    result = self.vm.qmp('block-export-add', {
...
+  File "/home/eblake/qemu/python/qemu/qmp/qmp_client.py", line 463, in _reply
+    raise result
+qemu.qmp.qmp_client.ExecInterruptedError: Disconnected
+
+======================================================================
+ERROR: test_export_add (__main__.TestExportIncomingIothread)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/eblake/qemu/python/qemu/machine/machine.py", line 533, in _soft_shutdown
+    self.qmp('quit')
...
+qemu.qmp.protocol.StateError: QMPClient is disconnecting. Call disconnect() to return to IDLE state.
+
+During handling of the above exception, another exception occurred:
+
+Traceback (most recent call last):
+  File "/home/eblake/qemu/python/qemu/machine/machine.py", line 554, in _do_shutdown
+    self._soft_shutdown(timeout)
...
+  File "/home/eblake/qemu/python/qemu/qmp/protocol.py", line 968, in _readline
+    raise EOFError
+EOFError
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "/home/eblake/qemu/tests/qemu-iotests/tests/export-incoming-iothread", line 54, in tearDown
+    self.vm.shutdown()
+  File "/home/eblake/qemu/python/qemu/machine/machine.py", line 583, in shutdown
+    self._do_shutdown(timeout)
+  File "/home/eblake/qemu/python/qemu/machine/machine.py", line 557, in _do_shutdown
+    raise AbnormalShutdown("Could not perform graceful shutdown") \
+qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown
+
 ----------------------------------------------------------------------
 Ran 1 tests

-OK
+FAILED (errors=2)


Then applying patches 1-2 and repeating the test passed, so your test
is a good proof that we identified and fixed the problem at hand.

Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>

Given that it is visible with NBD, I'm happy to queue this series
through my tree if no one else grabs it first.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


