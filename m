Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C1CEB29
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 19:54:48 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHXDc-0004Dv-2x
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 13:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iHXCc-0003XR-Pm
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 13:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iHXCa-0004iv-2U
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 13:53:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iHXCZ-0004iQ-Qq
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 13:53:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 63ECFA44AC2;
 Mon,  7 Oct 2019 17:53:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A12E6DACF;
 Mon,  7 Oct 2019 17:53:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED0BD1138648; Mon,  7 Oct 2019 19:53:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] netmap: support git-submodule build otption
References: <874l13qmvb.fsf@dusky.pond.sub.org>
 <20191004130242.27267-1-g.lettieri@iet.unipi.it>
 <CAFEAcA8ut__ruS4yEMT7-qCKu+BFihFwhaNoq7L1cdoqxpXx6g@mail.gmail.com>
 <87pnj8ltih.fsf@dusky.pond.sub.org>
 <CAFEAcA9KLDruPS6o85H5XJnQjoSXV2+-d=dnNGPvc80jiBthiQ@mail.gmail.com>
 <87zhicg2ce.fsf@dusky.pond.sub.org>
 <aeeb3680-71fa-55ff-40df-7abfc5a57a5a@redhat.com>
Date: Mon, 07 Oct 2019 19:53:19 +0200
In-Reply-To: <aeeb3680-71fa-55ff-40df-7abfc5a57a5a@redhat.com> (Thomas Huth's
 message of "Mon, 7 Oct 2019 17:37:17 +0200")
Message-ID: <87o8yscui8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 07 Oct 2019 17:53:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 Giuseppe Lettieri <giuseppe.lettieri@unipi.it>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 07/10/2019 14.35, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> 
>>> On Mon, 7 Oct 2019 at 11:50, Markus Armbruster <armbru@redhat.com> wrote:
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>> Basically new submodules are a pain so we seek to minimize
>>>>> the use of them.
>>>>
>>>> I suggested making it a submodule upthread[*].  Let me try to distill
>>>> the conversation into a rationale.  Giuseppe, please correct mistakes.
>>>>
>>>> To make use of QEMU's netmap backend (CONFIG_NETMAP), you have to build
>>>> and install netmap software from sources[**].  Which pretty much ensures
>>>> developers compile with CONFIG_NETMAP off, and the code rots.
>>>>
>>>> For other dependencies that aren't readily available on common
>>>> development hosts (slirp, capstone), we use submodules to avoid such
>>>> rot.  If the system provides, we use that, and if it doesn't, we fall
>>>> back to the submodule.  This has served us well.
>>>
>>> I would put this differently. We don't use submodules to avoid
>>> code-rot. We use submodules where a dependency is needed for us
>>> to provide QEMU features that are sufficiently important that we
>>> want to provide them to users even if those users don't have the
>>> dependency available to them as a system library.
>>>
>>> There are lots of features of QEMU that only compile with sufficiently
>>> recent versions of dependencies, and we don't try to submodule-ize
>>> them because the features aren't really that important for the bulk
>>> of our users. For instance, we provided pixman as a submodule for
>>> a while because the features that require it (our graphics layer
>>> code) are important to almost all users. But we didn't provide
>>> spice as a module even when you pretty much needed to be
>>> running bleeding-edge redhat to satisfy the version dependency
>>> we had, because most users don't care about spice support.
>>> Shipping our dependencies as submodules imposes real costs
>>> on the project (for instance we then need to track the upstream
>>> to see when we should be updating, including checking whether
>>> we need to update to fix security issues). Submodules should be
>>> the exception, not the rule.
>>>
>>>> For netmap, falling back to the submodule when the host doesn't provide
>>>> tends not to be useful beyond compile-testing.  Because of that, we fall
>>>> back only when the user explicitly asks for it by passing
>>>> --enable-netmap=git to configure.  CI should do that.
>>>
>>> This sounds like netmap is in the same position as most of our
>>> dependencies: OK to compile if the system provides the library,
>>> but if the system doesn't then almost all users won't care
>>> that the feature isn't present. If CI of the QEMU code is useful,
>> 
>> If CI of QEMU code isn't useful, then I suspect the QEMU code isn't
>> useful, period.  Giuseppe assures us the netmap QEMU code *is* useful.
>> It followe we better make sure our CI covers it.
>> 
>> A submodule would make sure, but it looks like it won't fly.  So let's
>> try another tack:
>> 
>>> get the library supported by and shipped in distros. If you can't
>>> get anybody in a distro (Linux or BSD) to care enough to ship the
>>> library, this is a really niche feature, and up for consideration
>>> for deprecate-and-drop from QEMU, I think.
>> 
>> Giuseppe, you mentioned netmap is in FreeBSD, and getting it into Linux
>> is unlikely, so let's focus on FreeBSD.
>> 
>> We have a FreeBSD section in .patchew.yml, which makes me guess Patchew
>> CI tests FreeBSD.  Does it test with CONFIG_NETMAP out of the box?  If
>> not, how do we have to tweak its configuration to get CONFIG_NETMAP
>> enabled?  Who could help with this?
>
> I just tried this patch here:
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -8,7 +8,7 @@ freebsd_12_task:
>      memory: 8G
>    install_script: pkg install -y
>      bash bison curl cyrus-sasl git glib gmake gnutls gsed
> -    nettle perl5 pixman pkgconf png usbredir
> +    nettle perl5 pixman pkgconf png usbredir netmap
>    script:
>      - mkdir build
>      - cd build
>
> ... and looks like net/netmap.c now gets successfully compiled on
> FreeBSD in the Cirrus-CI:
>
>  https://api.cirrus-ci.com/v1/task/5669479475838976/logs/main.log

Awesome :)

> We can also add it to the vm-freebsd test:
>
> diff --git a/tests/vm/freebsd b/tests/vm/freebsd
> --- a/tests/vm/freebsd
> +++ b/tests/vm/freebsd
> @@ -54,6 +54,9 @@ class FreeBSDVM(basevm.BaseVM):
>          # libs: opengl
>          "libepoxy",
>          "mesa-libs",
> +
> +        # libs: network
> +        "netmap",
>      ]
>
>      BUILD_SCRIPT = """
>
> ... then it gets compiled succesfully during "make vm-build-freebsd".
>
> So does that sound like a good way to keep netmap.c from bitrotting? If
> so, I can send the above two diffs as a proper patch, if you like.

Yes, please!

