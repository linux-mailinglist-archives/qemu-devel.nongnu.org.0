Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8B16C0DD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:33:22 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZOr-0000SU-BY
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j6Ysl-0008W8-WD
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:00:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j6Ysk-0006DF-QE
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:00:11 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:54953)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j6Yse-00065w-5f; Tue, 25 Feb 2020 07:00:04 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MHXWL-1jAjrb100v-00DXfU; Tue, 25 Feb 2020 12:59:58 +0100
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1582586444.git.alistair.francis@wdc.com>
 <205d84c5c51c54c8bb6a4a2927b7e1729fe42cdd.1582586444.git.alistair.francis@wdc.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v2 1/2] linux-user: Protect more syscalls
Message-ID: <4d5ad27a-0655-4c15-123a-8ae7ed6bedf2@vivier.eu>
Date: Tue, 25 Feb 2020 12:59:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <205d84c5c51c54c8bb6a4a2927b7e1729fe42cdd.1582586444.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PEGEras+ZNXreqY9xSxR18aJiYsuDeYEo9KPdKxxLs+Yun+T/UO
 VQ3XmFkIQpoc/mK1WlZiNHI4L/rIoCJ9eUicyq+o7+bZcspRekL9yo1QBBNOB3l/4NNuM1w
 ox9IOVE5wv5UYDI50MNPBROqYGPsxx88SHcJZgn2FeE1jxgi9Hx9C2KVQ2SpcoTT/4ofZSe
 aWpBEX+iiv5FGTUKEgAWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MEkB4zhY4gc=:SosM9qn+s9GUAN//eDeU+g
 q8r2kWVW7r6+UkZaNUdxcp+hjxS7bncOvhudCVnzClSsX8uhdFZKCWGZ9x17O9g1a94x5IQ8w
 hYR/n13648HiaiN8T1feYc/f+yiwNIEd3GV5g/wxJBEA1IV1sMKtQGDevkBYph0rJPyPosxsA
 sWttA4Mo2PXO9lZ2hOuY5AiUjVtx+NpPouvfLI0UM8zPsBnbMqT9kWzj+pFsYrjh0dbtWhE5a
 09PebR6Qeg3OU26ynW/nR+XVOiOTL767tRPIQsI9CwT3bj1gTdf3yKaXyaHBrJB3FEnlNdMER
 W34OlQ3vCjXopUTuIa8hx04oOU8hpbPyK9piq14txGH2ogydeMLJyI5CVm2MGXWCY68GpaTL/
 phkYEnpGd1uh8i+AgKZG2wWi6m/DQ4SAOLqmVwDJLtMPqCt0mEzso6LWIXOC2JOhNnJf1qpJG
 5DqdM6MPmY2B3+tmJBAa0sviXRkPbWdEfjIWw/WBxis5Zcvwfwl7iCUbB/J1cMrtWAZzObMPB
 coRsO+/ZTMUbeLVyTpHILwl+2BWttWsT9L5RAHWCzG1YCwjz/x42ZavdOwGx9gmHnhIsntNi3
 r/U1QBiyb7yakeBSqBJKfgJfqJzDG7FvQLp8dmXjGFAXiy4p2taWJdCmun51aOj4LN+bSclKC
 O00UFKldyqEskQSCksVwHlCOWRR3knuctPuZNHyzEBN5L//VfokaPTaJGhqXrFuDpIAB+Fmgz
 wGw40kE4Kh2ZBcbJiK2VNlNnZ5OlHFdlWeOSXJaMci/QIO+2ZV+Fz50Qzdpvh1rNtDWX/qsMR
 LXsgDViJX3iiIQQQPQrC5yhRusAfMtf06J6gKwQxNBg9p2xmP/VmedoJJl13qMDeJ0D1Obm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Cc: alistair23@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/02/2020 à 00:21, Alistair Francis a écrit :
> New y2038 safe 32-bit architectures (like RISC-V) don't support old
> syscalls with a 32-bit time_t. The kernel defines new *_time64 versions
> of these syscalls. Add some more #ifdefs to syscall.c in linux-user to
> allow us to compile without these old syscalls.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  linux-user/strace.c  |  2 ++
>  linux-user/syscall.c | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 4f7130b2ff..6420ccd97b 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -775,6 +775,7 @@ print_syscall_ret_newselect(const struct syscallname *name, abi_long ret)
>  #define TARGET_TIME_OOP      3   /* leap second in progress */
>  #define TARGET_TIME_WAIT     4   /* leap second has occurred */
>  #define TARGET_TIME_ERROR    5   /* clock not synchronized */
> +#ifdef TARGET_NR_adjtimex
>  static void
>  print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
>  {
> @@ -813,6 +814,7 @@ print_syscall_ret_adjtimex(const struct syscallname *name, abi_long ret)
>  
>      qemu_log("\n");
>  }
> +#endif
>  
>  UNUSED static struct flags access_flags[] = {
>      FLAG_GENERIC(F_OK),
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8d27d10807..5a2156f95a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -742,8 +742,10 @@ safe_syscall3(ssize_t, read, int, fd, void *, buff, size_t, count)
>  safe_syscall3(ssize_t, write, int, fd, const void *, buff, size_t, count)
>  safe_syscall4(int, openat, int, dirfd, const char *, pathname, \
>                int, flags, mode_t, mode)
> +#if defined(TARGET_NR_wait4)
>  safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
>                struct rusage *, rusage)

safe_wait4 is also used in TARGET_NR_waitpid

Thanks,
Laurent

