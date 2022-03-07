Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F182A4CFC8B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:21:10 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBQM-0004Zk-2n
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRAhh-0004QC-Tl
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:35:02 -0500
Received: from [2607:f8b0:4864:20::530] (port=43911
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRAhg-0007lD-Et
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:35:01 -0500
Received: by mail-pg1-x530.google.com with SMTP id 27so13174133pgk.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oM8L3rN23XU6YJBNI59ME3CoZC/BUveSERqRxiB7c0s=;
 b=NmKz7HorEHC0e9cLe1al0jj75Lok+1cLyNwFrG1rFHGALwlwvNGNpsm+4GCNHsyyrg
 Sc+YczowEXxTD19wogVb7KDikt7iYUIeU3bj2QFYMPifxTPIKM3TZigOiOZ4Lz6BL51X
 O/H2BmLvEOlAQixC3GUcRdHNf7CrhQvE7HJA+bCLXYDiywx8Dt2AyFR5FTX/Ihzh8j1b
 pXliO8WSC+I0wvsgKYYH1d5PIgN0NUKbWROEhSIsJuQdPG6VKJTiosNk6A4BskSme/4B
 /lLE6ZQulp6vP/if8tVuc2r5dBCHuFsaxlYtzvpb+GfmmaD8FNDBieDNmgFXIqt0DjPj
 2d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oM8L3rN23XU6YJBNI59ME3CoZC/BUveSERqRxiB7c0s=;
 b=xliAqt0pOe73rPPiFPAK3UKh6WLqtqpWm+ULMwDRtUzgZHAC3f/K4ZIo6KVxmuQEin
 ei2AmMBHNNY7gYv/c53qHigouFTe0Wq/lF6OrWs93mL8lsNY6/pnpg5A2bff7R9huZvh
 g2MloyFrvecsJ1DHj06p3rTMw7GyopDbH0loe9sEmxfUjf3WmBegTo9TYOsuWYWjyRrm
 AImn5nyFu3ZpJnNYr06AUkz2PLVqPnRuLvIezKTZF/Sg+8Ff1tNLvYfg7RukOjZfjuLS
 P2+nvtFt038gS7GkTCW442VozB1TpLGvkeqzc+v3yG2J61yzysTrFUMSJ173yOZkmJJF
 +NtA==
X-Gm-Message-State: AOAM5306UrvM1JbKmJX7ikXJxsDuBzYtihI5zA0nEK7cET3F3ZbAWTW4
 NMr0Z4zM4YqrZSE7jUxsEjk=
X-Google-Smtp-Source: ABdhPJyo0dyVflodTBactIRy4qjTThETT5SZGhVF95iG05BU2Xd+D49BGpFEcEJWA5nj57KEiS4uLw==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id
 b5-20020a056a00114500b004f63ebca79bmr11843248pfm.41.1646649299126; 
 Mon, 07 Mar 2022 02:34:59 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm15842755pfu.82.2022.03.07.02.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:34:58 -0800 (PST)
Message-ID: <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
Date: Mon, 7 Mar 2022 19:34:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/07 19:19, Marc-André Lureau wrote:
> Hi Akihiko
> 
> On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> egl-headless depends on the backing surface to be set before texture are
>>> set and updated. Display it (update=true) iff the current scanout kind
>>> is SURFACE.
>>
>> egl-headless does not dynamically call register_displaychangelistener
>> and has console associated (console_select would not affect egl-headless
>> itself) so this should not be necessary.
> 
> Could you help me understand, what should not be necessary?

I read the description as it sets the backing surface for egl-headless 
when register_displaychangelistener or console_select is called. The 
change is not necessary.

> 
>> The remaining problem with egl-headless is that egl-headless renders the
>> image to DisplaySurface, and a non-OpenGL display (namely vnc) has to
>> consume it instead of texture even when con->scanout.kind is
>> SCANOUT_TEXTURE or SCANOUT_DMABUF.
> 
> This is already happening, because egl-headless calls dpy_gfx_update().

It is not called when register_displaychangelistener or console_select 
is called by non-OpenGL display consuming the DisplaySurface.

Regards,
Akihiko Odaki

> 
> thanks
> 
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    ui/console.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/ui/console.c b/ui/console.c
>>> index 5bfecea4549e..16a0b0909ba2 100644
>>> --- a/ui/console.c
>>> +++ b/ui/console.c
>>> @@ -1112,6 +1112,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>>>            return;
>>>        }
>>>
>>> +    dpy_gfx_create_texture(con, con->surface);
>>> +    displaychangelistener_gfx_switch(dcl, con->surface,
>>> +                                     con->scanout.kind == SCANOUT_SURFACE);
>>> +
>>>        if (con->scanout.kind == SCANOUT_DMABUF &&
>>>            displaychangelistener_has_dmabuf(dcl)) {
>>>            dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
>>> @@ -1126,9 +1130,6 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>>>                                             con->scanout.texture.y,
>>>                                             con->scanout.texture.width,
>>>                                             con->scanout.texture.height);
>>> -    } else if (con->scanout.kind == SCANOUT_SURFACE) {
>>> -        dpy_gfx_create_texture(con, con->surface);
>>> -        displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
>>>        }
>>>    }
>>>
>>
> 


