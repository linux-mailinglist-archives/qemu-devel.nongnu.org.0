Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC74E710E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 11:19:31 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXh2Y-0006pi-4o
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 06:19:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nXh0Q-0005Xo-I1
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:17:20 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nXh0N-0003lh-Vq
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:17:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF7D0210DD;
 Fri, 25 Mar 2022 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648203428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDaTF01GvoK3OwsX6oerSVKX3cZ2MPyCatWKeKzjJnI=;
 b=uYCEI11yn+ALDLSMUDNQEn8X3tBie8HDnVJyaOcnHna29C50bLOZ/Nclz/zFIuQYiuNk6e
 14FJL8KgqUaaAdtmfuxc/IWvt/l4h7V4dLoa3c4dVfvwuFQH12y/016/imlaetHnO+CNWp
 vFVRrpGEduhaqEOQ2KsrHdfNsFUNcmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648203428;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDaTF01GvoK3OwsX6oerSVKX3cZ2MPyCatWKeKzjJnI=;
 b=JGRtA1naeERJzAK12tA2Sty7oQhEmHqNPHfaOFX7Xpkn5MEjVgCsUhEFezzXxGuecNlYXA
 nOoao1JFrvr5iEDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 835ED13A30;
 Fri, 25 Mar 2022 10:17:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id okhoG6SWPWK6FwAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 25 Mar 2022 10:17:08 +0000
Message-ID: <32ff3a63-fb50-8038-3f2e-5bfd70b01344@suse.de>
Date: Fri, 25 Mar 2022 11:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: iotest40 problem
Content-Language: en-US
From: Li Zhang <lizhang@suse.de>
To: QEMU Developers <qemu-devel@nongnu.org>, kwolf@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
References: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
In-Reply-To: <1c4fd757-5d08-0099-b842-4295c430a176@suse.de>
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

Hi,

I backport some iotests patches to the tree and change timeout.
It doesn't work.

Sometimes, iotest41 also reports the errors.
[ 1347s] 
+======================================================================
[ 1347s] +ERROR: test_top_node_in_wrong_chain (__main__.TestSingleDrive)
[ 1347s] 
+----------------------------------------------------------------------
[ 1347s] +Traceback (most recent call last):
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 399, in launch
[ 1347s] +    self._launch()
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 434, in _launch
[ 1347s] +    self._post_launch()
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
line 147, in _post_launch
[ 1347s] +    super()._post_launch()
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
line 340, in _post_launch
[ 1347s] +    self._qmp.accept(self._qmp_timer)
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
line 69, in accept
[ 1347s] +    timeout
[ 1347s] +  File 
"/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
line 42, in _sync
[ 1347s] +    asyncio.wait_for(future, timeout=timeout)
[ 1347s] +  File "/usr/lib64/python3.6/asyncio/base_events.py", line 
488, in run_until_complete
[ 1347s] +    return future.result()
[ 1347s] +  File "/usr/lib64/python3.6/asyncio/tasks.py", line 362, in 
wait_for
[ 1347s] +    raise futures.TimeoutError()
[ 1347s] +concurrent.futures._base.TimeoutError


I can see other errors like this, it's the problem of the socket.

[ 1535s] socket_accept failed: Resource temporarily unavailable
[ 1535s] **
[ 1535s] 
ERROR:../tests/qtest/libqtest.c:321:qtest_init_without_qmp_handshake: 
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)


The script is running the command as this:
/usr/bin/make -O -j4 check-block V=1

I can see the errors on ppc, arm or x86.
But I couldn't reproduce it when I run it manually.

It will be appreciated if any suggestions. Thanks.


On 3/24/22 14:47, Li Zhang wrote:
> Hi,
> 
> When I run the testsuit on our buidling system, it reports a timeout 
> sometimes not always as the following.
> It couldn't connect qmp socket. Any ideas about this problem?
> 
> 
> [ 1989s] --- 
> /home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040.out
> [ 1989s] +++ 040.out.bad
> [ 1989s] @@ -1,5 +1,55 @@
> [ 1989s] -.................................................................
> [ 1989s] +....ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed to establish 
> connection: asyncio.exceptions.CancelledError
> [ 1989s] 
> +E..................................ERROR:qemu.aqmp.qmp_client.qemu-6471:Failed 
> to establish connection: asyncio.exceptions.CancelledError
> [ 1989s] +E.........................
> [ 1989s] 
> +======================================================================
> [ 1989s] +ERROR: test_commit_node (__main__.TestActiveZeroLengthImage)
> [ 1989s] 
> +----------------------------------------------------------------------
> [ 1989s] +Traceback (most recent call last):
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/tests/qemu-iotests/040", line 
> 94, in setUp
> [ 1989s] +    self.vm.launch()
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
> line 399, in launch
> [ 1989s] +    self._launch()
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
> line 434, in _launch
> [ 1989s] +    self._post_launch()
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/qtest.py", 
> line 147, in _post_launch
> [ 1989s] +    super()._post_launch()
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/machine/machine.py", 
> line 340, in _post_launch
> [ 1989s] +    self._qmp.accept(self._qmp_timer)
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
> line 67, in accept
> [ 1989s] +    self._sync(
> [ 1989s] +  File 
> "/home/abuild/rpmbuild/BUILD/qemu-6.2.0/python/qemu/aqmp/legacy.py", 
> line 41, in _sync
> [ 1989s] +    return self._aloop.run_until_complete(
> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/base_events.py", line 
> 616, in run_until_complete
> [ 1989s] +    return future.result()
> [ 1989s] +  File "/usr/lib64/python3.8/asyncio/tasks.py", line 501, in 
> wait_for
> [ 1989s] +    raise exceptions.TimeoutError()
> [ 1989s] +asyncio.exceptions.TimeoutError
> 


