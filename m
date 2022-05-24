Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1F53339E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:43:16 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdFD-0006WV-K4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntdDn-0005p9-Ap
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:41:47 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntdDl-0002MM-IP
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:41:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id 31so17429482pgp.8
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=tR0oYCg8yKeFNoCMls20gUvq06/nxMREZzfSWoPOxWw=;
 b=qSOf9D6GVInGPiEFQTbIgHgY59g28Ix2AMmQWDBj2x206Ga22ESHSYbXvnlqxn4bDd
 dfKkFQhXxXamiOCyvyD0VnTiUzMYfn1tELx40jnEF7r8Wd8p88IBZaYEsNA2u9A3DyXz
 XfXI6NRLru/vKvnn3GEdRwKbCcQMA2iLNiqu/yHMqNCoz/H2hNHS7rQrXlrRZFKy7hDm
 I3p6xAgSu+fswiIOPrEimVRBIs3/2w6d0U3NM9xVLbRDCUOxbrUoC91CgXdestJONKpS
 ypVVtH33s/kJp1QIweSZN78kpxOK4IHo+TduBeRGfF/Rp319s1JJQ9122zf5KJCZQ0Af
 G6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=tR0oYCg8yKeFNoCMls20gUvq06/nxMREZzfSWoPOxWw=;
 b=muMbmpqA1k51M41FZrWdqZbujEw/opjNhcWgIsnzeuiG5T7xP6669H8yl1JmNB+Kem
 MulMdPNiuhyRWIEauHH1pDhYCCTIbnG54axn9mJbfJnm7N5Fr1JYfnq/JtFiHOGxpQja
 R6yDJq5QMl5O8edj6Ew0mrN/kOvGfEYHvqBalNXR+Hox0ExfCs/+BXFPC9cRCeee5tWm
 9bVxk7Wg6K81hTwfebMFInsXDWBiiUhZr49l3efjJlxfHIRVvDgOgHuCYP2g9/OdpJNy
 MwKL/mTP8UB/goh9TK8bSrju4NkFkoUmc3BRYyzYqJIF6d7aPpP0FgGgYwPrU0GLou5U
 SQCA==
X-Gm-Message-State: AOAM533M9BlplLYmYlibe0voO1RoQstVF9y4Pxf4h4eX7ZIDbXFL729n
 DiXkJFJlTIjH2ef7cYZJDFKQXw==
X-Google-Smtp-Source: ABdhPJx8Y+mzOpjzVbq3CW2jBZuFvWJsu8DID4fRI2bhpotQFgttn0TYYaNTVXPbj4qsGmCDlu565g==
X-Received: by 2002:a05:6a00:22d2:b0:518:97ee:8609 with SMTP id
 f18-20020a056a0022d200b0051897ee8609mr13833653pfj.80.1653432103592; 
 Tue, 24 May 2022 15:41:43 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a62d453000000b0050dc7628182sm10152594pfl.92.2022.05.24.15.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 15:41:42 -0700 (PDT)
Message-ID: <5018d8c0-7cbf-e63f-286e-f0aa8b8e4e86@linaro.org>
Date: Tue, 24 May 2022 15:41:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/43] Add LoongArch softmmu support
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
 <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
In-Reply-To: <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/24/22 15:32, Richard Henderson wrote:
> When the syntax errors are fixed, it does not pass "make check".

When I configure with --enable-debug --enable-sanitizers I get

$ QTEST_QEMU_BINARY='./qemu-system-loongarch64' ./tests/qtest/device-introspect-test -v
...
# Testing device 'loongarch_ipi'

=================================================================

==911066==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x613000093550 at pc 
0x7f97cb425c23 bp 0x7ffe6583f4f0 sp 0x7ffe6583ec98

WRITE of size 8 at 0x613000093550 thread T0

     #0 0x7f97cb425c22 in __interceptor_memset 
