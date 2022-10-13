Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB665FDEBA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:13:22 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1lp-0004kO-7n
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oj1gj-0008Rx-Ai
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:08:05 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oj1gf-00047L-Ke
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:08:04 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso3034744fac.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jBsDczbsyB++vbfcRD97z/xJ7MHkKxUjODHw7w+7sLc=;
 b=Q4ZiwYEGDGFBF6ZK5zinYFqeqfWe0lOW8oPFzAFdsCf1rvhDLT3JsrxyN9+KfdK/G4
 r1XURzr2zilyCE0Oe+nhvcOOvvhl2nCr6TjN1Mltac5pRtLYu8XxN0DDboO6oNCugwQP
 wxZNttOjQIyS1ENON2XErKCqXVF+JFAs6nq+uSFzs/nHJDmZwlLMUvmpRe373x2tPeF/
 9x+sd6Pb/VmkffX2Wxi5qS4SvL86zCxBZSIKBo1XUsvYD63oW59feRgizFIPl2TbYa3v
 BAsprYb6MhFuVzZUgq0L/Rv6fLbtNboGf53zICC2cqbw+zuN4AZ8WLb7d74f24wlwjBe
 LRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBsDczbsyB++vbfcRD97z/xJ7MHkKxUjODHw7w+7sLc=;
 b=lpXM1VyVEJVA/ZO31Hnzua1U9QCLWTxnQEHOFwZtGX5qdPpNHDk18d9zoBcB9mv29P
 aotNuU5+XVre1k80pigOznYJEigA0Dc0aVB0U2qMALlWWHPlYWi9S2+XAFGRdTy6uiCO
 Oz7SAivKC6FrXQhK2n7mBdseCSz70xzu+i4aRpcNWBgHVZHlpx2tGSJbJY4gi4acmQQI
 fPnbsrv033nuH08MkAuY87ASqneii6yfBzcTQ7Uxza5SCR2KbPgpdMOm22/gqkklDuzP
 PtpLoN5gaiXnE5+yoRv1f42QIVnRw3sVSvafmZEFwI7TQ2R1HbL1AxUkJ/S9Wp3/OW4+
 w0GQ==
X-Gm-Message-State: ACrzQf3+cgDR+Bve2HiFgCdcAhq0WeUZy23DAam7RNtfkgXrJtlh0UBR
 sJhVBiA9VieJ4zOk7GNEes0=
X-Google-Smtp-Source: AMsMyM70aoDRwQiaITMEB/7IfIkCw7N9g47TPbP2m2jMuAy1l/u+EZJfLw+xxmgG9p2Or9eiIkq0yA==
X-Received: by 2002:a05:6870:6488:b0:131:a45b:a8ca with SMTP id
 cz8-20020a056870648800b00131a45ba8camr406638oab.260.1665680878659; 
 Thu, 13 Oct 2022 10:07:58 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a056870899100b00132784a3a1fsm187079oaq.46.2022.10.13.10.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 10:07:58 -0700 (PDT)
Message-ID: <130dfd88-c6f5-6eee-4ace-510c6373ac6f@gmail.com>
Date: Thu, 13 Oct 2022 14:07:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <43330b01-01bb-e6db-1fb8-e737e1f92759@gmail.com> <87czaxqlvd.fsf@linaro.org>
 <469324d0-64d2-e794-8a9c-53afb7ec795f@gmail.com> <87fsfrpw9u.fsf@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87fsfrpw9u.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/13/22 12:39, Alex Bennée wrote:
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 10/12/22 09:13, Alex Bennée wrote:
>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>
>>>> On 10/12/22 03:46, Paolo Bonzini wrote:
>>>>> Il mar 11 ott 2022, 21:29 Alex Bennée <alex.bennee@linaro.org
>>>>> <mailto:alex.bennee@linaro.org>> ha scritto:
>>>>>       This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
>>>>>       Unconditionally building all the bios for all arches was a
>>>>> little too
>>>>>       far too fast.
>>>>> I would like to understand the issue better, because chances are
>>>>> that it is preexisting and applies to the TCG tests as well.
>>>>> Daniel, does building the TCG tests work for you? If not, I think we
>>>>> should just disable containers by default.
>>>>
>>>>
>>>> 'make check-tcg' never worked in this particular Xeon host I use. I never
>>>> had the curiosity to find out why because I have access to a Power9 host
>>>> that runs 'make check-tcg'.
>>>>
>>>> Using this revert patch on top of master in this Xeon box makes 'make -j'
>>>> successful and 'make check-tcg' fails with the following error:
> 
> What are you running on the Xeon machine? I think it indicates you have
> podman but it can't do rootless builds (which I think is the whole point
> of podman). I can try an replicate your setup and make the docker.py
> probe a bit more robust.

