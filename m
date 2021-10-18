Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C951A431907
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:25:58 +0200 (CEST)
Received: from localhost ([::1]:40412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcRiH-0000zx-Hv
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mcRZf-0004rT-TQ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:17:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:44926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mcRZc-0004Qb-Vz
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:17:03 -0400
Received: from [137.226.90.212] (vpn-212.iss.rwth-aachen.de [137.226.90.212])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0B05020775;
 Mon, 18 Oct 2021 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634559418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1fXi2YSAZK4rcV2yV4NCP4pJ5lQWg8XxmJLYNkvO2cs=;
 b=zymrnYcoYvcfbXPjHwn/ZySfMjDipnc+boKCmxQYWmE0x2Wv/4UUCqC+OjAmqWpOzB/1/o
 emUtWsVhzfVF8bN+s6l9MwsYo6BjNORT160G8WqgolrIidNW2+w5IXMJd7RpWWczQP3yI7
 zuoO6g1pVJUizfulBneJmj2GSxucByA=
Message-ID: <e48c53f3-049c-e153-2ae8-59bacafac730@greensocs.com>
Date: Mon, 18 Oct 2021 14:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/1] Add missing function names to symbol list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
 <87ilzcy593.fsf@linaro.org>
 <2cf6222a-7c66-cbbc-a9a2-66c037c62918@greensocs.com>
 <875ytu1spc.fsf@linaro.org>
From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>
In-Reply-To: <875ytu1spc.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.junger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 13:18, Alex Bennée wrote:
> 
> Lukas Jünger <lukas.junger@greensocs.com> writes:
> 
>> On 9/7/21 13:43, Alex Bennée wrote:
>>> Lukas Jünger <lukas.junger@greensocs.com> writes:
>>>
>>>> Hi all,
>>>>
>>>> I have been trying to use the hwprofile and cache plugin on
>>>> qemu-system-riscv64. They failed to load with an undefined
>>>> symbol error. It looks like some of the plugin API functions
>>>> are missing from the symbol list, so I added them.
>>> Heh I had a similar patch in plugins/next but yours includes more
>>> symbols so queued to plugins/next, thanks. Not sure how I missed it
>>> before - I think we might not have been honouring the symbol list
>>> before.
>>>
>>>> Afterwards
>>>> the plugins worked (eventhough the cache plugin is segfaulting
>>>> on shutdown, but that is a separate, unrelated issue).
>>> Has this been tracked down yet? There is a fix f7e68c9c99 (tcg/plugins:
>>> implement a qemu_plugin_user_exit helper) which was for user mode. At
>>> the time I didn't think system mode would be affected due to the atexit
>>> callback only being called once vCPUs had shutdown.
>>
>> It seems like there is a race condition with the tcg threads.
>> The plugin exit handler is run with atexit(). While the exit callback
>> is freeing memory, tcg is still running and memory callbacks write
>> to the already freed data structures in the plugin causing the segfault.
>> I tested this with the current master branch and this cmdline:
> 
> We fixed a bug in linux-user that was leading to the exit callbacks
> being called (see qemu_plugin_user_exit).
> 
>> bin/qemu-system-riscv64 -machine virt -nographic -bios fw_jump.elf
>>      -kernel Image -plugin path/to/libcache.so -d plugin -D log.txt
>>
>> I wonder if we could somehow wait for the tcg to exit before executing
>> plugin exit cb. Do you have an idea?
> 
> It should be because I don't see how TCG would still be running when we
> run the atexit handler. It literally shouldn't be called until QEMU
> itself calls exit which should be well after the TCG has stopped running
> (see pause_all_vcpus).
> 
> Any chance you could replicate and generate a backtrace that shows this
> happening?
> 

I'm on Fedora 34, running:

