Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF149576D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:37:06 +0100 (CET)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhvN-0007CM-EX
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAf5A-00060w-TN
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAf56-0004Z0-Kt
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642714494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7lNN7mbF8YAL8W7+I8YETOsV3tldo0nKlYY9Ah+LeE=;
 b=LDSuI3EKJUf0hCaFNqwVRUo7V7A7+WhBHdYK08YP0vsN9bxQtjP2YGCCFyVpkTPyA9/ghB
 /tS9qQIVTfYf3Gm3Ys7/NxeWFg2NLonP5rp2FLCbV/A07kKkTQ2akdJmwRtFJXMQ2N/Qdi
 wLjmNuat/3SDcwioBTdqkkRxoSpKunc=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-o2UF1nlhO7GFThl777dO2Q-1; Thu, 20 Jan 2022 16:34:53 -0500
X-MC-Unique: o2UF1nlhO7GFThl777dO2Q-1
Received: by mail-ua1-f71.google.com with SMTP id
 z19-20020ab05bd3000000b002fa2cbf6d75so4326661uae.19
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 13:34:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f7lNN7mbF8YAL8W7+I8YETOsV3tldo0nKlYY9Ah+LeE=;
 b=DSqrKkBTxNS+KDWqIgoZ1p1MMQ+ZKNyhCFJxhqNsPfWaRy1zLmoQj6qGYMiwi5ehw9
 StUx8dm+CipjsXa8+I74IRVIHAx+b+7Uaf/VnJtuRIE/LEOLuMB7AepyDiW6s6EiMUaF
 w9TLaoiFSXtbnRFenI1QkLmwPdjynGnFxGTQzJ9oN97MM0pzFCQIgCQ9UfTNROZ+f3XE
 Ps5MmUwAdiuooplpxv8gdpOY8GetZcbhazZm4ZCoOrYNnhJpfYDXZ54ouZmBbbFX+k08
 0wp+dKRENLbziy6l4lY98iRkX4bCHiplI1PBxhC2BtAGF5Hmy3+7/ak7U65ujuTbtzWo
 KWjg==
X-Gm-Message-State: AOAM531AU7+FXBIq3PZflm5IDwxUKitYQ3YZQpLafVqQIn5WY7+OvfFB
 F8Uf8v8N1icxDVLrzbfjdhN1GFsBtmYYGt0mRv05LXiU02REdgrRxg+KjLJpFFjQ816AdgndBxT
 K3ARqGLy9lrbdm7lGOOAiYVA6T+xG/zc=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr569701uar.87.1642714492904;
 Thu, 20 Jan 2022 13:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvOrkGi8YrSdWCxiqh+vVJgFpr1tSxs5zR1QuvBQhnnbRgF+8YYrCMFVggI4ZfmndwNWYNFJ54lfl0zOtWiZ4=
X-Received: by 2002:ab0:678f:: with SMTP id v15mr569692uar.87.1642714492540;
 Thu, 20 Jan 2022 13:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
 <YeaRJF3tqMjipU3o@redhat.com>
 <CAFn=p-ZS247FdLySHMcBTpqKzV=eTgsQQMAXyU5CwNEWdZQusQ@mail.gmail.com>
 <a82daf05-24d0-f871-185e-3588e4c91dea@amsat.org> <YelmNGvwwUDWmW93@redhat.com>
