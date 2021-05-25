Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E20390751
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:18:17 +0200 (CEST)
Received: from localhost ([::1]:34838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llah5-0004rD-EN
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llae9-0001sp-Fm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:15:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llae4-0007sj-F0
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621962905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovyPpLwWVRF38rengqvOfCpyKtpQrV/bfr4WVeLIOW8=;
 b=A8RBESh2fOkzSlgPly//yVCjmYYr0rji40OwL2wMGkbWycjVbXcGP4xWPfDTJ0XxsQEGkx
 S4J9j811BoG+TK+Gtoh7zwGby0vLVQSXu35N6zfYF97rIdpktUoYG1Wugh247bYhd72+TG
 BrwexV0e0RXtQXAwqPiWyPm1rpbRQCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-j2HCdo3RO6uZFJtBnUyzHw-1; Tue, 25 May 2021 13:15:01 -0400
X-MC-Unique: j2HCdo3RO6uZFJtBnUyzHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5037F802938;
 Tue, 25 May 2021 17:15:00 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60BABE147;
 Tue, 25 May 2021 17:14:51 +0000 (UTC)
Subject: Re: [PATCH v6 06/25] python: add directory structure README.rst files
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-7-jsnow@redhat.com>
 <YKxh6/mwCEqRLIvH@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <359a6fd3-995d-08e9-e78b-0f3e38ee34ae@redhat.com>
Date: Tue, 25 May 2021 13:14:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKxh6/mwCEqRLIvH@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 10:33 PM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:22PM -0400, John Snow wrote:
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
>>   python/qemu/utils/README.rst   |  7 ++++++
>>   5 files changed, 74 insertions(+)
>>   create mode 100644 python/README.rst
>>   create mode 100644 python/qemu/README.rst
>>   create mode 100644 python/qemu/machine/README.rst
>>   create mode 100644 python/qemu/qmp/README.rst
>>   create mode 100644 python/qemu/utils/README.rst
>>
>> diff --git a/python/README.rst b/python/README.rst
>> new file mode 100644
>> index 00000000000..7a0dc5dff4a
>> --- /dev/null
>> +++ b/python/README.rst
>> @@ -0,0 +1,41 @@
>> +QEMU Python Tooling
>> +===================
>> +
>> +This directory houses Python tooling used by the QEMU project to build,
>> +configure, and test QEMU. It is organized by namespace (``qemu``), and
>> +then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
>> +
>> +``setup.py`` is used by ``pip`` to install this tooling to the current
>> +environment. ``setup.cfg`` provides the packaging configuration used by
>> +setup.py in a setuptools specific format. You will generally invoke it
> 
> For consistency, ``setup.py`` here?  Also, I guess ``setuptools`` as it
> falls in the same category of ``pip``.
> 

Kinda-sorta, but `pip` is a command line executable and setuptools 
isn't. Along those lines I'll fix setup.py but leave setuptools as-is.

>> +by doing one of the following:
>> +
>> +1. ``pip3 install .`` will install these packages to your current
>> +   environment. If you are inside a virtual environment, they will
>> +   install there. If you are not, it will attempt to install to the
>> +   global environment, which is not recommended.
> 
> Maybe some **emphasis** on **not**?
> 

Sure :)

>> +
>> +2. ``pip3 install --user .`` will install these packages to your user's
>> +   local python packages. If you are inside of a virtual environment,
>> +   this will fail.
>> +
> 
> Maybe note that, if you are inside of a virtual environment, option #1
> will probably be what users doing "--user" in a venv actually want.
> 

Yes. It's frequently annoying how this works, because it's hard to relay 
succinctly :)

I think at least newer versions of pip give you good warnings when you 
use --user for virtual environments at least.

>> +If you append the ``-e`` argument, pip will install in "editable" mode;
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
> 
> Not only used by pip... but I understand the reason for limiting the
> amount of information given here.
> 

Yes ... suggesting broadly that I don't really support using 
setuptools/setup.py alone to install the package, but instead expect and 
consider 'pip' to be the canonical/supported interface.

There are sometimes minor differences between how they handle things, so 
I wanted less emphasis on setuptools et al.

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
>> +
>> +See the documentation in ``__init__.py`` for more information.
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
>> diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.rst
>> new file mode 100644
>> index 00000000000..975fbf4d7de
>> --- /dev/null
>> +++ b/python/qemu/utils/README.rst
>> @@ -0,0 +1,7 @@
>> +qemu.utils package
>> +==================
>> +
>> +This package provides miscellaneous utilities used for testing and
>> +debugging QEMU. It is used primarily by the vm and acceptance tests.
>> +
>> +See the documentation in ``__init__.py`` for more information.
>> -- 
>> 2.30.2
>>
>>
> 
> With the ``setup.py`` and ``setuptools`` for consistency sake
> mentioned in my first comment, all other comments are suggestions, so:
> 

I took one of those two review comments, and acted on one of two of your 
suggestions.

> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

So technically I didn't meet your criteria for taking this RB :) Let me 
know if I can still apply it:

diff --git a/python/README.rst b/python/README.rst
index 7a0dc5dff4a..38b0c83f321 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -7,17 +7,17 @@ then by package (e.g. ``qemu/machine``, ``qemu/qmp``, 
etc).

  ``setup.py`` is used by ``pip`` to install this tooling to the current
  environment. ``setup.cfg`` provides the packaging configuration used by
-setup.py in a setuptools specific format. You will generally invoke it
-by doing one of the following:
+``setup.py`` in a setuptools specific format. You will generally invoke
+it by doing one of the following:

  1. ``pip3 install .`` will install these packages to your current
     environment. If you are inside a virtual environment, they will
     install there. If you are not, it will attempt to install to the
-   global environment, which is not recommended.
+   global environment, which is **not recommended**.

  2. ``pip3 install --user .`` will install these packages to your user's
     local python packages. If you are inside of a virtual environment,
-   this will fail.
+   this will fail; you likely want the first invocation above.

  If you append the ``-e`` argument, pip will install in "editable" mode;
  which installs a version of the package that installs a forwarder