gdb --args bin/qemu-system-riscv64 -machine virt -nographic -bios 
/home/lukas/work/greensocs/projects/sifive/buildroot-2021.05.1/BUILD/images/fw_jump.elf 
-kernel 
/home/lukas/work/greensocs/projects/sifive/buildroot-2021.05.1/BUILD/images/Image 
-plugin BUILD/contrib/plugins/libcache.so -d plugin -D foo.log

I get:

Thread 1 "qemu-system-ris" received signal SIGSEGV, Segmentation fault.
0x00007ffff76a9571 in unlink_chunk.constprop () from /lib64/libc.so.6
Missing separate debuginfos, use: dnf debuginfo-install 
bzip2-libs-1.0.8-6.fc34.x86_64 glib2-2.68.4-1.fc34.x86_64 
glibc-2.33-20.fc34.x86_64 libblkid-2.36.2-1.fc34.x86_64 
libfdt-1.6.1-1.fc34.x86_64 libffi-3.1-28.fc34.x86_64 
libgcc-11.2.1-1.fc34.x86_64 libgcrypt-1.9.3-3.fc34.x86_64 
libgpg-error-1.42-1.fc34.x86_64 libmount-2.36.2-1.fc34.x86_64 
libpng-1.6.37-10.fc34.x86_64 ncurses-libs-6.2-4.20200222.fc34.x86_64 
pcre-8.44-3.fc34.1.x86_64 pcre2-10.36-4.fc34.x86_64 
pixman-0.40.0-3.fc34.x86_64 zlib-1.2.11-26.fc34.x86_64
(gdb) thread apply all bt

Thread 3 (Thread 0x7ffff6a85640 (LWP 669129) "qemu-system-ris"):
#0  0x00007ffff7bdd1ad in g_mutex_lock () at /lib64/libglib-2.0.so.0
#1  0x00007ffff7fc0e19 in vcpu_mem_access (vcpu_index=0, info=131121, 
vaddr=18446743936379926112, userdata=0x7fff6812dfb0) at 
/home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins/cache.c:395
#2  0x00007fff7021377c in code_gen_buffer ()
#3  0x0000555555c4daf1 in cpu_tb_exec (cpu=0x555556880570, 
itb=0x7fffb020bc40, tb_exit=0x7ffff6a84834) at 
../../../accel/tcg/cpu-exec.c:353
#4  0x0000555555c4e8f2 in cpu_loop_exec_tb (cpu=0x555556880570, 
tb=0x7fffb020bc40, last_tb=0x7ffff6a84840, tb_exit=0x7ffff6a84834) at 
../../../accel/tcg/cpu-exec.c:829
#5  0x0000555555c4ecd7 in cpu_exec (cpu=0x555556880570) at 
../../../accel/tcg/cpu-exec.c:987
#6  0x0000555555c703ca in tcg_cpus_exec (cpu=0x555556880570) at 
../../../accel/tcg/tcg-accel-ops.c:67
#7  0x0000555555c706dc in mttcg_cpu_thread_fn (arg=0x555556880570) at 
../../../accel/tcg/tcg-accel-ops-mttcg.c:70
#8  0x0000555555e2b806 in qemu_thread_start (args=0x5555568a60b0) at 
../../../util/qemu-thread-posix.c:556
#9  0x00007ffff77f9299 in start_thread () at /lib64/libpthread.so.0
#10 0x00007ffff7721353 in clone () at /lib64/libc.so.6

Thread 2 (Thread 0x7ffff7408640 (LWP 669128) "qemu-system-ris"):
#0  0x00007ffff771be0d in syscall () at /lib64/libc.so.6
#1  0x0000555555e2b468 in qemu_futex_wait (f=0x55555663da00 
<rcu_gp_event>, val=4294967295) at 
/home/lukas/work/greensocs/projects/sifive/upstream_qemu/include/qemu/futex.h:29
#2  0x0000555555e2b653 in qemu_event_wait (ev=0x55555663da00 
<rcu_gp_event>) at ../../../util/qemu-thread-posix.c:481
#3  0x0000555555e364a4 in wait_for_readers () at ../../../util/rcu.c:135
#4  0x0000555555e36620 in synchronize_rcu () at ../../../util/rcu.c:171
#5  0x0000555555e367d3 in call_rcu_thread (opaque=0x0) at 
../../../util/rcu.c:265
#6  0x0000555555e2b806 in qemu_thread_start (args=0x555556648860) at 
../../../util/qemu-thread-posix.c:556
#7  0x00007ffff77f9299 in start_thread () at /lib64/libpthread.so.0
#8  0x00007ffff7721353 in clone () at /lib64/libc.so.6

