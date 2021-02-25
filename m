Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602633250A9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:43:14 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGvB-0006BN-Cy
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lFGpm-00018I-93
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:37:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lFGpd-0005JA-Bt
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 08:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614260247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Btdw7LtvuwIAc0ZhWBKpjPiZbyQnNJ6VlWhn9Bk/ARg=;
 b=Sm69Y77wNXOEm0KSFO3x4Hyn5qdUTQcpPlok47Qxo6XRKoF8vfi7xHnN7A0iOp73We+zbG
 jpqeOXn57ZU5uVLDG2hvB3TtxxvAaTzE7aM1l9ayuGz2OCVMjWwjvwlUXznx62rboQLdhw
 nhrClKY6LVorKG5cCWHS8Hl5WCwSL3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-khvnfASHP9uqMcnzPFUs1A-1; Thu, 25 Feb 2021 08:37:25 -0500
X-MC-Unique: khvnfASHP9uqMcnzPFUs1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5066C1856A83
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 13:37:23 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B6010013D6;
 Thu, 25 Feb 2021 13:37:18 +0000 (UTC)
Subject: Re: QEMU CI failed due to canceled download
To: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <e8880ea6-7bc0-df19-4355-2c0b59c3d087@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <711e020f-9b65-7b1b-8d22-681d2044d60f@redhat.com>
Date: Thu, 25 Feb 2021 10:37:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e8880ea6-7bc0-df19-4355-2c0b59c3d087@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/25/21 1:51 AM, Thomas Huth wrote:
>
>  Hi,
>
> I just faced this failure in the CI:
>
>  https://gitlab.com/thuth/qemu/-/jobs/1053467007#L73
>
> I thought we'd handle CANCEL as "skipped"? Why did this
> cause the CI to fail?

Yes, CANCEL'ed tests should not change the job status (same semantic of 
SKIP).

For that execution in particular the test was actually interrupted (see 
on the summary report, the INTERRUPT accounts for 1). Sorry, I only 
glanced at the logs so I am not sure it is a bug on the fetch/download 
code or somewhere else.

BTW, it seems the GitLab cache mechanism for those acceptance tests is 
not working, as can be seen in:

https://gitlab.com/thuth/qemu/-/jobs/1053467007#L25

Thanks!

Wainer

