Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13334ED7EC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:46:30 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsJx-0007iw-R1
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:46:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nZsHs-00069F-50
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:44:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nZsHq-00042p-6p
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:44:19 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D027221A9E;
 Thu, 31 Mar 2022 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648723456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5/lv+0+eaL2Ay59zzyhtI4DR81TT3Q0p4DhYUUg+Bs=;
 b=Zwjf5ZVP4nmwQD/rhEeuz7NSmf+LRKZjvzM1fMoACIwNZphqqxguKH9TzJtAU8yLHrZ+JJ
 RSS+rXpNxYJKMqnMZXkpR12YrHtZ2y5rSgt2urXLxnTtqGxaK6/89Ar3h+NjlT2Emids3C
 QmYqqrQY0A4XG9ziD3aGooZ6WO+dugw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648723456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5/lv+0+eaL2Ay59zzyhtI4DR81TT3Q0p4DhYUUg+Bs=;
 b=EpBGe/o5yTD3etkEhqQEyFj8H9EH2qDk/9GYZUxvsOxZxXu1n5jExRqD3YVH7tb1Wtxlmd
 u4opVZxFAkZiv4Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4359133D4;
 Thu, 31 Mar 2022 10:44:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AGhrJgCGRWJVYQAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 31 Mar 2022 10:44:16 +0000
Message-ID: <7a952654-c163-00c9-8538-e07afef47ca8@suse.de>
Date: Thu, 31 Mar 2022 12:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: iotest40 problem
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 kwolf@redhat.com, John Snow <jsnow@redhat.com>
References: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
 <32ff3a63-fb50-8038-3f2e-5bfd70b01344@suse.de>
 <37635a04-b717-b7c6-88a0-1b3cecc0c4f5@suse.de>
 <8a898f41-98e1-5a02-4cd8-a697bcb6d9a1@redhat.com>
From: Li Zhang <lizhang@suse.de>
In-Reply-To: <8a898f41-98e1-5a02-4cd8-a697bcb6d9a1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 08:10, Hanna Reitz wrote:
> On 29.03.22 18:49, Li Zhang wrote:
>> Update what I observed.
>>
>> It seems that aqmp is not stable when running test cases.
>> So I revert the patches as the following, iotest40/41 test cases work 
>> well.
> 
> Thanks for bisecting.  I haven’t seen this problem before, so I didn’t 
> look into it; CC-ing John, perhaps he figures something.
> 
Thanks a lot.
It happens occassionally. I didn't find a way to reproduce it manually.

