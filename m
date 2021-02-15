Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391131C3A6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:34:24 +0100 (CET)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlVf-0006tX-7h
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlU9-0006Gb-Vm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBlU1-0000PS-9D
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613424760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngXBgGXUlHv0FuUbYx3V1YA424t4ZB9TKBA0W7wsTOY=;
 b=ZIDTaGZQOL7AXluchHN74E65MluHSk0VMSaqmf576zF5UPFUbYusWweMhnSLvawivTSCsf
 iHMYlBanI/t1zFezkkaPj4odSbUq2M8HtMzgKD0Q6fPXcdsuJ891GZNNvGcWPtxY2on0q4
 XazO0QPWPMkc/brG4aaGndXh8C70HG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-i5aqWYV-MO6hO_OkLSTF5w-1; Mon, 15 Feb 2021 16:32:36 -0500
X-MC-Unique: i5aqWYV-MO6hO_OkLSTF5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D49C8030B7;
 Mon, 15 Feb 2021 21:32:35 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DD7210016FA;
 Mon, 15 Feb 2021 21:32:30 +0000 (UTC)
Subject: Re: [PATCH v4 00/24] python: create installable package
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <YCXtY4ici/GJtZpN@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <d6a7c313-4c6d-41f6-92ef-0977ea58fa28@redhat.com>
Date: Mon, 15 Feb 2021 16:32:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCXtY4ici/GJtZpN@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 2/11/21 9:52 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:32PM -0500, John Snow wrote:
>> This series factors the python/qemu directory as an installable
>> package. It does not yet actually change the mechanics of how any other
>> python source in the tree actually consumes it (yet), beyond the import
>> path. (some import statements change in a few places.)
>>
>> git: https://gitlab.com/jsnow/qemu/-/commits/python-package-mk3
>> CI: https://gitlab.com/jsnow/qemu/-/pipelines/254940717
>> (New CI job: https://gitlab.com/jsnow/qemu/-/jobs/1024230604)
>>
>> The primary motivation of this series is primarily to formalize our
>> dependencies on mypy, flake8, isort, and pylint alongside versions that
>> are known to work. It does this using the setup.cfg and setup.py
>> files. It also adds explicitly pinned versions (using Pipfile.lock) of
>> these dependencies that should behave in a repeatable and known way for
>> developers and CI environments both. Lastly, it enables those CI checks
>> such that we can enforce Python coding quality checks via the CI tests.
>>
>> An auxiliary motivation is that this package is formatted in such a way
>> that it COULD be uploaded to https://pypi.org/project/qemu and installed
>> independently of qemu.git with `pip install qemu`, but that button
>> remains *unpushed* and this series *will not* cause any such
>> releases. We have time to debate finer points like API guarantees and
>> versioning even after this series is merged.
>>
>> Some other things this enables that might be of interest:
>>
>> With the python tooling as a proper package, you can install this
>> package in editable or production mode to a virtual environment, your
>> local user environment, or your system packages. The primary benefit of
>> this is to gain access to QMP tooling regardless of CWD, without needing
>> to battle sys.path (and confounding other python analysis tools).
>>
>> For example: when developing, you may go to qemu/python/ and run `make
>> venv` followed by `pipenv shell` to activate a virtual environment that
>> contains the qemu python packages. These packages will always reflect
>> the current version of the source files in the tree. When you are
>> finished, you can simply exit the shell (^d) to remove these packages
>> from your python environment.
>>
>> When not developing, you could install a version of this package to your
>> environment outright to gain access to the QMP and QEMUMachine classes
>> for lightweight scripting and testing by using pip: "pip install [--user] ."
>>
>> TESTING THIS SERIES:
>>
>> First of all, nothing should change. Without any intervention,
>> everything should behave exactly as it was before. The only new
>> information here comes from how to interact with and run the linters
>> that will be enforcing code quality standards in this subdirectory.
>>
>> To test those, CD to qemu/python first, and then:
>>
>> 1. Try "make venv && pipenv shell" to get a venv with the package
>> installed to it in editable mode. Ctrl+d exits this venv shell. While in
>> this shell, any python script that uses "from qemu.[qmp|machine] import
>> ..." should work correctly regardless of where the script is, or what
>> your CWD is.
>>
> 
> Ack here, works as expected.
> 

That's a relief!

>> You will need Python 3.6 installed on your system to do this step. For
>> Fedora: "dnf install python3.6" will do the trick.
>>
> 
> You may have explained this before, so forgive me asking again.  Why
> is this dependent on a given Python version, and not a *minimum*
> Python version? Are the checkers themselves susceptible to different
> behavior depending on the Python version used?  If so, any hint on the
> strategy for developing with say, Python 3.8, and then having issues
> caught only on Python 3.6?
> 

It's a good question, and I have struggled with communicating the 
language. So here are a few points:

(1) Users will not need Python 3.6 on their local systems to be able to 
run the linters; they will be able to run "make check" to run it under 
*any* environment -- granted they have the necessary packages. (mypy, 
pylint, pytest, flake8, and isort.) See note #2 below:

(2) `pip install [--user] .[devel]` will install the needed dependencies 
to the local environment/venv regardless of python version. These 
dependencies are not pinned, but do express a minimum viable version (in 
setup.cfg) for each tool that I tested rigorously.

(3) The CI system will target Python 3.6 specifically, because that is 
our minimum version. This will work to prevent future features from 
bleeding into the codebase, which was a notable problem when we were 
targeting simultaneous 2.7 and 3.x deployments. If we were going to only 
run against one version, 3.6 is the defensibly correct version to run 
against. If we want to run against more, I'd say let's not let 
perfection be the enemy of good enough.

(4) I considered it important to be able to run, as much as is possible, 
the *EXACT SAME* environment for tests as the CI runs. For this purpose, 
"make venv-check" uses pipenv to install a pinned set of dependencies 
(that might be lower than what you'd get otherwise), and uses explicitly 
Python 3.6. This is to make it repeatable and simple to run a test 
that's as close to what the CI runner will do as possible. This takes a 
lot of the thinking out of it.


So, to answer you more directly:

- 3.6 is a *minimum* for "make check". (setup.cfg)
- 3.6 is a *dependency* for "make venv-check". (Pipfile, Pipfile.lock)

And, as far as known version problems:

- pylint 2.6.0 is not compatible with Python 3.9. They are working on 
it. 2.6.1-dev works alright, but isn't released yet. The linters may be 
unavailable to folks with 3.9-only environment.

Workarounds:

- Make your own venv using 3.7 or 3.8
- Use the make venv-check entry point to use 3.6.
- Give up and push it to gitlab and see if the CI test passes.


And, finally, here's my maintainer testing strategy/promises:

- I endeavor to make sure this package is tested and working on any 
non-EOL Python version (3.6 - 3.9 at time of writing)
- I endeavor to ensure that it is easy to test and lint these files on 
your local development system with minimum hassle
- Given the volatility of compatibility between different versions of 
linters and python, however, the current *canonical check* is Python 
3.6, using the explicitly pinned versions in the Pipfile.lock. There may 
be times (like right now) where the local linting test may not work with 
your version of Python.

>> 2. Try "make check" while still in the shell to run the Python linters
>> using the venv built in the previous step. This will pull some packages
>> from PyPI and run pytest, which will in turn execute mypy, flake8, isort
>> and pylint with the correct arguments.
>>
> 
> Works as expected.  I'll provide more feedback at the specific patches.
> 
>> 3. Having exited the shell from above, try "make venv-check". This will
>> create and update the venv if needed, then run 'make check' within the
>> context of that shell. It should pass as long as the above did.
>>
> 
> If this makes into a documentation (or on a v5), you may just want to
> tell users to run "deactivate" instead of exiting the shell completely.
> 

It depends on how you entered the shell. Literally "pipenv shell" does 
create a new shell process that you should exit from. Since I suggested 
using the pipenv invocation, I match that suggestion by telling the user 
to exit (instead of deactivate).

You know too much about python for your own good!

>> 4. Still outside of the venv, you may try running "make check". This
>> will not install anything, but unless you have the right Python
>> dependencies installed, these tests may fail for you. You might try
>> using "pip install --user .[devel]" to install the development packages
>> needed to run the tests successfully to your local user's python
>> environment. Once done, you will probably want to "pip uninstall qemu"
>> to remove that package to avoid it interfering with other things.
>>
> 
> This is good info for completeness, but I wonder if "make check"
> should exist at all.  If it's a requirement for "make check-venv", the
> question becomes if it should be advertised.  Hint: I don't think it
> should, it just adds some a bit of confusion IMO.
> 

I think it's cleanly separated... If you understand much about how 
python virtual environments work.

- You can run the tests on any environment you want! or,
- You can run those tests on a very, very specific environment that is 
controlled with a militaristic, iron fist.

current belief: People who are not developing python can just wait for 
the little orb to turn green in Gitlab-CI and not worry about running 
any particular test at all, actually. This current patch-set does not 
integrate these tests into "make check" at all, on purpose.

People who ARE developing this package (infrequently) will need to know 
which they want to run. My suggestion is to use "make venv-check" as the 
best predictor of the CI check, though it can be slow and clunky.

If you develop on this package a *lot*, and you regularly use a venv to 
develop, "make check" starts to make a lot more sense.

"make" with no arguments produces the help message;

```
python packaging help:

make venv:       Create pipenv's virtual environment.
     NOTE: Requires Python 3.6 and pipenv.
           Will download packages from PyPI.
     HINT: On Fedora: 'sudo dnf install python36 pipenv'

make venv-check: run linters using pipenv's virtual environment.

make check:      run linters using the current environment.
     Hint: Install deps with: 'pip install ".[devel]"'
```

... Which, I suppose if you don't use python much, it might not make 
sense to you which environment you want to run the tests under. I can 
probably add a hint:

"HINT: Run this test if you're unsure which to run."

I could probably also amend the hint for the "make check" option, to say 
something like: "This is an advanced option that uses your current 
environment's python3 interpreter and packages with zero setup."

>> 5. "make distclean" will delete the venv and any temporary files that
>> may have been created by packaging, installing, testing, etc.
>>
> 
> Works as expected.  Now, unto the individual patches.
> 
> Cheers,
> - Cleber.
> 

Thanks!
--js


