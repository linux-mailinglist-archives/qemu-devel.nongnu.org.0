Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA42F8D8F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 15:57:59 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0n1Z-0002kb-Nq
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 09:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0n0a-0002AN-BU
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 09:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0n0X-00060s-An
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 09:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610809011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lkgmfn8oXui4J+FYmuxOlNFaAUH1zNBzycVkWIRtNM=;
 b=SE1UoOm4UV8eTzQuCf/OzsbCfAC1Z/xeBcp+xYnKWxSYCrhhBdWb0DMj31lydc92PEU498
 Eapopj/HBJP510kWHG8LtVF0tBMd21vdVfhp9zvBjqxHo3sUaEKF3DfXEv3tdFsqUw3pCk
 R9qfCbouL0LDdkt60igop+BAz8Spdlo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-XeHGkE0HMWmwG8LIvl3Pog-1; Sat, 16 Jan 2021 09:56:49 -0500
X-MC-Unique: XeHGkE0HMWmwG8LIvl3Pog-1
Received: by mail-wm1-f70.google.com with SMTP id f65so107951wmf.2
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 06:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lkgmfn8oXui4J+FYmuxOlNFaAUH1zNBzycVkWIRtNM=;
 b=uYvxoF3AgOYqC1HNLBruSbxN7ka4h/irV4bcJBzBQ4aH7mideIYiPcirUbS4Mt1F/P
 ji9NTsjHQQ3F0ZUayqcO6bdBJQTNy4gOxKHOhu4jTR1FJCmknxNdQeyjl7PYgdGMFEqN
 r3A9Wo/XQ2Hny2dt3OeagbAkfcReOewL2fhu5tHL/+eTjrAA0Kn4Cda4w3CKV9HPWlgf
 0ouFETj2ggB8kZwWY4jgz4gRnOEdRomW3S4jEsWtOKehrazePjwRlvCJu2qg3sl2sMIY
 08xOdi1Yd+ti0woZDODvrM7ltLEJdv1e41j0WS/FWALiP6C49CJf747LvUHiIgcRF8wf
 EoRQ==
X-Gm-Message-State: AOAM530aX06NKECSezynZ63qrgNmCEbrUOxdiTLJDjTX0u09s35f3YPY
 A7dfYWqw6Pk3QYABW5Ee3x2XE98R4XU3Cxyz44XHFQclsVYcNDcHFUcNh5cC3sfyNfjijTAyqld
 bgVA0Oy7jd7BeR3E=
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr13584737wmn.96.1610809008233; 
 Sat, 16 Jan 2021 06:56:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym1BQlI5TFjXWByBlNC+i77wgtXSQoKC6DBHkijJuvUQmKPat9QS7QYJinyDtSCvfi1izrgQ==
X-Received: by 2002:a1c:27c3:: with SMTP id n186mr13584709wmn.96.1610809007870; 
 Sat, 16 Jan 2021 06:56:47 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w18sm18665886wrn.2.2021.01.16.06.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 06:56:47 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
 <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
 <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
 <1969c0a9-d2a0-35cd-98c9-93ec8c810a25@linux.ibm.com>
 <6db4798d-9ec1-9d4a-424e-91ff33ef588e@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a662ba27-253c-d517-2a2d-1afb1ad079bb@redhat.com>
Date: Sat, 16 Jan 2021 15:56:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6db4798d-9ec1-9d4a-424e-91ff33ef588e@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.039, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 1/15/21 8:56 PM, Stefan Berger wrote:
> On 1/15/21 1:40 PM, Stefan Berger wrote:
>> On 1/15/21 11:06 AM, Philippe Mathieu-Daudé wrote:
>>> On 1/15/21 4:53 PM, Stefan Berger wrote:
>>>> On 1/15/21 10:52 AM, Philippe Mathieu-Daudé wrote:
>>>>> Subject is incorrect, this is not a removal of the tests, but
>>>>> removal of their execution. The tests are still in the repository.
>>>>> This is more of a disablement.
>>>> How do you compile / run them to have the LeakSanitizer checks?
>>> I used:
>>>
>>> ../configure --cc=clang --enable-sanitizers && make check-qtest
>>>
>>> $ clang -v
>>> clang version 10.0.1 (Fedora 10.0.1-3.fc32)
>>>
>>> This was previously covered by patchew CI. I just figured
>>> patchew is running without the LeakSanitizer since commit
>>> 6f89ec7442e ("docker: test-debug: disable LeakSanitizer"):
>>>
>>>   docker: test-debug: disable LeakSanitizer
>>>
>>>   There are just too many leaks in device-introspect-test (especially
>>> for
>>>   the plethora of arm and aarch64 boards) to make LeakSanitizer useful;
>>>   disable it for now.
>>>
>> I only get short stack traces:
>>
>>
>> Indirect leak of 852840 byte(s) in 207 object(s) allocated from:
>>     #0 0x561a8c2f8b57 in calloc
>> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>>
>>     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>>     #2 0x561a8c4c2508 in json_parser_parse
>> /home/stefanb/tmp/qemu-tip/build/../qobject/json-parser.c:580:14
>>     #3 0x561a8c4a99aa in json_message_process_token
>> /home/stefanb/tmp/qemu-tip/build/../qobject/json-streamer.c:92:12
>>     #4 0x561a8c4b6cfb in json_lexer_feed_char
>> /home/stefanb/tmp/qemu-tip/build/../qobject/json-lexer.c:313:13
>>
>> Indirect leak of 6624 byte(s) in 207 object(s) allocated from:
>>     #0 0x561a8c2f8b57 in calloc
>> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23fb57)
>>
>>     #1 0x14f0963069b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>>
>> Indirect leak of 1449 byte(s) in 207 object(s) allocated from:
>>     #0 0x561a8c2f899f in malloc
>> (/home/stefanb/tmp/qemu-tip/build/tests/qtest/tpm-crb-swtpm-test+0x23f99f)
>>
>>     #1 0x14f096306958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>>
>> How can I see more of those?
> 
> 
> I now added -fno-omit-frame-pointer to configure (should it not be
> there?) and it now shows some useful stacktraces.

