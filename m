Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62480673761
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:50:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITQg-0001VT-H3; Thu, 19 Jan 2023 06:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITQb-0001T4-0b
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:50:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITQW-0007i1-Ri
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:49:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso3376571wmc.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbTsWvS9ShgEZicm2MBugcJf9sn2ag27IoVczmOfrek=;
 b=X5/74CF/k5l8IR4NDqOPFxNDvDsy73gn1w2OFlwxakyKJH3YtG3uJIaaW/0fdplmA1
 TVt9JG9Onnet0hZMss52+UZ/uPkDb0iHtMz3OFqAtudigaCt3Nc8RGud8dN32XhRtH2K
 L4fljMGc+DLB0M4kudNKFQBFx0osrIC2vOWliKQGa8W6GL/W0A+/K6WmbkD7OZcJWiDo
 1tkU70+R06Aod6CC7sZupl38Fu422rCXD8+VIB/liKwOl1H4aKEqCXrnYOlltNBP6hD8
 vJZAJLKPDLBu+dbTHCBE2hqZiJXndQddhJza9XcH/VjeAT7AfDaAiB08bUn7gP/NhZUa
 qg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbTsWvS9ShgEZicm2MBugcJf9sn2ag27IoVczmOfrek=;
 b=p3KARbNLxWR2Zoxem8SctOTYUje71O3ua1KRH26ESNSow0Jyl6csGacntq1ezXq1EL
 5rH6SFMGrKSEU13VVBG4s+mQkYBOScdZDjAKrGw63B/TFTbmAykmWIEsT5H5QTrmVISl
 4JiEXPSLBuEOpfpIrHrHGzYwbus+KK8RIPaSl5quDh3bLTx60T/htSFhvRdgH/vR8qpD
 TvUT5DRw/emZV1yJm6ffsd0nQAsNqC34I49GwDU9KM/uVTrPSavmTbtLQ0zqcZKvXhzp
 MAW48RH6GLKNTKJK8wMZZP5XQ+CHp0uE1h8gnc4Gasxu1vV2OIOWTKpCGg95MuJ+rHWS
 MxhA==
X-Gm-Message-State: AFqh2kqcH+tO7VHZ1OgotifWn6Yhd5D6vSJAQrQYyiUc28BUVFtuOc+v
 Hhf1wKJRL2rkKAoz1sqD2AQetY6mFttu84Kb
X-Google-Smtp-Source: AMrXdXulx4PW7of7a4zNcyc66gL8Sm47LTa0TuOM1+suREGCcwxc/hVyMX8YRvoYL9XqduVufQpAlQ==
X-Received: by 2002:a05:600c:687:b0:3d9:73fb:8aaa with SMTP id
 a7-20020a05600c068700b003d973fb8aaamr10083740wmn.8.1674128990466; 
 Thu, 19 Jan 2023 03:49:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c502500b003db03725e86sm4918924wmr.8.2023.01.19.03.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:49:50 -0800 (PST)
Message-ID: <fe0f448c-6a8f-9830-208b-5e1c52e5e203@linaro.org>
Date: Thu, 19 Jan 2023 12:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
 <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
 <Y8kmlVU5NKaR7i4D@redhat.com>
 <7a46cdc2-42b7-a71d-5c00-a7b6e30d2622@linaro.org>
 <Y8kqeC5UWPHC+yIX@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8kqeC5UWPHC+yIX@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 12:33, Daniel P. Berrangé wrote:
