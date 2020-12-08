Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD02D25C3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:23:30 +0100 (CET)
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYHR-0007C8-SU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:23:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kmYFS-0006Ky-7A
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:21:26 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:35349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kmYFP-0003Mq-Uf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:21:26 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCayD-1kuUKE3lMh-009f1j; Tue, 08 Dec 2020 09:21:18 +0100
To: Matteo Croce <mcroce@linux.microsoft.com>, qemu-devel@nongnu.org
References: <20201208001727.17433-1-mcroce@linux.microsoft.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: add option to chroot before emulation
Message-ID: <f37589e0-90d9-a5f0-a5a9-423c583c675d@vivier.eu>
Date: Tue, 8 Dec 2020 09:21:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208001727.17433-1-mcroce@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6FvXMq9X29OyXTvMr3NmZPCtSP6oYP3Z7hlsbIS+3DioFKn8/f2
 qEQMFJ9LvMGNUPomFHycg29lXfc2EqmZcgfhlvjFT736lL9JULjC+ceu7bAYPnS85TbK9gL
 f0BNoute/+Gvbbs2gg+sESCwS/SfBFPz9jq42VWWlNgwsZ5Qrv+vQpqhS24PUdoUufpy2zv
 OffriD05Di01cDSwWK4zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/CdxOJ75c+o=:tibKlP87YXpJ+kZvx4Trw7
 eX9crzAMLAqNtOzqku0ej0rJZQhT/KrVsMJKx+gikP9K4r9kaqa8awaxg+IKSEa50x3sLzPfd
 7MvYrTmoiUWpdE9/fpCUPOK/y9iTUj6INqK4CjD8izedyGSrNH2NhSL6cwBfMAjFxiuXsUjUe
 R2IS2OgkIJhN9Wbc3Psd18aKJkhXi7gjBycBziaYi5h+bFcgo/J/QSyfHl0O35p69ordRrMnD
 /+e5uVbi7IV1rXnduOnqmsnCeEJZi6h1f5gDShPTLukv6Pown7P2RxKVYOSJQXv6KD2WFHrOF
 V+0D8LRaViup2DbpkQkkezjd8JxscZo2AbjEIY7nAG2VqzScJr8gZFDxE3K4rU3zTcVUzgLTz
 hpaIjbKGUqTAuavbGC81przt6VYZBzsQjHdHCFGA1ctB+4vjhmWOG1gzMAtwAf17C1dXL2ZQ5
 nI4U/vPRHg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 08/12/2020 à 01:17, Matteo Croce a écrit :
> From: Matteo Croce <mcroce@microsoft.com>
> 
> Add a '-c' option which does a chroot() just before starting the
> emulation. This is useful when the static QEMU user binary can't
> be copied into the target root filesystem, e.g. if it's readonly.

Did you try to use the binfmt_misc 'F' flag (fix binary)?

https://www.kernel.org/doc/Documentation/admin-guide/binfmt-misc.rst

``F`` - fix binary

The usual behaviour of binfmt_misc is to spawn the
binary lazily when the misc format file is invoked.  However,
this doesn``t work very well in the face of mount namespaces and
changeroots, so the ``F`` mode opens the binary as soon as the
emulation is installed and uses the opened image to spawn the
emulator, meaning it is always available once installed,
regardless of how the environment changes.

This can be configured with scripts/qemu-binfmt-conf.sh and
"--persistent yes"" option

