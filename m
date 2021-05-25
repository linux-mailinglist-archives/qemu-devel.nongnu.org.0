Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104F3909E3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:48:43 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lld2g-0008Ew-0b
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lld0Y-0006Y2-8Z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lld0T-000751-3d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621971984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sr0ZN201ipjzo0qZd8wHlVXK3yducxXCDeD9Ti4t7mo=;
 b=aNSyxFIN1ST//y1MCSAbMB41xPFGoq2C4Mbjb+RWri1z8RxoXJSAqIhPVFkYnzlfNLZJko
 qflWuopZVJvT/HJmmTqWFa7lxcU/6eYQIn6aTA/LtLZ801DYfIxrkws28yBj66/6YdezK7
 GYgb/PB/KQ+h6R6hoPXVmnigr4eho3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-GmgL84-0P2Woa4un1EO9Vg-1; Tue, 25 May 2021 15:46:21 -0400
X-MC-Unique: GmgL84-0P2Woa4un1EO9Vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0D3C526CA;
 Tue, 25 May 2021 19:45:29 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52BA99D53;
 Tue, 25 May 2021 19:45:27 +0000 (UTC)
Subject: Re: [PATCH v6 22/25] python: add Makefile for some common tasks
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-23-jsnow@redhat.com>
 <YK1O0JcbsnN/MD6F@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <d7c34ee2-17d4-af0d-e8cd-851bf8e1e297@redhat.com>
Date: Tue, 25 May 2021 15:45:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK1O0JcbsnN/MD6F@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

On 5/25/21 3:24 PM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:38PM -0400, John Snow wrote:
>> Add "make venv" to create the pipenv-managed virtual environment that
>> contains our explicitly pinned dependencies.
>>
>> Add "make check" to run the python linters [in the host execution
>> environment].
>>
>> Add "make venv-check" which combines the above two: create/update the
>> venv, then run the linters in that explicitly managed environment.
>>
>> Add "make develop" which canonizes the runes needed to get both the
>> linting pre-requisites (the "[devel]" part), and the editable
>> live-install (the "-e" part) of these python libraries.
>>
>> make clean: delete miscellaneous python packaging output possibly
>> created by pipenv, pip, or other python packaging utilities
>>
>> make distclean: delete the above, the .venv, and the editable "qemu"
>> package forwarder (qemu.egg-info) if there is one.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/README.rst |  3 +++
>>   python/Makefile   | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 python/Makefile
>>
>> diff --git a/python/README.rst b/python/README.rst
>> index e107bd12a69..3e09d20c23c 100644
>> --- a/python/README.rst
>> +++ b/python/README.rst
>> @@ -35,6 +35,9 @@ Files in this directory
>>   - ``qemu/`` Python package source directory.
>>   - ``tests/`` Python package tests directory.
>>   - ``avocado.cfg`` Configuration for the Avocado test-runner.
>> +  Used by ``make check`` et al.
>> +- ``Makefile`` provides some common testing/installation invocations.
>> +  Try ``make help`` to see available targets.
>>   - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
>>     that should be included by a source distribution.
>>   - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
>> diff --git a/python/Makefile b/python/Makefile
>> new file mode 100644
>> index 00000000000..184f59e5634
>> --- /dev/null
>> +++ b/python/Makefile
>> @@ -0,0 +1,42 @@
>> +.PHONY: help venv venv-check check clean distclean develop
>> +
>> +help:
>> +	@echo "python packaging help:"
>> +	@echo ""
>> +	@echo "make venv:       Create pipenv's virtual environment."
>> +	@echo "    NOTE: Requires Python 3.6 and pipenv."
>> +	@echo "          Will download packages from PyPI."
>> +	@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
>> +	@echo ""
>> +	@echo "make venv-check: run linters using pipenv's virtual environment."
>> +	@echo "    Hint: If you don't know which test to run, run this one!"
>> +	@echo ""
>> +	@echo "make develop:    Install deps for 'make check', and"
>> +	@echo "                 the qemu libs in editable/development mode."
>> +	@echo ""
>> +	@echo "make check:      run linters using the current environment."
>> +	@echo ""
> 
> Let's observe how this will be used (or misused).  I fear most people
> will jump into `make check`, even though you have described `make
> venv-check` as the primary choice.
> 
> We have a precedent with `make check-acceptance` that will create a
> venv and use it by default, so we can consider that as a fallback
> strategy based on user feedback.
> 

Right, I see. Though, I did intentionally want to make it clear which of 
these invocations created an environment and which did not.

Unlike the acceptance tests, it might make sense to run these tests both 
inside and outside of that venv, so I opted to make the default "make" 
target "make help".

The Gitlab CI will run the right one, after all -- and I do still expect 
the regular 'make check' to pass, so I am not as sure that it's a 
crucial failure if someone runs the "wrong one".

>> +	@echo "make clean:      remove build output."
>> +	@echo ""
>> +	@echo "make distclean:  remove venv files, qemu package forwarder, and"
>> +	@echo "                 everything from 'make clean'."
>> +
>> +venv: .venv
>> +.venv: Pipfile.lock
>> +	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
>> +	@touch .venv
>> +
>> +venv-check: venv
>> +	@pipenv run make check
>> +
>> +develop:
>> +	pip3 install -e .[devel]
>> +
>> +check:
>> +	@avocado --config avocado.cfg run tests/
>> +
>> +clean:
>> +	rm -rf build/ dist/
>> +
> 
> Usually `python3 setup.py clean --all` would be the better choice here,
> but, it doesn't clean `dist/`, so I'm OK with this.
> 

Hm, I should probably move the 'dist' down into 'distclean' anyway, and 
I will replace the clean invocation with the one you suggest.

>> +distclean: clean
>> +	rm -rf qemu.egg-info/ .venv/
>> -- 
>> 2.30.2
>>
>>
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> 