In-Reply-To: <YelmNGvwwUDWmW93@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Jan 2022 16:34:41 -0500
Message-ID: <CAFn=p-YjMQ1BQLXXEY21XHar2n+5Qyr0rtYX6XoD3pEHkKdwNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 8:40 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Jan 20, 2022 at 02:33:46PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 18/1/22 19:04, John Snow wrote:
> > > On Tue, Jan 18, 2022 at 5:06 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> >
> > > > It would be nice to just have this integrated into 'make check' so =
we
> > > > don't need to remember to run a special command.
> > >
> > > The CI will run it, but 'make check' doesn't. To add it to make check=
,
> > > I need to figure out how to insert a venv-building step into 'make
> > > check' such that the venv gets deposited into the build dir instead o=
f
> > > the source dir.
> > > I think I may also need yet another set of package dependencies that
> > > pin on precise dependencies for testing purposes to prevent random
> > > regressions during 'make check' when nobody has touched the Python
> > > code.
> > >
> > > Overall, I felt like maybe it was more hassle than it was worth if I
> > > can just nudge people touching the python to run a 'make check-dev'
> > > every so often.
> > >
> > > Patches welcome, etc. My overall strategy with the python tests so fa=
r has been:
> > >
> > > (1) Keep python tests fully separate from the QEMU build system to
> > > allow them to be split out into new repositories easily.
> > > (2) Use the pipenv test to lock the very oldest dependencies the code
> > > and tests support, using the very oldest python we support (3.6) This
> > > test is used as the gating test in GitLab CI, as it is very repeatabl=
e
> > > and the GitLab CI setup ensures I can always have the exact Python
> > > packages it requires available.
> > > (3) Use the tox test to test against a wide variety of Python
> > > interpreters (3.6 through 3.10 inclusive) using the very latest pytho=
n
> > > packages to detect regressions on cutting-edge environments
> > > (4) Use the widest possible range of versions for dependent packages
> > > in setup.cfg such that QEMU packages are unlikely to cause versioning
> > > conflicts in environments that decide to integrate our code.
> > >
> > > Overall, I test on 3.6 through 3.10, and against the "oldest" and
> > > "newest" dependencies. It's a good, wide matrix.
> > >
> > > However, It's #4 there that runs me into trouble with tests that are
> > > guaranteed to pass -- the linters update all the time and cause new
> > > problems. I use pipenv to lock to specific versions, but that tool
> > > wants to run against Python 3.6 *explicitly*, so it isn't suitable fo=
r
> > > a generic purpose 'make check' because not everyone will have a Pytho=
n
> > > 3.6 interpreter available. I need something kind of halfway between,
> > > where I can lock against specific versions but not against the Python
> > > interpreter version, and that's what could be used for a decent 'make
> > > check' test.
> > >
> > > Of course, I don't want to maintain like 10 versions of a dependent
> > > packages list, either.
> > >
> > > (I really, really wish pip had an --use-oldest flag for dependency
> > > resolution, but it doesn't.)
> >
> > Could we simply use a virtualenv for all QEMU testing tasks (packages
> > consumed by QEMU tests), and only deal with installed Python packages
> > for regular non-testing QEMU uses (things exposed via pyqemu that we
> > want stable)?

There's no python packages we need except those that are for testing.
Everything we need for the build is self-contained. "Python packages
regular non-testing QEMU uses" is an empty set. We do ship *one*
self-contained Python script, qemu-trace-stap. That lives in
scripts/qemu-trace-stap and we don't need to mess with it right now.

Now, in the process of setting up the python/ directory, Cleber and I
had discussed how to handle virtual environments for that directory --
as it has its own requirements, its own goals, etc. We decided at the
time it would be best not to mix the dependencies of the test system
with the dependencies of the burgeoning QEMU library. Let me elaborate
on why we believe that to be the right decision:

In summary, the Python in use in the QEMU tree can be found in these catego=
ries:

- Used during the build itself, Not shipped with QEMU. Zero external
dependencies.
- Used for testing, Not shipped with QEMU. Avocado tests use a scant
few external dependencies.
- Not used for building nor testing, Shipped with QEMU. (This is to my
knowledge a single script with no dependencies.)

Now, there are two kinds of tests that involves python code:

- Tests that are used for testing QEMU that incidentally use or are
written in Python
- Tests that are used for testing the Python code itself

The first category of test there makes sense to be tied to a QEMU
build. That's what Avocado tests are, and they use their own virtual
environment for the purpose.
The second category of test does not make sense to be tied to a QEMU
build, because it does not test QEMU. This is what the python/ CI
tests behave like.

The different in purpose and motivation between those two categories
of tests is why where are presently two different virtual environment
regimes in the tree, and it's very likely that making any attempt to
combine them is a very bad idea.
For example, /python/qemu/aqmp/ is on its way to being forked out as
its own standalone library. This library needs its own set of
requirements for being installed, tested, etc. tests/avocado/, on the
other hand, is an application that will consume the QMP library, and
it will likely have its own requirements.

Put another way: mixing the requirements of library and application
together simply because they're in the same git tree at the moment is
not good.

>
> I don't especially like the idea of using virtualenv. It is a good thing
> that we're testing on the distro python packages, because that is the
> scenario that our contributors/developers will actually use these
> tools in. We're got a well defined set of target platforms that QEMU
> aims for that we need to cover in testing. If we also want to do tests
> against general python using a virtualenv in CI pipelines thats fine,
> but doesn't replace the need to testing against our explicit platform
> targets, its just additive.

> I don't especially like the idea of using virtualenv.

Well, we already are using them in multiple places.
tests/requirements.txt is used to instantiate a per-build VENV that is
used to run the Avocado tests, and the python/ tests use several
different ones in order to achieve a wide testing matrix for testing
itself.

> It is a good thing that we're testing on the distro python packages

I mean, virtual environments don't download new copies of Python. No
matter what, we're testing against "distro python". All the virtual
environment does is allow us to pull very specific python package
dependencies. For example, the avocado tests mandate that we use
version 88.1 of avocado-framework. I assume most distributions don't
even *have* avocado bundled in their repo. For sure, absolutely nobody
will have packaged "qemu.qmp" by the time I need to start using it.
Python testing packages (mypy, pylint, avocado, et al) move so fast
that trying to maintain compatibility with every last one that ships
as part of a distro repository is impossible (I've tried).

Most of all, though, I don't see the benefit in trying to maintain
compatibility with a random ancient version of 'pylint' that someone
might have as part of their platform. I see no reason why downloading
a more modern pylint into a cached folder somewhere hurts our ability
to test QEMU against our supported build platforms ... especially if
said package-grab indeed works on all of those build platforms.

> because that is the scenario that our contributors/developers will actual=
ly use these tools in

Not if the virtual environment is part of the test invocation
script... like it already is. Then everyone is using a very tightly
controlled version of the testing environment with the exact correct
dependencies. Mind you, I am drawing a distinction between build
scripts, test scripts, and tools. The argument I see you making here
is something that I believe applies to libraries and tools. That's
indeed exactly why the testing regime for python/ is completely
separate and fairly different from the QEMU build process, and covers
a wide spectrum of dependent versions precisely to guarantee maximum
compatibility.

> We're got a well defined set of target platforms that QEMU aims for that =
we need to cover in testing.

And we do! If we use a VENV to pull in some pure python code, who
cares? The point is that QEMU is getting built and tested on those
platforms. It matters extremely little if the test environment uses
tighter bounds for thinks like a QMP library. This is barely different
from initializing git submodules at the start of a build. I really
feel like you are being artificially harsh here.

> If we also want to do tests against general python using a virtualenv in =
CI pipelines thats fine,
> but doesn't replace the need to testing against our explicit platform tar=
gets, its just additive.

I don't understand this paragraph, unless you believe that virtual
environments also replace the Python interpreter. Any use of a venv to
run python tests is still gonna run those tests on these target
platforms you wanna make sure work. I don't understand your
apprehension.

--js


