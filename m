Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DD31EDCB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 18:59:48 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnad-0001MK-EX
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 12:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCnNQ-0004mG-VB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCnNM-0000lv-WA
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 12:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613670363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSApLS8AX+fyXTJFwJGfODKTLplEReyRvfxvzW1pDBA=;
 b=Agz7EVDD9cGe2Xklm9jPVJMNROKC6r5mq0rRhuOeJvs/UffnbFAkVVU4zZdABevNIMvAll
 QWX8uO8JdGHp+r0o/1qMt5Ilz5qTnflyWpoWO9CbghGfRMS5NcixF1XiNiN+esA+8pko3p
 EZxM43B9CXq7BlpZbgxXVyPq8xgoMYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-JlUndUqIPiaVUpItyG-IIg-1; Thu, 18 Feb 2021 12:45:59 -0500
X-MC-Unique: JlUndUqIPiaVUpItyG-IIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1F480197A;
 Thu, 18 Feb 2021 17:45:58 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3762C60BE5;
 Thu, 18 Feb 2021 17:45:53 +0000 (UTC)
Subject: Re: [PATCH v4 07/24] python: add directory structure README.rst files
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-8-jsnow@redhat.com>
 <YCyDwYYhpYEz2onl@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <69a11981-8db5-a47e-74a9-8c47fac16270@redhat.com>
Date: Thu, 18 Feb 2021 12:45:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCyDwYYhpYEz2onl@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 9:47 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:39PM -0500, John Snow wrote:
>> Add short readmes to python/, python/qemu/, python/qemu/machine,
>> python/qemu/qmp, and python/qemu/utils that explain the directory
>> hierarchy. These readmes are visible when browsing the source on
>> e.g. gitlab/github and are designed to help new developers/users quickly
>> make sense of the source tree.
>>
>> They are not designed for inclusion in a published manual.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/README.rst              | 41 ++++++++++++++++++++++++++++++++++
>>   python/qemu/README.rst         |  8 +++++++
>>   python/qemu/machine/README.rst |  9 ++++++++
>>   python/qemu/qmp/README.rst     |  9 ++++++++
>>   python/qemu/utils/README.rst   |  9 ++++++++
>>   5 files changed, 76 insertions(+)
>>   create mode 100644 python/README.rst
>>   create mode 100644 python/qemu/README.rst
>>   create mode 100644 python/qemu/machine/README.rst
>>   create mode 100644 python/qemu/qmp/README.rst
>>   create mode 100644 python/qemu/utils/README.rst
>>
> 
> It's not often I complain about too much documentation, but I honestly
> think this will not scale.  I understand that the intention is to help
> users browsing through the directory structure it has a huge potential
> for bit rot.
> 

Always a nice problem to have too much instead of too little. ;)

> The READMEs at the first two levels seem OK, but the ones at the
> subpackages level will be a maintainance nightmare.  I would *very
> much* move those (subpackage ones) documentation into the Python file
> themselves.
> 

I don't think there's much, if anything, to move into those files. There 
are some details about how the module relates to the rest of the QEMU 
tree, but I think those details aren't appropriate to have "in" the 
python package itself -- they won't apply to whatever environment they 
get installed in.

>> diff --git a/python/README.rst b/python/README.rst
>> new file mode 100644
>> index 00000000000..6a14b99e104
>> --- /dev/null
>> +++ b/python/README.rst
>> @@ -0,0 +1,41 @@
>> +QEMU Python Tooling
>> +===================
>> +
>> +This directory houses Python tooling used by the QEMU project to build,
>> +configure, and test QEMU. It is organized by namespace (``qemu``), and
>> +then by package (``qemu/machine``, ``qemu/qmp``).
>> +
>> +``setup.py`` is used by ``pip`` to install this tooling to the current
>> +environment. ``setup.cfg`` provides the packaging configuration used by
>> +setup.py in a setuptools specific format. You will generally invoke it
>> +by doing one of the following:
>> +
>> +1. ``pip3 install .`` will install these packages to your current
>> +   environment. If you are inside a virtual environment, they will
>> +   install there. If you are not, it will attempt to install to the
>> +   global environment, which is not recommended.
>> +
>> +2. ``pip3 install --user .`` will install these packages to your user's
>> +   local python packages. If you are inside of a virtual environment,
>> +   this will fail.
>> +
>> +If you amend the ``-e`` argument, pip will install in "editable" mode;
>> +which installs a version of the package that installs a forwarder
>> +pointing to these files, such that the package always reflects the
>> +latest version in your git tree.
>> +
>> +See `Installing packages using pip and virtual environments
>> +<https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
>> +for more information.
>> +
>> +
>> +Files in this directory
>> +-----------------------
>> +
>> +- ``qemu/`` Python package source directory.
>> +- ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
>> +- ``README.rst`` you are here!
>> +- ``VERSION`` contains the PEP-440 compliant version used to describe
>> +  this package; it is referenced by ``setup.cfg``.
>> +- ``setup.cfg`` houses setuptools package configuration.
>> +- ``setup.py`` is the setuptools installer used by pip; See above.

Top-level doc seems fine to you though? I expect this directory to be 
reasonably low-traffic in terms of file additions/removals. If/when we 
start using sphinx to generate documentation for the qemu packages, we 
can probably link to e.g. readthedocs from here.

Not ready yet, of course.

>> diff --git a/python/qemu/README.rst b/python/qemu/README.rst
>> new file mode 100644
>> index 00000000000..d04943f526c
>> --- /dev/null
>> +++ b/python/qemu/README.rst
>> @@ -0,0 +1,8 @@
>> +QEMU Python Namespace
>> +=====================
>> +
>> +This directory serves as the root of a `Python PEP 420 implicit
>> +namespace package <https://www.python.org/dev/peps/pep-0420/>`_.
>> +
>> +Each directory below is assumed to be an installable Python package that
>> +is available under the ``qemu.<package>`` namespace.