Basic machine info:

$ lscpu | grep 'Model name'
Model name:                      Intel(R) Xeon(R) CPU E5-2650 v4 @ 2.20GHz
$ uname -a
Linux kal1 5.14.0-70.13.1.el9_0.x86_64 #1 SMP PREEMPT Thu Apr 14 12:42:38 EDT 2022 x86_64 x86_64 x86_64 GNU/Linux
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 9.0 (Plow)
$ rpm -qi podman
Name        : podman
Epoch       : 2
Version     : 4.0.2
Release     : 6.el9_0
Architecture: x86_64
Install Date: Mon 18 Apr 2022 11:34:24 PM EDT
Group       : Unspecified
Size        : 53912909
License     : ASL 2.0 and GPLv3+
(...)

I suppose the ./configure output might be useful as well:

==========================

$ ../configure --target-list=ppc64-softmmu,ppc64-linux-user,ppc-softmmu,ppc-linux-user,ppc64le-linux-user \
	--prefix=/home/danielhb/qemu/install
The Meson build system
Version: 0.61.5
Source dir: /home/danielhb/qemu
Build dir: /home/danielhb/qemu/build
Build type: native build
Project name: qemu
Project version: 7.1.50
C compiler for the host machine: cc -m64 -mcx16 (gcc 11.2.1 "cc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)")
C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.35.2-17
Host machine cpu family: x86_64
Host machine cpu: x86_64
Program scripts/symlink-install-tree.py found: YES (/usr/bin/python3 /home/danielhb/qemu/scripts/symlink-install-tree.py)
Program sh found: YES (/usr/bin/sh)
Program python3 found: YES (/usr/bin/python3)
Program iasl found: NO
Compiler for C supports link arguments -Wl,-z,relro: YES
Compiler for C supports link arguments -Wl,-z,now: YES
C++ compiler for the host machine: c++ -m64 -mcx16 (gcc 11.2.1 "c++ (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)")
C++ linker for the host machine: c++ -m64 -mcx16 ld.bfd 2.35.2-17
Compiler for C++ supports link arguments -Wl,--warn-common: YES
Program cgcc found: NO
Library m found: YES
Run-time dependency threads found: YES
Library util found: YES
Run-time dependency appleframeworks found: NO (tried framework)
Found pkg-config: /usr/bin/pkg-config (1.7.3)
Run-time dependency gio-2.0 found: YES 2.68.4
Program /usr/bin/gdbus-codegen found: YES (/usr/bin/gdbus-codegen)
Run-time dependency gio-unix-2.0 found: YES 2.68.4
Run-time dependency pixman-1 found: YES 0.40.0
Run-time dependency zlib found: YES 1.2.11
Has header "libaio.h" : NO
Run-time dependency liburing found: NO (tried pkgconfig)
Run-time dependency libnfs found: NO (tried pkgconfig)
Run-time dependency appleframeworks found: NO (tried framework)
Run-time dependency appleframeworks found: NO (tried framework)
Run-time dependency libseccomp found: NO (tried pkgconfig)
Has header "cap-ng.h" : NO
Run-time dependency xkbcommon found: NO (tried pkgconfig)
Run-time dependency slirp found: YES 4.4.0
Has header "libvdeplug.h" : NO
Run-time dependency libpulse found: NO (tried pkgconfig)
Run-time dependency alsa found: NO (tried pkgconfig)
Run-time dependency jack found: NO (tried pkgconfig)
Run-time dependency sndio found: NO (tried pkgconfig)
Run-time dependency spice-protocol found: NO (tried pkgconfig)
Run-time dependency spice-server found: NO (tried pkgconfig)
Library rt found: YES
Run-time dependency libiscsi found: NO (tried pkgconfig)
Run-time dependency libzstd found: YES 1.5.1
Run-time dependency virglrenderer found: NO (tried pkgconfig)
Run-time dependency libcurl found: NO (tried pkgconfig)
Run-time dependency libudev found: NO (tried pkgconfig)
Library mpathpersist found: NO
Run-time dependency ncursesw found: YES 6.2.20210508
Has header "brlapi.h" : NO
sdl2-config found: NO
Run-time dependency sdl2 found: NO (tried pkgconfig and config-tool)
Library rados found: NO
Has header "rbd/librbd.h" : NO
Run-time dependency glusterfs-api found: NO (tried pkgconfig)
Run-time dependency libssh found: NO (tried pkgconfig)
Has header "bzlib.h" : NO
Has header "lzfse.h" : NO
Has header "sys/soundcard.h" : YES
Run-time dependency epoxy found: NO (tried pkgconfig)
Has header "epoxy/egl.h" with dependency epoxy: NO
Run-time dependency gnutls found: NO (tried pkgconfig)
Run-time dependency gnutls found: NO (tried pkgconfig)
libgcrypt-config found: NO need ['>=1.8']
Run-time dependency libgcrypt found: NO (tried config-tool)
Run-time dependency nettle found: NO (tried pkgconfig)
Run-time dependency gmp found: NO (tried pkgconfig)
Run-time dependency gtk+-3.0 found: NO (tried pkgconfig)
Run-time dependency libpng found: NO (tried pkgconfig)
Run-time dependency libjpeg found: NO (tried pkgconfig)
Has header "sasl/sasl.h" : NO
Has header "security/pam_appl.h" : NO
Has header "snappy-c.h" : NO
Has header "lzo/lzo1x.h" : NO
Has header "numa.h" : NO
Library ibumad found: NO
Has header "rdma/rdma_cma.h" : NO
Library ibverbs found: NO
Run-time dependency xencontrol found: NO (tried pkgconfig)
Library xenstore found: NO
Library xenctrl found: NO
Library xendevicemodel found: NO
Library xenforeignmemory found: NO
Library xengnttab found: NO
Library xenevtchn found: NO
Library xentoolcore found: NO
Run-time dependency libcacard found: NO (tried pkgconfig)
Run-time dependency u2f-emu found: NO (tried pkgconfig)
Run-time dependency canokey-qemu found: NO (tried pkgconfig)
Run-time dependency libusbredirparser-0.5 found: NO (tried pkgconfig)
Run-time dependency libusb-1.0 found: NO (tried pkgconfig)
Run-time dependency libpmem found: NO (tried pkgconfig)
Run-time dependency libdaxctl found: NO (tried pkgconfig)
Run-time dependency libkeyutils found: YES 1.6.1
Checking for function "gettid" : YES
Run-time dependency libselinux found: YES 3.3
Run-time dependency fuse3 found: NO (tried pkgconfig)
Run-time dependency libbpf found: NO (tried pkgconfig)
Checking for function "io_uring_register_ring_fd" with dependency : NO
Has header "sys/epoll.h" : YES
Has header "linux/magic.h" : YES
Has header "valgrind/valgrind.h" : YES
Has header "linux/btrfs.h" : YES
Has header "libdrm/drm.h" : NO
Has header "pty.h" : YES
Has header "sys/disk.h" : NO
Has header "sys/ioccom.h" : NO
Has header "sys/kcov.h" : NO
Checking for function "accept4" : YES
Checking for function "clock_adjtime" : YES
Checking for function "dup3" : YES
Checking for function "fallocate" : YES
Checking for function "posix_fallocate" : YES
Checking for function "posix_memalign" : YES
Checking for function "_aligned_malloc" : NO
Checking for function "valloc" : YES
Checking for function "memalign" : YES
Checking for function "ppoll" : YES
Checking for function "preadv" : YES
Checking for function "pthread_fchdir_np" : NO
Checking for function "sendfile" : YES
Checking for function "setns" : YES
Checking for function "unshare" : YES
Checking for function "syncfs" : YES
Checking for function "sync_file_range" : YES
Checking for function "timerfd_create" : YES
Checking for function "copy_file_range" : YES
Checking for function "getifaddrs" : YES
Checking for function "openpty" with dependency -lutil: YES
Checking for function "strchrnul" : YES
Checking for function "system" : YES
Header <byteswap.h> has symbol "bswap_32" : YES
Header <sys/epoll.h> has symbol "epoll_create1" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_KEEP_SIZE" : YES
Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : YES
Has header "linux/fiemap.h" : YES
Header <linux/fs.h> has symbol "FS_IOC_FIEMAP" : YES
Checking for function "getrandom" : YES
Header <sys/random.h> has symbol "GRND_NONBLOCK" : YES
Header <sys/inotify.h> has symbol "inotify_init" : YES
Header <sys/inotify.h> has symbol "inotify_init1" : YES
Header <machine/bswap.h> has symbol "bswap32" : NO
Header <sys/prctl.h> has symbol "PR_SET_TIMERSLACK" : YES
Header <linux/rtnetlink.h> has symbol "IFLA_PROTO_DOWN" : YES
Header <sys/sysmacros.h> has symbol "makedev" : YES
Header <getopt.h> has symbol "optreset" : NO
Header <netinet/in.h> has symbol "IPPROTO_MPTCP" : YES
Header <sys/mount.h> has symbol "FSCONFIG_SET_FLAG" : NO
Checking whether type "struct sigevent" has member "sigev_notify_thread_id" : NO
Checking whether type "struct stat" has member "st_atim" : YES
Checking for type "struct iovec" : YES
Checking for type "struct utmpx" : YES
Checking for type "struct mmsghdr" : YES
Header <linux/vm_sockets.h> has symbol "AF_VSOCK" : YES
Program scripts/minikconf.py found: YES (/usr/bin/python3 /home/danielhb/qemu/scripts/minikconf.py)
Configuring ppc64-softmmu-config-target.h using configuration
Configuring ppc64-softmmu-config-devices.mak with command
Reading depfile: /home/danielhb/qemu/build/meson-private/ppc64-softmmu-config-devices.mak.d
Configuring ppc64-softmmu-config-devices.h using configuration
Configuring ppc64-linux-user-config-target.h using configuration
Configuring ppc-softmmu-config-target.h using configuration
Configuring ppc-softmmu-config-devices.mak with command
Reading depfile: /home/danielhb/qemu/build/meson-private/ppc-softmmu-config-devices.mak.d
Configuring ppc-softmmu-config-devices.h using configuration
Configuring ppc-linux-user-config-target.h using configuration
Configuring ppc64le-linux-user-config-target.h using configuration
Program scripts/make-config-poison.sh found: YES (/home/danielhb/qemu/scripts/make-config-poison.sh)
Run-time dependency capstone found: NO (tried pkgconfig)
Library fdt found: NO
Configuring config-host.h using configuration
Program scripts/hxtool found: YES (/home/danielhb/qemu/scripts/hxtool)
Program scripts/shaderinclude.pl found: YES (/usr/bin/env perl /home/danielhb/qemu/scripts/shaderinclude.pl)
Program scripts/qapi-gen.py found: YES (/usr/bin/python3 /home/danielhb/qemu/scripts/qapi-gen.py)
Program scripts/qemu-version.sh found: YES (/home/danielhb/qemu/scripts/qemu-version.sh)

