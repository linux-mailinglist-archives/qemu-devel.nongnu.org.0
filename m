Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52532DFC68
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:49:40 +0100 (CET)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLZD-00011X-Su
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLWi-0007LV-G8
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLWe-0004Bp-Df
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mooW7GAQhLHtuXKi6R7eZxEgLhGlpoCRwWSIec02O8A=;
 b=J4TsCu4V/ecgrx3yKR4v8S4+qggvGxXRRnCZ2ZGB+ou+RDGpBNiEZXwnl6P0++d+PtXHrB
 C3dvZIxDl2sKt7mT/8201r+AnwNWY8oSUBMGcK9fsn+UqUqIMhb+JYZR8jwGpFL6VbnuLb
 to39Eobq0YehSB3GeWjFg3l6DT9S464=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-xcvn8t4BPgK6uNw99VwCDg-1; Mon, 21 Dec 2020 08:46:57 -0500
X-MC-Unique: xcvn8t4BPgK6uNw99VwCDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2183E75A;
 Mon, 21 Dec 2020 13:46:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9616F134;
 Mon, 21 Dec 2020 13:46:48 +0000 (UTC)
Subject: Re: [PATCH v3] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
To: Cornelia Huck <cohuck@redhat.com>
References: <20201221133254.4178703-1-thuth@redhat.com>
 <20201221144450.3e5fce49.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ae5bafc3-b9b0-a07a-7d54-4956bdde345f@redhat.com>
Date: Mon, 21 Dec 2020 14:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221144450.3e5fce49.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2020 14.44, Cornelia Huck wrote:
> On Mon, 21 Dec 2020 14:32:54 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> This initrd contains a virtio-net and a virtio-gpu kernel module,
>> so we can check that we can set a MAC address for the network device
>> and whether we can hot-plug and -unplug a virtio-crypto device.
>> But the most interesting part is maybe that we can also successfully
>> write some stuff into the emulated framebuffer of the virtio-gpu
>> device and make sure that we can read back that data from a screenshot.
>>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v3:
>>  - Remove unused "import re"
>>  - Use lscss to test for devnos
>>  - Improve tmpfile handling (thanks Wainer!)
>>
>>  tests/acceptance/machine_s390_ccw_virtio.py | 110 ++++++++++++++++++++
>>  1 file changed, 110 insertions(+)
> 
> (...)
> 
>> +        # Some tests to see whether the CLI options have been considered:
>> +        self.log.info("Test whether QEMU CLI options have been considered")
>> +        exec_command_and_wait_for_pattern(self, 'lspci',
>> +                             '0007:00:00.0 Class 0200: Device 1af4:1000')
>> +        exec_command_and_wait_for_pattern(self,
>> +                             'cat /sys/class/net/enP7p0s0/address',
>> +                             '02:ca:fe:fa:ce:12')
>> +        exec_command_and_wait_for_pattern(self, 'lscss', '0.1.9876')
>> +        self.wait_for_console_pattern('0.2.5432')
> 
> This looks a bit odd... maybe do 'lscss -d 0.1.9876' and 'lscss -d
> 0.2.5432' and wait for the respective devnos to be printed?
> 
> (I'm not entirely sure about the wait_for_console_pattern semantics
> here... can the 0.2.5432 line have been printed already before we start
> waiting, and would that be a problem? Might be better to play it safe.)

Fine for me. Could you fix it up when picking up the patch? Or do you want
me to send a v4 ?

 Thomas


