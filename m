Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49B29D1F8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 20:56:11 +0100 (CET)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXrYH-0002Rq-GN
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 15:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXrXE-0001ab-WC
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXrXB-0004Nz-FM
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 15:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603914900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t69EzJKw2eW0ats5BZNs3ZV2aJsI3qAInQP1p5MaSOs=;
 b=InikBfR61Cc7Vz5mTbCSzTVLX2LScFr5EjWmw1FkvOw8I81nDkxsIBLw+4bCYawbmZT1A4
 lzICchEkhI7b2+maVAy/jZyszHFxCxxm57Lm//LK636O1MHOC9Rywtz2Q3EA06Gh6JaNw9
 +aagfvMkOHM81CMk2jGq7dpl3x1Ufy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-KdH4DLyHPNi5neAmF7ZDWg-1; Wed, 28 Oct 2020 15:54:56 -0400
X-MC-Unique: KdH4DLyHPNi5neAmF7ZDWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1731357098;
 Wed, 28 Oct 2020 19:54:55 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7211E10013D9;
 Wed, 28 Oct 2020 19:54:49 +0000 (UTC)
Subject: Re: [PATCH v3 01/15] python: create qemu packages
To: Cleber Rosa <crosa@redhat.com>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-2-jsnow@redhat.com>
 <20201028144616.GB2201333@localhost.localdomain>
 <1a05a456-2739-f539-0072-01ac7074f53b@redhat.com>
 <20201028163927.GD2201333@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <02153f8f-6584-6422-e9c8-d00b45d147ba@redhat.com>
