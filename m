Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9638CA72
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:54:24 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7Tj-0007Eo-US
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7S2-0005hl-88
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7Ry-0003TO-TZ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621612354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJ2mxUuKjkia+svvcVRqTqA8q3SWI1lNJ6oI7NFB4Xg=;
 b=Uh3YOsPG+yVP5OPYdMmG7hJW+S1m/afINTfytibbfhrkmgg/MK/X9TtNCxAw7D5SGn7QtQ
 e0ot7vZejvGWcWS2nvz38F0umbOz4QCQM/EXgWwZzppQslFcxj7hj+nPtm6x2duwHgyzU7
 D0mEPqUuijuXRu+eV4hHn9bhcuFmTqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-aPjhr5tjOMW4QUkk7hyKhQ-1; Fri, 21 May 2021 11:52:30 -0400
X-MC-Unique: aPjhr5tjOMW4QUkk7hyKhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E947C100945E;
 Fri, 21 May 2021 15:52:28 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86CBE46;
 Fri, 21 May 2021 15:52:19 +0000 (UTC)
Subject: Re: [PATCH v6 04/25] python: add qemu package installer
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-5-jsnow@redhat.com>
 <YKcwI3iA9qTY6Mzc@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <53a2699c-2db9-2925-9a8c-37f7ef8c4619@redhat.com>