No idea... Cc'ing Marc-André.

If the issue is only with ASan we could add the flag locally
to avoid generic problems with _FORTIFY_SOURCE:

-- >8 --
@@ -5309,6 +5309,9 @@ fi

 if test "$have_asan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
+  if test "$debug" = "no" ; then
+    QEMU_CFLAGS="-fno-omit-frame-pointer $QEMU_CFLAGS"
+  fi
   QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
   if test "$have_asan_iface_h" = "no" ; then
       echo "ASAN build enabled, but ASAN header missing." \
---

> 
> 
> diff --git a/configure b/configure
> index 155dda124c..ed86b5ca32 100755
> --- a/configure
> +++ b/configure
> @@ -5308,7 +5308,7 @@ if test "$gprof" = "yes" ; then
>  fi
> 
>  if test "$have_asan" = "yes"; then
> -  QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
> +  QEMU_CFLAGS="-fsanitize=address -fno-omit-frame-pointer $QEMU_CFLAGS"
>    QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
>    if test "$have_asan_iface_h" = "no" ; then
>        echo "ASAN build enabled, but ASAN header missing." \
> diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
> 
> 
> This is my TPM related fix. Maybe it resolve the issue for you also?

Great, a trivial diff :) I'll try it next week.

> 
> 
> index 5a33a6ef0f..b70cc32d60 100644
> --- a/tests/qtest/tpm-util.c
> +++ b/tests/qtest/tpm-util.c
> @@ -250,7 +250,7 @@ void tpm_util_wait_for_migration_complete(QTestState
> *who)
>          status = qdict_get_str(rsp_return, "status");
>          completed = strcmp(status, "completed") == 0;
>          g_assert_cmpstr(status, !=,  "failed");
> -        qobject_unref(rsp_return);
> +        qobject_unref(rsp);
>          if (completed) {
>              return;
>          }
> 
> Now I see ppc64 related leaks:
> 
> Direct leak of 200 byte(s) in 1 object(s) allocated from:
>     #0 0x14c9b743c837 in __interceptor_calloc (/lib64/libasan.so.6+0xb0837)
>     #1 0x14c9b6e8b9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b0)
>     #2 0x55c5e7130a1a in qemu_init_vcpu ../softmmu/cpus.c:618
>     #3 0x55c5e68b30c0 in ppc_cpu_realize
> ../target/ppc/translate_init.c.inc:10146
>     #4 0x55c5e7539c08 in device_set_realized ../hw/core/qdev.c:761
>     #5 0x55c5e714aa38 in property_set_bool ../qom/object.c:2255
>     #6 0x55c5e7145d52 in object_property_set ../qom/object.c:1400
>     #7 0x55c5e714f99f in object_property_set_qobject
> ../qom/qom-qobject.c:28
>     #8 0x55c5e71465f4 in object_property_set_bool ../qom/object.c:1470
>     #9 0x55c5e666ae21 in spapr_realize_vcpu ../hw/ppc/spapr_cpu_core.c:254
>     #10 0x55c5e666ae21 in spapr_cpu_core_realize
> ../hw/ppc/spapr_cpu_core.c:337
>     #11 0x55c5e7539c08 in device_set_realized ../hw/core/qdev.c:761
>     #12 0x55c5e714aa38 in property_set_bool ../qom/object.c:2255
>     #13 0x55c5e7145d52 in object_property_set ../qom/object.c:1400
>     #14 0x55c5e714f99f in object_property_set_qobject
> ../qom/qom-qobject.c:28
>     #15 0x55c5e71465f4 in object_property_set_bool ../qom/object.c:1470
>     #16 0x55c5e5c7553c in qdev_device_add ../softmmu/qdev-monitor.c:665
>     #17 0x55c5e6fd4cc4 in device_init_func ../softmmu/vl.c:1201
>     #18 0x55c5e78fc7bb in qemu_opts_foreach ../util/qemu-option.c:1147
>     #19 0x55c5e6fc8912 in qemu_create_cli_devices ../softmmu/vl.c:2488
>     #20 0x55c5e6fc8912 in qmp_x_exit_preconfig ../softmmu/vl.c:2527
>     #21 0x55c5e6fcfb4b in qemu_init ../softmmu/vl.c:3533
>     #22 0x55c5e5b18e78 in main ../softmmu/main.c:49
>     #23 0x14c9b50fa041 in __libc_start_main (/lib64/libc.so.6+0x27041)
> 
> [..]

Currently the fuzzed qtests are only reported for X86, so I didn't
bother testing the other targets. Cc'ing qemu-ppc@ however.

Thanks for the quick feedbacks,

Phil.


