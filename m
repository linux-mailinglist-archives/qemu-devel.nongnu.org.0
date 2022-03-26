Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924944E8092
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 12:28:01 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY4aO-0006Ds-3V
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 07:28:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nY4ZI-0005We-4j
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 07:26:52 -0400
Received: from [2607:f8b0:4864:20::42b] (port=36424
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nY4ZG-0002Tr-C8
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 07:26:51 -0400
Received: by mail-pf1-x42b.google.com with SMTP id z16so8633761pfh.3
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SlCyf+n9edHeVdVjt0AdHfJ0O/9PWNeNn66tZdfQi/I=;
 b=nM4bCxFuWVB5givvhfxeFD34r4yRqSY13T6CI5uc5yYk2dtQre95Kq17xeBK0ZTVhu
 PSpKKfghbvGPetdElNk4EIVw2iGTUh0luBGhVt3TTBBljzLFAeMDosRx+bhVireTdUmb
 POqdeHMlW1lMGqGeUofq/86egX10ME5G80MXt1tmA89SIPE1EEyD78OSF97LaSTgMcBb
 elvQiJIgFVc8VBjp4ScBEO4WcsJddcn3fDTMMiW0imwtWTKVEg+yTN4ixVtSjDFH+AEx
 HpfidrpeKrck0CD/WAFuF0IfIv6CJGbON3OM5EV7foCCElpo3sO9xynskb8BARPqFQ3s
 YZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SlCyf+n9edHeVdVjt0AdHfJ0O/9PWNeNn66tZdfQi/I=;
 b=omGhClshp1z8RZXzWU+HfSg7T+fAQVMY93NIs/WRF5R5dGwjw+VStfme5ubkQItYga
 aVAh5wKyGmsCZZu1lW+7/3UDVCkpJyMKL6a9qgQGV4B7iaJ44aDQCCT2xvp9QancjGMw
 S7ha0qi9AKvt6w97yjxNCgktHo3DMXwCoti7tpeqvE3c653v+mpiJWMUcqCPEjHgVXkF
 iCeJ0fq7/ygJtnscdK32CXxLtS4CLqjToAUukAWM0Q3N06b3JlkspBilxTnyAXvkuod2
 iLceC1jQUs9QZR1yJ654DdceuAhhQnm/1F98JJfeWGJA6YTre2gpsGVjIvCK6hGUaPu/
 m4kA==
X-Gm-Message-State: AOAM530F+rjuIxw5tnEH0VZt5VNKpxqkX++ptw7+JtZzMGhf5RRa4eRz
 nBzTCVYoEe3ASog6KGHU+PM=
X-Google-Smtp-Source: ABdhPJx5Lmgj4bd7rpbKwbcFuwiJAsJfio2bVC6o9ZIOnJrgWyhZPbLc3lRuwCkTM0WXHAbYeub9iA==
X-Received: by 2002:a63:b51:0:b0:381:6a51:9481 with SMTP id
 a17-20020a630b51000000b003816a519481mr3116050pgl.582.1648294008515; 
 Sat, 26 Mar 2022 04:26:48 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa78432000000b004fb0a5aa2c7sm6096449pfn.183.2022.03.26.04.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 04:26:47 -0700 (PDT)
Message-ID: <1f1e02c6-d269-4c67-71da-a0da4c328486@gmail.com>
Date: Sat, 26 Mar 2022 20:26:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v3] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/03/26 3:37, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Since commit 0439c5a462 ("block/block-backend.c: assertions for
> block-backend") QEMU crashes when using Cocoa on Darwin hosts.
> 
> Example on macOS:
> 
>    $ qemu-system-i386
>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
>    Abort trap: 6
> 
> Looking with lldb:
> 
>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
>    Process 76914 stopped
>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
>       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>    at block-backend.c:552:5 [opt]
>        549    */
>        550   BlockBackend *blk_all_next(BlockBackend *blk)
>        551   {
>    --> 552       GLOBAL_STATE_CODE();
>        553       return blk ? QTAILQ_NEXT(blk, link)
>        554                  : QTAILQ_FIRST(&block_backends);
>        555   }
>    Target 1: (qemu-system-i386) stopped.
> 
>    (lldb) bt
>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
>       frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
>       frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
>       frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>       frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>     * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at block-backend.c:552:5 [opt]
>       frame #5: 0x00000001003c00b4 qemu-system-i386`blk_all_next(blk=<unavailable>) at block-backend.c:552:5 [opt]
>       frame #6: 0x00000001003d8f04 qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at qapi.c:591:16 [opt]
>       frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>       frame #8: 0x000000010003ab04 qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at cocoa.m:1980:5 [opt]
>       frame #9: 0x00000001012690f4 dyld`start + 520
> 
> As we are in passed release 7.0 hard freeze, disable the block
> backend assertion which, while being valuable during development,
> is not helpful to users. We'll restore this assertion immediately
> once 7.0 is released and work on a fix.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Reword (Akihiko)
> ---
>   include/qemu/main-loop.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 7a4d6a0920..89bd9edefb 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -270,10 +270,23 @@ bool qemu_mutex_iothread_locked(void);
>   bool qemu_in_main_thread(void);
>   
>   /* Mark and check that the function is part of the global state API. */
> +#ifdef CONFIG_COCOA
> +/*
> + * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
> + * a thread different from the QEMU main thread and can not take the BQL,
> + * triggering this assertions in the block layer (commit 0439c5a462).
> + * As the Cocoa fix is not trivial, disable this assertion for the v7.0.0
> + * release (when using Cocoa); we will restore it immediately after the
> + * release.
> + * This issue is tracked as https://gitlab.com/qemu-project/qemu/-/issues/926
> + */
> +#define GLOBAL_STATE_CODE()
> +#else
>   #define GLOBAL_STATE_CODE()                                         \
>       do {                                                            \
>           assert(qemu_in_main_thread());                              \
>       } while (0)
> +#endif /* CONFIG_COCOA */
>   
>   /* Mark and check that the function is part of the I/O API. */
>   #define IO_CODE()                                                   \

