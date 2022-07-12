Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9375712D9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:12:42 +0200 (CEST)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBA4X-0003g8-8G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oB9kt-0007dO-8Y
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:52:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oB9kr-0004a1-1l
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:52:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id s21so6794608pjq.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lV6SP2wIbcOZgtNUqtz0YOcwuHHP7JD9wqWog40Y4Dc=;
 b=FXw6jf4vC+lY++G7vzElvjzFeEf1F8N+HuWpMoz3Tz6gYRgyzEgV7jQxeM2ryNrYOF
 PNRnQUGiNtm2sUcyIrjmkP6x+j09vyQ8UWAlTAvSYTjsYn2/htEzOA8ikDgb5RyKVrhj
 0Y64t7kQBkOoDeLQ3goU0KnW5YTWR/AYx9KkTnEVzrQ6IT1HzPL6Y/LR2vP1AAM32q2+
 z8an7HmEpio3u9yFUjr8Uc9qVACKmi+RZwKSNnx98w/V0FmqEiEBQwyxr6X7OGKi8xLD
 zyRYpM2l8/mDAS4pAElCDh7i5EP8WVlwW0lfkg4z+kK6mm24PjT9/AoSr/ytJUB3PRkQ
 6LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lV6SP2wIbcOZgtNUqtz0YOcwuHHP7JD9wqWog40Y4Dc=;
 b=WZccnX5dwxb5+OlJGjY4/XJGyv4W2yDGIHHiU0pCh7zhOMufEVTLv1sAALMXpFIpBn
 Ezmon6qWhp7Fuyzn4Dtc9/NzJQwJf1aF0R+Z6wOOeWmaH4aB30DeDepotza05q2KoBhc
 09Zm2VDdhbpnhrflxeKNQJVnPqRxEazIT0EN2eyA+d43tRDkjPMjyOUDz7YaUSfCrZFp
 JeW9zfRVaIjxI5+oT3Gz9oxCDY2NTmpsFjduBiP0ZnIBiET1c5N04Jbe7HIkG0tgXzoT
 XeXhca8TRhi2kE+UY8+T1RvtnVoGYKT8ZfjiAsn64ssUv00ZEWBkR/VJKTQk/31KarLo
 8CVQ==
X-Gm-Message-State: AJIora/UUh73X3Yxhs5aa/pJZ1JpR1D9aXRcEF/RcbKyvJCrmkh915XX
 e/c72LqMjDOgsnA1HIYwJrfzFg==
X-Google-Smtp-Source: AGRyM1sqLZQa+aOPkUWCE6zri0n95B+UX9zMaA4v+2PeVxxDygi8WtOXRySANQ/oThwp9x2O1eCY4A==
X-Received: by 2002:a17:90a:a796:b0:1ef:85de:6d9c with SMTP id
 f22-20020a17090aa79600b001ef85de6d9cmr2507868pjq.201.1657608736647; 
 Mon, 11 Jul 2022 23:52:16 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.118.4])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a63e301000000b0040c9df2b060sm5360470pgh.30.2022.07.11.23.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 23:52:16 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 12 Jul 2022 12:22:10 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: John Snow <jsnow@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
In-Reply-To: <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
 <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Mon, 11 Jul 2022, John Snow wrote:

> On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > Integrate the pytest framework with the meson build system. This will make meson
> > run all the pytests under the pytest directory.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/Makefile.include   |  4 +++-
> >  tests/meson.build        |  1 +
> >  tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 53 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/pytest/meson.build
> >
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 3accb83b13..40755a6bd1 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -3,12 +3,14 @@
> >  .PHONY: check-help
> >  check-help:
> >         @echo "Regression testing targets:"
> > -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
> > +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
>
> Does this mean that "make check" *requires* an internet connection?

No. My test will be skipped if it is unable to download the artifacts it
requires due to lack of Internet connectivity.


If
> so, I'm afraid that introduces some complications for downstreams
> which require that "make check" can run without an internet
> connection. It's something I've been trying to wrestle with as I split
> the qemu.qmp library out of the QEMU tree, and I have been working
> (slowly) on remedying it with some additional Makefile logic.
>
> I have been looking into making a testing "dummy package" for python
> with optional dependency groups that use a venv building script to
> either pull from PyPI in online mode, or use system packages in
> offline mode. In the case of offline mode, I am working on augmenting
> the configure script to test that dependencies are met, and disabling
> test groups when the correct dependencies cannot be located.
>
> I hope to have another version of that series soon; it should be
> trivial to add a new optional dependency group to it. I'll CC you on
> the next version of the series.
>
> --js
>
> >         @echo " $(MAKE) bench                  Run speed tests"
> >         @echo
> >         @echo "Individual test suites:"
> >         @echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
> >         @echo " $(MAKE) check-qtest            Run qtest tests"
> > +       @echo " $(MAKE) check-pytest           Run pytest tests"
> > +       @echo " $(MAKE) check-pytest-TARGET    Run pytest for a given target"
> >         @echo " $(MAKE) check-unit             Run qobject tests"
> >         @echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
> >         @echo " $(MAKE) check-block            Run block tests"
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 8e318ec513..f344cbdc6c 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -93,3 +93,4 @@ subdir('unit')
> >  subdir('qapi-schema')
> >  subdir('qtest')
> >  subdir('migration')
> > +subdir('pytest')
> > diff --git a/tests/pytest/meson.build b/tests/pytest/meson.build
> > new file mode 100644
> > index 0000000000..e60d481ae4
> > --- /dev/null
> > +++ b/tests/pytest/meson.build
> > @@ -0,0 +1,49 @@
> > +slow_pytests = {
> > +  'acpi-bits' : 120,
> > +}
> > +
> > +pytests_generic = []
> > +
> > +# biosbits tests are currenly only supported on x86_64 platforms.
> > +pytests_x86_64 = ['acpi-bits-test']
> > +
> > +pytest_executables = {}
> > +other_deps = []
> > +
> > +subdir('acpi-bits')
> > +
> > +foreach dir : target_dirs
> > +  if not dir.endswith('-softmmu')
> > +    continue
> > +  endif
> > +
> > +  target_base = dir.split('-')[0]
> > +  pytest_emulator = emulators['qemu-system-' + target_base]
> > +  target_pytests = get_variable('pytests_' + target_base, []) + pytests_generic
> > +
> > +  test_deps = roms
> > +  pytest_env = environment()
> > +  if have_tools
> > +    pytest_env.set('QTEST_QEMU_IMG', './qemu-img')
> > +    test_deps += [qemu_img]
> > +  endif
> > +  pytest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
> > +  pytest_env.set('PYTEST_QEMU_BINARY', './qemu-system-' + target_base)
> > +  pytest_env.set('PYTEST_SOURCE_ROOT', meson.project_source_root())
> > +  if have_tools and have_vhost_user_blk_server
> > +    pytest_env.set('PYTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
> > +    test_deps += [qsd]
> > +  endif
> > +
> > +  foreach test : target_pytests
> > +    test('pytest-@0@/@1@'.format(target_base, test),
> > +         pytest_executables[test],
> > +         depends: [test_deps, pytest_emulator, emulator_modules, other_deps],
> > +         env: pytest_env,
> > +         args: ['--tap', '-k'],
> > +         protocol: 'tap',
> > +         timeout: slow_pytests.get(test, 30),
> > +         priority: slow_pytests.get(test, 30),
> > +         suite: ['pytest', 'pytest-' + target_base])
> > +  endforeach
> > +endforeach
> > --
> > 2.25.1
> >
>
>

