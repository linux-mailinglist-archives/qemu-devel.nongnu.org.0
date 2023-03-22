Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9886C485E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewAJ-0005yo-1B; Wed, 22 Mar 2023 06:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewAG-0005yO-P1
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:57:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewAE-0001Bh-Ij
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:57:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v1so10441593wrv.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679482673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=INcR64Rt0QDCZYXn5pYcgy52RtwXtHQx+iTvo3+eCQA=;
 b=rdGWXySZsto+5cZqq3/71MGF+IzsEuN3MIN+L7T0M9xLe4jZn7DUwzy0c8huaBCQsz
 zJNbihD7F5klzqXZc/PVUHBrBhNfQx1B+a+YDeoPptP9Dyy/3IyI7y0OxlrN6jS5x4gZ
 4NVWqVV7uKGICvTOQ9cob2cnrCOW6LEk+DX2GmR6s5MXDd47hm4ubQK3p4vKbAW81iuV
 DyUyvMDYrkAQWG8Jn51ZGMgdKV4vzqYBEWm9v53k8YJ4OSSeYEgmjl6U1otBYc+QJum0
 9Q2zgB3y78/xE//MQEl3khFm/PHdJ2eHvXM5bQW2pVVChcm2oUDthcwkHIKVlvEZ3tJL
 biYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=INcR64Rt0QDCZYXn5pYcgy52RtwXtHQx+iTvo3+eCQA=;
 b=dz/uVTlech3kpBQ56fEFzkId7rkax9/Kf5Kb3sTB6jMZ3tQUSsgafjO9JSHRDrJjNl
 IfgR7Xvvh/ZjZz7p22Bt6dGbLjrLCXTEpWlYDbD6VwpY0cae0Z4v3SdjB4oDwRLK04Wv
 IobImJc2bPsBOTco0tJNRMDqfFdra7OQ69ScYPpLrssftnpsbhOPA93tKTAopJGKVlz1
 Io5u7hJsdk6AohfGQQEPqi3TnoZe/YfYKr1YRbyDTwlOqmbUgzjYWxV2rY4LPRA7ho+g
 5HgfqdVCysUC6HXlCtdpLZjCaXjUHOT6ffo815ezU9I/bCOBfaUH6AagDPeUB9rEmaj0
 QJbQ==
X-Gm-Message-State: AO0yUKVOB/e6DS2CEJfzeQhVDm3OefuurmYgXEGWFhL4w7kpjj5pjG5R
 qIrkeW9lkIP1N4c8n+Q0PnDGEA==
X-Google-Smtp-Source: AK7set/ZwcCbyDTe1j0u362qPqYoiV327EDWCNHU9RKc01k3OA1nT8syaACZZPgM10+BLkNzNZJHug==
X-Received: by 2002:adf:e484:0:b0:2cf:e3c7:5975 with SMTP id
 i4-20020adfe484000000b002cfe3c75975mr1497398wrm.34.1679482672875; 
 Wed, 22 Mar 2023 03:57:52 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600010c900b002c7163660a9sm13562316wrx.105.2023.03.22.03.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:57:52 -0700 (PDT)
Message-ID: <4b8292bf-fbb3-aed9-23f3-7b079d3d5298@linaro.org>
Date: Wed, 22 Mar 2023 11:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ui/spice: fix compilation on win32
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
 <c2c4b00e-53b8-0205-e627-93860bb67720@linaro.org>
 <CAJ+F1C+Ge1v+F_D5_NzMSu1ZAocRQdzyuUHApFwfz_VzBYRdGg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1C+Ge1v+F_D5_NzMSu1ZAocRQdzyuUHApFwfz_VzBYRdGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/3/23 11:22, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 22, 2023 at 1:01 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 22/3/23 08:52, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> qemu_close_to_socket() renaming left-over.
>>>
>>> Fixes:
>>> https://gitlab.com/qemu-project/qemu/-/issues/1553
>>>
>>> Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    ui/spice-core.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/ui/spice-core.c b/ui/spice-core.c
>>> index 67cfd3ca9c..52a59386d7 100644
>>> --- a/ui/spice-core.c
>>> +++ b/ui/spice-core.c
>>> @@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
>>>        qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
>>>    #ifdef WIN32
>>>        /* SOCKET is owned by spice */
>>> -    qemu_close_to_socket(watch->fd);
>>> +    qemu_close_socket_osfhandle(watch->fd);
>>>    #endif
>>>        g_free(watch);
>>>    }
>>
>> Wondering why this hasn't been caught by CI, apparently we miss
>> the spice package:
>>
>> -- >8 --
>> diff --git a/.cirrus.yml b/.cirrus.yml
>> @@ -41,6 +41,7 @@ windows_msys2_task:
>>          mingw-w64-x86_64-curl
>>          mingw-w64-x86_64-gnutls
>>          mingw-w64-x86_64-libnfs
>> +      mingw-w64-x86_64-spice
>>        "
>>        CHERE_INVOKING: 1
>>      msys2_cache:
>> ---
> 
> Can you send a patch? I will trigger CI to check it.

