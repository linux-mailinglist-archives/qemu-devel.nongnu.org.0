Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A435370308
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:37:21 +0200 (CEST)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcap6-00005K-KL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIb-0004WC-RN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lcaIY-0000wq-G8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619816621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suwXjvVsqkwmF6MvJzuNPvRyp3i4hOsB6SPBCUv73Cg=;
 b=BwB/P+ulAn8OdS3PKWv5yjt3B3Cx7ySXHqLr9qsN2lcBSF+RWJXCr0zhoUWdvckpoW6zBO
 ZTlMM9ALzyNv9EPKa1+mFWec8scRUSV5s1Cxvkob+npOKrjoFM0dg5E0zLP8WrJ/Vp4nZD
 9t1W0n7XgOqx0qCRpCNSWLam/KixJWs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-LwEnhrCENHm7Ik2xLv0YcQ-1; Fri, 30 Apr 2021 17:03:39 -0400
X-MC-Unique: LwEnhrCENHm7Ik2xLv0YcQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d13-20020a056402144db0290387e63c95d8so6348282edx.11
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 14:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=suwXjvVsqkwmF6MvJzuNPvRyp3i4hOsB6SPBCUv73Cg=;
 b=AqVN+TAL35DqsYe6vpM8Kt3PuPFoEJ/8FVEJ+M5uwnLeAwrPn+NAy6iTtg2vkEe1eH
 E34PSlcB6IXWkUJLhczVpclaKdEeJIMKXUjmiqcQ1gdayICWd7KW1xT0CLCYfBr1ezUS
 u6k6Fpn6u6ZmYTwsX32CvKlio7E52d5cgAlYmyajttIweW8pi2KG5gA7R+BfSiecXcpY
 fdPZZQYCAyWooQZnLgJaSZN40YtavING5m8+XG2PGFw/Ml3sfU60DPOkryDUEj+o1ODw
 O8k+YoKA+uFAr7phGduoTFBkShaOrSy4g8NYn9rCE4Ba4iE6hxIMZuH9AeWWU1DMlYy9
 FxaQ==
X-Gm-Message-State: AOAM532mhgSolhFeHvySBFKE+z66USnes2JHLHnXqAInXaNxvw/0Hl8G
 xQNGf/1jyCO3Jdl4l/QH9scOVAWdVPCrTXCoEQeBnGxLUrBe45gt/1L+59OiWwjMYkfH+kSxAC6
 RIfBUIyAQRFgdKwHVzxu62joCMovIBY+zDGYv1EzkbivhBBXhqhU/f9ZMb7nNJKnVnsM=
X-Received: by 2002:a17:907:10cb:: with SMTP id
 rv11mr6431714ejb.379.1619816617256; 
 Fri, 30 Apr 2021 14:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUCLKz8btHJq6EgJIwCx6uSVl9oA3tqX12ZoLpetLANwIVmdeI65IZ6WH2pKxn5Fr6c2sohA==
X-Received: by 2002:a17:907:10cb:: with SMTP id
 rv11mr6431672ejb.379.1619816616862; 
 Fri, 30 Apr 2021 14:03:36 -0700 (PDT)
Received: from localhost.localdomain (mob-194-230-155-107.cgn.sunrise.net.
 [194.230.155.107])
 by smtp.gmail.com with ESMTPSA id p24sm2515390edt.5.2021.04.30.14.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:03:36 -0700 (PDT)
Subject: Re: [PATCH v3 05/15] qemu-iotests: delay QMP socket timers
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210414170352.29927-1-eesposit@redhat.com>
 <20210414170352.29927-6-eesposit@redhat.com>
 <df1df43e-cfdc-ddeb-f7c1-f9399f252b35@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <bb2c8f3c-f1cf-6213-b67d-7b1ff2102992@redhat.com>
