Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BD533478
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 02:49:07 +0200 (CEST)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntfCz-0002Gg-IR
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 20:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ntf9W-0001JH-B1
 for qemu-devel@nongnu.org; Tue, 24 May 2022 20:45:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39314 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ntf9Q-0008N7-3d
 for qemu-devel@nongnu.org; Tue, 24 May 2022 20:45:29 -0400
Received: from [192.168.199.219] (unknown [114.250.136.244])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxn+YMfI1ijbEAAA--.5679S3;
 Wed, 25 May 2022 08:45:00 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------8MQcNw9xvXySgvr68j6u09O5"
Message-ID: <7cbb6328-2802-b0ed-b143-16c31cf42b82@loongson.cn>
Date: Wed, 25 May 2022 08:44:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 00/43] Add LoongArch softmmu support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
 <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
 <5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
In-Reply-To: <5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org>
X-CM-TRANSID: AQAAf9Cxn+YMfI1ijbEAAA--.5679S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww43Gw4xXw4xWF1fur4fGrg_yoWxWFy5pr
 97JryxGrW8W3y8Gr4xG3W0qFyrJr18A3WUJF18KFyUtr9xGryjvr1DXryqgFnrGFs7Zr17
 Jr17JryYvr1UJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
 WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2
 z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67
 IIx4CEVc8vx2IErcIFxwCjr7xvwVCIw2I0I7xG6c02F41lc7I2V7IY0VAS07AlzVAYIcxG
 8wCY02Avz4vE14v_twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JUk-B_UUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------8MQcNw9xvXySgvr68j6u09O5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/5/25 6:41, Richard Henderson 写道:
> On 5/24/22 15:32, Richard Henderson wrote:
>> When the syntax errors are fixed, it does not pass "make check".
>
> When I configure with --enable-debug --enable-sanitizers I get
>
I got the same error.

The 'make check '  result:

Summary of Failures:

  95/117 qemu:qtest+qtest-loongarch64 / 
qtest-loongarch64/device-introspect-test ERROR           1.20s killed by 
signal 6 SIGABRT
Ok:                 114
Expected Fail:      0
Fail:               1
Unexpected Pass:    0
Skipped:            2
Timeout:            0


We will fix this error as soon as possible.  And  what necessary tests 
do we need to do?
'mak check-tcg' ,  'make check' and 'make docker-test-build',  these are 
we know so far.

I also see the wiki  [1],   should  we need tests all of them? Could you 
give us some advice?
[1] : https://wiki.qemu.org/Testing#Tests_included_in_the_QEMU_source

Thanks.
Xiaojuan