Executing subproject libvhost-user

libvhost-user| Project name: libvhost-user
libvhost-user| Project version: undefined
libvhost-user| C compiler for the host machine: cc -m64 -mcx16 (gcc 11.2.1 "cc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)")
libvhost-user| C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.35.2-17
libvhost-user| Dependency threads found: YES unknown (cached)
libvhost-user| Dependency glib-2.0 found: YES 2.68.4 (overridden)
libvhost-user| Build targets in project: 10
libvhost-user| Subproject libvhost-user finished.


Executing subproject libvduse

libvduse| Project name: libvduse
libvduse| Project version: undefined
libvduse| C compiler for the host machine: cc -m64 -mcx16 (gcc 11.2.1 "cc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)")
libvduse| C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.35.2-17
libvduse| Build targets in project: 11
libvduse| Subproject libvduse finished.

Program scripts/decodetree.py found: YES (/usr/bin/python3 /home/danielhb/qemu/scripts/decodetree.py)
Program ../scripts/modules/module_block.py found: YES (/usr/bin/python3 /home/danielhb/qemu/block/../scripts/modules/module_block.py)
Program ../scripts/block-coroutine-wrapper.py found: YES (/usr/bin/python3 /home/danielhb/qemu/block/../scripts/block-coroutine-wrapper.py)
Program scripts/modinfo-collect.py found: YES (/home/danielhb/qemu/scripts/modinfo-collect.py)
Program scripts/modinfo-generate.py found: YES (/home/danielhb/qemu/scripts/modinfo-generate.py)
Program nm found: YES
Program scripts/undefsym.py found: YES (/usr/bin/python3 /home/danielhb/qemu/scripts/undefsym.py)
Program scripts/feature_to_c.sh found: YES (/bin/sh /home/danielhb/qemu/scripts/feature_to_c.sh)
Program qemu-keymap found: YES (/usr/bin/qemu-keymap)
Program sphinx-build-3 sphinx-build found: NO
Program bash found: YES 5.1.8 (/usr/bin/bash)
Program diff found: YES (/usr/bin/diff)
Program dbus-daemon found: YES (/usr/bin/dbus-daemon)
Program initrd-stress.sh found: YES (/home/danielhb/qemu/tests/migration/initrd-stress.sh)
Build targets in project: 520