Thread 1 (Thread 0x7ffff740a0c0 (LWP 669123) "qemu-system-ris"):
#0  0x00007ffff76a9571 in unlink_chunk.constprop () at /lib64/libc.so.6
#1  0x00007ffff76a99e1 in _int_free () at /lib64/libc.so.6
#2  0x00007ffff76ad7c8 in free () at /lib64/libc.so.6
#3  0x00007ffff7b9424d in g_free () at /lib64/libglib-2.0.so.0
#4  0x00007ffff7fc11ad in cache_free (cache=0x5555566a1c60) at 
/home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins/cache.c:478
#5  0x00007ffff7fc1231 in caches_free (caches=0x5555568517e0) at 
/home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins/cache.c:494
#6  0x00007ffff7fc18f3 in plugin_exit (id=14580660273623469927, p=0x0) 
at 
/home/lukas/work/greensocs/projects/sifive/upstream_qemu/contrib/plugins/cache.c:616
#7  0x0000555555c6eb0b in plugin_cb__udata (ev=QEMU_PLUGIN_EV_ATEXIT) at 
../../../plugins/core.c:156
#8  0x0000555555c6f7b7 in qemu_plugin_atexit_cb () at 
../../../plugins/core.c:480
#9  0x00007ffff7660af7 in __run_exit_handlers () at /lib64/libc.so.6
#10 0x00007ffff7660ca0 in on_exit () at /lib64/libc.so.6
#11 0x0000555555d78166 in mux_proc_byte (chr=0x555556823400, 
d=0x555556823400, ch=120) at ../../../chardev/char-mux.c:160
#12 0x0000555555d7848b in mux_chr_read (opaque=0x555556823400, 
buf=0x7fffffffd240 "x\353\364UUU", size=1) at 
../../../chardev/char-mux.c:230
#13 0x0000555555d7f882 in qemu_chr_be_write_impl (s=0x555556750540, 
buf=0x7fffffffd240 "x\353\364UUU", len=1) at ../../../chardev/char.c:201
#14 0x0000555555d7f8e6 in qemu_chr_be_write (s=0x555556750540, 
buf=0x7fffffffd240 "x\353\364UUU", len=1) at ../../../chardev/char.c:213
#15 0x0000555555d82476 in fd_chr_read (chan=0x555556649e20, 
cond=G_IO_IN, opaque=0x555556750540) at ../../../chardev/char-fd.c:73
#16 0x0000555555c8abcf in qio_channel_fd_source_dispatch 
(source=0x555556d8c2a0, callback=0x555555d8234c <fd_chr_read>, 
user_data=0x555556750540) at ../../../io/channel-watch.c:84
#17 0x00007ffff7b8f4cf in g_main_context_dispatch () at 
/lib64/libglib-2.0.so.0
#18 0x0000555555e50adb in glib_pollfds_poll () at 
../../../util/main-loop.c:232
#19 0x0000555555e50b58 in os_host_main_loop_wait (timeout=1000000000) at 
../../../util/main-loop.c:255
#20 0x0000555555e50c66 in main_loop_wait (nonblocking=0) at 
../../../util/main-loop.c:531
#21 0x0000555555b5216f in qemu_main_loop () at 
../../../softmmu/runstate.c:726
#22 0x000055555580bcf6 in main (argc=14, argv=0x7fffffffe508, 
envp=0x7fffffffe580) at ../../../softmmu/main.c:50

Hope that helps?