> $ QTEST_QEMU_BINARY='./qemu-system-loongarch64' 
> ./tests/qtest/device-introspect-test -v
> ...
> # Testing device 'loongarch_ipi'
>
> =================================================================
>
> ==911066==ERROR: AddressSanitizer: heap-buffer-overflow on address 
> 0x613000093550 at pc 0x7f97cb425c23 bp 0x7ffe6583f4f0 sp 0x7ffe6583ec98
>
> WRITE of size 8 at 0x613000093550 thread T0
>
>     #0 0x7f97cb425c22 in __interceptor_memset 
> ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799
>
>     #1 0x562b21b23916 in qdev_init_gpio_out_named 
> ../qemu/hw/core/gpio.c:85
>
>     #2 0x562b21b23b89 in qdev_init_gpio_out ../qemu/hw/core/gpio.c:101
>
>     #3 0x562b22562d77 in loongarch_ipi_init 
> ../qemu/hw/intc/loongarch_ipi.c:187
>
>     #4 0x562b22992ef0 in object_init_with_type ../qemu/qom/object.c:377
>
>     #5 0x562b2299445f in object_initialize_with_type 
> ../qemu/qom/object.c:519
>
>     #6 0x562b22995b54 in object_new_with_type ../qemu/qom/object.c:734
>
>     #7 0x562b22995c6d in object_new ../qemu/qom/object.c:749
>
>     #8 0x562b22ddc1d3 in qmp_device_list_properties 
> ../qemu/qom/qom-qmp-cmds.c:146
>
>     #9 0x562b22f4ad2c in qmp_marshal_device_list_properties 
> qapi/qapi-commands-qdev.c:66
>
>     #10 0x562b22fa7ab6 in do_qmp_dispatch_bh 
> ../qemu/qapi/qmp-dispatch.c:128
>
>     #11 0x562b230354b1 in aio_bh_call ../qemu/util/async.c:142
>
>     #12 0x562b23035c09 in aio_bh_poll ../qemu/util/async.c:170
>
>     #13 0x562b22fd6531 in aio_dispatch ../qemu/util/aio-posix.c:421
>
>     #14 0x562b2303714c in aio_ctx_dispatch ../qemu/util/async.c:312
>
>     #15 0x7f97caafdd1a in g_main_dispatch ../../../glib/gmain.c:3417
>
>     #16 0x7f97caafdd1a in g_main_context_dispatch 
> ../../../glib/gmain.c:4135
>
>     #17 0x562b23089479 in glib_pollfds_poll ../qemu/util/main-loop.c:297
>
>     #18 0x562b23089663 in os_host_main_loop_wait 
> ../qemu/util/main-loop.c:320
>
>     #19 0x562b23089968 in main_loop_wait ../qemu/util/main-loop.c:596
>
>     #20 0x562b2223edf5 in qemu_main_loop ../qemu/softmmu/runstate.c:726
>
>     #21 0x562b21965c69 in qemu_main ../qemu/softmmu/main.c:36
>
>     #22 0x562b21965c9e in main ../qemu/softmmu/main.c:45
>
>     #23 0x7f97c9354d8f in __libc_start_call_main 
> ../sysdeps/nptl/libc_start_call_main.h:58
>
>     #24 0x7f97c9354e3f in __libc_start_main_impl ../csu/libc-start.c:392
>
>     #25 0x562b21965b74 in _start 
> (/home/rth/chroot-home/bld-x/qemu-system-loongarch64+0x21b0b74)
>
>
>
> 0x613000093550 is located 48 bytes to the left of 376-byte region 
> [0x613000093580,0x6130000936f8)
>
> allocated by thread T0 here:
>
>     #0 0x7f97cb4a0a37 in __interceptor_calloc 
> ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154
>
>     #1 0x7f97cab06c40 in g_malloc0 ../../../glib/gmem.c:155
>
>     #2 0x562b2298fef0 in type_register_internal ../qemu/qom/object.c:143
>
>     #3 0x562b2298ffcd in type_register ../qemu/qom/object.c:152
>
>     #4 0x562b2199c281 in qemu_console_early_init 
> ../qemu/ui/console.c:2719
>
>     #5 0x562b2224d16e in qemu_create_early_backends 
> ../qemu/softmmu/vl.c:1975
>
>     #6 0x562b222565ef in qemu_init ../qemu/softmmu/vl.c:3674
>
>     #7 0x562b21965c64 in qemu_main ../qemu/softmmu/main.c:35
>
>     #8 0x562b21965c9e in main ../qemu/softmmu/main.c:45
>
>     #9 0x7f97c9354d8f in __libc_start_call_main 
> ../sysdeps/nptl/libc_start_call_main.h:58
>
>
>
> SUMMARY: AddressSanitizer: heap-buffer-overflow 
> ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799 
> in __interceptor_memset
>
> Shadow bytes around the buggy address:
>
>   0x0c268000a650: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
>   0x0c268000a660: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
>
>   0x0c268000a670: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
>
>   0x0c268000a680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
>   0x0c268000a690: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
> =>0x0c268000a6a0: 00 00 00 00 fa fa fa fa fa fa[fa]fa fa fa fa fa
>
>   0x0c268000a6b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
>   0x0c268000a6c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
>   0x0c268000a6d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
>
>   0x0c268000a6e0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
>
>   0x0c268000a6f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
> Shadow byte legend (one shadow byte represents 8 application bytes):
>
>   Addressable:           00
>
>   Partially addressable: 01 02 03 04 05 06 07
>
>   Heap left redzone:       fa
>
>   Freed heap region:       fd
>
>   Stack left redzone:      f1
>
>   Stack mid redzone:       f2
>
>   Stack right redzone:     f3
>
>   Stack after return:      f5
>
>   Stack use after scope:   f8
>
>   Global redzone:          f9
>
>   Global init order:       f6
>
>   Poisoned by user:        f7
>
>   Container overflow:      fc
>
>   Array cookie:            ac
>
>   Intra object redzone:    bb
>
>   ASan internal:           fe
>
>   Left alloca redzone:     ca
>
>   Right alloca redzone:    cb
>
>   Shadow gap:              cc
>
> ==911066==ABORTING
>
>
>
--------------8MQcNw9xvXySgvr68j6u09O5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/5/25 6:41, Richard Henderson 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org">On
      5/24/22 15:32, Richard Henderson wrote:
      <br>
      <blockquote type="cite">When the syntax errors are fixed, it does
        not pass "make check".
        <br>
      </blockquote>
      <br>
      When I configure with --enable-debug --enable-sanitizers I get
      <br>
      <br>
    </blockquote>
    I got the same error. <br>
    <p>The 'make check '  result:</p>
    <p><font size="2">Summary of Failures:</font></p>
    <font size="2"> 95/117 qemu:qtest+qtest-loongarch64 /
      qtest-loongarch64/device-introspect-test ERROR           1.20s  
      killed by signal 6 SIGABRT<br>
      Ok:                 114 <br>
      Expected Fail:      0   <br>
      Fail:               1   <br>
      Unexpected Pass:    0   <br>
      Skipped:            2   <br>
      Timeout:            0   </font>
    <p><br>
    </p>
    We will fix this error as soon as possible.  And  what necessary
    tests do we need to do?   <br>
    'mak check-tcg' ,  'make check' and 'make docker-test-build',  these
    are we know so far.<br>
    <br>
    I also see the wiki  [1],   should  we need tests all of them?   
    Could you give us some advice?<br>
    [1] :
    <a class="moz-txt-link-freetext" href="https://wiki.qemu.org/Testing#Tests_included_in_the_QEMU_source">https://wiki.qemu.org/Testing#Tests_included_in_the_QEMU_source</a><br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org">$
      QTEST_QEMU_BINARY='./qemu-system-loongarch64'
      ./tests/qtest/device-introspect-test -v
      <br>
      ...
      <br>
      # Testing device 'loongarch_ipi'
      <br>
      <br>
      =================================================================
      <br>
      <br>
      ==911066==ERROR: AddressSanitizer: heap-buffer-overflow on address
      0x613000093550 at pc 0x7f97cb425c23 bp 0x7ffe6583f4f0 sp
      0x7ffe6583ec98
      <br>
      <br>
      WRITE of size 8 at 0x613000093550 thread T0
      <br>
      <br>
          #0 0x7f97cb425c22 in __interceptor_memset
