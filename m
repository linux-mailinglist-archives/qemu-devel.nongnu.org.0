Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A831AE5C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 23:45:31 +0100 (CET)
Received: from localhost ([::1]:42846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3fO-0003YM-62
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 17:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB3di-000368-Vo
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 17:43:47 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:43367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB3dh-00071m-6o
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 17:43:46 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXGak-1lNeqH0vq2-00Ykt5; Sat, 13 Feb 2021 23:43:43 +0100
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201122000131.18487-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cde211fb-7a1f-0ae0-58a3-3a7638acb612@vivier.eu>
Date: Sat, 13 Feb 2021 23:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201122000131.18487-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v9r6Mf3tcALbPPdZcX6/EPwjxnlVPRlxhD3oeltldAFurrFGcFm
 pwQZDBJJWH7g7GntShyI13nOuZwbnpTdi/HRjeaNlT1L9FsN7tmwovR8MsCpEif2kb6Y2CE
 ZnmTYbUoMa8lHtUBYjCiab6EGr0beaWEhsNd1qRAJN+1DRiFhsR0J9739ijnKYbW8fqfTk3
 3xDKe5FYgTMa+/0IxmWtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cv2X47q7mE4=:HAq9yfgfzbaVwWX09YTO56
 Lx2TfwrVGI3U1p9X96O8c5Ut3+goYYrRqFIoYsh2tqDsYIDLaRGNPy4scyFOtqV6VxA4AvYk1
 CyLcKVUmgq/qlTcOHkxmBv13pCwJZPcv1SpCMu0DwGv6gHGusF+cHBJLolvQBXNh+2XJ/ly95
 2h9YW7FBW+o3M3DWKkiIX/T3JMPMfxt4+6CHAxd1EO0awWj62LpRvKerBaVKl5NqWflMQwzH5
 OWwvw29pzH1QKkgK6xGaUi7asIhAYfsCGBnMUqZc6VqVmkPD3XSrZIpxNkg0LHLvtJG0jzUru
 qnqbD8HMr66ylqaOBGt/HwbeIUTsur9chF9R4Kf9hnyo83ifyUgKH/1SKcYybb6Wd3pz/3owD
 umR1LCPB7Pm9YSnvBzbzwjTYKMwVNAXNNCR/iaS9si8pAEbHZ+n+uL3MgtU1UKWqe5cFFdTb5
 yLVoQUPb3w==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 22/11/2020 à 01:01, Peter Maydell a écrit :
> The 'Quick Start' section of the userspace emulator documentation is
> very old and outdated. In particular:
>  - it suggests running x86-on-x86 emulation, which is the least
>    interesting possible use case
>  - it recommends that users download tarballs of guest binaries
>    from the QEMU web page which we no longer provide there
> 
> There's nothing salvageable here; delete it all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm open to suggestions that this is being too drastic;
> the main aim here is to remove references to tar.gz files
> that we haven't provided for years, as noted by
>  https://bugs.launchpad.net/qemu/+bug/1884982
> Ideally the whole of docs/user could use a lot of love...
> 
>  docs/user/main.rst | 61 ----------------------------------------------
>  1 file changed, 61 deletions(-)
> 
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index bd99b0fdbe9..49ccae3ecab 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -45,67 +45,6 @@ emulator.
>  Linux User space emulator
>  -------------------------
>  
> -Quick Start
> -~~~~~~~~~~~
> -
> -In order to launch a Linux process, QEMU needs the process executable
> -itself and all the target (x86) dynamic libraries used by it.
> -
> --  On x86, you can just try to launch any process by using the native
> -   libraries::
> -
> -      qemu-i386 -L / /bin/ls
> -
> -   ``-L /`` tells that the x86 dynamic linker must be searched with a
> -   ``/`` prefix.
> -
> --  Since QEMU is also a linux process, you can launch QEMU with QEMU
> -   (NOTE: you can only do that if you compiled QEMU from the sources)::
> -
> -      qemu-i386 -L / qemu-i386 -L / /bin/ls
> -
> --  On non x86 CPUs, you need first to download at least an x86 glibc
> -   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
> -   ``LD_LIBRARY_PATH`` is not set::
> -
> -      unset LD_LIBRARY_PATH
> -
> -   Then you can launch the precompiled ``ls`` x86 executable::
> -
> -      qemu-i386 tests/i386/ls
> -
> -   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
> -   automatically launched by the Linux kernel when you try to launch x86
> -   executables. It requires the ``binfmt_misc`` module in the Linux
> -   kernel.
> -
> --  The x86 version of QEMU is also included. You can try weird things
> -   such as::
> -
> -      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
> -                /usr/local/qemu-i386/bin/ls-i386
> -
> -Wine launch
> -~~~~~~~~~~~
> -
> --  Ensure that you have a working QEMU with the x86 glibc distribution
> -   (see previous section). In order to verify it, you must be able to
> -   do::
> -
> -      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
> -
> --  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
> -   on the QEMU web page).
> -
> --  Configure Wine on your account. Look at the provided script
> -   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
> -   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
> -
> --  Then you can try the example ``putty.exe``::
> -
> -      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
> -                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
> -
>  Command line options
>  ~~~~~~~~~~~~~~~~~~~~
>  
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


