Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FF154579
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:53:41 +0100 (CET)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izhb4-0004XH-Ta
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1izhaF-00044x-Im
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:52:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1izhaD-0002u4-QM
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:52:43 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60406
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1izhaD-0002r3-Ko
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 08:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580997159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afuzYu/ru1n80CJVmQHbFAiNDyZK04H4UU7847GNqtE=;
 b=X+OL44elBtQocin51PwFCbGm4kiSjHGmSH+LLiIlihrP02TLkJx3PQNYFV5u+PXe9R+S2d
 hQM5YGFBB6Ym8IJx3APWuyHwT3HWs1OY1aqYE2M9yHJud7Wzguze1zi/aGJnXp9/w/hj0L
 YptCVcvsCZGC1mBSxPeXhAv1V0tp4dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-WOJ9fGROPVCaX_RA6yV7jg-1; Thu, 06 Feb 2020 08:52:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DCBDB2B;
 Thu,  6 Feb 2020 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-96.gru2.redhat.com
 [10.97.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E846790C8;
 Thu,  6 Feb 2020 13:52:17 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] GitLab CI: crude mapping of PMM's scripts to jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20200203032328.12051-1-crosa@redhat.com>
 <20200203032328.12051-2-crosa@redhat.com>
 <80f87c73-ed38-cba6-f551-20c7f5a46264@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c75939bf-828f-bff9-d42f-b11d141aae64@redhat.com>
