Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B56673644
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISfd-00060X-Cj; Thu, 19 Jan 2023 06:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISfc-000608-7y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:01:24 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISfa-0007ru-57
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:01:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d2so1458030wrp.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FpUkC0C1GHWvdAqFvVe0qm+x+56HGIiGOEHov6GQeIE=;
 b=wQDaBvapXKTOj7hLDrgql4KF7qksOu3qXouvYR/vvAfVItPtfimRMWmnYvJM/t+hp+
 O7nEHmr6xhTfPV90YSVy1nCkCrPvAX3Jt3bOFHZeVcEGMrIfpsGAtVnXRnaeXJKR+dXF
 u29lFVLSGOsQU/FYTZnS2iPpQzt5G726ZIaLVFhZY3keBAnUbaN0aVt3u/F3jcDlkWa+
 xyneITWjXSB3ZCxF+s7OFhbu2lwrFaXboMxnWsyRONAn20naqsdkhffcUjhdg169wkVk
 5+OBGwtAK/mw7cSc4QJ8diVipwqgp8IwD9tcdCspLi5ldcyhYyHLMk/jRWWJn0WBjM+6
 Rddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpUkC0C1GHWvdAqFvVe0qm+x+56HGIiGOEHov6GQeIE=;
 b=DEo/sxjGx++OqHkM6ybNQS++u9ytwKbY56JpAQMTJIVpMwywXxSjvoUJGvooNn7YRK
 uKIiftjPaHI+m6MMwbdmhNvlMVrVrqbSyr7U3qeXhu54+13iLcRfpYzmcisbMLX63anW
 zaKEOh8hDk4icxhDvOI2WT1bOvoL10N/+qSPoblaK3CH/p6xR+sHyKr2YUFla/5mNRSM
 /bs5Uo3CIn2Yg2E1rW/yR6teGhHNf0Ipj45pT6c7lRXA0GuAjrAO8JLkc2Xuo/Giugjb
 7AkwXwhqQ8X80kQgh2uWd2csHHR6QuGm9fp1LOAGYlbp+Kn0qfrYWo3UijoByXFyu9lQ
 6p0g==
X-Gm-Message-State: AFqh2kqlmesfJVeSP5XnJks8w4oNu2hB5Yy+/lT3QoX8txNb7+wdKCO3
 o6IUNh5zf83iTiblW1CcD/i3cw==
X-Google-Smtp-Source: AMrXdXtw5yD7iHv1fh5HzotqhAgK5pbf0vyQV4x0Zy7YsvPX+z/2nzHRUn8XYICytXDQAZgj0o7m/A==
X-Received: by 2002:a5d:45cd:0:b0:2bd:d94f:432c with SMTP id
 b13-20020a5d45cd000000b002bdd94f432cmr9392001wrs.26.1674126080153; 
 Thu, 19 Jan 2023 03:01:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j14-20020adff00e000000b0024cb961b6aesm32754573wro.104.2023.01.19.03.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:01:19 -0800 (PST)
Message-ID: <60569516-bd5a-b124-e105-8a9ab9f43c89@linaro.org>
Date: Thu, 19 Jan 2023 12:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: tests/qtest: Is vnc-display-test supposed to work on Darwin?
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9b81a6f2-7bf9-4ada-d7ba-c8a9dffcb2d3@linaro.org>
 <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1CLS3JxJ6yO6uTajdkia0t4gEWzSfhXnUQ+M6iywWWuUug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 5/12/22 08:51, Marc-André Lureau wrote:
> On Fri, Dec 2, 2022 at 1:51 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The vnc-display-test is failing on Darwin:
>>
>> tests/qtest/vnc-display-test:45038): ERROR **: 10:42:35.488: vnc-error:
>> Unsupported auth type 17973672
> 
> It is supposed to pass. Can you share more details? It doesn't look
> like an endianness issue, at first sight..

Adding '-trace vnc*' and setting _VNC_DEBUG in "vnc.h" I get:

# Start of vnc-display tests
vnc_server_dpy_recreate VNC server dpy recreate dpy=0x130008000 
size=640x480 fmt=537004168
Initializing VNC server with no auth
vnc_auth_init VNC auth init state=0x130008000 websock=0 auth=1 subauth=0
Initializing VNC server with no auth
vnc_auth_init VNC auth init state=0x130008000 websock=1 auth=1 subauth=0
vnc_client_connect VNC client connect state=0x130050000 ioc=0x13f7077f0
Client sioc=0x13f7077f0 ws=0 auth=1 subauth=0
New client on socket 0x13f7077f0
vnc_set_share_mode/0x13f7077f0: undefined -> connecting
Write Plain: Pending output 0x14880a400 size 4096 offset 12. Wait SSF 0
Wrote wire 0x14880a400 12 -> 12
Read plain 0x0 size 0 offset 0
Read wire 0x13f8c8c00 4096 -> 12
Client request protocol version 3.8
Write Plain: Pending output 0x14880a400 size 4096 offset 2. Wait SSF 0
Wrote wire 0x14880a400 2 -> 2
Bail out! FATAL-ERROR: vnc-error: Unsupported auth type 5489072
Read plain 0x13f8c8c00 size 4096 offset 0
Read wire 0x13f8c8c00 4096 -> 1
vnc_auth_reject VNC client auth rejected state=0x130050000 method 
expected=1 got=176
Write Plain: Pending output 0x14880a400 size 4096 offset 30. Wait SSF 0
Wrote wire 0x14880a400 30 -> 30
Closing down client sock: protocol error
vnc_client_disconnect_start VNC client disconnect start 
state=0x130050000 ioc=0x13f7077f0
vnc_set_share_mode/0x13f7077f0: connecting -> disconnected
vnc_client_disconnect_finish VNC client disconnect finish 
state=0x130050000 ioc=0x13f7077f0

** (tests/qtest/vnc-display-test:8465): ERROR **: 11:59:18.613: 
vnc-error: Unsupported auth type 5489072
Trace/BPT trap: 5

Does that help? What else can I do to gather more info?

>> Is it supposed to pass, or should we skip it similarly to Windows?
> 
> (I hope it'll cover Windows soon)
> 