../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799<br>
      <br>
          #1 0x562b21b23916 in qdev_init_gpio_out_named
      ../qemu/hw/core/gpio.c:85
      <br>
      <br>
          #2 0x562b21b23b89 in qdev_init_gpio_out
      ../qemu/hw/core/gpio.c:101
      <br>
      <br>
          #3 0x562b22562d77 in loongarch_ipi_init
      ../qemu/hw/intc/loongarch_ipi.c:187
      <br>
      <br>
          #4 0x562b22992ef0 in object_init_with_type
      ../qemu/qom/object.c:377
      <br>
      <br>
          #5 0x562b2299445f in object_initialize_with_type
      ../qemu/qom/object.c:519
      <br>
      <br>
          #6 0x562b22995b54 in object_new_with_type
      ../qemu/qom/object.c:734
      <br>
      <br>
          #7 0x562b22995c6d in object_new ../qemu/qom/object.c:749
      <br>
      <br>
          #8 0x562b22ddc1d3 in qmp_device_list_properties
      ../qemu/qom/qom-qmp-cmds.c:146
      <br>
      <br>
          #9 0x562b22f4ad2c in qmp_marshal_device_list_properties
      qapi/qapi-commands-qdev.c:66
      <br>
      <br>
          #10 0x562b22fa7ab6 in do_qmp_dispatch_bh
      ../qemu/qapi/qmp-dispatch.c:128
      <br>
      <br>
          #11 0x562b230354b1 in aio_bh_call ../qemu/util/async.c:142
      <br>
      <br>
          #12 0x562b23035c09 in aio_bh_poll ../qemu/util/async.c:170
      <br>
      <br>
          #13 0x562b22fd6531 in aio_dispatch
      ../qemu/util/aio-posix.c:421
      <br>
      <br>
          #14 0x562b2303714c in aio_ctx_dispatch
      ../qemu/util/async.c:312
      <br>
      <br>
          #15 0x7f97caafdd1a in g_main_dispatch
      ../../../glib/gmain.c:3417
      <br>
      <br>
          #16 0x7f97caafdd1a in g_main_context_dispatch
      ../../../glib/gmain.c:4135
      <br>
      <br>
          #17 0x562b23089479 in glib_pollfds_poll
      ../qemu/util/main-loop.c:297
      <br>
      <br>
          #18 0x562b23089663 in os_host_main_loop_wait
      ../qemu/util/main-loop.c:320
      <br>
      <br>
          #19 0x562b23089968 in main_loop_wait
      ../qemu/util/main-loop.c:596
      <br>
      <br>
          #20 0x562b2223edf5 in qemu_main_loop
      ../qemu/softmmu/runstate.c:726
      <br>
      <br>
          #21 0x562b21965c69 in qemu_main ../qemu/softmmu/main.c:36
      <br>
      <br>
          #22 0x562b21965c9e in main ../qemu/softmmu/main.c:45
      <br>
      <br>
          #23 0x7f97c9354d8f in __libc_start_call_main
      ../sysdeps/nptl/libc_start_call_main.h:58
      <br>
      <br>
          #24 0x7f97c9354e3f in __libc_start_main_impl
      ../csu/libc-start.c:392
      <br>
      <br>
          #25 0x562b21965b74 in _start
      (/home/rth/chroot-home/bld-x/qemu-system-loongarch64+0x21b0b74)
      <br>
      <br>
      <br>
      <br>
      0x613000093550 is located 48 bytes to the left of 376-byte region
      [0x613000093580,0x6130000936f8)
      <br>
      <br>
      allocated by thread T0 here:
      <br>
      <br>
          #0 0x7f97cb4a0a37 in __interceptor_calloc
      ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154
      <br>
      <br>
          #1 0x7f97cab06c40 in g_malloc0 ../../../glib/gmem.c:155
      <br>
      <br>
          #2 0x562b2298fef0 in type_register_internal
      ../qemu/qom/object.c:143
      <br>
      <br>
          #3 0x562b2298ffcd in type_register ../qemu/qom/object.c:152
      <br>
      <br>
          #4 0x562b2199c281 in qemu_console_early_init
      ../qemu/ui/console.c:2719
      <br>
      <br>
          #5 0x562b2224d16e in qemu_create_early_backends
      ../qemu/softmmu/vl.c:1975
      <br>
      <br>
          #6 0x562b222565ef in qemu_init ../qemu/softmmu/vl.c:3674
      <br>
      <br>
          #7 0x562b21965c64 in qemu_main ../qemu/softmmu/main.c:35
      <br>
      <br>
          #8 0x562b21965c9e in main ../qemu/softmmu/main.c:45
      <br>
      <br>
          #9 0x7f97c9354d8f in __libc_start_call_main
      ../sysdeps/nptl/libc_start_call_main.h:58
      <br>
      <br>
      <br>
      <br>
      SUMMARY: AddressSanitizer: heap-buffer-overflow