Date: Wed, 28 Oct 2020 15:54:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028163927.GD2201333@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ben Widawsky <ben@bwidawsk.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 12:39 PM, Cleber Rosa wrote:
> On Wed, Oct 28, 2020 at 11:21:19AM -0400, John Snow wrote:
>> On 10/28/20 10:46 AM, Cleber Rosa wrote:
>>> On Tue, Oct 20, 2020 at 03:35:41PM -0400, John Snow wrote:
>>>> move python/qemu/*.py to python/qemu/[machine, qmp]/*.py and update import
>>>> directives across the tree.
>>>>
>>>> This is done to create a PEP420 namespace package, in which we may
>>>> create subpackages. To do this, the namespace directory ("qemu") should
>>>> not have any modules in it. Those files will go into new 'machine' and 'qmp'
>>>> subpackages instead.
>>>>
>>>> Implement machine/__init__.py making the top-level classes and functions
>>>> from its various modules available directly inside the package. Change
>>>> qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
>>>> library classes are available directly from "qemu.qmp" instead of
>>>> "qemu.qmp.qmp".
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    python/{qemu => }/.isort.cfg                |  0
>>>>    python/qemu/__init__.py                     | 11 ------
>>>>    python/qemu/{ => machine}/.flake8           |  0
>>>>    python/qemu/machine/__init__.py             | 41 +++++++++++++++++++++
>>>>    python/qemu/{ => machine}/accel.py          |  0
>>>>    python/qemu/{ => machine}/console_socket.py |  0
>>>>    python/qemu/{ => machine}/machine.py        | 16 +++++---
>>>>    python/qemu/{ => machine}/pylintrc          |  0
>>>>    python/qemu/{ => machine}/qtest.py          |  3 +-
>>>>    python/qemu/{qmp.py => qmp/__init__.py}     | 12 +++++-
>>>>    tests/acceptance/boot_linux.py              |  3 +-
>>>>    tests/qemu-iotests/297                      |  2 +-
>>>>    tests/qemu-iotests/300                      |  4 +-
>>>>    tests/qemu-iotests/iotests.py               |  2 +-
>>>>    tests/vm/basevm.py                          |  3 +-
>>>>    15 files changed, 71 insertions(+), 26 deletions(-)
>>>>    rename python/{qemu => }/.isort.cfg (100%)
>>>>    delete mode 100644 python/qemu/__init__.py
>>>>    rename python/qemu/{ => machine}/.flake8 (100%)
>>>>    create mode 100644 python/qemu/machine/__init__.py
>>>>    rename python/qemu/{ => machine}/accel.py (100%)
>>>>    rename python/qemu/{ => machine}/console_socket.py (100%)
>>>>    rename python/qemu/{ => machine}/machine.py (98%)
>>>>    rename python/qemu/{ => machine}/pylintrc (100%)
>>>>    rename python/qemu/{ => machine}/qtest.py (99%)
>>>>    rename python/qemu/{qmp.py => qmp/__init__.py} (96%)
>>>>
>>>> diff --git a/python/qemu/.isort.cfg b/python/.isort.cfg
>>>> similarity index 100%
>>>> rename from python/qemu/.isort.cfg
>>>> rename to python/.isort.cfg
>>>> diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
>>>> deleted file mode 100644
>>>> index 4ca06c34a4..0000000000
>>>> --- a/python/qemu/__init__.py
>>>> +++ /dev/null
>>>> @@ -1,11 +0,0 @@
>>>> -# QEMU library
>>>> -#
>>>> -# Copyright (C) 2015-2016 Red Hat Inc.
>>>> -# Copyright (C) 2012 IBM Corp.
>>>> -#
>>>> -# Authors:
>>>> -#  Fam Zheng <famz@redhat.com>
>>>> -#
>>>> -# This work is licensed under the terms of the GNU GPL, version 2.  See
>>>> -# the COPYING file in the top-level directory.
>>>> -#
>>>> diff --git a/python/qemu/.flake8 b/python/qemu/machine/.flake8
>>>> similarity index 100%
>>>> rename from python/qemu/.flake8
>>>> rename to python/qemu/machine/.flake8
>>>> diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init__.py
>>>> new file mode 100644
>>>> index 0000000000..27b0b19abd
>>>> --- /dev/null
>>>> +++ b/python/qemu/machine/__init__.py
>>>> @@ -0,0 +1,41 @@
>>>> +"""
>>>> +QEMU development and testing library.
>>>> +
>>>> +This library provides a few high-level classes for driving QEMU from a
>>>> +test suite, not intended for production use.
>>>> +
>>>> +- QEMUMachine: Configure and Boot a QEMU VM
>>>> + - QEMUQtestMachine: VM class, with a qtest socket.
>>>> +
>>>> +- QEMUQtestProtocol: Connect to, send/receive qtest messages.
>>>> +
>>>> +- list_accel: List available accelerators
>>>> +- kvm_available: Probe for KVM support
>>>> +- tcg_available: Probe for TCG support
>>>> +"""
>>>> +
>>>> +# Copyright (C) 2020 John Snow for Red Hat Inc.
>>>> +# Copyright (C) 2015-2016 Red Hat Inc.
>>>> +# Copyright (C) 2012 IBM Corp.
>>>> +#
>>>> +# Authors:
>>>> +#  John Snow <jsnow@redhat.com>
>>>> +#  Fam Zheng <fam@euphon.net>
>>>> +#
>>>> +# This work is licensed under the terms of the GNU GPL, version 2.  See
>>>> +# the COPYING file in the top-level directory.
>>>> +#
>>>> +
>>>> +from .accel import kvm_available, list_accel, tcg_available
>>>> +from .machine import QEMUMachine
>>>> +from .qtest import QEMUQtestMachine, QEMUQtestProtocol
>>>> +
>>>> +
>>>> +__all__ = (
>>>> +    'list_accel',
>>>> +    'kvm_available',
>>>> +    'tcg_available',
>>>> +    'QEMUMachine',
>>>> +    'QEMUQtestProtocol',
>>>> +    'QEMUQtestMachine',
>>>> +)
>>>
>>> How far would this approach go?  I mean, should all future APIs be developed
>>> inside module under "qemu/machine", say "qemu/machine/foo.py" and their main
>>> functionality imported here?  Or do you see this as a temporary state?
>>>
>>
>> I assume any new functionality can be directly imported. Having this here
>> doesn't prevent using the fully qualified module names.
>>
>> i.e. you can still do "from qemu.machine.machine import QEMUMachine".
>>
>> Offering root-level aliases seems like a very prevalent paradigm in popular
>> third-party packages like 'requests'. Not justification in and of itself,
>> but there's precedent.
>>
> 
> There's always someone doing something someway... I think the point
> here is to try to deliver something that makes the most sense to most
> users of the API.  Not an easy task, but it's our task.
> 

Just gotta follow the patterns I see in prominent examples that are 
often held up as good citizens. In my experience, commonly used aliases 
for the purposes of ease-of-use is a common pattern.

I don't think this *hurts* anything, but I suppose there's deeper 
questions about what we want the imports to look like. OK, but I think 
this discussion about the use of __all__ winds up being unrelated to the 
actual matter at hand.

>>> IMO, this is hard to maintain, and is a very easy path to future
>>> inconsistencies.
>>>
>>
>> Maybe. The alternative is to do what I did to QMP and stick it back inside
>> of __init__.
>>
>> What I don't like is:
>>
>> from qemu.machine.machine import QEMUMachine
>>
>> I prefer:
>>
>> from qemu.machine import QEMUMachine
>>
>>
>> Of course, I also like help(qemu.machine) to show something useful, which is
>> going to generally involve updating the docstring to explain what the major
>> APIs here are anyway, so I think actually you cannot escape your fate of
>> having to keep a list of APIs updated in a multi-module package.
>>
>> Maybe you could make an argument that keeping both the docstring and the
>> __all__ attribute in sync is an undue maintenance burden, but I'd need some
>> more convincing.
>>
>>>> diff --git a/python/qemu/accel.py b/python/qemu/machine/accel.py
>>>> similarity index 100%
>>>> rename from python/qemu/accel.py
>>>> rename to python/qemu/machine/accel.py
>>>> diff --git a/python/qemu/console_socket.py b/python/qemu/machine/console_socket.py
>>>> similarity index 100%
>>>> rename from python/qemu/console_socket.py
>>>> rename to python/qemu/machine/console_socket.py
>>>> diff --git a/python/qemu/machine.py b/python/qemu/machine/machine.py
>>>> similarity index 98%
>>>> rename from python/qemu/machine.py
>>>> rename to python/qemu/machine/machine.py
>>>> index 6420f01bed..a5dc305539 100644
>>>> --- a/python/qemu/machine.py
>>>> +++ b/python/qemu/machine/machine.py
>>>> @@ -38,8 +38,14 @@
>>>>        Type,
>>>>    )
>>>> -from . import console_socket, qmp
>>>> -from .qmp import QMPMessage, QMPReturnValue, SocketAddrT
>>>> +from qemu.qmp import (
>>>> +    QEMUMonitorProtocol,
>>>> +    QMPMessage,
>>>> +    QMPReturnValue,
>>>> +    SocketAddrT,
>>>> +)
>>>> +
>>>> +from . import console_socket
>>>>    LOG = logging.getLogger(__name__)
>>>> @@ -139,7 +145,7 @@ def __init__(self,
>>>>            self._events: List[QMPMessage] = []
>>>>            self._iolog: Optional[str] = None
>>>>            self._qmp_set = True   # Enable QMP monitor by default.
>>>> -        self._qmp_connection: Optional[qmp.QEMUMonitorProtocol] = None
>>>> +        self._qmp_connection: Optional[QEMUMonitorProtocol] = None
>>>>            self._qemu_full_args: Tuple[str, ...] = ()
>>>>            self._temp_dir: Optional[str] = None
>>>>            self._launched = False
>>>> @@ -314,7 +320,7 @@ def _pre_launch(self) -> None:
>>>>                if self._remove_monitor_sockfile:
>>>>                    assert isinstance(self._monitor_address, str)
>>>>                    self._remove_files.append(self._monitor_address)
>>>> -            self._qmp_connection = qmp.QEMUMonitorProtocol(
>>>> +            self._qmp_connection = QEMUMonitorProtocol(
>>>>                    self._monitor_address,
>>>>                    server=True,
>>>>                    nickname=self._name
>>>> @@ -534,7 +540,7 @@ def set_qmp_monitor(self, enabled: bool = True) -> None:
>>>>            self._qmp_set = enabled
>>>>        @property
>>>> -    def _qmp(self) -> qmp.QEMUMonitorProtocol:
>>>> +    def _qmp(self) -> QEMUMonitorProtocol:
>>>>            if self._qmp_connection is None:
>>>>                raise QEMUMachineError("Attempt to access QMP with no connection")
>>>>            return self._qmp_connection
>>>> diff --git a/python/qemu/pylintrc b/python/qemu/machine/pylintrc
>>>> similarity index 100%
>>>> rename from python/qemu/pylintrc
>>>> rename to python/qemu/machine/pylintrc
>>>> diff --git a/python/qemu/qtest.py b/python/qemu/machine/qtest.py
>>>> similarity index 99%
>>>> rename from python/qemu/qtest.py
>>>> rename to python/qemu/machine/qtest.py
>>>> index 39a0cf62fe..53926e434a 100644
>>>> --- a/python/qemu/qtest.py
>>>> +++ b/python/qemu/machine/qtest.py
>>>> @@ -26,8 +26,9 @@
>>>>        TextIO,
>>>>    )
>>>> +from qemu.qmp import SocketAddrT
>>>> +
>>>>    from .machine import QEMUMachine
>>>> -from .qmp import SocketAddrT
>>>>    class QEMUQtestProtocol:
>>>> diff --git a/python/qemu/qmp.py b/python/qemu/qmp/__init__.py
>>>> similarity index 96%
>>>> rename from python/qemu/qmp.py
>>>> rename to python/qemu/qmp/__init__.py
>>>> index 2cd4d43036..9606248a3d 100644
>>>> --- a/python/qemu/qmp.py
>>>> +++ b/python/qemu/qmp/__init__.py
>>>> @@ -1,4 +1,14 @@
>>>> -""" QEMU Monitor Protocol Python class """
>>>> +"""
>>>> +QEMU Monitor Protocol (QMP) development library & tooling.
>>>> +
>>>> +This package provides a fairly low-level class for communicating to QMP
>>>> +protocol servers, as implemented by QEMU, the QEMU Guest Agent, and the
>>>> +QEMU Storage Daemon. This library is not intended for production use.
>>>> +
>>>> +`QEMUMonitorProtocol` is the primary class of interest, and all errors
>>>> +raised derive from `QMPError`.
>>>> +"""
>>>> +
>>>>    # Copyright (C) 2009, 2010 Red Hat Inc.
>>>>    #
>>>>    # Authors:
>>>> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
>>>> index 0055dc7cee..54f999e647 100644
>>>> --- a/tests/acceptance/boot_linux.py
>>>> +++ b/tests/acceptance/boot_linux.py
>>>> @@ -12,8 +12,7 @@
>>>>    from avocado_qemu import Test, BUILD_DIR
>>>> -from qemu.accel import kvm_available
>>>> -from qemu.accel import tcg_available
>>>> +from qemu.machine import kvm_available, tcg_available
>>>>
>>>
>>> I think this reveals a slight downgrade of the API caused by the usage
>>> of the symbols from "qemu.machine" namespace.
>>>
>>> My point is that there are valid use cases for using "kvm_available"
>>> without using a "QEMUMachine".  This presuposes that "qemu.machine" is
>>> named like that because "QEMUMachine" are the main actors of this
>>> namespace.
>>>
>>
>> No, the accel functions literally start a QEMU process and probe its output
>> to determine what they support. This belongs directly alongside the machine
>> code in my opinion.
>>
> 
> accel.kvm_available() may not even run QEMU at all... and when it
> does, it runs it just like your most mundane command line application,
> "grepping" its stdout.
> 
>> (I also don't know why'd you call these functions unless you intended to
>> create a machine based on what you found.
>>
> 
> *If* this is an API that you intend others to leverage, you should
> reverse the question: "Is there any reason for not making this utility
> available and as obvious and as easily available as possible to be
> used by people whom I can't actually tell how they'd use it?".
> 
> For instance, I may want to write Python code that skips over a number
> of tests if I detect that KVM is not available.  This code of mine,
> may be completely separate from actual code creating the QEMUMachines,
> or may even be compiled C code that I don't want to call because I
> know that KVM is not available.
> 
> And that's not hypothetical.  I personally have a use case for that.
> 

All of the usages in tests/acceptance pass a binary in. The vm/ tests 
are the ones that don't.

With tcg_available necessitating providing a binary, it's weird that 
kvm_available has an overloaded invocation where it avoids doing so. The 
generic detection for host KVM support likely ought to be in a different 
function.

(And that one, you are right, would have only the most tenuous 
relationship to a qemu.machine package.)

>>
>> I see your point that it is not a method of the Machine class itself nor an
>> extension thereof; but I think for the purpose of three small helper
>> functions it's not worth creating an entirely new package to contain.
>>
> 
> Not only that, but it's not even used by QEMUMachine itself.
> 

But it's not wholly unrelated: I maintain the most obvious use for these 
is to probe a binary and adjust flags accordingly. I would go so far as 
to say that shipping qemu.machine without such a feature would create a 
deficit in that package!

>> Nor is it worth watering down the "machine" name to something less specific
>> to accommodate three tiny helper functions.
>>
>> If I am considering "machine" the "package that knows how to start and
>> interact with QEMU", then accel belongs here.
>>
> 
> That's pretty broad and generic.  Do you mean that "machine" should
> know how to interact with, say, "info qtree"?  Would a utility that
> outputs and parse that deserve to live under "machine"?
> 

It is broad and generic. I am arguing explicitly against creating an 
entire package to house a single module which contains three utility 
functions. What I am really pressing on you to answer is: "What are they 
utility functions *for*?"

Answering that might give us good names. Without names, I can't respin 
the patches to your liking. :)

But, yes, that means I am considering "machine" as something very broad 
and generic. I believe that's correct until such time as we have 
justification to create something more targeted and focused. If you have 
a better name I'm open to it, but I did intent to intuit that the 
primary purpose of this package was to provide QEMUMachine and friends, 
because it is.

That's also why I have adopted Andrea's suggestion to start with a 0.x 
version: I am treating this domain as an incubation space, and not 
stable APIs -- precisely because this type of argument is not one I am 
sure needed to be solved up front. We can graduate packages out of this 
incubator.


What I had initially:

qemu.core, containing *everything*


What I have now:

qemu.qmp     - QMP library and tools that rely on the QMP library
qemu.machine - machine.py, console_socket.py, qtest.py, accel helpers


What you want, I believe:

qemu.qmp     - QMP library and misc QMP-using tools
qemu.machine - machine.py, console_socket.py, qtest.py
qemu.util    - accel helpers


What I'm protesting against is creating a "utilities" package at all, 
because with no central thesis to its existence, I do not know how to 
version or maintain such a package.

It's my belief that keeping the subpackages tightly focused (qmp, 
machine) it will help guide what kind of API we want to develop for each.

Making a "util" package to house random bits and pieces seems like the 
sort of thing that will be very hard to maintain in a meaningful way; 
and it's something I'd like to avoid supporting for external usage.

> Please understand that these are the awkward, speculative and hard
> questions that we have to ask *if* the intention is to make an API
> available for general use.
> 

I did invite bikeshedding! Now's the time to do it, if ever there was one.

>>> Naming is hard, (so don't assume I believe "utils" below is the best
>>> or even a good name), but I'd be more confortable using an API along
>>> the lines:
>>>
>>>      from qemu.utils.accel import kvm_available
>>>      kvm_available()
>>>
>>> OR
>>>
>>>      from qemu.utils import accel
>>>      accel.kvm_available()
>>>
>>
>> utils/tools I am reserving as a package for various debugging scripts and
>> tools in the future that I don't intend to upload to PyPI, e.g. many of the
>> "thematically loose" scripts in ./scripts.
>>
> 
> The *actual* name, if already "taken in advance", is not the core issue.
> 

Didn't mean to imply the name was an issue, it was the semantics. I do 
intend to create a type of "misc" subpackage, but it's one I won't 
support; functionally it's something for internal dev usage on the QEMU 
tree was my intent.

If you want accel functions to be supported and available outside the 
QEMU source tree, I am saying that I don't want to support a "util" 
package to do that.

>>> This would also remove the need to keep importing symbols into the
>>> current "qemu.machine" namespace.
>>>
>>
>> It would, but it's three functions. It doesn't warrant an entire package for
>> a single module with three standalone functions.
>>
>> That calculus may change in the future if we accumulate lots more
>> miscellaneous thingies to make that more worthwhile!
>>
>>>>    from avocado.utils import cloudinit
>>>>    from avocado.utils import network
>>>> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
>>>> index 5c5420712b..8236875222 100755
>>>> --- a/tests/qemu-iotests/297
>>>> +++ b/tests/qemu-iotests/297
>>>> @@ -36,7 +36,7 @@ MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
>>>>        --disallow-any-generics --disallow-incomplete-defs \
>>>>        --disallow-untyped-decorators --no-implicit-optional \
>>>>        --warn-redundant-casts --warn-unused-ignores \
>>>> -    --no-implicit-reexport iotests.py
>>>> +    --no-implicit-reexport --namespace-packages iotests.py
>>>>    # success, all done
>>>>    echo "*** done"
>>>> diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
>>>> index 5b75121b84..a41fac4e1d 100755
>>>> --- a/tests/qemu-iotests/300
>>>> +++ b/tests/qemu-iotests/300
>>>> @@ -23,7 +23,7 @@ import random
>>>>    import re
>>>>    from typing import Dict, List, Optional, Union
>>>>    import iotests
>>>> -import qemu
>>>> +from qemu.machine import machine
>>>>
>>>
>>> I believe this gives my previous comment some extra strength.  I think
>>> this shows that "qemu.machine" containing "machine" really means that
>>> the first "machine" naming component doesn't really mean that.
>>>
>>
>> Yeah, I don't like the duplication of 'machine' here either. I believe this
>> test needs access to specific error classes which I didn't believe were
>> important enough to receive an alias.
>>
>> Might be that the correct thing to do is to stick machine.py in
>> machine/__init__.py to avoid that duplication, just like I did with qmp.py.
>>
> 
> I agree this is a better approach wrt *machine.py* itself, from the
> API perspective.
> 
> In a broad sense (excluding qmp) you're proposing that current usage of:
> 
>   "from qemu import myutility"
> 
> Becomes:
> 
>   "from qemu.machine import myutility"
> 
> And "everything" (take it with a grain of salt), will live under
> "qemu.machine".  I still think, as you put it, that the future will
> show that other modules not connected to "machine", but generally
> useful, will need a place to live.
> 

I mean, the only things we *have* that aren't directly connected to 
Machine are these three accel functions, and even those launch QEMU 
binaries to probe them for features for the purpose of .. passing flags 
to QEMUMachine.

> This may be an opportunity to *keep* a place where contributors can
> put generally useful bits.  But, if you want to recognize that current
> "from qemu import myutility" was an unintended naming side effect, and
> that namespace is really about *machine*, and broaden the meaning of
> "machine", OK.
> 

You're right, it is the "removal" of a place where we can put random 
bits and pieces. That's a conscious decision, yes.

We can create that space (and I intend to, as intuited above), but in so 
doing I also intend to preclude it from any kind of API stability 
guarantees, visibility in our sphinx manuals, that sort of thing. I 
think you actually do want to keep using accel and want to support 
people using it, so it needs a place to live.

Reintroduction of a "core" package that we intend to support externally 
could work; but without a strong idea of what will go in there, I'd 
rather not make one pre-emptively.

I guess put another way:

I'd prefer accel helpers to be in the machine package, since they 
provide an obvious utility for helping to launch machines (though they 
may provide additional utility in further contexts), instead of creating 
a completely un-themed miscellaneous package to house just a few things, 
especially for callers who are *almost guaranteed* to be using the other 
subpackages already.

> Cheers,
> - Cleber.
> 

All that said, I'm not truly married to the exact names I chose. Feel 
free to recommend some, but this is the best I could come up with. I 
think "qemu.machine" in particular could have a better name, but what to 
name it? I don't know.

--js


