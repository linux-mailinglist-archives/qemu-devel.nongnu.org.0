Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009F58F39B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:41:35 +0200 (CEST)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLsWE-0000nM-3x
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLsLv-0001ad-PB
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:30:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLsLs-0007BG-R6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:30:55 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AJoZ1X029195;
 Wed, 10 Aug 2022 20:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : reply-to : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=Vz/jGBUm6V1ST+tXvgJcY+ptaGRFMEEEkzP0zXTLPwE=;
 b=tqDiMkl6BJGEarj6nu6n58o6o8fixoU1B1KTz7DAeEekIPvnmnCk4grEobVFaboxJPgy
 8d0BUAaJnGD8fW/6Ej2bqNc3WRzppaSIkmD3phKscCRKWHa9DL8MDDFbGIk6i7TSPMBa
 8MDTjBFhNlFL2FQbfVBy6KgI+dwrIE2crXzobWL9gX5vtXsXFg12yCL5fomixPc93U8S
 Q+dlo3VHSfIVcqiyjJO6pk5DkTO+gZ/YJCcOZUr9OX48lTlCpWcSJnM79uQbyyy9j+1a
 GXZURbYTmJiym2ES04tmcf2Ctm80u0RfVTOsPm87t7F0zD8CHQqTxCHgfouqDxGyMV01 NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvk6f12u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 20:30:49 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AKIeNY006974;
 Wed, 10 Aug 2022 20:30:48 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvk6f12ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 20:30:48 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27AKKop2013493;
 Wed, 10 Aug 2022 20:30:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3hvkjh01bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 20:30:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27AKUkH720185422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 20:30:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36AC87809D;
 Wed, 10 Aug 2022 20:30:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C76A87809B;
 Wed, 10 Aug 2022 20:30:43 +0000 (GMT)
Received: from [9.65.252.112] (unknown [9.65.252.112])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 10 Aug 2022 20:30:43 +0000 (GMT)
Message-ID: <8a9891ed-1cb2-6b2e-efed-04c61b546c2e@linux.ibm.com>
Date: Wed, 10 Aug 2022 17:30:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 fiuczy@linux.ibm.com, pasic@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220809064024.15259-1-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CwVV462OKyX7llnwSyhy1ig1JodJSlp7
X-Proofpoint-ORIG-GUID: hDvOFh65Y1PPoYwv21He1cuBloQc3ejj
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_14,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208100060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Claudio.

On 8/9/22 03:40, Claudio Imbrenda wrote:
> This patch adds support for asynchronously tearing down a VM on Linux.
> 
> When qemu terminates, either naturally or because of a fatal signal,
> the VM is torn down. If the VM is huge, it can take a considerable
> amount of time for it to be cleaned up. In case of a protected VM, it
> might take even longer than a non-protected VM (this is the case on
> s390x, for example).
> 
> Some users might want to shut down a VM and restart it immediately,
> without having to wait. This is especially true if management
> infrastructure like libvirt is used.
> 
> This patch implements a simple trick on Linux to allow qemu to return
> immediately, with the teardown of the VM being performed
> asynchronously.
> 
> If the new commandline option -async-teardown is used, a new process is
> spawned from qemu at startup, using the clone syscall, in such way that
> it will share its address space with qemu.
> 
> The new process will have the name "cleanup/<QEMU_PID>". It will wait
> until qemu terminates, and then it will exit itself.
> 
> This allows qemu to terminate quickly, without having to wait for the
> whole address space to be torn down. The teardown process will exit
> after qemu, so it will be the last user of the address space, and
> therefore it will take care of the actual teardown.
> 
> The teardown process will share the same cgroups as qemu, so both
> memory usage and cpu time will be accounted properly.
> 
> This feature can already be used with libvirt by adding the following
> to the XML domain definition to pass the parameter to qemu directly:
> 
>    <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
>    <arg value='-async-teardown'/>
>    </commandline>
> 
> More advanced interfaces like pidfd or close_range have intentionally
> been avoided in order to be more compatible with older kernels.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

I've smoke-tested this on ppc and everything looks fine.
For what's worth:

Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Tested-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>


Have you measured the benefits of using -async-teardown vs. not using it?
If so, can you please share the details so I can give it a try on ppc, too?

The wall-clock perception is that nothing has changed, for better or worse.
My tests used mid-sized VMs, like 128 vCPUs, 64GB RAM.

Cheers!