Date: Thu, 6 Feb 2020 11:52:15 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <80f87c73-ed38-cba6-f551-20c7f5a46264@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: WOJ9fGROPVCaX_RA6yV7jg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/6/20 11:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/3/20 4:23 AM, Cleber Rosa wrote:
>> This is a crude and straightforward mapping of Peter's
>> "remake-merge-builds" and "pull-buildtest" scripts.
>>
>> Some characteristics were removed for simplicity sake (but eventually
>> will), including:
>> =C2=A0 * number of simultaneous make jobs
>> =C2=A0 * make's synchronous output, not needed because of previous point
>> =C2=A0 * out-of-tree builds
>>
>> This covers the "x86-64 Linux with a variety of different build
>> configs"[1].=C2=A0 I've personally tested all of them, and only had
>> issues with the "notcg" job[2], but it seems to be a test specific
>> issue with the nested KVM I was using.
>>
>> [1] - https://wiki.qemu.org/Requirements/GatingCI#Current_Tests
>> [2] - https://paste.centos.org/view/1dd43a1c
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>> =C2=A0 .gitlab-ci.yml | 116 ++++++++++++++++++++++++++++++++++++++++++++=
+++++
>> =C2=A0 1 file changed, 116 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index d2c7d2198e..eb4077e2ab 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -2,6 +2,8 @@ include:
>> =C2=A0=C2=A0=C2=A0 - local: '/.gitlab-ci-edk2.yml'
>> =C2=A0 =C2=A0 build-system1:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script: &before_scr_apt
>> =C2=A0=C2=A0 - apt-get update -qq
>> =C2=A0=C2=A0 - apt-get install -y -qq flex bison libglib2.0-dev libpixma=
n-1-dev=20
>> genisoimage
>> @@ -17,6 +19,8 @@ build-system1:
>> =C2=A0=C2=A0 - make -j2 check
>> =C2=A0 =C2=A0 build-system2:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -31,6 +35,8 @@ build-system2:
>> =C2=A0=C2=A0 - make -j2 check
>> =C2=A0 =C2=A0 build-disabled:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -47,6 +53,8 @@ build-disabled:
>> =C2=A0=C2=A0 - make -j2 check-qtest SPEED=3Dslow
>> =C2=A0 =C2=A0 build-tcg-disabled:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -67,6 +75,8 @@ build-tcg-disabled:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 248 250 254 255 256
>> =C2=A0 =C2=A0 build-user:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -78,6 +88,8 @@ build-user:
>> =C2=A0=C2=A0 - make run-tcg-tests-i386-linux-user run-tcg-tests-x86_64-l=
inux-user
>> =C2=A0 =C2=A0 build-clang:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -92,6 +104,8 @@ build-clang:
>> =C2=A0=C2=A0 - make -j2 check
>> =C2=A0 =C2=A0 build-tci:
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME !=3D "staging"'
>> =C2=A0=C2=A0 before_script:
>> =C2=A0=C2=A0=C2=A0 *before_scr_apt
>> =C2=A0=C2=A0 script:
>> @@ -111,3 +125,105 @@ build-tci:
>> =C2=A0=C2=A0 - QTEST_QEMU_BINARY=3D"x86_64-softmmu/qemu-system-x86_64"=
=20
>> ./tests/qtest/pxe-test
>> =C2=A0=C2=A0 - QTEST_QEMU_BINARY=3D"s390x-softmmu/qemu-system-s390x"
>> =C2=A0=C2=A0=C2=A0=C2=A0 ./tests/qtest/pxe-test -m slow
>> +
>> +ubuntu-18.04.3-x86_64-notools:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n22
>> + - ./configure --target-list=3Darm-softmmu --disable-tools=20
>> --disable-libssh
>> + # There is no make / make check in the "pull-buildtest" script for=20
>> this.
>> + # Question: should it at least be built? Or dropped?
>> + - make
>> +
>> +ubuntu-18.04.3-x86_64-all-linux-static:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n25
>> + - ./configure --enable-debug --static --disable-system=20
>> --disable-glusterfs --disable-libssh
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n36
>> + - make
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n45
>> + - make check V=3D1
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n48
>> + - make check-tcg V=3D1
>> +
>> +ubuntu-18.04.3-x86_64-all:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n26
>> + - ./configure --disable-libssh
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n28
>> + - make
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n37
>> + - make check V=3D1
>> +
>> +ubuntu-18.04.3-x86_64-alldbg:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n27
>> + - ./configure --disable-libssh
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n27
>> + - make clean
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n29
>> + - make
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n37
>> + - make check V=3D1
>> +
>> +ubuntu-18.04.3-x86_64-clang:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n31
>> + - ./configure --disable-libssh --cc=3Dclang --cxx=3Dclang++=20
>> --enable-gtk --extra-cflags=3D'-fsanitize=3Dundefined=20
>> -fno-sanitize=3Dshift-base -Werror'
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n33
>> + - make
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n39
>> + - make check V=3D1
>> +
>> +ubuntu-18.04.3-x86_64-tci:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n33
>> + - ./configure --disable-libssh --enable-debug --enable-tcg-interpreter
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n34
>> + - make
>> +
>> +ubuntu-18.04.3-x86_64-notcg:
>> + tags:
>> + - ubuntu_18.04.3
>> + - x86_64
>> + rules:
>> + - if: '$CI_COMMIT_REF_NAME =3D=3D "staging"'
>> + script:
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/remake=
-merge-builds#n35
>> + - ./configure --disable-libssh --enable-debug --disable-tcg
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n35
>> + - make
>> + #=20
>> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/pull-b=
uildtest#n39
>> + # Question: check is disabled on the original script, because the=20
>> machine
>> + # is said to be running VirtualBox.=C2=A0 Should this be dropped or=20
>> should the
>> + # machine be tweaked or substituted?
>> + - make check V=3D1
>
> On another thread Thomas said he doesn't want to be responsible of=20
> other tests:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg670132.html
>
> We could move the set of tests converted from Peter personal testsuite=20
> into a separate YAML, so the interested (you Cleber, and Peter) can=20
> have a F: entry in MAINTAINERS for it:


I like that idea.


>
>
> include:
> =C2=A0 - local: '/.gitlab-ci-pm215.yml'


If so, I suggest moving the file to the .gitlab-ci.d directory instead.=20
Likewise the .gitlab-ci-edk2.yml file. This way the sources root=20
directory does not get infested of GitLab files.

Thanks,

Wainer

>
>
>


