Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472848887D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:34:57 +0100 (CET)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UbI-0006Z5-4C
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTW-0004Si-I7
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:54 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55558
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTO-0006JW-Bg
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:54 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 41CD5600FB;
 Sun,  9 Jan 2022 17:26:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720400; bh=/XYB35IGuAuURwG4xiM+rzVu5V32mIIPcZ+2U2Ok4jE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=jWs2Hl1SCNzoYfBCpDAECeelu/FglmXnzH81by5dFj1YuIJ4WLBFif/KkDU5HNCtJ
 8WWKGhqeLWbgkLe2siA8KYGry5HKNMDAXdeS6dBOefSFUZU4SDW8M8NAWXK9qpWAMl
 MZmAMjvod5KxRfIzeOyjOwHdVYsDrO8gu6YI5Uxk=
Message-ID: <ffa6ec4c-1eb1-00bd-71c9-52e71a46c16a@xen0n.name>
Date: Sun, 9 Jan 2022 17:24:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 01/26] target/loongarch: Add README
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-2-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> This patch gives an introduction to the LoongArch target.
>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   MAINTAINERS             |  5 +++
>   target/loongarch/README | 77 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 82 insertions(+)
>   create mode 100644 target/loongarch/README
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..2df0d4a7c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -213,6 +213,11 @@ S: Maintained
>   F: target/hppa/
>   F: disas/hppa.c
>   
> +LoongArch TCG CPUS
"TCG CPUs" -- notice the case for the plural "s".
> +M: Song Gao<gaosong@loongson.cn>
> +S: Maintained
> +F: target/loongarch/
> +
>   M68K TCG CPUs
>   M: Laurent Vivier<laurent@vivier.eu>
>   S: Maintained
> diff --git a/target/loongarch/README b/target/loongarch/README
> new file mode 100644
> index 0000000000..d5780c5918
> --- /dev/null
> +++ b/target/loongarch/README
> @@ -0,0 +1,77 @@
> +- Introduction
> +
> +  LoongArch is the general processor architecture of Loongson.
> +
> +  The following versions of the LoongArch core are supported
> +    core: 3A5000
> +https://github.com/loongson/LoongArch-Documentation/releases/download/2021.08.17/LoongArch-Vol1-v1.00-EN.pdf
> +
> +  We can get the latest loongarch documents athttps://github.com/loongson/LoongArch-Documentation/tags.
> +
> +
> +- Linux-user emulation
> +
> +  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
> +  and We can also use qemu-loongarch64 to run LoongArch executables.
> +
> +  1. Install LoongArch cross-tools on X86 machines.
> +
> +    Download cross-tools.
> +
> +      wgethttps://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
> +
> +      tar -vxf loongarch64-clfs-20211202-cross-tools.tar.xz -C /opt
> +
> +    Config cross-tools env.
> +
> +      . setenv.sh
> +
> +      setenv.sh:
> +
> +          #!/bin/sh
> +          set -x
> +          CC_PREFIX=/opt/cross-tools
> +
> +          export PATH=$CC_PREFIX/bin:$PATH
> +          export LD_LIBRARY_PATH=$CC_PREFIX/lib:$LD_LIBRARY_PATH
> +          export LD_LIBRARY_PATH=$CC_PREFIX/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
> +          set +x
> +
> +  2. Test tests/tcg/multiarch.
> +
> +    ./configure --disable-rdma --disable-pvrdma --prefix=/usr  \
> +            --target-list="loongarch64-linux-user"  \
> +            --disable-libiscsi --disable-libnfs --disable-libpmem \
> +            --disable-glusterfs --enable-libusb --enable-usb-redir \
> +            --disable-opengl --disable-xen --enable-spice --disable-werror \
> +            --enable-debug --disable-capstone --disable-kvm --enable-profiler
> +
> +    cd  build/
> +
> +    make && make check-tcg
> +
> +  3. Run LoongArch system basic command with loongarch-clfs-system.
> +
> +    Download clfs-system.
> +
> +      wgethttps://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-system-2021-12-02.tar.bz2
> +
> +      tar -vxf loongarch64-clfs-system-2021-12-02.tar.bz2 -C /opt/clfs
> +      ln -s /opt/clfs/  /opt/clfs/tls
Command with dubious intention -- are you working around some kind of 
LIBPATH priority problem? TLS shouldn't be involved at this level, yet I 
remotely remember that library search paths similar to "/usr/lib/tls" 
were a thing long ago...
> +
> +    Config env.
> +
> +      cp /opt/clfs/lib64/ld-linux-loongarch64.so.1   /lib64
> +
> +      export LD_LIBRARY_PATH="/opt/clfs/lib64"
> +
> +    Run LoongArch system basic command.
> +
> +      ./qemu-loongarch64  /opt/clfs/usr/bin/bash
> +      ./qemu-loongarch64  /opt/clfs/usr/bin/ls
> +      ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
> +      ...
> +
> +
> +- Note.
> +  We can get the latest LoongArch documents or LoongArch tools athttps://github.com/loongson/
I'm afraid this README would require some re-writing due to the amount 
of Chinglish involved, but that's possibly okay after merging. (I don't 
have the time to rewrite this for you currently, so just a mild rant for 
now.)