> ---
>   include/qemu/async-teardown.h |  22 ++++++
>   os-posix.c                    |   6 ++
>   qemu-options.hx               |  17 +++++
>   util/async-teardown.c         | 123 ++++++++++++++++++++++++++++++++++
>   util/meson.build              |   1 +
>   5 files changed, 169 insertions(+)
>   create mode 100644 include/qemu/async-teardown.h
>   create mode 100644 util/async-teardown.c
> 
> diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardown.h
> new file mode 100644
> index 0000000000..092e7a37e7
> --- /dev/null
> +++ b/include/qemu/async-teardown.h
> @@ -0,0 +1,22 @@
> +/*
> + * Asynchronous teardown
> + *
> + * Copyright IBM, Corp. 2022
> + *
> + * Authors:
> + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef QEMU_ASYNC_TEARDOWN_H
> +#define QEMU_ASYNC_TEARDOWN_H
> +
> +#include "config-host.h"
> +
> +#ifdef CONFIG_LINUX
> +void init_async_teardown(void);
> +#endif
> +
> +#endif
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..4858650c3e 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -39,6 +39,7 @@
>   
>   #ifdef CONFIG_LINUX
>   #include <sys/prctl.h>
> +#include "qemu/async-teardown.h"
>   #endif
>   
>   /*
> @@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optarg)
>       case QEMU_OPTION_daemonize:
>           daemonize = 1;
>           break;
> +#if defined(CONFIG_LINUX)
> +    case QEMU_OPTION_asyncteardown:
> +        init_async_teardown();
> +        break;
> +#endif
>       default:
>           return -1;
>       }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3f23a42fa8..d434353159 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4743,6 +4743,23 @@ HXCOMM Internal use
>   DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
>   DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>   
> +#ifdef __linux__
> +DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
> +    "-async-teardown enable asynchronous teardown\n",
> +    QEMU_ARCH_ALL)
> +#endif
> +SRST
> +``-async-teardown``
> +    Enable asynchronous teardown. A new teardown process will be
> +    created at startup, using clone. The teardown process will share
> +    the address space of the main qemu process, and wait for the main
> +    process to terminate. At that point, the teardown process will
> +    also exit. This allows qemu to terminate quickly if the guest was
> +    huge, leaving the teardown of the address space to the teardown
> +    process. Since the teardown process shares the same cgroups as the
> +    main qemu process, accounting is performed correctly.
> +ERST
> +
>   DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>       "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
>       "                control error message format\n"
> diff --git a/util/async-teardown.c b/util/async-teardown.c
> new file mode 100644
> index 0000000000..07fe549891
> --- /dev/null
> +++ b/util/async-teardown.c
> @@ -0,0 +1,123 @@
> +/*
> + * Asynchronous teardown
> + *
> + * Copyright IBM, Corp. 2022
> + *
> + * Authors:
> + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/unistd.h>
> +#include <dirent.h>
> +#include <sys/prctl.h>
> +#include <signal.h>
> +#include <sched.h>
> +
> +#include "qemu/async-teardown.h"
> +
> +static pid_t the_ppid;
> +
> +/*
> + * Close all open file descriptors.
> + */
> +static void close_all_open_fd(void)
> +{
> +    struct dirent *de;
> +    int fd, dfd;
> +    DIR *dir;
> +
> +    dir = opendir("/proc/self/fd");
> +    if (!dir) {
> +        return;
> +    }
> +    /* Avoid closing the directory. */
> +    dfd = dirfd(dir);
> +
> +    for (de = readdir(dir); de; de = readdir(dir)) {
> +        fd = atoi(de->d_name);
> +        if (fd != dfd) {
> +            close(fd);
> +        }
> +    }
> +    closedir(dir);
> +}
> +
> +static void hup_handler(int signal)
> +{
> +    /* Check every second if this process has been reparented. */
> +    while (the_ppid == getppid()) {
> +        /* sleep() is safe to use in a signal handler. */
> +        sleep(1);
> +    }
> +
> +    /* At this point the parent process has terminated completely. */
> +    _exit(0);
> +}
> +
> +static int async_teardown_fn(void *arg)
> +{
> +    struct sigaction sa = { .sa_handler = hup_handler };
> +    sigset_t hup_signal;
> +    char name[16];
> +
> +    /* Set a meaningful name for this process. */
> +    snprintf(name, 16, "cleanup/%d", the_ppid);
> +    prctl(PR_SET_NAME, (unsigned long)name);
> +
> +    /*
> +     * Close all file descriptors that might have been inherited from the
> +     * main qemu process when doing clone, needed to make libvirt happy.
> +     * Not using close_range for increased compatibility with older kernels.
> +     */
> +    close_all_open_fd();
> +
> +    /* Set up a handler for SIGHUP and unblock SIGHUP. */
> +    sigaction(SIGHUP, &sa, NULL);
> +    sigemptyset(&hup_signal);
> +    sigaddset(&hup_signal, SIGHUP);
> +    sigprocmask(SIG_UNBLOCK, &hup_signal, NULL);
> +
> +    /* Ask to receive SIGHUP when the parent dies. */
> +    prctl(PR_SET_PDEATHSIG, SIGHUP);
> +
> +    /*
> +     * Sleep forever, unless the parent process has already terminated. The
> +     * only interruption can come from the SIGHUP signal, which in normal
> +     * operation is received when the parent process dies.
> +     */
> +    if (the_ppid == getppid()) {
> +        pause();
> +    }
> +
> +    /* At this point the parent process has terminated completely. */
> +    _exit(0);
> +}
> +
> +/*
> + * Block all signals, start (clone) a new process sharing the address space
> + * with qemu (CLONE_VM), then restore signals.
> + */
> +void init_async_teardown(void)
> +{
> +    sigset_t all_signals, old_signals;
> +    const int stack_size = 8192; /* Should be more than enough */
> +    char *stack, *stack_ptr;
> +
> +    the_ppid = getpid();
> +    stack = malloc(stack_size);
> +    if (!stack) {
> +        return;
> +    }
> +    stack_ptr = stack + stack_size;
> +
> +    sigfillset(&all_signals);
> +    sigprocmask(SIG_BLOCK, &all_signals, &old_signals);
> +    clone(async_teardown_fn, stack_ptr, CLONE_VM, NULL, NULL, NULL, NULL);
> +    sigprocmask(SIG_SETMASK, &old_signals, NULL);
> +}
> diff --git a/util/meson.build b/util/meson.build
> index 5e282130df..63acd59bb0 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
>   if not config_host_data.get('CONFIG_ATOMIC64')
>     util_ss.add(files('atomic64.c'))
>   endif
> +util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
>   util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
>   if config_host_data.get('CONFIG_EPOLL_CREATE1')


-- 
Murilo

