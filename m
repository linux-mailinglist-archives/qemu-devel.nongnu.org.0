Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F07D476153
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:08:21 +0100 (CET)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZdT-0004HX-B2
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:08:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxYB5-0007SB-4d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:34:55 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:34895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxYB2-000750-IP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:34:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CDB20D2284BE;
 Wed, 15 Dec 2021 18:34:49 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 18:34:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c4c477ac-5fe4-404b-9aa3-971b0a8b8143,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
Message-ID: <e8c653bb-af8a-0f2e-2eb8-9239fc9cffcc@kaod.org>
Date: Wed, 15 Dec 2021 18:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>, Laurent Vivier
 <laurent@vivier.eu>
References: <20211215084958.185214-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211215084958.185214-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ab014838-51fc-400a-9872-fac4e41829f6
X-Ovh-Tracer-Id: 2826290245155916591
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 09:49, Thomas Huth wrote:
> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
> 
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   .gitlab-ci.d/buildtest.yml                    | 27 -----------------
>   configs/targets/ppc64abi32-linux-user.mak     |  8 -----
>   configure                                     | 29 +------------------
>   docs/about/deprecated.rst                     |  7 -----
>   docs/about/removed-features.rst               |  8 +++++
>   docs/user/main.rst                            |  1 -
>   linux-user/elfload.c                          |  4 +--
>   linux-user/ppc/signal.c                       | 11 ++-----
>   linux-user/ppc/target_syscall.h               |  4 +--
>   linux-user/syscall_defs.h                     |  6 ++--
>   .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
>   tests/tcg/configure.sh                        |  2 +-
>   12 files changed, 21 insertions(+), 88 deletions(-)
>   delete mode 100644 configs/targets/ppc64abi32-linux-user.mak
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 7e1cb0b3c2..d52fde23ec 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -473,33 +473,6 @@ tsan-build:
>       TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
>       MAKE_CHECK_ARGS: bench V=1
>   
> -# These targets are on the way out
> -build-deprecated:
> -  extends: .native_build_job_template
> -  needs:
> -    job: amd64-debian-user-cross-container
> -  variables:
> -    IMAGE: debian-all-test-cross
> -    CONFIGURE_ARGS: --disable-tools
> -    MAKE_CHECK_ARGS: build-tcg
> -    TARGETS: ppc64abi32-linux-user
> -  artifacts:
> -    expire_in: 2 days
> -    paths:
> -      - build
> -
> -# We split the check-tcg step as test failures are expected but we still
> -# want to catch the build breaking.
> -check-deprecated:
> -  extends: .native_test_job_template
> -  needs:
> -    - job: build-deprecated
> -      artifacts: true
> -  variables:
> -    IMAGE: debian-all-test-cross
> -    MAKE_CHECK_ARGS: check-tcg
> -  allow_failure: true
> -
>   # gprof/gcov are GCC features
>   build-gprof-gcov:
>     extends: .native_build_job_template
> diff --git a/configs/targets/ppc64abi32-linux-user.mak b/configs/targets/ppc64abi32-linux-user.mak
> deleted file mode 100644
> index 0945451081..0000000000
> --- a/configs/targets/ppc64abi32-linux-user.mak
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -TARGET_ARCH=ppc64
> -TARGET_ABI32=y
> -TARGET_BASE_ARCH=ppc
> -TARGET_ABI_DIR=ppc
> -TARGET_SYSTBL_ABI=common,nospu,32
> -TARGET_SYSTBL=syscall.tbl
> -TARGET_WORDS_BIGENDIAN=y
> -TARGET_XML_FILES= gdb-xml/power64-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml gdb-xml/power-vsx.xml
> diff --git a/configure b/configure
> index 48c21775f3..da34ab0e12 100755
> --- a/configure
> +++ b/configure
> @@ -1295,8 +1295,6 @@ if [ "$ARCH" = "unknown" ]; then
>   fi
>   
>   default_target_list=""
> -deprecated_targets_list=ppc64abi32-linux-user
> -deprecated_features=""
>   mak_wilds=""
>   
>   if [ "$softmmu" = "yes" ]; then
> @@ -1309,16 +1307,6 @@ if [ "$bsd_user" = "yes" ]; then
>       mak_wilds="${mak_wilds} $source_path/configs/targets/*-bsd-user.mak"
>   fi
>   
> -# If the user doesn't explicitly specify a deprecated target we will
> -# skip it.
> -if test -z "$target_list"; then
> -    if test -z "$target_list_exclude"; then
> -        target_list_exclude="$deprecated_targets_list"
> -    else
> -        target_list_exclude="$target_list_exclude,$deprecated_targets_list"
> -    fi
> -fi
> -
>   for config in $mak_wilds; do
>       target="$(basename "$config" .mak)"
>       if echo "$target_list_exclude" | grep -vq "$target"; then
> @@ -1337,11 +1325,9 @@ Standard options:
>     --prefix=PREFIX          install in PREFIX [$prefix]
>     --interp-prefix=PREFIX   where to find shared libraries, etc.
>                              use %M for cpu name [$interp_prefix]
> -  --target-list=LIST       set target list (default: build all non-deprecated)
> +  --target-list=LIST       set target list (default: build all)
>   $(echo Available targets: $default_target_list | \
>     fold -s -w 53 | sed -e 's/^/                           /')
> -$(echo Deprecated targets: $deprecated_targets_list | \
> -  fold -s -w 53 | sed -e 's/^/                           /')
>     --target-list-exclude=LIST exclude a set of targets from the default target-list
>   
>   Advanced options (experts only):
> @@ -1827,13 +1813,6 @@ else
>       done
>   fi
>   
> -for target in $target_list; do
> -    # if a deprecated target is enabled we note it here
> -    if echo "$deprecated_targets_list" | grep -q "$target"; then
> -        add_to deprecated_features $target
> -    fi
> -done
> -
>   # see if system emulation was really requested
>   case " $target_list " in
>     *"-softmmu "*) softmmu=yes
> @@ -4017,12 +3996,6 @@ else
>     fi
>   fi
>   
> -if test -n "${deprecated_features}"; then
> -    echo "Warning, deprecated features enabled."
> -    echo "Please see docs/about/deprecated.rst"
> -    echo "  features: ${deprecated_features}"
> -fi
> -
>   # Create list of config switches that should be poisoned in common code...
>   # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
>   target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 5693abb663..7f12f53713 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -396,13 +396,6 @@ The above, converted to the current supported format::
>   linux-user mode CPUs
>   --------------------
>   
> -``ppc64abi32`` CPUs (since 5.2)
> -'''''''''''''''''''''''''''''''
> -
> -The ``ppc64abi32`` architecture has a number of issues which regularly
> -trip up our CI testing and is suspected to be quite broken. For that
> -reason the maintainers strongly suspect no one actually uses it.
> -
>   MIPS ``I7200`` CPU (since 5.2)
>   ''''''''''''''''''''''''''''''
>   
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index d42c3341de..f92b8bd738 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -594,6 +594,14 @@ the upstream Linux kernel in 2018, and it has also been dropped from glibc, so
>   there is no new Linux development taking place with this architecture. For
>   running the old binaries, you can use older versions of QEMU.
>   
> +``ppc64abi32`` CPUs (removed in 7.0)
> +''''''''''''''''''''''''''''''''''''
> +
> +The ``ppc64abi32`` architecture has a number of issues which regularly
> +tripped up the CI testing and was suspected to be quite broken. For that
> +reason the maintainers strongly suspected no one actually used it.
> +
> +
>   System emulator devices
>   -----------------------
>   
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index e08d4be63b..6f2ffa080f 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -166,7 +166,6 @@ Other binaries
>   
>   -  user mode (PowerPC)
>   
> -   * ``qemu-ppc64abi32`` TODO.
>      * ``qemu-ppc64`` TODO.
>      * ``qemu-ppc`` TODO.
>   
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 767f54c76d..62ce067d58 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -718,7 +718,7 @@ static inline void init_thread(struct target_pt_regs *regs,
>   #define ELF_MACHINE    PPC_ELF_MACHINE
>   #define ELF_START_MMAP 0x80000000
>   
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>   
>   #define elf_check_arch(x) ( (x) == EM_PPC64 )
>   
> @@ -870,7 +870,7 @@ static uint32_t get_elf_hwcap2(void)
>   static inline void init_thread(struct target_pt_regs *_regs, struct image_info *infop)
>   {
>       _regs->gpr[1] = infop->start_stack;
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>       if (get_ppc64_abi(infop) < 2) {
>           uint64_t val;
>           get_user_u64(val, infop->entry + 8);
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 90a0369632..86f4528422 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -477,9 +477,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       int i, err = 0;
>   #if defined(TARGET_PPC64)
>       struct target_sigcontext *sc = 0;
> -#if !defined(TARGET_ABI32)
>       struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
> -#endif
>   #endif
>   
>       rt_sf_addr = get_sigframe(ka, env, sizeof(*rt_sf));
> @@ -530,7 +528,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       env->gpr[5] = (target_ulong) h2g(&rt_sf->uc);
>       env->gpr[6] = (target_ulong) h2g(rt_sf);
>   
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>       if (get_ppc64_abi(image) < 2) {
>           /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
>           struct target_func_ptr *handler =
> @@ -562,7 +560,7 @@ sigsegv:
>   
>   }
>   
> -#if !defined(TARGET_PPC64) || defined(TARGET_ABI32)
> +#if !defined(TARGET_PPC64)
>   long do_sigreturn(CPUPPCState *env)
>   {
>       struct target_sigcontext *sc = NULL;
> @@ -575,12 +573,9 @@ long do_sigreturn(CPUPPCState *env)
>       if (!lock_user_struct(VERIFY_READ, sc, sc_addr, 1))
>           goto sigsegv;
>   
> -#if defined(TARGET_PPC64)
> -    set.sig[0] = sc->oldmask + ((uint64_t)(sc->_unused[3]) << 32);
> -#else
>       __get_user(set.sig[0], &sc->oldmask);
>       __get_user(set.sig[1], &sc->_unused[3]);
> -#endif
> +
>       target_to_host_sigset_internal(&blocked, &set);
>       set_sigmask(&blocked);
>   
> diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
> index b9c4b813d3..30591806f0 100644
> --- a/linux-user/ppc/target_syscall.h
> +++ b/linux-user/ppc/target_syscall.h
> @@ -36,7 +36,7 @@ struct target_pt_regs {
>   	abi_ulong link;
>   	abi_ulong xer;
>   	abi_ulong ccr;
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>           abi_ulong softe;
>   #else
>   	abi_ulong mq;		/* 601 only (not used at present) */
> @@ -58,7 +58,7 @@ struct target_revectored_struct {
>    * flags masks
>    */
>   
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>   #ifdef TARGET_WORDS_BIGENDIAN
>   #define UNAME_MACHINE "ppc64"
>   #else
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 0b13975937..7a8f24967d 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1607,7 +1607,7 @@ struct target_stat64 {
>   struct target_stat {
>   	abi_ulong st_dev;
>   	abi_ulong st_ino;
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>   	abi_ulong st_nlink;
>   	unsigned int st_mode;
>   #else
> @@ -1628,12 +1628,12 @@ struct target_stat {
>   	abi_ulong  target_st_ctime_nsec;
>   	abi_ulong  __unused4;
>   	abi_ulong  __unused5;
> -#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
> +#if defined(TARGET_PPC64)
>   	abi_ulong  __unused6;
>   #endif
>   };
>   
> -#if !defined(TARGET_PPC64) || defined(TARGET_ABI32)
> +#if !defined(TARGET_PPC64)
>   #define TARGET_HAS_STRUCT_STAT64
>   struct QEMU_PACKED target_stat64 {
>   	unsigned long long st_dev;
> diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> index 1146a06be6..5de12b01cd 100644
> --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> @@ -16,7 +16,7 @@ RUN apt update && \
>   
>   # Specify the cross prefix for this image (see tests/docker/common.rc)
>   ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
> -ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
> +ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
>   
>   # Install extra libraries to increase code coverage
>   RUN apt update && \
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 9b76f58258..022bd45341 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -165,7 +165,7 @@ for target in $target_list; do
>         container_image=debian-nios2-cross
>         container_cross_cc=nios2-linux-gnu-gcc
>         ;;
> -    ppc-*|ppc64abi32-*)
> +    ppc-*)
>         container_hosts=x86_64
>         container_image=debian-powerpc-test-cross
>         container_cross_cc=powerpc-linux-gnu-gcc-10
> 


