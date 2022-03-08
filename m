Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066244D1AE0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:43:44 +0100 (CET)
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRb3u-0000wC-Kq
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:43:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRb2M-0000Er-UJ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:42:06 -0500
Received: from [2607:f8b0:4864:20::632] (port=40922
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRb2L-0006Hk-BX
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:42:06 -0500
Received: by mail-pl1-x632.google.com with SMTP id z11so17238811pla.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 06:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uegG03Svxh0gmkAvS5nQd8/T2ElshKogCcmNEC44jiA=;
 b=S9YCnrU4V2uakGf3dRVXbUVT+x/sOoIqot2lEWuKSGMLCRHZiWER12dyYua5UDcx1g
 7Ok/reBCE+QIMyH8ET5+SEt+pqQVdCcC81B9XwC1HSHcLVzJt6Xkz1mAZD/sfZZzZsPZ
 G/jt4W2EDQYVzyX1qfwmXgSVEk3MMHhFZAzhBMpa9+mI8acHxN3iYYKYRYSvI3D6fa7v
 DaxNNh66YbfWtVX+9b8lEj2vlXcpNaxlWasRuHlyQBE4HrIzwvn9gijyARawBeIs+cYC
 6sPemHZfU5PDIrO8digGQa5DdbJjk+eR2c/kZ3Gf03WsJCjj3/zL070uN5vQoOwNQCJt
 BmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uegG03Svxh0gmkAvS5nQd8/T2ElshKogCcmNEC44jiA=;
 b=uInJV5EH0j7qoZa44s0stZJ5TZFbWlB9sGQ7a2kSaXOcZyoqAt2fLtCh0QA7wZBjZc
 adBZWBh7jjKGAjheTstGyJGgRyBgiDRJHqNLooX5LvBOOPa2EhiW4ILeWkHFxsk0q7fX
 w763LAkU6SZNKRzXW5DgTxIVWW/QkUBmYg9T5DExrm1yUwnph2JUKGp4mb3kKS+WLrO7
 mQJvGeqZf2CdDMBTBI1SDtmLPXDCqQC3OD+n0A+2RRo2HbQBckLuMNNLiuQvna82P1Ip
 VyVreWF5q0SA/1gAr9ZGXv6TfKjVQghN99eW8BPSFMIi5xFOTkJCw5M6VVlwhV4OP0x5
 OIcA==
X-Gm-Message-State: AOAM532gQwvuvwzh/Re9KCy/iodFfOTdJnUzjDW58yzFqIK/iWne+C2e
 EBKmIyJxJmOvf4ix8uHXcWI=
X-Google-Smtp-Source: ABdhPJxzrMdL4kIi87h9Vq6ZzBzOAFTv8vuW9IZWGctJC53Ef0LNCwJGpvNl+gwrkIvITsV04DF7Iw==
X-Received: by 2002:a17:903:11c7:b0:151:7290:ccc with SMTP id
 q7-20020a17090311c700b0015172900cccmr17986487plh.95.1646750523613; 
 Tue, 08 Mar 2022 06:42:03 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 me8-20020a17090b17c800b001bf9907c41bsm1604954pjb.12.2022.03.08.06.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:42:03 -0800 (PST)
Message-ID: <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
Date: Tue, 8 Mar 2022 23:42:00 +0900
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
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x632.google.com
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

On 2022/03/08 23:26, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
> 
> (taking notes, mostly for myself)
> 
>>> Could you provide a failing test case or a more concrete suggestion on
>>> what to do instead? I am all ears :)
>>>
>>> thanks
>>>
>>
>> Let me describe a more concrete case. Think that egl-headless and vnc
>> are enabled. The guest devices are serial virtio-gpu-gl. vnc selects
>> serial at first.
> 
> (I am not sure how you would select serial first, but let's assume you did)
> 
>>
>> vnc uses register_displaychangelistener and console_select to switch
>> consoles.
>>
>> displaychangelistener_display_console does the actual switching, and
>> calls dpy_gfx_switch and dpy_gfx_update if con->scanout.kind is
>> SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or
>> dpy_gl_scanout_dmabuf if con->scanout.kind is SCANOUT_TEXTURE or
>> SCANOUT_DMABUF. It works for a OpenGL display, but it doesn't vnc in
>> combination with egl-headless.
> 
> (hmm, what doesn't work? With this patch, the DisplaySurface is always
> switched, no matter what con->scanout.kind is)
> 
>>
>> virtio-gpu-gl starts scanning out texture. It would happen in the
>> following sequence:
>> 1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind will be
>> SCANOUT_SURFACE.
>> 2. qemu_console_resize calls dpy_gfx_switch, delivering DisplaySurface
>> to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.
> 
> (qemu_console_resize calls dpy_gfx_replace_surface. con.scanout.kind
> is still SCANOUT_SURFACE)
> 
> (It calls displaychangelistener_gfx_switch() which will call
> egl_gfx_switch() and update the current surface)
> 
>> 3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless starts
>> rendering the texture to the DisplaySurface.
> 
> (now con.scanout.kind becomes SCANOUT_TEXTURE)
> 
>>
>> In the end, the DisplaySurface will have the image rendered, and
>> con->scanout.kind will be SCANOUT_TEXTURE.
> 
> (so far it works as expected, right?)
> 
> 
> 
>>
>> Now vnc switches to virtio-gpu-gl.
>>
>> 4. vnc calls console_select
>> 5. displaychangelistener_display_console finds con->scanout.kind is
>> SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not an OpenGL
>> display. It essentially becomes no-op and the display would be blank.
>>
>> This patch will change it to call dpy_gfx_switch but not to call
>> dpy_gfx_update.
> 
> Alright, I think I see what you mean. egl-headless is associated with
> a specific con, and thus is not involved during vnc console switching.
> 
> However, dpy_gfx_switch on vnc is not a no-op. It updates the surface,
> resize the client and mark the area dirty. Because the con.surface is
> kept updated by egl-headless, the client gets the updated content.
> Iow, it still works.
> 
> If we always called dpy_gfx_update() during
> displaychangelistener_display_console(), it would mean for the
> listener to display the surface content, even when the scanout kind is
> set for a texture. Or we need to change the behaviour of
> dpy_gfx_update() to depend on the current scanout kind.

vnc has to display the surface content so dpy_gfx_update should be 
called for vnc, but not for OpenGL displays.

Regards,
Akihiko Odaki

> 
> Imho, it's acceptable in the current proposed form, since there is no
> apparent bug (unless I miss something). However, I can try to
> formulate a FIXME comment and add some documentation around the gfx
> callback to improve the situation.
> 
> thanks
> 


