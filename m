Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7E33304D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:52:39 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjLK-0005ZE-5t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJilT-0004Q8-Tw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:15:35 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJilR-0003RZ-O7
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:15:35 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQ5nK-1l6R3x0SrA-00M1qh; Tue, 09 Mar 2021 21:15:13 +0100
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <336b0ebf-bf70-5798-9118-5229963824d5@vivier.eu>
Date: Tue, 9 Mar 2021 21:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210222105004.1642234-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XEBxR8vETQeDyAsjxRYwgPHdAMC4ihEE2YO9nym6bi6c1r+bgQY
 hz08BxkiS/zjxsWdU/OTjXDfO/Cf6ucRQVPJSsF1m7BcaMLN1PODjLNsNjEBZUCDEbLFccN
 O1Y010OC6PyyQ5DgKRg6j3a4r9XzDD69B7iCKPTZGn6CbbSdFaLLelquwIzx9y5L69r/UnO
 IuV/iDLt282AtAU37nZfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PBEXGZk7G70=:Tu7Q76/xDJ2nEvmKUK0wnS
 aHE1DY66Fd8P55vJEz7cC9mBaMq8GcoePJEtQQT3QJrZ3/gaH7iN/2rxAT+13UGX2FMsCBCgX
 i3r+1yf+jG/3nhK8F7DY+6uwSxbZyt4JmXuLns5FFF7FzKtEpU6yQzRZoKBSmeeW9ezose6LK
 XHiGu3GU7h/OP+qZCLJO3JEebkj81CzgDxGVFe2BDLIkjLQ7yIxK1XwTmJYa4O+SGqgHpg5HC
 RibtveCfQqhUoW5GyyuZ5rWZN8TU87EZsxogmCiltBIBcvR+wfsq7Hsacl+TD+ngQKFPYo6U/
 bbE/9LM29c4IC2xt/h8/o6mqkPWNb0qsiBQyHbdBAcrzyq2DkUVD+L/GoTYFRcdMjmWw3VTw+
 rDzDDO30swO1z5s2arcER9DdxqTnT17RDVQJ/lLhcUO0398oNl/zZj9ZhkQgQ3C6NTycB61EM
 hDHyrqj0ig==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Helge Deller <deller@gmx.de>, Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/02/2021 à 11:50, Laurent Vivier a écrit :
> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
> flag.
> 
> This patch allows to use new flag in AT_FLAGS to detect if
> preserve-argv0 is configured for this interpreter:
> argv[0] (the full pathname provided by binfmt-misc) is removed and
> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
> 'P'/preserve-arg[0] is set)
> 
> For instance with this patch and kernel support for AT_FLAGS:
> 
>   $ sudo chroot m68k-chroot sh -c 'echo $0'
>   sh
> 
> without this patch:
> 
>   $ sudo chroot m68k-chroot sh -c 'echo $0'
>   /usr/bin/sh
> 
> The new flag is available in kernel (v5.12) since:
> 2347961b11d4 ("binfmt_misc: pass binfmt_misc flags to the interpreter")
> 
> This can be tested with something like:
> 
>   # cp ..../qemu-ppc /chroot/powerpc/jessie
> 
>   # qemu-binfmt-conf.sh --qemu-path / --systemd ppc --credential yes \
>                         --persistent no --preserve-argv0 yes
>   # systemctl restart systemd-binfmt.service
>   # cat /proc/sys/fs/binfmt_misc/qemu-ppc
>   enabled
>   interpreter //qemu-ppc
>   flags: POC
>   offset 0
>   magic 7f454c4601020100000000000000000000020014
>   mask ffffffffffffff00fffffffffffffffffffeffff
>   # chroot /chroot/powerpc/jessie  sh -c 'echo $0'
>   sh
> 
>   # qemu-binfmt-conf.sh --qemu-path / --systemd ppc --credential yes \
>                         --persistent no --preserve-argv0 no
>   # systemctl restart systemd-binfmt.service
>   # cat /proc/sys/fs/binfmt_misc/qemu-ppc
>   enabled
>   interpreter //qemu-ppc
>   flags: OC
>   offset 0
>   magic 7f454c4601020100000000000000000000020014
>   mask ffffffffffffff00fffffffffffffffffffeffff
>   # chroot /chroot/powerpc/jessie  sh -c 'echo $0'
>   /bin/sh
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/main.c           | 24 ++++++++++++++++++++
>  scripts/qemu-binfmt-conf.sh | 44 +++++++++++++++++++++++--------------
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 81f48ff54ed4..b9015a5dbd3e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -26,6 +26,7 @@
>  #include <sys/syscall.h>
>  #include <sys/resource.h>
>  #include <sys/shm.h>
> +#include <linux/binfmts.h>
>  
>  #include "qapi/error.h"
>  #include "qemu.h"
> @@ -49,6 +50,11 @@
>  #include "cpu_loop-common.h"
>  #include "crypto/init.h"
>  
> +#ifndef AT_FLAGS_PRESERVE_ARGV0
> +#define AT_FLAGS_PRESERVE_ARGV0_BIT 0
> +#define AT_FLAGS_PRESERVE_ARGV0 (1 << AT_FLAGS_PRESERVE_ARGV0_BIT)
> +#endif
> +
>  char *exec_path;
>  
>  int singlestep;
> @@ -631,6 +637,7 @@ int main(int argc, char **argv, char **envp)
>      int execfd;
>      int log_mask;
>      unsigned long max_reserved_va;
> +    bool preserve_argv0;
>  
>      error_init(argv[0]);
>      module_call_init(MODULE_INIT_TRACE);
> @@ -687,6 +694,9 @@ int main(int argc, char **argv, char **envp)
>  
>      init_qemu_uname_release();
>  
> +    /*
> +     * Manage binfmt-misc open-binary flag
> +     */
>      execfd = qemu_getauxval(AT_EXECFD);
>      if (execfd == 0) {
>          execfd = open(exec_path, O_RDONLY);
> @@ -696,6 +706,20 @@ int main(int argc, char **argv, char **envp)
>          }
>      }
>  
> +    /*
> +     * get binfmt_misc flags
> +     */
> +    preserve_argv0 = !!(qemu_getauxval(AT_FLAGS) & AT_FLAGS_PRESERVE_ARGV0);
> +
> +    /*
> +     * Manage binfmt-misc preserve-arg[0] flag
> +     *    argv[optind]     full path to the binary
> +     *    argv[optind + 1] original argv[0]
> +     */
> +    if (optind + 1 < argc && preserve_argv0) {
> +        optind++;
> +    }
> +
>      if (cpu_model == NULL) {
>          cpu_model = cpu_get_model(get_elf_eflags(execfd));
>      }
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 7b5d54b88741..573b5dc6acd7 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -178,25 +178,27 @@ usage() {
>  Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
>                             [--help][--credential yes|no][--exportdir PATH]
>                             [--persistent yes|no][--qemu-suffix SUFFIX]
> +                           [--preserve-argv0 yes|no]
>  
>         Configure binfmt_misc to use qemu interpreter
>  
> -       --help:        display this usage
> -       --qemu-path:   set path to qemu interpreter ($QEMU_PATH)
> -       --qemu-suffix: add a suffix to the default interpreter name
> -       --debian:      don't write into /proc,
> -                      instead generate update-binfmts templates
> -       --systemd:     don't write into /proc,
> -                      instead generate file for systemd-binfmt.service
> -                      for the given CPU. If CPU is "ALL", generate a
> -                      file for all known cpus
> -       --exportdir:   define where to write configuration files
> -                      (default: $SYSTEMDDIR or $DEBIANDIR)
> -       --credential:  if yes, credential and security tokens are
> -                      calculated according to the binary to interpret
> -       --persistent:  if yes, the interpreter is loaded when binfmt is
> -                      configured and remains in memory. All future uses
> -                      are cloned from the open file.
> +       --help:          display this usage
> +       --qemu-path:     set path to qemu interpreter ($QEMU_PATH)
> +       --qemu-suffix:   add a suffix to the default interpreter name
> +       --debian:        don't write into /proc,
> +                        instead generate update-binfmts templates
> +       --systemd:       don't write into /proc,
> +                        instead generate file for systemd-binfmt.service
> +                        for the given CPU. If CPU is "ALL", generate a
> +                        file for all known cpus
> +       --exportdir:     define where to write configuration files
> +                        (default: $SYSTEMDDIR or $DEBIANDIR)
> +       --credential:    if yes, credential and security tokens are
> +                        calculated according to the binary to interpret
> +       --persistent:    if yes, the interpreter is loaded when binfmt is
> +                        configured and remains in memory. All future uses
> +                        are cloned from the open file.
> +       --preserve-argv0 preserve argv[0]
>  
>      To import templates with update-binfmts, use :
>  
> @@ -269,6 +271,9 @@ qemu_generate_register() {
>      if [ "$PERSISTENT" = "yes" ] ; then
>          flags="${flags}F"
>      fi
> +    if [ "$PRESERVE_ARG0" = "yes" ] ; then
> +        flags="${flags}P"
> +    fi
>  
>      echo ":qemu-$cpu:M::$magic:$mask:$qemu:$flags"
>  }
> @@ -330,9 +335,10 @@ DEBIANDIR="/usr/share/binfmts"
>  QEMU_PATH=/usr/local/bin
>  CREDENTIAL=no
>  PERSISTENT=no
> +PRESERVE_ARG0=no
>  QEMU_SUFFIX=""
>  
> -options=$(getopt -o ds:Q:S:e:hc:p: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent: -- "$@")
> +options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
>  eval set -- "$options"
>  
>  while true ; do
> @@ -388,6 +394,10 @@ while true ; do
>          shift
>          PERSISTENT="$1"
>          ;;
> +    -g|--preserve-argv0)
> +        shift
> +        PRESERVE_ARG0="$1"
> +        ;;
>      *)
>          break
>          ;;
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


