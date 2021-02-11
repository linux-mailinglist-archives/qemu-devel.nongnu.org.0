Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B23194A7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:42:25 +0100 (CET)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAInA-0002nA-Cm
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAIZ3-0000XP-LF
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:27:53 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:45235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAIZ1-0005Ay-45
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:27:49 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIxFi-1lUipW0mpm-00KRA9; Thu, 11 Feb 2021 21:27:44 +0100
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20201122000131.18487-1-peter.maydell@linaro.org>
 <CAFEAcA8ZWZUwqstAcg3tw8fAr+SDVXr-puPby_VU9eh4zgBq2w@mail.gmail.com>
 <CAFEAcA8TaDhkmm7uA_XCfs-LG2feRXP5uehH4JKFNSeqOcm4MQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e6fe3ffc-3e11-df7e-0080-5ab52a94dc56@vivier.eu>
Date: Thu, 11 Feb 2021 21:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8TaDhkmm7uA_XCfs-LG2feRXP5uehH4JKFNSeqOcm4MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KS+aCkG4FGpyxqlGk0AjDh5uU5NCHjcxMbhaUmGmf9CrQDRPk1m
 MjnOOLxg6nZxbn1fjvcSksMaZdqSNg8k/P7U9lFeXmmsp6CbFKuBXGdfdkjVXum2/+wijS7
 RXgEhwrLRtBFZo7UoPvVPIKM5v3Bwo9fnZQkTHytCfQQXzNH3ISOVISf7JvsHh7C4jETjEa
 ow4TnmYB+VwyZqXDp8xpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e0RiIzgUaOI=:Vov2+Z4iezSYm2pNta4ShW
 Ism2to+/ocLjZC2D4zi3Bm4s0Fk3uATo4EnPkyHD7MUZros7GvtHyhhf+t39iYLLoA/T9VYY3
 ScmWkY4Z0+WqwDh8BWTX5q42Ouxj1OgSjY/F165Bnlm1UDwRkK2Dx1EG2uITS6gaUDIoTMHcd
 F259HbgIlxGetMb1NiNqWYDlTL08geG1aytauZ8d5NmKY+H5AW3Rmx5A3yK1OwlY5G/2kKGSa
 sw8sddUJbXG5Jl95OH6LSnAAVYd1Tmi0ysbXDUBJrZfaO63LVEiiqIe7q++Ebam/PTCRd3KT9
 wPd72o3Pxr1lpxcUQ8RRf4vMfgrS65cwLScG9NH+aSEHb9PDMjHHP5f9MqKjI6DPOdZP/+Kan
 okD5H5WKiOUOsCUzZevsH4q63JJCR2nDlSogsfB4by5Phx5eWbEIgxIcPCGlbJgYcB9ugDsO4
 LGp2FcomLA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/02/2021 à 18:02, Peter Maydell a écrit :
> Laurent: Ping^2 ? Somebody on IRC just now was getting confused by this
> ancient documentation and its references to nonexistent tarballs..

Sorry, I didn't see your mail.

I agree with the change.

Acked-by: Laurent Vivier <lauren@vivier.eu>

> -- PMM
> 
> On Tue, 19 Jan 2021 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Ping? Laurent, what's your take on this docs patch?
>>
>> thanks
>> -- PMM
>>
>> On Sun, 22 Nov 2020 at 00:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> The 'Quick Start' section of the userspace emulator documentation is
>>> very old and outdated. In particular:
>>>  - it suggests running x86-on-x86 emulation, which is the least
>>>    interesting possible use case
>>>  - it recommends that users download tarballs of guest binaries
>>>    from the QEMU web page which we no longer provide there
>>>
>>> There's nothing salvageable here; delete it all.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> I'm open to suggestions that this is being too drastic;
>>> the main aim here is to remove references to tar.gz files
>>> that we haven't provided for years, as noted by
>>>  https://bugs.launchpad.net/qemu/+bug/1884982
>>> Ideally the whole of docs/user could use a lot of love...
>>>
>>>  docs/user/main.rst | 61 ----------------------------------------------
>>>  1 file changed, 61 deletions(-)
>>>
>>> diff --git a/docs/user/main.rst b/docs/user/main.rst
>>> index bd99b0fdbe9..49ccae3ecab 100644
>>> --- a/docs/user/main.rst
>>> +++ b/docs/user/main.rst
>>> @@ -45,67 +45,6 @@ emulator.
>>>  Linux User space emulator
>>>  -------------------------
>>>
>>> -Quick Start
>>> -~~~~~~~~~~~
>>> -
>>> -In order to launch a Linux process, QEMU needs the process executable
>>> -itself and all the target (x86) dynamic libraries used by it.
>>> -
>>> --  On x86, you can just try to launch any process by using the native
>>> -   libraries::
>>> -
>>> -      qemu-i386 -L / /bin/ls
>>> -
>>> -   ``-L /`` tells that the x86 dynamic linker must be searched with a
>>> -   ``/`` prefix.
>>> -
>>> --  Since QEMU is also a linux process, you can launch QEMU with QEMU
>>> -   (NOTE: you can only do that if you compiled QEMU from the sources)::
>>> -
>>> -      qemu-i386 -L / qemu-i386 -L / /bin/ls
>>> -
>>> --  On non x86 CPUs, you need first to download at least an x86 glibc
>>> -   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
>>> -   ``LD_LIBRARY_PATH`` is not set::
>>> -
>>> -      unset LD_LIBRARY_PATH
>>> -
>>> -   Then you can launch the precompiled ``ls`` x86 executable::
>>> -
>>> -      qemu-i386 tests/i386/ls
>>> -
>>> -   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
>>> -   automatically launched by the Linux kernel when you try to launch x86
>>> -   executables. It requires the ``binfmt_misc`` module in the Linux
>>> -   kernel.
>>> -
>>> --  The x86 version of QEMU is also included. You can try weird things
>>> -   such as::
>>> -
>>> -      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
>>> -                /usr/local/qemu-i386/bin/ls-i386
>>> -
>>> -Wine launch
>>> -~~~~~~~~~~~
>>> -
>>> --  Ensure that you have a working QEMU with the x86 glibc distribution
>>> -   (see previous section). In order to verify it, you must be able to
>>> -   do::
>>> -
>>> -      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
>>> -
>>> --  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
>>> -   on the QEMU web page).
>>> -
>>> --  Configure Wine on your account. Look at the provided script
>>> -   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
>>> -   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
>>> -
>>> --  Then you can try the example ``putty.exe``::
>>> -
>>> -      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
>>> -                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
>>> -
>>>  Command line options
>>>  ~~~~~~~~~~~~~~~~~~~~
>>>
>>> --
>>> 2.20.1