> Hanna
> 
>> commit 76cd358671e6b8e7c435ec65b1c44200254514a9
>>
>> Author: John Snow <jsnow@redhat.com>
>>
>> Date:   Tue Oct 26 13:56:12 2021 -0400
>>
>>
>>
>>     python, iotests: replace qmp with aqmp
>>
>>
>>
>>     Swap out the synchronous QEMUMonitorProtocol from qemu.qmp with 
>> the sync
>>
>>     wrapper from qemu.aqmp instead.
>>
>>
>>
>>     Add an escape hatch in the form of the environment variable
>>
>>     QEMU_PYTHON_LEGACY_QMP which allows you to cajole QEMUMachine into 
>> using
>>
>>     the old implementation, proving that both implementations work
>>
>>     concurrently.
>>
>>
>>
>>     Signed-off-by: John Snow <jsnow@redhat.com>
>>
>>     Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>>
>>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>>
>>     Message-id: 20211026175612.4127598-9-jsnow@redhat.com
>>
>>     Signed-off-by: John Snow <jsnow@redhat.com>
>>
>>
>> commit 1611e6cf4e7163f6102b37010a8b7e7120f468b5
>>
>> Author: John Snow <jsnow@redhat.com>
>>
>> Date:   Thu Nov 18 15:46:18 2021 -0500
>>
>>
>>
>>     python/machine: handle "fast" QEMU terminations
>>
>>
>>
>>     In the case that the QEMU process actually launches -- but then 
>> dies so
>>
>>     quickly that we can't establish a QMP connection to it -- QEMUMachine
>>
>>     currently calls _post_shutdown() assuming that it never launched 
>> the VM
>>
>>     process.
>>
>>
>>
>>     This isn't true, though: it "merely" may have failed to establish 
>> a QMP
>>
>>     connection and the process is in the middle of its own exit path.
>>
>>
>>
>>     If we don't wait for the subprocess, the caller may get a bogus 
>> `None`
>>
>>     return for .exitcode(). This behavior was observed from
>>
>>     device-crash-test; after the switch to Async QMP, the timings were
>>
>>     changed such that it was now seemingly possible to witness the 
>> failure
>>
>>     of "vm.launch()" *prior* to the exitcode becoming available.
>>
>>
>>
>>     The semantic of the `_launched` property is changed in this
>>
>>     patch. Instead of representing the condition "launch() executed
>>
>>     successfully", it will now represent "has forked a child process
>>
>>     successfully". This way, wait() when called in the exit path won't
>>
>>     become a no-op.
>>
>>
>>
>>     Signed-off-by: John Snow <jsnow@redhat.com>
>>
>>     Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>
>>     Message-id: 20211118204620.1897674-6-jsnow@redhat.com
>>
>>     Signed-off-by: John Snow <jsnow@redhat.com>
>>
>>
>>
>>
>>
>> On 3/25/22 11:17, Li Zhang wrote:
>>> Hi,
>>>
>>> I backport some iotests patches to the tree and change timeout.
>>> It doesn't work.
>>>
>>> Sometimes, iotest41 also reports the errors.
>>> [ 1347s] 
>>> +======================================================================
>>> [ 1347s] +ERROR: test_top_node_in_wrong_chain (__main__.TestSingleDrive)
>>> [ 1347s] 
>>> +----------------------------------------------------------------------
>>> [ 1347s] +Traceback (most recent call last):
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 399, in launch
>>> [ 1347s] +    self._launch()
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 434, in _launch
>>> [ 1347s] +    self._post_launch()
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", line 
>>> 147, in _post_launch
>>> [ 1347s] +    super()._post_launch()
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>> line 340, in _post_launch
>>> [ 1347s] +    self._qmp.accept(self._qmp_timer)
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>> line 69, in accept
>>> [ 1347s] +    timeout
>>> [ 1347s] +  File 
>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>> line 42, in _sync
>>> [ 1347s] +    asyncio.wait_for(future, timeout=timeout)
>>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/base_events.py", line 
>>> 488, in run_until_complete
>>> [ 1347s] +    return future.result()
>>> [ 1347s] +  File "/usr/lib64/python3.6/asyncio/tasks.py", line 362, 
>>> in wait_for
>>> [ 1347s] +    raise futures.TimeoutError()
>>> [ 1347s] +concurrent.futures._base.TimeoutError
>>>
>>>
>>> I can see other errors like this, it's the problem of the socket.
>>>
>>> [ 1535s] socket_accept failed: Resource temporarily unavailable
>>> [ 1535s] **
>>> [ 1535s] 
>>> ERROR:../tests/qtest/libqtest.c:321:qtest_init_without_qmp_handshake: 
>>> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>>>
>>>
>>> The script is running the command as this:
>>> /usr/bin/make -O -j4 check-block V=1
>>>
>>> I can see the errors on ppc, arm or x86.
>>> But I couldn't reproduce it when I run it manually.
>>>
>>> It will be appreciated if any suggestions. Thanks.
>>>
>>>
>>> On 3/24/22 14:47, Li Zhang wrote:
>>>> Hi,
>>>>
>>>> When I run the testsuit on our buidling system, it reports a timeout 
>>>> sometimes not always as the following.
>>>> It couldn't connect qmp socket. Any ideas about this problem?
>>>>
>>>>
>>>> [ 1989s] --- 
>>>> /home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040.out
>>>> [ 1989s] +++ 040.out.bad
>>>> [ 1989s] @@ -1,5 +1,55 @@
>>>> [ 1989s] 
>>>> -.................................................................
>>>> [ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed to 
>>>> establish connection: asyncio.exceptions.CancelledError
>>>> [ 1989s] 
>>>> +E..................................ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed 
>>>> to establish connection: asyncio.exceptions.CancelledError
>>>> [ 1989s] +E.........................
>>>> [ 1989s] 
>>>> +======================================================================
>>>> [ 1989s] +ERROR: test_commit_node (__main__.TestActiveZeroLengthImage)
>>>> [ 1989s] 
>>>> +----------------------------------------------------------------------
>>>> [ 1989s] +Traceback (most recent call last):
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040", 
>>>> line 94, in setUp
>>>> [ 1989s] +    self.vm.launch()
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>>> line 399, in launch
>>>> [ 1989s] +    self._launch()
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>>> line 434, in _launch
>>>> [ 1989s] +    self._post_launch()
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
>>>> line 147, in _post_launch
>>>> [ 1989s] +    super()._post_launch()
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
>>>> line 340, in _post_launch
>>>> [ 1989s] +    self._qmp.accept(self._qmp_timer)
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>>> line 67, in accept
>>>> [ 1989s] +    self._sync(
>>>> [ 1989s] +  File 
>>>> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
>>>> line 41, in _sync
>>>> [ 1989s] +    return self._aloop.run_until_complete(
>>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/base_events.py", line 
>>>> 616, in run_until_complete
>>>> [ 1989s] +    return future.result()
>>>> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/tasks.py", line 501, 
>>>> in wait_for
>>>> [ 1989s] +    raise exceptions.TimeoutError()
>>>> [ 1989s] +asyncio.exceptions.TimeoutError
>>>>
>>>
>>>
>>
> 


