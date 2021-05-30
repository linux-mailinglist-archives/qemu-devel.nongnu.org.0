Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AA3952AC
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 21:23:26 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnR1x-0004BQ-7y
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 15:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lnR0u-0003Nb-Ok
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lnR0q-0005x0-LT
 for qemu-devel@nongnu.org; Sun, 30 May 2021 15:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622402534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tK3OVo8XB0ElqWQtX9E2SKzwsYk73q9beD98RihEPt8=;
 b=aKM5SoBloHmpxpbKQ3Bk+t0IZPkQQxgcZnsnmK3AKPR5WopUxx2cNj09UjHQZOctkdaaKo
 oW/MWaEBp0gjsnLJmDIFAJOdIJAWQ8JRkNbGS3BcKuIF2jKsKmPmPaUMYJFc6ZdYHRg6Sl
 N+l3AYz5t2534SNwxi1JKOD3He7yT0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-t2ub-19BPpm3aSW27rUkQQ-1; Sun, 30 May 2021 15:22:11 -0400
X-MC-Unique: t2ub-19BPpm3aSW27rUkQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4B71005D5B;
 Sun, 30 May 2021 19:22:10 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 765AB16922;
 Sun, 30 May 2021 19:22:02 +0000 (UTC)
Subject: Re: [PULL 00/44] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210528023220.417057-1-jsnow@redhat.com>
 <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <15baf57f-3372-a617-61f3-66c3bb42a302@redhat.com>
Date: Sun, 30 May 2021 15:22:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Kws=q73Yhe-AeuGhtx3V0uQOwaEG9+oRvcaROed8uNg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/21 3:09 PM, Peter Maydell wrote:
> On Fri, 28 May 2021 at 03:32, John Snow <jsnow@redhat.com> wrote:
>>
>> The following changes since commit c8616fc7670b884de5f74d2767aade224c1c5c3a:
>>
>>    Merge remote-tracking branch 'remotes/philmd/tags/gitlab-ci-20210527' into staging (2021-05-27 16:32:57 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>>
>> for you to fetch changes up to faa40e297406445ab8814844bd9aa532a7538cde:
>>
>>    gitlab: add python linters to CI (2021-05-27 18:11:17 -0400)
>>
>> ----------------------------------------------------------------
>> Python pull request
>>
>> Python packaging & CI implementation
>> Acceptance tests sent w/ Cleber's blessing.
>> New CI tests send w/ stsquad's RB.
>>
>> --js
>>
>> ----------------------------------------------------------------
> 
> Fails to build on my machine that runs the BSD VMs, apparently
> before it gets to the point of launching the VM:
> 
> make: Entering directory '/home/peter.maydell/qemu-freebsd/build'
> /usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/meson/meson.py
> introspect --targets --tests --benchmarks | /usr/bin/python3 -B
> scripts/mtest2make.py > Makefile.mtest
> { \
>    echo 'ninja-targets = \'; \
>    /usr/bin/ninja -t targets all | sed 's/:.*//; $!s/$/ \\/'; \
>    echo 'build-files = \'; \
>    /usr/bin/ninja -t query build.ninja | sed -n '1,/^  input:/d; /^
> outputs:/q; s/$/ \\/p'; \
> } > Makefile.ninja.tmp && mv Makefile.ninja.tmp Makefile.ninja
> (GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
> (GIT="git" "/home/peter.maydell/qemu-freebsd/scripts/git-submodule.sh"
> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp)
> /usr/bin/python3 -B /home/peter.maydell/qemu-freebsd/tests/vm/freebsd
> --debug --genisoimage /usr/bin/genisoimage    --image
> "/home/peter.maydell/.cache/qemu-vm/images/freebsd.img" --force
> --build-image /home/peter.maydell/.cache/qemu-vm/images/freebsd.img
> Traceback (most recent call last):
>    File "/home/peter.maydell/qemu-freebsd/tests/vm/freebsd", line 21, in <module>
>      import basevm
>    File "/home/peter.maydell/qemu-freebsd/tests/vm/basevm.py", line 22,
> in <module>
>      from qemu.machine import QEMUMachine
> ImportError: bad magic number in 'qemu': b'\x03\xf3\r\n'
> /home/peter.maydell/qemu-freebsd/tests/vm/Makefile.include:79: recipe
> for target '/home/peter.maydell/.cache/qemu-vm/images/freebsd.img'
> failed
> make: *** [/home/peter.maydell/.cache/qemu-vm/images/freebsd.img] Error 1
> make: Leaving directory '/home/peter.maydell/qemu-freebsd/build'
> 
> thanks
> -- PMM
> 

Hmm ...

When I have seen this error message in the past, it has been because of 
using a new Python version and it gets confused reading stale cached 
information generated from an older interpreter.

None of these patches *should* have affected what version of python is 
used during the build, only the locations of some of the files. I don't 
immediately know why this PR would affect the QEMU build at all, actually.

Can you do me a favor and delete any __pycache__ folders and/or any 
*.pyc files that might be hiding in your tree and/or build folders and 
try running it again?

(If it helps, I can see about amending 'make clean' to try and clean up 
stale Python cache, which is the best solution I can think of for right 
now.)

In case that doesn't fix it, can you tell me what version of Python your 
BSD setup uses? (And what version of FreeBSD you use?) -- I'll try to 
set up a VM and see if I can reproduce the problem.

--js