qemu 7.1.50

   Directories
     Install prefix               : /home/danielhb/qemu/install
     BIOS directory               : share/qemu
     firmware path                : share/qemu-firmware
     binary directory             : /home/danielhb/qemu/install/bin
     library directory            : /home/danielhb/qemu/install/lib64
     module directory             : lib64/qemu
     libexec directory            : /home/danielhb/qemu/install/libexec
     include directory            : /home/danielhb/qemu/install/include
     config directory             : /home/danielhb/qemu/install/etc
     local state directory        : /home/danielhb/qemu/install/var
     Manual directory             : /home/danielhb/qemu/install/share/man
     Doc directory                : /home/danielhb/qemu/install/share/doc
     Build directory              : /home/danielhb/qemu/build
     Source path                  : /home/danielhb/qemu
     GIT submodules               : ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc

   Host binaries
     git                          : git
     make                         : make
     python                       : /usr/bin/python3 (version: 3.9)
     sphinx-build                 : NO
     gdb                          : /usr/bin/gdb
     iasl                         : NO
     genisoimage                  : /usr/bin/genisoimage
     smbd                         : /usr/sbin/smbd

   Configurable features
     Documentation                : NO
     system-mode emulation        : YES
     user-mode emulation          : YES
     block layer                  : YES
     Install blobs                : YES
     module support               : NO
     fuzzing support              : NO
     Audio drivers                : oss
     Trace backends               : log
     D-Bus display                : NO
     QOM debugging                : NO
     vhost-kernel support         : YES
     vhost-net support            : YES
     vhost-user support           : YES
     vhost-user-crypto support    : YES
     vhost-user-blk server support: YES
     vhost-vdpa support           : YES
     build guest agent            : YES

   Compilation
     host CPU                     : x86_64
     host endianness              : little
     C compiler                   : cc -m64 -mcx16
     Host C compiler              : cc -m64 -mcx16
     C++ compiler                 : c++ -m64 -mcx16
     CFLAGS                       : -O2 -g
     CXXFLAGS                     : -O2 -g
     QEMU_CFLAGS                  : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
     QEMU_CXXFLAGS                : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wundef -Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
     QEMU_OBJCFLAGS               : -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -Wno-psabi -Wno-gnu-variable-sized-type-not-at-end
     QEMU_LDFLAGS                 : -fstack-protector-strong -Wl,-z,relro -Wl,-z,now -Wl,--warn-common
     profiler                     : NO
     link-time optimization (LTO) : NO
     PIE                          : YES
     static build                 : NO
     malloc trim support          : YES
     membarrier                   : NO
     debug stack usage            : NO
     mutex debugging              : NO
     memory allocator             : system
     avx2 optimization            : YES
     avx512f optimization         : NO
     gprof enabled                : NO
     gcov                         : NO
     thread sanitizer             : NO
     CFI support                  : NO
     strip binaries               : NO
     sparse                       : NO
     mingw32 support              : NO

   Cross compilers
     ppc64                        : /usr/bin/python3 -B /home/danielhb/qemu/tests/docker/docker.py --engine podman cc --cc powerpc64-linux-gnu-gcc-10 -i qemu/debian-powerpc-test-cross -s /home/danielhb/qemu --
     ppc                          : /usr/bin/python3 -B /home/danielhb/qemu/tests/docker/docker.py --engine podman cc --cc powerpc-linux-gnu-gcc-10 -i qemu/debian-powerpc-test-cross -s /home/danielhb/qemu --
     ppc64le                      : /usr/bin/python3 -B /home/danielhb/qemu/tests/docker/docker.py --engine podman cc --cc powerpc64le-linux-gnu-gcc-10 -i qemu/debian-powerpc-test-cross -s /home/danielhb/qemu --

   Targets and accelerators
     KVM support                  : NO
