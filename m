Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B1032BA0A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:55:02 +0100 (CET)
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWeD-0000Bm-Sb
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHWcR-0006ys-Ck
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:53:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHWcP-0001HB-9o
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCUi0M6FlbMswoFAQUdFwG6TUqXX8Jk+CnOm8CIbFGs=;
 b=SaZqxhXWID5stZThL04aEkK1EO3SVNxU7M9meA27xpRvGSlN7VoQs7OnzuV5HSvRM6tNvI
 X0+BY3rHY5+nxHq2dqaIrs0JPEIhuP7brbEGyVfSx2q4wtKLRc4BsCIYj0Y1FCl56amQSc
 +rA2Gk5kfgLe0Qs0T2xRIHRhoLZ422c=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-IVXxhPynP3m3A0P_zWrd7w-1; Wed, 03 Mar 2021 13:53:05 -0500
X-MC-Unique: IVXxhPynP3m3A0P_zWrd7w-1
Received: by mail-vk1-f198.google.com with SMTP id r63so5231519vkg.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PCUi0M6FlbMswoFAQUdFwG6TUqXX8Jk+CnOm8CIbFGs=;
 b=V2cnbDiBY24KcOq377danyDVHZPmBOIfpszzTBlvXzU4Fkkw/5pRpUHXrbyjCAm2gd
 D7nr8IJ1iuQEZUNkzPUQncfrcswSVsik/DzuaoT0IO0lKgopewbl0xjlc3ao+qYwuk6M
 WqMwMy23EB7T701WY8Dcc9a+3gR7NZRtxFCfTSmzHfCbpYVWn6qQ8/ajru1yCMBXpAXl
 X55rWoZJRttlUtCUeifVEI22hDaLqQ2DLkOPNT6rCPqduKh75mCh+3uksI/TQGZVZgf3
 /9MbNQqmjRYQ9vtFGHbQ7tTV5JsG5RDrWjE4ZQif3JUWZ7vDyqUvKM3rBLaskMSG5Cr7
 y6Og==
X-Gm-Message-State: AOAM530yR90jI0Uc9LjmitK5RguzFVEl4Jx5E80NEy1my4Hjg80FssPw
 IKOyTfFj5m49Ch8kzaH01X3AE8dt2SAZekL4GuXKMKHgldutLVTcLhLJqb3471/SfPk8oqpOJmU
 6gYdpfzXYNdPCBtLSK0kW8YFaFpQgf0s=
X-Received: by 2002:a67:ed86:: with SMTP id d6mr220241vsp.50.1614797584030;
 Wed, 03 Mar 2021 10:53:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/HWITySvkK4n7Iia0OR/vK9COASRvZCJ2PLCpmtKIYG1HTMsqWg8w3HOfHoKXwhIV16b5NbWJt2lWbkkdFDo=
X-Received: by 2002:a67:ed86:: with SMTP id d6mr220228vsp.50.1614797583709;
 Wed, 03 Mar 2021 10:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20210228224343.310677-1-f4bug@amsat.org>
 <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
 <b0dc999b-ddd1-fc4b-cd7d-56905c85616b@amsat.org>
 <CAKJDGDZzWKYrDiBPmDFBihEH=hOCymHuXZ8cNP4ZTSdLisAefA@mail.gmail.com>
 <f48c7cd7-27e5-da53-adbf-849c094a88f5@redhat.com>
In-Reply-To: <f48c7cd7-27e5-da53-adbf-849c094a88f5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 15:52:37 -0300
Message-ID: <CAKJDGDYxN=GKm-pmpfhoO2t8WLU6K4Vfki7Rbtfz3bU+g=_6jA@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22
 artifacts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