This one is short and sweet. Not at risk of rotting. See below for a 
suggestion that might appease both of us WRT per-subpackage READMEs.

>> diff --git a/python/qemu/machine/README.rst b/python/qemu/machine/README.rst
>> new file mode 100644
>> index 00000000000..ac2b4fffb42
>> --- /dev/null
>> +++ b/python/qemu/machine/README.rst
>> @@ -0,0 +1,9 @@
>> +qemu.machine package
>> +====================
>> +
>> +This package provides core utilities used for testing and debugging
>> +QEMU. It is used by the iotests, vm tests, acceptance tests, and several
>> +other utilities in the ./scripts directory. It is not a fully-fledged
>> +SDK and it is subject to change at any time.
>> + >> +See the documentation in ``__init__.py`` for more information.

This is actually *pretty* brief, and I didn't intend for it to be 
exhaustively complete. I am trying to say "Please look at the python 
docstrings in __init__.py for real details!" because I was also worried 
about bitrot and duplicating docs.

Though, sure, it does duplicate at least some of the basic information. 
We have three-ish choices:

(1) Eh, fine, leave it here.
(2) Update it to be a simple pointer to __init__.py only; i.e. just the 
title heading and the "Please see __init__.py for details" hint.
(3) Just remove it. It should be common knowledge to investigate 
__init__.py for package-level documentation.
   (3b) Remove it, but update the PEP420-level document to contain an
        extra blurb that says "See each subpackage's __init__.py for more
        information."

Your preference?

>> diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
>> new file mode 100644
>> index 00000000000..c21951491cf
>> --- /dev/null
>> +++ b/python/qemu/qmp/README.rst
>> @@ -0,0 +1,9 @@
>> +qemu.qmp package
>> +================
>> +
>> +This package provides a library used for connecting to and communicating
>> +with QMP servers. It is used extensively by iotests, vm tests,
>> +acceptance tests, and other utilities in the ./scripts directory. It is
>> +not a fully-fledged SDK and is subject to change at any time.
>> +
>> +See the documentation in ``__init__.py`` for more information.

Same story as above. This is a pretty brief explanation that explains 
its role in the QEMU source tree, but doesn't explain much about the 
package itself. The same three options as above make sense to me here.

>> diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.rst
>> new file mode 100644
>> index 00000000000..4b33c1f27e1
>> --- /dev/null
>> +++ b/python/qemu/utils/README.rst
>> @@ -0,0 +1,9 @@
>> +qemu.utils package
>> +==================
>> +
>> +This package provides misc utilities used for testing and debugging
>> +QEMU. It is used most directly by the qemu.machine package, but has some
>> +uses by the vm and acceptance tests for determining accelerator support.
>> +
>> +See the documentation in ``__init__.py`` and ``accel.py`` for more
>> +information.
> 

I broke my own convention here and mentioned something beside 
__init__.py. I will remove that.

> And example of the bit rot and the huge maintainance cost is when a
> new file is added here, let's say, "qemu/utils/network.py".  I think
> your good intentions would quickly backfire.
> 

As you point out, that little slip-up of mine gave you room to attack 
the bitrot :) I avoided it in two other places, but the utils package is 
sooooo tiny I gave in to trying to be helpful and pointed out the real 
implementation file.

> Regards,
> - Cleber.
> 

I'm still somewhat on the fence. I was trying to make the python 
directories accessible to outside contributors as much as was humanly 
possible, but the bitrot concern is a good point. I think it can be 
alleviated by making clear that these files are just little "see also" 
pointers that should quite likely not rot very quickly.

Lemme know your final thoughts here and I'll adjust accordingly.

--js