Cleaning... 0 files.
     HAX support                  : NO
     HVF support                  : NO
     WHPX support                 : NO
     NVMM support                 : NO
     Xen support                  : NO
     TCG support                  : YES
     TCG backend                  : native (x86_64)
     TCG plugins                  : YES
     TCG debug enabled            : NO
     target list                  : ppc64-softmmu ppc64-linux-user ppc-softmmu ppc-linux-user ppc64le-linux-user
     default devices              : YES
     out of process emulation     : YES
     vfio-user server             : NO

   Block layer support
     coroutine backend            : ucontext
     coroutine pool               : YES
     Block whitelist (rw)         :
     Block whitelist (ro)         :
     Use block whitelist in tools : NO
     VirtFS support               : NO
     build virtiofs daemon        : NO
     Live block migration         : YES
     replication support          : YES
     bochs support                : YES
     cloop support                : YES
     dmg support                  : YES
     qcow v1 support              : YES
     vdi support                  : YES
     vvfat support                : YES
     qed support                  : YES
     parallels support            : YES
     FUSE exports                 : NO
     VDUSE block exports          : YES

   Crypto
     TLS priority                 : NORMAL
     GNUTLS support               : NO
     libgcrypt                    : NO
     nettle                       : NO
     AF_ALG support               : NO
     rng-none                     : NO
     Linux keyring                : YES

   Dependencies
     SDL support                  : NO
     SDL image support            : NO
     GTK support                  : NO
     pixman                       : YES 0.40.0
     VTE support                  : NO
     slirp support                : YES 4.4.0
     libtasn1                     : NO
     PAM                          : NO
     iconv support                : YES
     curses support               : YES
     virgl support                : NO
     curl support                 : NO
     Multipath support            : NO
     PNG support                  : NO
     VNC support                  : YES
     VNC SASL support             : NO
     VNC JPEG support             : NO
     OSS support                  : YES
     sndio support                : NO
     ALSA support                 : NO
     PulseAudio support           : NO
     JACK support                 : NO
     brlapi support               : NO
     vde support                  : NO
     netmap support               : NO
     l2tpv3 support               : YES
     Linux AIO support            : NO
     Linux io_uring support       : NO
     ATTR/XATTR support           : YES
     RDMA support                 : NO
     PVRDMA support               : NO
     fdt support                  : internal
     libcap-ng support            : NO
     bpf support                  : NO
     spice protocol support       : NO
     rbd support                  : NO
     smartcard support            : NO
     U2F support                  : NO
     libusb                       : NO
     usb net redir                : NO
     OpenGL support (epoxy)       : NO
     GBM                          : NO
     libiscsi support             : NO
     libnfs support               : NO
     seccomp support              : NO
     GlusterFS support            : NO
     TPM support                  : YES
     libssh support               : NO
     lzo support                  : NO
     snappy support               : NO
     bzip2 support                : NO
     lzfse support                : NO
     zstd support                 : YES 1.5.1
     NUMA host support            : NO
     capstone                     : NO
     libpmem support              : NO
     libdaxctl support            : NO
     libudev                      : NO
     FUSE lseek                   : NO
     selinux                      : YES 3.3

   Subprojects
     libvduse                     : YES
     libvhost-user                : YES

   User defined options
     Native files                 : config-meson.cross
     prefix                       : /home/danielhb/qemu/install
     werror                       : true
     vfio_user_server             : disabled