Thanks,
Laurent
> 
> Move some code which accesses /proc/sys/vm/mmap_min_addr before
> the chroot, otherwise it would fail.
> 
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> ---
>  linux-user/main.c | 128 +++++++++++++++++++++++++++-------------------
>  1 file changed, 75 insertions(+), 53 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 24d1eb73ad..4788e4b5bc 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -60,6 +60,7 @@ static const char *seed_optarg;
>  unsigned long mmap_min_addr;
>  unsigned long guest_base;
>  bool have_guest_base;
> +static const char *qemu_chroot;
>  
>  /*
>   * Used to implement backwards-compatibility for the `-strace`, and
> @@ -304,6 +305,11 @@ static void handle_arg_pagesize(const char *arg)
>      }
>  }
>  
> +static void handle_arg_chroot(const char *arg)
> +{
> +    qemu_chroot = arg;
> +}
> +
>  static void handle_arg_seed(const char *arg)
>  {
>      seed_optarg = arg;
> @@ -450,6 +456,8 @@ static const struct qemu_argument arg_table[] = {
>       "logfile",     "write logs to 'logfile' (default stderr)"},
>      {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
>       "pagesize",   "set the host page size to 'pagesize'"},
> +    {"c",          "QEMU_CHROOT",      true,  handle_arg_chroot,
> +     "chroot",     "chroot to 'chroot' before starting emulation"},
>      {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
>       "",           "run in singlestep mode"},
>      {"strace",     "QEMU_STRACE",      false, handle_arg_strace,
> @@ -688,6 +696,73 @@ int main(int argc, char **argv, char **envp)
>  
>      init_qemu_uname_release();
>  
> +    /*
> +     * Read in mmap_min_addr kernel parameter.  This value is used
> +     * When loading the ELF image to determine whether guest_base
> +     * is needed.  It is also used in mmap_find_vma.
> +     */
> +    {
> +        FILE *fp;
> +
> +        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
> +            unsigned long tmp;
> +            if (fscanf(fp, "%lu", &tmp) == 1 && tmp != 0) {
> +                mmap_min_addr = tmp;
> +                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
> +                              mmap_min_addr);
> +            }
> +            fclose(fp);
> +        }
> +    }
> +
> +    /*
> +     * We prefer to not make NULL pointers accessible to QEMU.
> +     * If we're in a chroot with no /proc, fall back to 1 page.
> +     */
> +    if (mmap_min_addr == 0) {
> +        mmap_min_addr = qemu_host_page_size;
> +        qemu_log_mask(CPU_LOG_PAGE,
> +                      "host mmap_min_addr=0x%lx (fallback)\n",
> +                      mmap_min_addr);
> +    }
> +
> +    /*
> +     * Prepare copy of argv vector for target.
> +     */
> +    target_argc = argc - optind;
> +    target_argv = calloc(target_argc + 1, sizeof (char *));
> +    if (target_argv == NULL) {
> +        (void) fprintf(stderr, "Unable to allocate memory for target_argv\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * If argv0 is specified (using '-0' switch) we replace
> +     * argv[0] pointer with the given one.
> +     */
> +    i = 0;
> +    if (argv0 != NULL) {
> +        target_argv[i++] = strdup(argv0);
> +    }
> +    for (; i < target_argc; i++) {
> +        target_argv[i] = strdup(argv[optind + i]);
> +    }
> +    target_argv[target_argc] = NULL;
> +
> +    /*
> +     * Change root if requested wuth '-c'
> +     */
> +    if (qemu_chroot) {
> +        if (chroot(qemu_chroot) < 0) {
> +            error_report("chroot failed");
> +            exit(1);
> +        }
> +        if (chdir("/")) {
> +            error_report("not able to chdir to /: %s", strerror(errno));
> +            exit(1);
> +        }
> +    }
> +
>      execfd = qemu_getauxval(AT_EXECFD);
>      if (execfd == 0) {
>          execfd = open(exec_path, O_RDONLY);
> @@ -746,59 +821,6 @@ int main(int argc, char **argv, char **envp)
>      target_environ = envlist_to_environ(envlist, NULL);
>      envlist_free(envlist);
>  
> -    /*
> -     * Read in mmap_min_addr kernel parameter.  This value is used
> -     * When loading the ELF image to determine whether guest_base
> -     * is needed.  It is also used in mmap_find_vma.
> -     */
> -    {
> -        FILE *fp;
> -
> -        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
> -            unsigned long tmp;
> -            if (fscanf(fp, "%lu", &tmp) == 1 && tmp != 0) {
> -                mmap_min_addr = tmp;
> -                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
> -                              mmap_min_addr);
> -            }
> -            fclose(fp);
> -        }
> -    }
> -
> -    /*
> -     * We prefer to not make NULL pointers accessible to QEMU.
> -     * If we're in a chroot with no /proc, fall back to 1 page.
> -     */
> -    if (mmap_min_addr == 0) {
> -        mmap_min_addr = qemu_host_page_size;
> -        qemu_log_mask(CPU_LOG_PAGE,
> -                      "host mmap_min_addr=0x%lx (fallback)\n",
> -                      mmap_min_addr);
> -    }
> -
> -    /*
> -     * Prepare copy of argv vector for target.
> -     */
> -    target_argc = argc - optind;
> -    target_argv = calloc(target_argc + 1, sizeof (char *));
> -    if (target_argv == NULL) {
> -        (void) fprintf(stderr, "Unable to allocate memory for target_argv\n");
> -        exit(EXIT_FAILURE);
> -    }
> -
> -    /*
> -     * If argv0 is specified (using '-0' switch) we replace
> -     * argv[0] pointer with the given one.
> -     */
> -    i = 0;
> -    if (argv0 != NULL) {
> -        target_argv[i++] = strdup(argv0);
> -    }
> -    for (; i < target_argc; i++) {
> -        target_argv[i] = strdup(argv[optind + i]);
> -    }
> -    target_argv[target_argc] = NULL;
> -
>      ts = g_new0(TaskState, 1);
>      init_task_state(ts);
>      /* build Task State */
> 


