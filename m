Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC394E3D09
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:58:08 +0100 (CET)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcDH-0006g7-RM
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:58:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWcCA-0005z7-5F
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:56:58 -0400
Received: from [2607:f8b0:4864:20::436] (port=42983
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWcC8-0004qj-0s
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:56:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id g19so17816813pfc.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Lyu890gainsaZYMU3NH2X3aGDKZ3gW4C3hXbJypyYtU=;
 b=dm5JfGAwrHxcfErMMCdGMfnZZeX7jHQTDFUjWiYgj+2KzttKUVy20N9aL1KqQpx+yy
 X/5ovNPxbDkXdu46XtZdSPPdbBPop6oyF3UzpA7oC7ZkFJtydoPESP7M+Y6qdYc588OK
 3YqAcxFKP+Du8Ls3vmVSvKqovyakCIhV615jkq3Jaf6yjyGSyFefKexFH1IfcV8JCpyP
 1t6GBK16iq6EHw+kGDLQVX6lnL+cXLTC4VAyWawVU5f5sx15Uof0kcpM9kkDj5v3yqHX
 6U9brHTpPyfi8CKvGLToLNoObfC12eLC68sVzYm4gJKnxfFgqIgqZRu/gaaKty+QuHIJ
 kLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lyu890gainsaZYMU3NH2X3aGDKZ3gW4C3hXbJypyYtU=;
 b=VOIKdrQgbXc6fOyk2o2sJQnnyAQrCTJ77epYb3NVIc5MCdR0DxUeaufUPHC8Xgo1vh
 2i40U7GijJGke6ztiQfCLMl95dx0UUzocffGwntjh2tDqPHQugT/JMEORCd0heh156UA
 GZkgmujJBYV4L8jSQrDSWGwzu3/3uPym8zq5xXNCIr412Uu+vrpkNIE7PN8meYB41faC
 76NOwLqG6i059QYk2urbUSaG+stZkoGGKk5POaX1NKAKDXqH/xaOCuwzFts5IgPEdrKo
 GiE/dQsco5NuVcSvSeb+DMPBXcSXAmogeHIFRkOD9GgTO15brxLI0eoMby/cxgn0rlo5
 IlJg==
X-Gm-Message-State: AOAM533plANQgWOU7su5LPyVoGAPeLWtf8dj32ivhPuI5cUKxvXJ1JEY
 8Hbwdtnn1Sxb3MKN48bJDcs=
X-Google-Smtp-Source: ABdhPJy8KJhmmN0fDnkAtjdlbFUjVXSqbCk103Ve4kqCgvLXhsxdER8udpJtrbZLdeWijMLxUP98uQ==
X-Received: by 2002:a62:e213:0:b0:4fa:6b13:3a9a with SMTP id
 a19-20020a62e213000000b004fa6b133a9amr22964642pfi.18.1647946614519; 
 Tue, 22 Mar 2022 03:56:54 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a056a0022d600b004f7a0b47b0dsm24448884pfj.109.2022.03.22.03.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 03:56:53 -0700 (PDT)
Message-ID: <9ab2deed-c798-057c-681b-5649ac309df0@gmail.com>
Date: Tue, 22 Mar 2022 19:56:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
 <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
 <7ae621b5-7451-4a70-d109-f1adbcdaac68@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <7ae621b5-7451-4a70-d109-f1adbcdaac68@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/22 18:35, Philippe Mathieu-Daudé wrote:
> On 22/3/22 09:32, Paolo Bonzini wrote:
>> On 3/22/22 08:54, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Since commit 0439c5a462 ("block/block-backend.c: assertions for
>>> block-backend") QEMU crashes when using Cocoa on Darwin hosts.
>>>
>>> Example on macOS:
>>>
>>>    $ qemu-system-i386
>>>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, 
>>> file block-backend.c, line 552.
>>>    Abort trap: 6
>>>
>>> Looking with lldb:
>>>
>>>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, 
>>> file block-backend.c, line 552.
>>>    Process 76914 stopped
>>>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit 
>>> program assert
>>>       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>>>    at block-backend.c:552:5 [opt]
>>>        549    */
>>>        550   BlockBackend *blk_all_next(BlockBackend *blk)
>>>        551   {
>>>    --> 552       GLOBAL_STATE_CODE();
>>>        553       return blk ? QTAILQ_NEXT(blk, link)
>>>        554                  : QTAILQ_FIRST(&block_backends);
>>>        555   }
>>>    Target 1: (qemu-system-i386) stopped.
>>>
>>>    (lldb) bt
>>>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit 
>>> program assert
>>>       frame #0: 0x00000001908c99b8 
>>> libsystem_kernel.dylib`__pthread_kill + 8
>>>       frame #1: 0x00000001908fceb0 
>>> libsystem_pthread.dylib`pthread_kill + 288
>>>       frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>>>       frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>>>     * frame #4: 0x000000010057c2d4 
>>> qemu-system-i386`blk_all_next.cold.1 at block-backend.c:552:5 [opt]
>>>       frame #5: 0x00000001003c00b4 
>>> qemu-system-i386`blk_all_next(blk=<unavailable>) at 
>>> block-backend.c:552:5 [opt]
>>>       frame #6: 0x00000001003d8f04 
>>> qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at 
>>> qapi.c:591:16 [opt]
>>>       frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] 
>>> addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>>>       frame #8: 0x000000010003ab04 
>>> qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at 
>>> cocoa.m:1980:5 [opt]
>>>       frame #9: 0x00000001012690f4 dyld`start + 520
>>>
>>> As we are in passed release 7.0 hard freeze, disable the block
>>> backend assertion which, while being valuable during development,
>>> is not helpful to users. We'll restore this assertion immediately
>>> once 7.0 is released and work on a fix.
>>>
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Supersedes: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
>>> ---
>>>   include/qemu/main-loop.h | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
>>> index 7a4d6a0920..48061f736b 100644
>>> --- a/include/qemu/main-loop.h
>>> +++ b/include/qemu/main-loop.h
>>> @@ -270,10 +270,22 @@ bool qemu_mutex_iothread_locked(void);
>>>   bool qemu_in_main_thread(void);
>>>   /* Mark and check that the function is part of the global state 
>>> API. */
>>> +#ifdef CONFIG_COCOA
>>> +/*
>>> + * When using Cocoa ui, addRemovableDevicesMenuItems() calls 
>>> qmp_query_block()
>>> + * while expecting the main thread to still hold the BQL, triggering 
>>> this
>>> + * assertions in the block layer (commit 0439c5a462). As the Cocoa 
>>> fix is not
>>> + * trivial, disable this assertion for the v7.0.0 release when using 
>>> Cocoa; it
>>> + * will be restored immediately after the release. This issue is 
>>> tracked as
>>> + * https://gitlab.com/qemu-project/qemu/-/issues/926
>>> + */
>>> +#define GLOBAL_STATE_CODE()
>>> +#else
>>>   #define GLOBAL_STATE_CODE()                                         \
>>>       do {                                                            \
>>>           assert(qemu_in_main_thread());                              \
>>>       } while (0)
>>> +#endif /* CONFIG_DARWIN */
>>>   /* Mark and check that the function is part of the I/O API. */
>>>   #define IO_CODE()                                                   \
>>
>> I don't know, it seems to me that the reorganized initialization code 
>> had only advantages.
>>
>> For now, it fixes the regression and makes the Cocoa build much more 
>> similar to the others.  There is an easy way to fix the -runas 
>> regression, by moving the code up to the call of -sharedApplication in 
>> cocoa_display_init.
> 
> So the options are:
> 
> #1 disabling the assert for cocoa (this patch)
> 
> #2 run qemu_init() in the main thread​ from Paolo [*] with this (?)
>     patch on top:
> 
> -- >8 --
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index e69ce97f44..867c222e18 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1946,7 +1946,6 @@ static void 
> cocoa_clipboard_request(QemuClipboardInfo *info,
>   int main(int argc, char **argv, char **envp)
>   {
>       COCOA_DEBUG("Entered main()\n");
> -    qemu_event_init(&cbevent, false);
> 
>       /* Takes iothread lock, released in 
> applicationDidFinishLaunching:.  */
>       qemu_init(argc, argv, envp);
> @@ -1958,13 +1957,6 @@ int main(int argc, char **argv, char **envp)
> 
>       NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
> 
> -    // Pull this console process up to being a fully-fledged graphical
> -    // app with a menubar and Dock icon
> -    ProcessSerialNumber psn = { 0, kCurrentProcess };
> -    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
> -
> -    [QemuApplication sharedApplication];
> -
>       create_initial_menus();
> 
>       /*
> @@ -1976,7 +1968,6 @@ int main(int argc, char **argv, char **envp)
>        */
>       add_console_menu_entries();
>       addRemovableDevicesMenuItems();
> -    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
> 
>       // Create an Application controller
>       QemuCocoaAppController *appController = [[QemuCocoaAppController 
> alloc] init];
> @@ -2089,6 +2080,17 @@ static void cocoa_display_init(DisplayState *ds, 
> DisplayOptions *opts)
>       if (opts->u.cocoa.has_left_command_key && 
> !opts->u.cocoa.left_command_key) {
>           left_command_key_enabled = 0;
>       }
> +
> +    qemu_event_init(&cbevent, false);
> +
> +    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
> +
> +    // Pull this console process up to being a fully-fledged graphical
> +    // app with a menubar and Dock icon
> +    ProcessSerialNumber psn = { 0, kCurrentProcess };
> +    TransformProcessType(&psn, kProcessTransformToForegroundApplication);
> +
> +    [QemuApplication sharedApplication];

I think the changes for cbevent and cbowner are irrelevant, but 
basically this should do.

>   }
> 
> ---
> 
> # 3 "Create menus in iothread" approach from Akihiko:
> https://lore.kernel.org/qemu-devel/20220321041043.24112-1-akihiko.odaki@gmail.com/ 
> 
> 
> Is that correct? (#2 patch and the 3 different options)
> 
> What is preferred between #2 and #3? I don't have enough knowledge to
> take the decision, which is why I suggested the chicken-hearted "disable
> assert" option #1.

#2 can help allowing ui/cocoa to live in the same binary with ui/gtk and 
ui/sdl2 in the future and I believe it should be eventually (possible 
after 7.0) done, but requires relatively large code change.

#3 aims to solve only the problem with iothread dependency when creating 
menus and its scope of modification is minimal. It is concerned that #3 
may confuse developers since it touches Cocoa interfaces from iothread 
although it is still according to its API convention.

I'm pretty sure both of #2 and #3 work, but I would like to rather 
insist #1 as the safest. As a developer, I don't want see such an ugly 
workaround like #1 of course, but such feeling does not matter much in 
practice. On the other hand, having the entire next release cycle for 
testing #2 is a real advantage even if the possibility of discovering a 
new problem is very tiny.

Regards,
Akihiko Odaki

> 
> Thanks,
> 
> Phil.
> 
> [*] 
> https://lore.kernel.org/qemu-devel/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/ 
> 