> On Thu, Jan 19, 2023 at 12:21:58PM +0100, Philippe Mathieu-Daudé wrote:
>> On 19/1/23 12:16, Daniel P. Berrangé wrote:
>>> On Thu, Jan 19, 2023 at 12:01:18PM +0100, Philippe Mathieu-Daudé wrote:
>>>> On 5/12/22 08:51, Marc-André Lureau wrote:
>>>>> On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>>>
>>>>>> The vnc-display-test is failing on Darwin:
>>>>>>
>>>>>> tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
>>>>>> Unsupported auth type 17973672
>>>>>
>>>>> It is supposed to pass. Can you share more details? It doesn't look
>>>>> like an endianness issue, at first sight..
>>>>
>>>> Adding '-trace vnc*' and setting _VNC_DEBUG in "vnc.h" I get:
>>
>>>> Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 5489072
>>>
>>> ^^^^ This specific message is comnig from the gtk-vnc client rather
>>> than QEMU
>>>
>>> Still doesn't tell us if the flaw is server or client side. The
>>> logs from QEMU are insufficient. In theory it should be reporting
>>> auth type == 0 though, for 'no auth' configs.
>>
>>>> Does that help? What else can I do to gather more info?
>>>
>>> Modify vnc-display-test.c to call  vnc_util_set_debug(TRUE);
>>> before vnc_connection_new(), to get the gtk-vnc debug logs
>>> to stderr too.
>> Here you go:
>>
>> vnc_server_dpy_recreate VNC server dpy recreate dpy=0x1588b8000 size=640x384
>> fmt=537004168
>> vnc_auth_init VNC auth init state=0x1588b8000 websock=0 auth=1 subauth=0
>> vnc_auth_init VNC auth init state=0x1588b8000 websock=1 auth=1 subauth=0
>> vnc_client_connect VNC client connect state=0x1484b0000 ioc=0x152e667f0
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Init VncConnection=0x14f0168b0
>> gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Init
>> VncConnection=0x14f0168b0
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Thinking about auth type 1
>> gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Thinking about auth type
>> 1
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Decided on auth type 1
>> gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Decided on auth type 1
> 
> So here we set conn->auth_type == 1
> 
> 
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Open fd=4
>> gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open fd=4
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Open coroutine starting
>> gtk-vnc-DEBUG: 12:20:30.482: ../src/vncconnection.c Open coroutine starting
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Started background coroutine
>> gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Started background
>> coroutine
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Connecting to FD 4
>> gtk-vnc-DEBUG: 12:20:30.484: ../src/vncconnection.c Connecting to FD 4
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 16
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Emit main context 16
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Protocol initialization
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Protocol initialization
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Schedule greeting timeout
>> 0x14f0155e0
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Schedule greeting
>> timeout 0x14f0155e0
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Remove timeout 0x14f0155e0
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Remove timeout
>> 0x14f0155e0
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Server version: 3.8
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Server version: 3.8
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Sending full greeting
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Sending full greeting
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Using version: 3.8
>> gtk-vnc-DEBUG: 12:20:30.485: ../src/vncconnection.c Using version: 3.8
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Possible auth 1
>> gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Possible auth 1
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Emit main context 14
>> gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Emit main context 14
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Waiting for auth type
>> gtk-vnc-DEBUG: 12:20:30.589: ../src/vncconnection.c Waiting for auth type
>> # gtk-vnc-DEBUG: ../src/vncconnection.c Choose auth 10486192
> 
> Here we've read conn->auth_type and got back 10486192 nonsense instead
> of 1.
> 
> Interestingly this value is differetn from the previous debug log
> which reported  5489072, so i guess we're getting garbage here for
> unknown reasons.
> 
> This looks like a gtk-vnc problem rather than QEMU.
> 
> I'm a little worried that perhaps the gtk-vnc ucontext coroutine backend
> is broken on macOS
> 
> What coroutine backend does QEMU end up using on macOS ? Is it the
> sigaltstack one ?

   Block layer support
     coroutine backend            : sigaltstack
     coroutine pool               : YES

When trying the coroutine options, with --with-coroutine=windows:

ERROR: 'windows' coroutine backend only valid for Windows

:) and with --with-coroutine=ucontext I get:

ERROR: 'ucontext' backend requested but makecontext not available

config.log hints:

/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ucontext.h:51:2: 
error: The deprecated ucontext routines require _XOPEN_SOURCE to be defined
#error The deprecated ucontext routines require _XOPEN_SOURCE to be defined
  ^

Adding _XOPEN_SOURCE to QEMU_CFLAGS:

warning: 'makecontext' is deprecated: first deprecated in macOS 10.6 - 
No longer supported [-Wdeprecated-declarations]
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ucontext.h:41:6: 
note: 'makecontext' has been explicitly marked deprecated here
void makecontext(ucontext_t *, void (*)(), int, ...);
      ^

So to detect makecontext() I have to add
--extra-cflags=-mmacosx-version-min=10.5 but then linking fails with
multiple "$LIBNAME was built for newer macOS version (13.0) than being
linked (11.0)".