On Tue, Mar 2, 2021 at 12:45 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 3/2/21 4:27 PM, Willian Rampazzo wrote:
> > Hi Phil,
> >
> > On Mon, Mar 1, 2021 at 11:11 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 3/1/21 2:30 PM, Wainer dos Santos Moschetta wrote:
> >>> Hi,
> >>>
> >>> On 2/28/21 7:43 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> Having artifacts stored in personal namespace is not ideal,
> >>>> as these might get closed and disappear. Use the original URL
> >>>> where these artifacts could be found.
> >>>>
> >>>> For more references:
> >>>> https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips=
64el
> >>>>
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>> ---
> >>>>   tests/acceptance/boot_linux_console.py | 4 ++--
> >>>>   tests/acceptance/replay_kernel.py      | 4 ++--
> >>>>   2 files changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/tests/acceptance/boot_linux_console.py
> >>>> b/tests/acceptance/boot_linux_console.py
> >>>> index eb012867997..138bd8cb7d3 100644
> >>>> --- a/tests/acceptance/boot_linux_console.py
> >>>> +++ b/tests/acceptance/boot_linux_console.py
> >>>> @@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
> >>>>           :avocado: tags=3Dmachine:malta
> >>>>           :avocado: tags=3Dendian:little
> >>>>           """
> >>>> -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blo=
b/'
> >>>> -                      'raw/9ad2df38/mips/malta/mips64el/'
> >>>> +        kernel_url =3D ('http://mipsfedora.imgtec.com/development/2=
2/'
> >>>> +                      'mips64el/images/20150601/'
> >>>>                         'vmlinux-3.19.3.mtoman.20150408')
> >>>
> >>> http://mipsfedora.imgtec.com/development/22/mips64el/images/20150601/=
vmlinux-3.19.3.mtoman.20150408
> >>> did not get resolve here. Could you please double-check the url is co=
rrect?
> >>
> >> Yes it is correct, the domain is dead. It was working when I wrote
> >> the test. Should I remove the test instead?
> >>
> >
> > This test is already skipped by default because of the
> > AVOCADO_ALLOW_UNTRUSTED_CODE flag.
>
> QEMU's .gitlab-ci.yml does (see acceptance_definition):
>
>   before_script:
>     - mkdir -p ~/.config/avocado
>     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
>     - echo "cache_dirs =3D ['${CI_PROJECT_DIR}/avocado-cache']"
>            >> ~/.config/avocado/avocado.conf
>     - echo -e '[job.output.testlogs]\nstatuses =3D ["FAIL", "INTERRUPT"]'
>            >> ~/.config/avocado/avocado.conf
>     - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
>         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
>       fi
>     - export AVOCADO_ALLOW_UNTRUSTED_CODE=3D1
>

This is true when running the test in the CI. What happens if I try to
run this test locally? It will be skipped unless I set
AVOCADO_ALLOW_UNTRUSTED_CODE=3D1.

> > Even if the flag is set to allow
> > the test to run, it will be skipped because the cache lacks the asset.
>
> Same file, we save the cache between runs:
>
>   cache:
>     key: "${CI_JOB_NAME}-cache"
>     paths:
>       - ${CI_PROJECT_DIR}/avocado-cache
>

In the CI environment, the test will execute because the asset is
already cached. Again, what happens if we merge this code and I try to
run it locally? the test will be skipped because I don't have the
asset.

The QEMU GitLab CI won't be affected by an invalid URL and will run
the test until the cache is cleared. If someone tries to run the
pipeline on a new instance of a GitLab CI, the test will be skipped.

With my suggestion, developers will have the chance to run the test
locally if they have the correct file and register it to their local
cache manually.

> > Instead of removing the test, my suggestion is to add information to
> > allow people to run it locally, like:
> >
> > diff --git a/tests/acceptance/boot_linux_console.py
> > b/tests/acceptance/boot_linux_console.py
> > index eb01286799..23efc18a99 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -239,11 +239,13 @@ def test_mips64el_malta_5KEc_cpio(self):
> >          :avocado: tags=3Dmachine:malta
> >          :avocado: tags=3Dendian:little
> >          """
> > -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
> > -                      'raw/9ad2df38/mips/malta/mips64el/'
> > -                      'vmlinux-3.19.3.mtoman.20150408')
> > +        # to run this test locally, download the following asset and r=
egister
> > +        # it manually to the avocado cache with:
> > +        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
> > +        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
> > +        kernel_name =3D 'vmlinux-3.19.3.mtoman.20150408'
>
> In this particular case it could work because the name is not generic,
> but what about the generic names ("vmlinux" for example)?
>
> Can't we register assets using any string to hash?
>

Right now it is not supported, but I opened an issue to discuss it
here: https://github.com/avocado-framework/avocado/issues/4435

> >          kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> > -        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkern=
el_hash)
> > +        kernel_path =3D self.fetch_asset(kernel_name, asset_hash=3Dker=
nel_hash)
> >          initrd_url =3D ('https://github.com/groeck/linux-build-test/'
> >                        'raw/8584a59e/rootfs/'
> >                        'mipsel64/rootfs.mipsel64r1.cpio.gz')
> > diff --git a/tests/acceptance/replay_kernel.py
> > b/tests/acceptance/replay_kernel.py
> > index c1cb862468..180e915264 100644
> > --- a/tests/acceptance/replay_kernel.py
> > +++ b/tests/acceptance/replay_kernel.py
> > @@ -397,11 +397,13 @@ def test_mips64el_malta_5KEc_cpio(self):
> >          :avocado: tags=3Dendian:little
> >          :avocado: tags=3Dslowness:high
> >          """
> > -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/'
> > -                      'raw/9ad2df38/mips/malta/mips64el/'
> > -                      'vmlinux-3.19.3.mtoman.20150408')
> > +        # to run this test locally, download the following asset and r=
egister
> > +        # it manually to the avocado cache with:
> > +        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
> > +        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
> > +        kernel_name =3D 'vmlinux-3.19.3.mtoman.20150408'
> >          kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> > -        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkern=
el_hash)
> > +        kernel_path =3D self.fetch_asset(kernel_name, asset_hash=3Dker=
nel_hash)
> >          initrd_url =3D ('https://github.com/groeck/linux-build-test/'
> >                        'raw/8584a59e/rootfs/'
> >                        'mipsel64/rootfs.mipsel64r1.cpio.gz')
> >
> > What do you think?
> >
> > ps. WARNING, above code not tested.
> >
> >>>>           kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> >>>>           kernel_path =3D self.fetch_asset(kernel_url,
> >>>> asset_hash=3Dkernel_hash)
> >>>> diff --git a/tests/acceptance/replay_kernel.py
> >>>> b/tests/acceptance/replay_kernel.py
> >>>> index c1cb8624683..efdd4233bc2 100644
> >>>> --- a/tests/acceptance/replay_kernel.py
> >>>> +++ b/tests/acceptance/replay_kernel.py
> >>>> @@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
> >>>>           :avocado: tags=3Dendian:little
> >>>>           :avocado: tags=3Dslowness:high
> >>>>           """
> >>>> -        kernel_url =3D ('https://github.com/philmd/qemu-testing-blo=
b/'
> >>>> -                      'raw/9ad2df38/mips/malta/mips64el/'
> >>>> +        kernel_url =3D ('http://mipsfedora.imgtec.com/development/2=
2/'
> >>>> +                      'mips64el/images/20150601/'
> >>>>                         'vmlinux-3.19.3.mtoman.20150408')
> >>>>           kernel_hash =3D '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> >>>>           kernel_path =3D self.fetch_asset(kernel_url,
> >>>> asset_hash=3Dkernel_hash)
> >>>
> >>
> >
>