Date: Fri, 30 Apr 2021 23:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <df1df43e-cfdc-ddeb-f7c1-f9399f252b35@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/04/2021 13:59, Max Reitz wrote:
> On 14.04.21 19:03, Emanuele Giuseppe Esposito wrote:
>> Attaching a gdbserver implies that the qmp socket
>> should wait indefinitely for an answer from QEMU.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   python/qemu/machine.py        |  3 +++
>>   tests/qemu-iotests/iotests.py | 10 +++++++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
>> index 12752142c9..d6142271c2 100644
>> --- a/python/qemu/machine.py
>> +++ b/python/qemu/machine.py
>> @@ -409,6 +409,9 @@ def _launch(self) -> None:
>>                                          stderr=subprocess.STDOUT,
>>                                          shell=False,
>>                                          close_fds=False)
>> +
>> +        if 'gdbserver' in self._wrapper:
>> +            self._qmp_timer = None
> 
> Why doesn’t __init__() evaluate this?  This here doesn’t feel like the 
> right place for it.  If we want to evaluate it here, self._qmp_timer 
> shouldn’t exist, and instead the timeout should be a _post_launch() 
> parameter.  (Which I would have nothing against, by the way.)

Uhm.. I got another comment in a previous version where for the "event" 
callbacks it was better a property than passing around a parameter. 
Which I honestly agree.

What should __init__() do? The check here is to see if the invocation 
has gdb (and a couple of patches ahead also valgrind), to remove the timer.
If I understand what you mean, you want something like
def __init__(self, timer):

But from my understanding, the class hierarchy is:
QEMUMachine: in machine.py
QEMUQtestMachine(QEMUMachine): in qtest.py
VM(qtest.QEMUQtestMachine): in iotests.py
VM() is then invoked in each test.

So this is not easily reachable by check.py, to pass the parameter into 
__init__

> 
> Also, mypy complains that this variable is a float, so iotest 297 (which 
> runs mypy) fails.

This and all mistakes of test 297 (mypy) is my fault: I did not have 
pylint-3 installed thus when testing it skipped the 297 test.

> 
>>           self._post_launch()
>>       def _early_cleanup(self) -> None:
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index 05d0dc0751..380527245e 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -478,7 +478,10 @@ def log(msg: Msg,
>>   class Timeout:
>>       def __init__(self, seconds, errmsg="Timeout"):
>> -        self.seconds = seconds
>> +        if qemu_gdb:
>> +            self.seconds = 3000
>> +        else:
>> +            self.seconds = seconds
> 
> We might as well completely disable the timeout then, that would be more 
> honest, I think.  (I.e. to make __enter__ and __exit__ no-ops.)
> 
>>           self.errmsg = errmsg
>>       def __enter__(self):
>>           signal.signal(signal.SIGALRM, self.timeout)
>> @@ -684,6 +687,11 @@ def qmp_to_opts(self, obj):
>>               output_list += [key + '=' + obj[key]]
>>           return ','.join(output_list)
>> +    def get_qmp_events(self, wait: bool = False) -> List[QMPMessage]:
>> +        if qemu_gdb:
>> +            wait = 0.0
> 
> First, this is a bool.  I can see that qmp.py expects a
> Union[bool, float], but machine.py expects just a bool.  (Also, mypy 
> complains that this specific `wait` here is a `bool`.  You can see that 
> by running iotest 297.)

I think here machine.py should reflect the qmp.py behavior and have an 
Union[bool, float] too.
> 
> Second, I don’t understand this.  If the caller wants to block waiting 
> on an event, then that should have nothing to do with whether we have 
> gdb running or not.  As far as I understand, setting wait to 0.0 is the 
> same as wait = False, i.e. we don’t block and just return None 
> immediately if there is no pending event.

You're right, this might not be needed here. The problem I had was that 
calling gdb and pausing at a breakpoint or something for a while would 
make the QMP socket timeout, thus aborting the whole test. In order to 
avoid that, I need to stop or delay timers.

I can't remember why I added this check here. At some point I am sure 
the test was failing because of socket timeout expiration, but I cannot 
reproduce the problem when commenting out this check above in 
get_qmp_events. The other check in patch 3 should be enough.

Emanuele
> 
> Max
> 
>> +        return super().get_qmp_events(wait=wait)
>> +
>>       def get_qmp_events_filtered(self, wait=60.0):
>>           result = []
>>           for ev in self.get_qmp_events(wait=wait):
>>
> 


