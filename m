Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57D318EF7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:43:38 +0100 (CET)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAE81-0003va-OB
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAE61-0003CV-V2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAE5y-00041x-U5
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613058088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4DeL3YA/bqZ6O2SMn9A36hHFAZ/Y2eihn8XHxga7Zk=;
 b=NE2Qzi6AZ9rNqoOFJ8z4MRdEiJPZToZswy60hF4gPIfVXyhj1xspwc/VwgcUU/rh6ieTjt
 VFFvXM5oXlz5u2L1ZlAQUeu3seH9tAXqitd3v5ibblw78BJvYdnMzhKYn5YjuySfGndZhh
 37lM/3qeTIOnKKUEoxvzzwCoDKqlq5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-6ZNdzF4WMFKZJw-OGsd8ag-1; Thu, 11 Feb 2021 10:41:25 -0500
X-MC-Unique: 6ZNdzF4WMFKZJw-OGsd8ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF0AC73B9;
 Thu, 11 Feb 2021 15:41:24 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B143F5C290;
 Thu, 11 Feb 2021 15:41:14 +0000 (UTC)
Subject: Re: acceptance-system-centos job failure running or1k_sim
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jia Liu <proljc@gmail.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <ea331a46-cc36-ae63-fc7d-223dae10b2e2@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <551e50fd-eb14-b5b6-f763-caf898fe3260@redhat.com>
Date: Thu, 11 Feb 2021 10:41:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ea331a46-cc36-ae63-fc7d-223dae10b2e2@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stafford Horne <shorne@gmail.com>,
 avocado-devel <avocado-devel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 5:55 AM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I got the following error with the or1k_sim image
> (acceptance-system-centos job):
> https://gitlab.com/philmd/qemu/-/jobs/1022309593
> 
> (09/55) tests/acceptance:BootLinuxConsole.test_or1k_sim:  INTERRUPTED
> 22:50:22 DEBUG| CPU: OpenRISC-13 (revision 8) @20 MHz
> ...
> 22:50:23 DEBUG| console [ttyS0] enabled
> 22:50:23 DEBUG| console [ttyS0] enabled
> 22:50:23 DEBUG| bootconsole [uart0] disabled
> 22:50:23 DEBUG| bootconsole [uart0] disabled
> 22:50:23 DEBUG| Freeing unused kernel memory: 1176K
> 22:50:23 DEBUG| This architecture does not have kernel memory protection.
> 22:51:53 ERROR| RuntimeError: Test interrupted by SIGTERM
> 
> Not reproducible, so probably bad luck.
> 
> Still, since the artifact logs are removed after 2 days, I attached
> the debug.log to this mail.
> 
> Note, earlier failures were displayed on the console which is
> archived by Gitlab so we can still access them, example:
> https://gitlab.com/qemu-project/qemu/-/jobs/793741261#L322
> 
> Regards,
> 
> Phil.
> 

Hi. from the gitlab output:

  (09/55) 
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_or1k_sim: 
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout 
reached\nOriginal status: ERROR\n{'name': 
'09-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_or1k_sim', 
'logdir': 
'/builds/philmd/qemu/build/tests/results/job-2021-02-10T22.50-0d5d33e/... (90.74 
s)


"INTERRUPTED" for Avocado means that the test reached the avocado test 
runner's timeout, right? (IIRC, it's 90 seconds.)


 From the debug log, it looks like we hung here:

22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", 
line 54, in wait_for_console_pattern
22:51:53 ERROR|     vm=vm)
22:51:53 ERROR|   File 
"build/tests/acceptance/avocado_qemu/__init__.py", line 130, in 
wait_for_console_pattern
22:51:53 ERROR|     _console_interaction(test, success_message, 
failure_message, None, vm=vm)
22:51:53 ERROR|   File 
"build/tests/acceptance/avocado_qemu/__init__.py", line 82, in 
_console_interaction
22:51:53 ERROR|     msg = console.readline().strip()
22:51:53 ERROR|   File "/usr/lib64/python3.6/socket.py", line 586, in 
readinto
22:51:53 ERROR|     return self._sock.recv_into(b)


Looks like we were waiting for some pattern to show up and it didn't 
arrive within 90 seconds.

The pattern we wanted here was 'QEMU advent calendar'

It looks like the image only got this far:

22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| Freeing unused kernel memory: 1176K
22:50:23 DEBUG| This architecture does not have kernel memory protection.

before it stalled for at least 30 seconds when it was then canceled.

--js