Found ninja-1.10.2 at /usr/bin/ninja
Running postconf script '/usr/bin/python3 /home/danielhb/qemu/scripts/symlink-install-tree.py'

==========================


Let me know if you need more info about the host.


Daniel




> 
>>>>
>>>>
>>>> $ make -j
>>>>     GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
>>>> [1/24] Generating qemu-version.h with a custom command (wrapped by meson to capture output)
>>>>
>>>> $ make check-tcg
>>>>     GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
>>>>     BUILD   debian-powerpc-test-cross
>>>>     BUILD   ppc64-linux-user guest-tests
>>>> Traceback (most recent call last):
>>>>     File "/home/danielhb/qemu/tests/docker/docker.py", line 683, in <module>
>>>>       sys.exit(main())
>>>>     File "/home/danielhb/qemu/tests/docker/docker.py", line 679, in main
>>>>       return args.cmdobj.run(args, argv)
>>>>     File "/home/danielhb/qemu/tests/docker/docker.py", line 657, in run
>>>>       return Docker().run(cmd, False, quiet=args.quiet,
>>>>     File "/home/danielhb/qemu/tests/docker/docker.py", line 370, in run
>>>>       ret = self._do_check(["run", "--rm", "--label",
>>>>     File "/home/danielhb/qemu/tests/docker/docker.py", line 247, in _do_check
>>>>       return subprocess.check_call(self._command + cmd, **kwargs)
>>>>     File "/usr/lib64/python3.9/subprocess.py", line 373, in check_call
>>>>       raise CalledProcessError(retcode, cmd)
>>>> subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label', 'com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f', '--userns=keep-id', '-u', '1005', '-w', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user', '-v', '/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:/home/danielhb/qemu/build/tests/tcg/ppc64-linux-user:rw', '-v', '/home/danielhb/qemu:/home/danielhb/qemu:ro,z', 'qemu/debian-powerpc-test-cross', 'powerpc64-linux-gnu-gcc-10', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-aliasing', '-m64', '-mbig-endian', '/home/danielhb/qemu/tests/tcg/multiarch/float_convd.c', '/home/danielhb/qemu/tests/tcg/multiarch/libs/float_helpers.c', '-o', 'float_convd', '-static', '-lm']' returned non-zero exit status 127.
>>>> filter=--filter=label=com.qemu.instance.uuid=cf15761c98884d0a9b4e37f631ba593f
>>>> make[1]: *** [/home/danielhb/qemu/tests/tcg/multiarch/Makefile.target:26: float_convd] Error 1
>>>> make: *** [/home/danielhb/qemu/tests/Makefile.include:50: build-tcg-tests-ppc64-linux-user] Error 2
>>>>
>>>>
>>>> This is very similar to the error message I get when running 'make -j' on mainline
>>>> without this revert.
>>>>
>>>> So yeah, I guess we can say this is a preexisting condition that I always saw with
>>>> 'make check-tcg' in this particular host, and 730fe750fba just made it manifest when
>>>> running a plain 'make'.
>>>>
>>>>
>>>> Thanks,
>>>>
>>>>
>>>> Daniel
>>>>
>>>>
>>>>>       Signed-off-by: Alex Bennée <alex.bennee@linaro.org
>>>>> <mailto:alex.bennee@linaro.org>>
>>>>>       Cc: Paolo Bonzini <pbonzini@redhat.com <mailto:pbonzini@redhat.com>>
>>>>>       Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>>>>>       Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com <mailto:danielhb413@gmail.com>>
>>>>>       Message-Id: <20221011113417.794841-4-alex.bennee@linaro.org <mailto:20221011113417.794841-4-alex.bennee@linaro.org>>
>>>>>       diff --git a/configure b/configure
>>>>>       index baa69189f0..45ee6f4eb3 100755
>>>>>       --- a/configure
>>>>>       +++ b/configure
>>>>>       @@ -2121,7 +2121,7 @@ probe_target_compiler() {
>>>>>             target_ranlib=
>>>>>             target_strip=
>>>>>           fi
>>>>>       -  test -n "$target_cc" || test -n "$container_image"
>>>>>       +  test -n "$target_cc"
>>>>>         }
>>>>>         write_target_makefile() {
>>>>>       @@ -2268,7 +2268,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
>>>>>             config_mak=pc-bios/optionrom/config.mak
>>>>>             echo "# Automatically generated by configure - do not modify" > $config_mak
>>>>>             echo "TOPSRC_DIR=$source_path" >> $config_mak
>>>>>       -    write_target_makefile pc-bios/optionrom/all >> $config_mak
>>>>>       +    write_target_makefile >> $config_mak
>>>>>         fi
>>>>>         if test "$softmmu" = yes && probe_target_compiler ppc-softmmu;
>>>>> then
>>>>>       @@ -2276,31 +2276,25 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>>>>>             config_mak=pc-bios/vof/config.mak
>>>>>             echo "# Automatically generated by configure - do not modify" > $config_mak
>>>>>             echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
>>>>>       -    write_target_makefile pc-bios/vof/all >> $config_mak
>>>>>       +    write_target_makefile >> $config_mak
>>>>>         fi
>>>>>         # Only build s390-ccw bios if the compiler has -march=z900 or
>>>>> -march=z10
>>>>>         # (which is the lowest architecture level that Clang supports)
>>>>>         if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
>>>>>       -  got_cross_cc=no
>>>>>       -  if test -n "$target_cc"; then
>>>>>       -    write_c_skeleton
>>>>>       -    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>>>>>       -    has_z900=$?
>>>>>       -    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>>>       -      if [ $has_z900 != 0 ]; then
>>>>>       -        echo "WARNING: Your compiler does not support the z900!"
>>>>>       -        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>>>>>       -      fi
>>>>>       -      got_cross_cc=yes
>>>>>       +  write_c_skeleton
>>>>>       +  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
>>>>>       +  has_z900=$?
>>>>>       +  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
>>>>>       +    if [ $has_z900 != 0 ]; then
>>>>>       +      echo "WARNING: Your compiler does not support the z900!"
>>>>>       +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>>>>>             fi
>>>>>       -  fi
>>>>>       -  if test "$got_cross_cc" = yes || test -n "$container_image"; then
>>>>>             roms="$roms pc-bios/s390-ccw"
>>>>>             config_mak=pc-bios/s390-ccw/config-host.mak
>>>>>             echo "# Automatically generated by configure - do not modify" > $config_mak
>>>>>             echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
>>>>>       -    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>>>>>       +    write_target_makefile >> $config_mak
>>>>>             # SLOF is required for building the s390-ccw firmware on s390x,
>>>>>             # since it is using the libnet code from SLOF for network booting.
>>>>>             git_submodules="${git_submodules} roms/SLOF"
>>>>>       @@ -2488,7 +2482,7 @@ for target in $target_list; do
>>>>>               ;;
>>>>>           esac
>>>>>       -  if probe_target_compiler $target; then
>>>>>       +  if probe_target_compiler $target || test -n "$container_image"; then
>>>>>               test -n "$container_image" && build_static=y
>>>>>               mkdir -p "tests/tcg/$target"
>>>>>               config_target_mak=tests/tcg/$target/config-target.mak
>>>>>       --     2.34.1
>>>>>
>>> Can you check what ENGINE is in your config-host.mak? If no
>>> container
>>> engine is defined we should be gating against running docker.
>>
>> Yeah. Running the case I mentioned above (revert is applied, 'make check-tcg'
>> fails):
>>
>> [danielhb@kal1 build]$ grep ENGINE config-host.mak
>> ENGINE=podman
>>
>>
>> And with current master where 'make' is failing:
>>
>> [danielhb@kal1 build]$ grep ENGINE config-host.mak
>> ENGINE=podman
>>
>>
>> podman version:
>>
>> $ podman --version
>> podman version 4.0.2
>>
>>
>>
>> Daniel
>>
>>>
> 
> 