Date: Fri, 21 May 2021 11:52:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKcwI3iA9qTY6Mzc@localhost.localdomain>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On 5/21/21 12:00 AM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:20PM -0400, John Snow wrote:
>> Add setup.cfg and setup.py, necessary for installing a package via
>> pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
>> this package is for and who to contact for more information. This
>> document will be used as the landing page for the package on PyPI.
>>
>> I am not yet using a pyproject.toml style package manifest, because
>> "editable" installs are not defined (yet?) by PEP-517/518.
>>
>> I consider editable installs crucial for development, though they have
>> (apparently) always been somewhat poorly defined.
>>
> 
> They are crucial for development indeed, so I agree with your overall
> choices here.
> 
>> Pip now (19.2 and later) now supports editable installs for projects
>> using pyproject.toml manifests, but might require the use of the
>> --no-use-pep517 flag, which somewhat defeats the point.
>>
> 
> Just to make it clear for other people reading this, it means that
> even with the very latest pip release (21.1.1), you *must* have a
> setup.py or setup.cfg file to use editable (development) installs[1]
> You can *not* rely solely on a pyproject.toml setup.
> 
> [1] https://github.com/pypa/pip/pull/9547/commits/7a95720e796a5e56481c1cc20b6ce6249c50f357
> 
>> For now, while the dust settles, stick with the de-facto
>> setup.py/setup.cfg combination supported by setuptools. It will be worth
>> re-evaluating this point again in the future when our supported build
>> platforms all ship a fairly modern pip.
>>
> 
> Agreed, but let's not hold our breath given that even pip 21.1.1 still
> doesn't support that.  My guesstimate is 6-12 months for the feature to
> be developed/merged, and let's say another 12 months for our supported
> build platforms to ship it.
> 
>> Additional reading on this matter:
>>
>> https://github.com/pypa/packaging-problems/issues/256
>> https://github.com/pypa/pip/issues/6334
>> https://github.com/pypa/pip/issues/6375
>> https://github.com/pypa/pip/issues/6434
>> https://github.com/pypa/pip/issues/6438
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/PACKAGE.rst | 33 +++++++++++++++++++++++++++++++++
>>   python/setup.cfg   | 19 +++++++++++++++++++
>>   python/setup.py    | 23 +++++++++++++++++++++++
>>   3 files changed, 75 insertions(+)
>>   create mode 100644 python/PACKAGE.rst
>>   create mode 100644 python/setup.cfg
>>   create mode 100755 python/setup.py
>>
>> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
>> new file mode 100644
>> index 00000000000..1bbfe1b58e2
>> --- /dev/null
>> +++ b/python/PACKAGE.rst
>> @@ -0,0 +1,33 @@
>> +QEMU Python Tooling
>> +===================
>> +
>> +This package provides QEMU tooling used by the QEMU project to build,
>> +configure, and test QEMU. It is not a fully-fledged SDK and it is subject
>> +to change at any time.
>> +
>> +Usage
>> +-----
>> +
>> +The ``qemu.qmp`` subpackage provides a library for communicating with
>> +QMP servers. The ``qemu.machine`` subpackage offers rudimentary
>> +facilities for launching and managing QEMU processes. Refer to each
>> +package's documentation
>> +(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
>> +for more information.
>> +
>> +Contributing
>> +------------
>> +
>> +This package is maintained by John Snow <jsnow@redhat.com> as part of
>> +the QEMU source tree. Contributions are welcome and follow the `QEMU
>> +patch submission process
>> +<https://wiki.qemu.org/Contribute/SubmitAPatch>`_, which involves
>> +sending patches to the QEMU development mailing list.
>> +
>> +John maintains a `GitLab staging branch
>> +<https://gitlab.com/jsnow/qemu/-/tree/python>`_, and there is an
>> +official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
>> +
>> +Please report bugs on the `QEMU issue tracker
>> +<https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
>> +the report.
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> new file mode 100644
>> index 00000000000..dd71640fc2f
>> --- /dev/null
>> +++ b/python/setup.cfg
>> @@ -0,0 +1,19 @@
>> +[metadata]
>> +name = qemu
>> +maintainer = QEMU Developer Team
>> +maintainer_email = qemu-devel@nongnu.org
>> +url = https://www.qemu.org/
>> +download_url = https://www.qemu.org/download/
>> +description = QEMU Python Build, Debug and SDK tooling.
>> +long_description = file:PACKAGE.rst
>> +long_description_content_type = text/x-rst
>> +classifiers =
>> +    Development Status :: 3 - Alpha
>> +    License :: OSI Approved :: GNU General Public License v2 (GPLv2)
>> +    Natural Language :: English
>> +    Operating System :: OS Independent
>> +    Programming Language :: Python :: 3 :: Only
>> +
>> +[options]
>> +python_requires = >= 3.6
>> +packages = find_namespace:
>> diff --git a/python/setup.py b/python/setup.py
>> new file mode 100755
>> index 00000000000..2014f81b757
>> --- /dev/null
>> +++ b/python/setup.py
>> @@ -0,0 +1,23 @@
>> +#!/usr/bin/env python3
>> +"""
>> +QEMU tooling installer script
>> +Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
>> +"""
>> +
>> +import setuptools
>> +import pkg_resources
>> +
>> +
>> +def main():
>> +    """
>> +    QEMU tooling installer
>> +    """
>> +
>> +    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
>> +    pkg_resources.require('setuptools>=39.2')
>> +
>> +    setuptools.setup()
>> +
>> +
>> +if __name__ == '__main__':
>> +    main()
>> -- 
>> 2.30.2
>>
>>
> 
> BTW, about the need to have a "setup.py", before pip 21.1.1:
> 
>    $ rm setup.py
>    $ pip install -e .
>    ERROR: File "setup.py" not found. Directory cannot be installed in editable mode: /home/cleber/src/qemu/python
> 
> On pip 21.1.1:
> 
>     $ pip install -e .
>     Obtaining file:///home/cleber/src/qemu/python
>     Installing collected packages: qemu
>       Running setup.py develop for qemu
>     Successfully installed qemu-0.0.0
> 
> Side note: The "Running setup.py ..." message given by pip 21.1.1,
> even though there is *not* a "setup.py" is rather confusing.
> 
> Anyway, we may be able to drop setup.py either when we find pip 21.1.1
> or later in our "common build environments", or if we require people
> hacking on the Python module to "pip install --upgrade pip".
> 
> I'll be repeating myself here, but I believe you made the right
> choices at this time, and based on my testing I can successfully
> install/develop using "python setup.py" and "pip", so:
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> 

Great :)

I figured it would be helpful to outline the reasons in the commit 
message, at least, so that anyone who is curious about it in the future 
can find out exactly what we considered the blockers to be.

I'll update the commit message with an edited version of your reply 
here, just to add more information to the historical record.

--js