>
>
> For reference, here's the debug.log:
>
> 19:33:28 DEBUG| PARAMS (key=arch, path=*, default=aarch64) => 'aarch64'
> 19:33:28 DEBUG| PARAMS (key=machine, path=*, default=None) => None
> 19:33:28 DEBUG| PARAMS (key=qemu_bin, path=*, 
> default=./qemu-system-aarch64) => './qemu-system-aarch64'
> 19:33:28 DEBUG| Looking for and selecting a qemu-img binary to be used 
> to create the bootable snapshot image
> 19:33:28 INFO | Downloading/preparing boot image
> 19:48:28 ERROR|
> 19:48:28 ERROR| Reproduced traceback from: 
> /builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/core/test.py:753
> 19:48:28 ERROR| Traceback (most recent call last):
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 292, in download_boot
> 19:48:28 ERROR|     boot = vmimage.get(
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 533, in get
> 19:48:28 ERROR|     return Image(name=provider.name, 
> url=provider.get_image_url(),
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 205, in get_image_url
> 19:48:28 ERROR|     if int(self.version) >= 28:
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 97, in version
> 19:48:28 ERROR|     return self._best_version or self.get_version()
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 146, in get_version
> 19:48:28 ERROR|     resulting_versions = self.get_versions()
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 124, in get_versions
> 19:48:28 ERROR|     self._feed_html_parser(self.url_versions, parser)
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 113, in _feed_html_parser
> 19:48:28 ERROR|     data = urlopen(url).read()
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 222, in urlopen
> 19:48:28 ERROR|     return opener.open(url, data, timeout)
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 525, in open
> 19:48:28 ERROR|     response = self._open(req, data)
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 542, in _open
> 19:48:28 ERROR|     result = self._call_chain(self.handle_open, 
> protocol, protocol +
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 502, in _call_chain
> 19:48:28 ERROR|     result = func(*args)
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 1393, in https_open
> 19:48:28 ERROR|     return self.do_open(http.client.HTTPSConnection, req,
> 19:48:28 ERROR|   File "/usr/lib/python3.8/urllib/request.py", line 
> 1354, in do_open
> 19:48:28 ERROR|     r = h.getresponse()
> 19:48:28 ERROR|   File "/usr/lib/python3.8/http/client.py", line 1347, 
> in getresponse
> 19:48:28 ERROR|     response.begin()
> 19:48:28 ERROR|   File "/usr/lib/python3.8/http/client.py", line 307, 
> in begin
> 19:48:28 ERROR|     version, status, reason = self._read_status()
> 19:48:28 ERROR|   File "/usr/lib/python3.8/http/client.py", line 268, 
> in _read_status
> 19:48:28 ERROR|     line = str(self.fp.readline(_MAXLINE + 1), 
> "iso-8859-1")
> 19:48:28 ERROR|   File "/usr/lib/python3.8/socket.py", line 669, in 
> readinto
> 19:48:28 ERROR|     return self._sock.recv_into(b)
> 19:48:28 ERROR|   File "/usr/lib/python3.8/ssl.py", line 1241, in 
> recv_into
> 19:48:28 ERROR|     return self.read(nbytes, buffer)
> 19:48:28 ERROR|   File "/usr/lib/python3.8/ssl.py", line 1099, in read
> 19:48:28 ERROR|     return self._sslobj.read(len, buffer)
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/plugins/runner.py", 
> line 77, in sigterm_handler
> 19:48:28 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
> 19:48:28 ERROR| RuntimeError: Test interrupted by SIGTERM
> 19:48:28 ERROR|
> 19:48:28 ERROR| During handling of the above exception, another 
> exception occurred:
> 19:48:28 ERROR|
> 19:48:28 ERROR| Traceback (most recent call last):
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 257, in setUp
> 19:48:28 ERROR|     self.set_up_boot()
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 321, in set_up_boot
> 19:48:28 ERROR|     path = self.download_boot()
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 299, in download_boot
> 19:48:28 ERROR|     self.cancel('Failed to download/prepare boot image')
> 19:48:28 ERROR|   File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/core/test.py", 
> line 984, in cancel
> 19:48:28 ERROR|     raise exceptions.TestCancel(message)
> 19:48:28 ERROR| avocado.core.exceptions.TestCancel: Failed to 
> download/prepare boot image
> 19:48:28 ERROR|
> 19:48:28 ERROR| CANCEL 
> 01-tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg -> 
> TestCancel: Failed to download/prepare boot image
> 19:48:28 INFO |
>
> Runner error occurred: Timeout reached
> Original status: CANCEL
> {'name': 
> '01-tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg', 
> 'logdir': 
> '/builds/thuth/qemu/build/tests/results/job-2021-02-24T19.33-5b27292/test-results/01-tests_acceptance_boot_linux.py_BootLinuxAarch64.test_virt_tcg', 
> 'logfile': 
> '/builds/thuth/qemu/build/tests/results/job-2021-02-24T19.33-5b27292/test-results/01-tests_acceptance_boot_linux.py_BootLinuxAarch64.test_virt_tcg/debug.log', 
> 'status': 'CANCEL', 'running': False, 'paused': False, 'time_start': 
> 1614195208.4540772, 'time_elapsed': 900.2490696907043, 'time_end': 
> 1614196108.703147, 'fail_reason': 'Failed to download/prepare boot 
> image', 'fail_class': 'TestCancel', 'traceback': 'Traceback (most 
> recent call last):\n File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 292, in download_boot\n    boot = vmimage.get(\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 533, in get\n    return Image(name=provider.name, 
> url=provider.get_image_url(),\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 205, in get_image_url\n    if int(self.version) >= 28:\n File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 97, in version\n    return self._best_version or 
> self.get_version()\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 146, in get_version\n    resulting_versions = 
> self.get_versions()\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 124, in get_versions\n self._feed_html_parser(self.url_versions, 
> parser)\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/utils/vmimage.py", 
> line 113, in _feed_html_parser\n    data = urlopen(url).read()\n File 
> "/usr/lib/python3.8/urllib/request.py", line 222, in urlopen\n    
> return opener.open(url, data, timeout)\n  File 
> "/usr/lib/python3.8/urllib/request.py", line 525, in open\n response = 
> self._open(req, data)\n  File "/usr/lib/python3.8/urllib/request.py", 
> line 542, in _open\n result = self._call_chain(self.handle_open, 
> protocol, protocol +\n  File "/usr/lib/python3.8/urllib/request.py", 
> line 502, in _call_chain\n    result = func(*args)\n  File 
> "/usr/lib/python3.8/urllib/request.py", line 1393, in https_open\n    
> return self.do_open(http.client.HTTPSConnection, req,\n  File 
> "/usr/lib/python3.8/urllib/request.py", line 1354, in do_open\n    r = 
> h.getresponse()\n  File "/usr/lib/python3.8/http/client.py", line 
> 1347, in getresponse\n    response.begin()\n  File 
> "/usr/lib/python3.8/http/client.py", line 307, in begin\n version, 
> status, reason = self._read_status()\n  File 
> "/usr/lib/python3.8/http/client.py", line 268, in _read_status\n    
> line = str(self.fp.readline(_MAXLINE + 1), "iso-8859-1")\n  File 
> "/usr/lib/python3.8/socket.py", line 669, in readinto\n    return 
> self._sock.recv_into(b)\n  File "/usr/lib/python3.8/ssl.py", line 
> 1241, in recv_into\n    return self.read(nbytes, buffer)\n  File 
> "/usr/lib/python3.8/ssl.py", line 1099, in read\n    return 
> self._sslobj.read(len, buffer)\n File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/plugins/runner.py", 
> line 77, in sigterm_handler\n    raise RuntimeError("Test interrupted 
> by SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n\nDuring 
> handling of the above exception, another exception 
> occurred:\n\nTraceback (most recent call last):\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/core/test.py", 
> line 747, in _run_avocado\n    self.setUp()\n  File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 257, in setUp\n    self.set_up_boot()\n  File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 321, in set_up_boot\n    path = self.download_boot()\n  File 
> "/builds/thuth/qemu/build/tests/acceptance/avocado_qemu/__init__.py", 
> line 299, in download_boot\n    self.cancel(\'Failed to 
> download/prepare boot image\')\n  File 
> "/builds/thuth/qemu/build/tests/venv/lib/python3.8/site-packages/avocado/core/test.py", 
> line 984, in cancel\n    raise 
> exceptions.TestCancel(message)\navocado.core.exceptions.TestCancel: 
> Failed to download/prepare boot image\n', 'timeout': 900, 
> 'whiteboard': '', 'phase': 'FINISHED', 'class_name': 
> 'BootLinuxAarch64', 'job_logdir': 
> '/builds/thuth/qemu/build/tests/results/job-2021-02-24T19.33-5b27292', 
> 'job_unique_id': '5b27292fb97a200bfe5bfeae2d35f53b94eb4c5c', 'params': 
> []}
>
>
>  Thomas