I was waiting the job to complete. It is sufficient to reproduce:

[1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
FAILED: libcommon.fa.p/ui_spice-core.c.obj
"cc" "-m64" "-mcx16" "-Ilibcommon.fa.p" "-I../dtc/libfdt" 
"-IC:/tools/msys64/mingw64/include/pixman-1" 
"-IC:/tools/msys64/mingw64/include/libpng16" 
"-IC:/tools/msys64/mingw64/include/spice-server" 
"-IC:/tools/msys64/mingw64/include/spice-1" 
"-IC:/tools/msys64/mingw64/include/glib-2.0" 
"-IC:/tools/msys64/mingw64/lib/glib-2.0/include" 
"-IC:/tools/msys64/mingw64/include/p11-kit-1" 
"-IC:/tools/msys64/mingw64/include/SDL2" 
"-IC:/tools/msys64/mingw64/include/ncursesw" 
"-IC:/tools/msys64/mingw64/include/gtk-3.0" 
"-IC:/tools/msys64/mingw64/include/pango-1.0" 
"-IC:/tools/msys64/mingw64/include/harfbuzz" 
"-IC:/tools/msys64/mingw64/include/freetype2" 
"-IC:/tools/msys64/mingw64/include/fribidi" 
"-IC:/tools/msys64/mingw64/include/cairo" 
"-IC:/tools/msys64/mingw64/include/gdk-pixbuf-2.0" 
"-IC:/tools/msys64/mingw64/include/webp" 
"-IC:/tools/msys64/mingw64/include/atk-1.0" 
"-IC:/tools/msys64/mingw64/include/libusb-1.0" 
"-fdiagnostics-color=auto" "-Wall" "-Winvalid-pch" "-Werror" 
"-std=gnu11" "-O2" "-g" "-iquote" "." "-iquote" 
"C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build" 
"-iquote" 
"C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/include" 
"-iquote" 
"C:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-ci-build/tcg/i386" 
"-U_FORTIFY_SOURCE" "-D_FORTIFY_SOURCE=2" "-fno-pie" "-no-pie" 
"-D_GNU_SOURCE" "-D_FILE_OFFSET_BITS=64" "-D_LARGEFILE_SOURCE" 
"-fno-strict-aliasing" "-fno-common" "-fwrapv" "-Wundef" 
"-Wwrite-strings" "-Wmissing-prototypes" "-Wstrict-prototypes" 
"-Wredundant-decls" "-Wold-style-declaration" "-Wold-style-definition" 
"-Wtype-limits" "-Wformat-security" "-Wformat-y2k" "-Winit-self" 
"-Wignored-qualifiers" "-Wempty-body" "-Wnested-externs" 
"-Wendif-labels" "-Wexpansion-to-defined" "-Wimplicit-fallthrough=2" 
"-Wmissing-format-attribute" "-Wno-missing-include-dirs" 
"-Wno-shift-negative-value" "-Wno-psabi" "-fstack-protector-strong" 
"-DHWY_SHARED_DEFINE" "-DLIBDEFLATE_DLL" "-D_POSIX_C_SOURCE=199506L" 
"-DNCURSES_WIDECHAR" "-DNCURSES_WIDECHAR=1" "-Dmain=SDL_main" 
"-Wno-undef" "-DSTRUCT_IOVEC_DEFINED" -MD -MQ 
libcommon.fa.p/ui_spice-core.c.obj -MF 
"libcommon.fa.p/ui_spice-core.c.obj.d" -o 
libcommon.fa.p/ui_spice-core.c.obj "-c" ../ui/spice-core.c
../ui/spice-core.c: In function 'watch_remove':
../ui/spice-core.c:152:5: error: implicit declaration of function 
'qemu_close_to_socket' [-Werror=implicit-function-declaration]
   152 |     qemu_close_to_socket(watch->fd);
       |     ^~~~~~~~~~~~~~~~~~~~
../ui/spice-core.c:152:5: error: nested extern declaration of 
'qemu_close_to_socket' [-Werror=nested-externs]
cc1.exe: all warnings being treated as errors

ninja: build stopped: subcommand failed.
make: *** [Makefile:165: run-ninja] Error 1
Exit status: 2


