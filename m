Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D12489B9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:25:44 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83Ud-0007XA-Dq
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k83Sj-00043E-0G
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:23:45 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:47585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k83Sg-0000hM-OD
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 11:23:44 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbjBo-1kfTbB1vB8-00dIFF; Tue, 18 Aug 2020 17:23:15 +0200
To: Andrew Aladjev <aladjev.andrew@gmail.com>, qemu-devel@nongnu.org
References: <20200817235712.10957-1-aladjev.andrew@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH 1/3] linux user: make execfd global (like exec path) and
 keep it open
Message-ID: <6caa924e-364d-4e5c-f494-424dc81d8ada@vivier.eu>
Date: Tue, 18 Aug 2020 17:23:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817235712.10957-1-aladjev.andrew@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DDw0eOQVZEzs9+o6I+RccDhVyHuDdejzNkx4ymIejQb64PqXRIn
 +QZ3HYq/KkoAvZR2Gr+sImkGOlFWtwSqVlY4Bh2eW5aCrQ+0epSt3DJBv9saTRraUJ+G5aT
 dfucHrFf0M+CW1prVpqaFNI6qwoddLL7t5Md1HVfER7v1j1OCUpSa6+y9VO4HQeennL1rNP
 dJmjFmPHxLmF6GHReYgXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h4iVQWn3pxk=:0hdj1uQWKgSTEYT7+c4IQu
 LocO6BqXwfCpdWqsAKsnY+22Pp6rl9XGIbAz2O/k9RxXt3rS48hs2AzGR0QoMgaBoLpO8hD5D
 N/TQtHZ3nHZE+xbEJBjoWeoau14gFBUWIJCUDrKk3DRYXG19WpzIfnIW6XSl1SV/TjbVKvH4/
 WGTHTy9L9Ao5shorH2D8TBWRkLFTkwF+8mhdE0z+9A2FoUtP5rfXC01gMCqqVxDgj0+o1mNrT
 TuZQw7fsYeo1LgTnmIwDlyE8lAEdSCpc53pLN3Fcz6QECNia/Ft5LGZjYGQ7XFbdmbr1bwctQ
 9eZrcjt61jlAJHXQ21RHOLh/juTvPS2JJ9Dx5ITIJP9keHkCT7v1Tv5cPcJ/rtc4ma0LUPgBN
 P1vb533EY2OslCRb4uJvUrEWH9LV7dfa1ml/ewBqOtN31EwQfCeADGcG/fV/SJ4iMtcUEr93o
 f9TDrwbmJlYh35ND5BSjbUxvE2kANQMWknrgrIrGYXA520Tefcd82zpmKVoyKu/qQfkf/DP+B
 2okzMRl3+7hwFc9HQxuaSrVoplfewkt0+NFIJ4+rrbdu2vZBJolkKk2NjF20SzPMkruy54X+o
 RjperHHNHG2gnP47o6OdTGPbg7/O6mE9LVhm6s7IEYkp2SCU42Mxr/SPiPgIEs1brRqHqyuVI
 gIPcfSDdNV3dXQbDRIdqK6U4I3tjnJ+YXJrGHRSIABLbGW1An0rYnZIJsa6asewCiMHj4cjNi
 6qcJkeMJgevBC5zRQS7sQHTwxrhc2h1yVls+TnMCXdQi3klkKccM8eriV1vQI2Z1z4b2TupKM
 NU2474FOPNfvHmHihug6pNwVdOlvc3QnRDLUv7iYxWPjNbn1EUBOQNX0a0yFLq3A+UJdlrx
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 11:23:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

Le 18/08/2020 à 01:57, Andrew Aladjev a écrit :
> User opens /proc/self/exe symlink, than kernel should create /proc/self/fd/<execfd> symlink. We should be able to detect both exe and fd/<execfd> symlinks to provide common behaviour. The easiest solution is to make execfd global and keep it open. This solution looks acceptable because exec_path is already global.
> 
> Signed-off-by: Andrew Aladjev <aladjev.andrew@gmail.com>
> ---
>  linux-user/elfload.c |  3 ++-
>  linux-user/exit.c    |  7 +++++--
>  linux-user/main.c    |  2 +-
>  linux-user/qemu.h    |  1 +
>  linux-user/syscall.c | 18 ++++++++++++++----
>  5 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index fe9dfe795d..dfaf937ab9 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2363,6 +2363,7 @@ void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
>  
>     IMAGE_NAME is the filename of the image, to use in error messages.
>     IMAGE_FD is the open file descriptor for the image.
> +   WARNING: IMAGE_FD won't be closed.
>  
>     BPRM_BUF is a copy of the beginning of the file; this of course
>     contains the elf file header at offset 0.  It is assumed that this
> @@ -2632,7 +2633,6 @@ static void load_elf_image(const char *image_name, int image_fd,
>  
>      mmap_unlock();
>  
> -    close(image_fd);
>      return;
>  
>   exit_read:
> @@ -2666,6 +2666,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
>      }
>  
>      load_elf_image(filename, fd, info, NULL, bprm_buf);
> +    close(fd);
>      return;
>  
>   exit_perror:
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index 1594015444..f0626fc432 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -28,12 +28,15 @@ extern void __gcov_dump(void);
>  
>  void preexit_cleanup(CPUArchState *env, int code)
>  {
> +    close(execfd);
> +
>  #ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
>  #ifdef CONFIG_GCOV
>          __gcov_dump();
>  #endif
> -        gdb_exit(env, code);
> -        qemu_plugin_atexit_cb();
> +
> +    gdb_exit(env, code);
> +    qemu_plugin_atexit_cb();
>  }
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 75c9785157..27644a831a 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -49,6 +49,7 @@
>  #include "crypto/init.h"
>  
>  char *exec_path;
> +int execfd;
>  
>  int singlestep;
>  static const char *argv0;
> @@ -629,7 +630,6 @@ int main(int argc, char **argv, char **envp)
>      int target_argc;
>      int i;
>      int ret;
> -    int execfd;
>      int log_mask;
>      unsigned long max_reserved_va;
>  
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 5c964389c1..f99be78d42 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -156,6 +156,7 @@ typedef struct TaskState {
>  } __attribute__((aligned(16))) TaskState;
>  
>  extern char *exec_path;
> +extern int execfd;
>  void init_task_state(TaskState *ts);
>  void task_settid(TaskState *);
>  void stop_all_tasks(void);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 945fc25279..5741c72733 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7613,8 +7613,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
>      };
>  
>      if (is_proc_myself(pathname, "exe")) {
> -        int execfd = qemu_getauxval(AT_EXECFD);
> -        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
> +        return execfd;
>      }
>  
>      for (fake_open = fakes; fake_open->filename; fake_open++) {
> @@ -7872,8 +7871,19 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return ret;
>  #endif
>      case TARGET_NR_close:
> -        fd_trans_unregister(arg1);
> -        return get_errno(close(arg1));
> +        {
> +            int fd = arg1;
> +            if (fd == execfd) {
> +                /*
> +                 * We don't need to close execfd.
> +                 * It will be closed on QEMU exit.
> +                 */
> +                return 0;
> +            }

Why do you prevent the user to close it?

It's his own responsability if he breaks something.

And for instance, doing that breaks a call to dup() if it was done on
purpose.

Except that, the patch looks good.

Thanks,
Laurent