../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799
      in __interceptor_memset
      <br>
      <br>
      Shadow bytes around the buggy address:
      <br>
      <br>
        0x0c268000a650: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a660: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
      <br>
      <br>
        0x0c268000a670: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a690: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
      =&gt;0x0c268000a6a0: 00 00 00 00 fa fa fa fa fa fa[fa]fa fa fa fa
      fa
      <br>
      <br>
        0x0c268000a6b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a6c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a6d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa
      <br>
      <br>
        0x0c268000a6e0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00
      <br>
      <br>
        0x0c268000a6f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
      <br>
      <br>
      Shadow byte legend (one shadow byte represents 8 application
      bytes):
      <br>
      <br>
        Addressable:           00
      <br>
      <br>
        Partially addressable: 01 02 03 04 05 06 07
      <br>
      <br>
        Heap left redzone:       fa
      <br>
      <br>
        Freed heap region:       fd
      <br>
      <br>
        Stack left redzone:      f1
      <br>
      <br>
        Stack mid redzone:       f2
      <br>
      <br>
        Stack right redzone:     f3
      <br>
      <br>
        Stack after return:      f5
      <br>
      <br>
        Stack use after scope:   f8
      <br>
      <br>
        Global redzone:          f9
      <br>
      <br>
        Global init order:       f6
      <br>
      <br>
        Poisoned by user:        f7
      <br>
      <br>
        Container overflow:      fc
      <br>
      <br>
        Array cookie:            ac
      <br>
      <br>
        Intra object redzone:    bb
      <br>
      <br>
        ASan internal:           fe
      <br>
      <br>
        Left alloca redzone:     ca
      <br>
      <br>
        Right alloca redzone:    cb
      <br>
      <br>
        Shadow gap:              cc
      <br>
      <br>
      ==911066==ABORTING
      <br>
      <br>
      <br>
        <br>
    </blockquote>
  </body>
</html>

--------------8MQcNw9xvXySgvr68j6u09O5--