../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799

     #1 0x562b21b23916 in qdev_init_gpio_out_named ../qemu/hw/core/gpio.c:85

     #2 0x562b21b23b89 in qdev_init_gpio_out ../qemu/hw/core/gpio.c:101

     #3 0x562b22562d77 in loongarch_ipi_init ../qemu/hw/intc/loongarch_ipi.c:187

     #4 0x562b22992ef0 in object_init_with_type ../qemu/qom/object.c:377

     #5 0x562b2299445f in object_initialize_with_type ../qemu/qom/object.c:519

     #6 0x562b22995b54 in object_new_with_type ../qemu/qom/object.c:734

     #7 0x562b22995c6d in object_new ../qemu/qom/object.c:749

     #8 0x562b22ddc1d3 in qmp_device_list_properties ../qemu/qom/qom-qmp-cmds.c:146

     #9 0x562b22f4ad2c in qmp_marshal_device_list_properties qapi/qapi-commands-qdev.c:66

     #10 0x562b22fa7ab6 in do_qmp_dispatch_bh ../qemu/qapi/qmp-dispatch.c:128

     #11 0x562b230354b1 in aio_bh_call ../qemu/util/async.c:142

     #12 0x562b23035c09 in aio_bh_poll ../qemu/util/async.c:170

     #13 0x562b22fd6531 in aio_dispatch ../qemu/util/aio-posix.c:421

     #14 0x562b2303714c in aio_ctx_dispatch ../qemu/util/async.c:312

     #15 0x7f97caafdd1a in g_main_dispatch ../../../glib/gmain.c:3417

     #16 0x7f97caafdd1a in g_main_context_dispatch ../../../glib/gmain.c:4135

     #17 0x562b23089479 in glib_pollfds_poll ../qemu/util/main-loop.c:297

     #18 0x562b23089663 in os_host_main_loop_wait ../qemu/util/main-loop.c:320

     #19 0x562b23089968 in main_loop_wait ../qemu/util/main-loop.c:596

     #20 0x562b2223edf5 in qemu_main_loop ../qemu/softmmu/runstate.c:726

     #21 0x562b21965c69 in qemu_main ../qemu/softmmu/main.c:36

     #22 0x562b21965c9e in main ../qemu/softmmu/main.c:45

     #23 0x7f97c9354d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58

     #24 0x7f97c9354e3f in __libc_start_main_impl ../csu/libc-start.c:392

     #25 0x562b21965b74 in _start 
(/home/rth/chroot-home/bld-x/qemu-system-loongarch64+0x21b0b74)



0x613000093550 is located 48 bytes to the left of 376-byte region 
[0x613000093580,0x6130000936f8)

allocated by thread T0 here:

     #0 0x7f97cb4a0a37 in __interceptor_calloc 
../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:154

     #1 0x7f97cab06c40 in g_malloc0 ../../../glib/gmem.c:155

     #2 0x562b2298fef0 in type_register_internal ../qemu/qom/object.c:143

     #3 0x562b2298ffcd in type_register ../qemu/qom/object.c:152

     #4 0x562b2199c281 in qemu_console_early_init ../qemu/ui/console.c:2719

     #5 0x562b2224d16e in qemu_create_early_backends ../qemu/softmmu/vl.c:1975

     #6 0x562b222565ef in qemu_init ../qemu/softmmu/vl.c:3674

     #7 0x562b21965c64 in qemu_main ../qemu/softmmu/main.c:35

     #8 0x562b21965c9e in main ../qemu/softmmu/main.c:45

     #9 0x7f97c9354d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58



SUMMARY: AddressSanitizer: heap-buffer-overflow 
../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:799 in 
__interceptor_memset

Shadow bytes around the buggy address:

   0x0c268000a650: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

   0x0c268000a660: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa

   0x0c268000a670: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00

   0x0c268000a680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

   0x0c268000a690: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

=>0x0c268000a6a0: 00 00 00 00 fa fa fa fa fa fa[fa]fa fa fa fa fa

   0x0c268000a6b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

   0x0c268000a6c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

   0x0c268000a6d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa

   0x0c268000a6e0: fa fa fa fa fa fa fa fa 00 00 00 00 00 00 00 00

   0x0c268000a6f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Shadow byte legend (one shadow byte represents 8 application bytes):

   Addressable:           00

   Partially addressable: 01 02 03 04 05 06 07

   Heap left redzone:       fa

   Freed heap region:       fd

   Stack left redzone:      f1

   Stack mid redzone:       f2

   Stack right redzone:     f3

   Stack after return:      f5

   Stack use after scope:   f8

   Global redzone:          f9

   Global init order:       f6

   Poisoned by user:        f7

   Container overflow:      fc

   Array cookie:            ac

   Intra object redzone:    bb

   ASan internal:           fe

   Left alloca redzone:     ca

   Right alloca redzone:    cb

   Shadow gap:              cc

==911066==ABORTING



r~

