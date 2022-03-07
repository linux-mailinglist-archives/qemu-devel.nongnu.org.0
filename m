Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA1E4CFE74
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:27:40 +0100 (CET)
Received: from localhost ([::1]:51966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCSh-0006zh-EK
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRCPM-0000G4-OU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:24:12 -0500
Received: from [2607:f8b0:4864:20::631] (port=36643
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRCPL-00010X-31
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:24:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id e13so13607979plh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1lOwkrNNKUEXYo5Ub///6FCTaDaRoMXW7acsQg9w/Jk=;
 b=E4vzIuGQugzp5WPvINWSCMBWt96xnoDkeYooAdvdr2C4dMaJBuGfo3PeiwVLzWQwsl
 Jz9BZV/vggkxaU2RGv6skZY8mU9+A6epmoD0TjpCBANqJi84azTNGXgqWfRjhGvJo9Pw
 BtZh4k1E0p8saLJy90YHZVYDAVI3SIi5BS7PJOBol3XrHxvbkBgLGo/+DnCQv+uBCaLd
 bTYI1ISN5BTR36cZ/H3GUsGnFT2G1znwWDk9waA65q2uapQrtCxsk3uaGtloXTTxr4Az
 EAQWMiZQ6rVCdzM1z62w/z0QNCHlBrSDeOFnKB/GNuXPsoBSvJrCM23S4KEux2w7d8Gv
 hYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1lOwkrNNKUEXYo5Ub///6FCTaDaRoMXW7acsQg9w/Jk=;
 b=bEamXd/tM6Yv+d7jha8OitbiBnaj9rCa7ujZ+oISt/k7KN3M6R1N+XUZ5M/ak3RGGR
 aogfODpPlzsHn81Tv78YTi5hD+2KAlyeU//4C6WittGwh5hMamnfouzG+J6iEVqjUWF2
 WRWpPLY3t5ZWhNiUfRTRa6ep7KX4cN+SmcGo5R9VA9Zg0Ae9yj0OvAJKEtqlEpTmdVYJ
 nM3vKbrBwUe1P7dH7Sgyh0LtjGH1Kmu4AZfMAroBndrDl2+c7C8S5aecouUk6lKsqJw9
 IV06iZT8Ak2UY4S7hlZKb6ERtynmfnXcYPykuEJDxujBI3q21t6O5M8SFutmYXW/r23I
 bduA==
X-Gm-Message-State: AOAM5319TYd0kybPHRbIJvht0zjb0vessU8bk7trMpz7+H99bbnRbfjC
 5EsKQekW8R6z1M7sKkOxJE8=
X-Google-Smtp-Source: ABdhPJyT2fmCW6PGCCe3TJckPOd8TnUKz8ErixlORxYcmhoNRAh6iXGOt+p/35LpHzwhCikgr4ffZA==
X-Received: by 2002:a17:90a:c6:b0:1bc:c0be:4696 with SMTP id
 v6-20020a17090a00c600b001bcc0be4696mr25082891pjd.7.1646655843750; 
 Mon, 07 Mar 2022 04:24:03 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 1-20020a17090a1a0100b001bf3ba1508fsm7559103pjk.33.2022.03.07.04.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 04:24:03 -0800 (PST)
Message-ID: <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
Date: Mon, 7 Mar 2022 21:24:00 +0900
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
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
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

On 2022/03/07 20:50, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 7, 2022 at 2:35 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> On 2022/03/07 19:19, Marc-André Lureau wrote:
>>> Hi Akihiko
>>>
>>> On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>>>
>>>> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
>>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>
>>>>> egl-headless depends on the backing surface to be set before texture are
>>>>> set and updated. Display it (update=true) iff the current scanout kind
>>>>> is SURFACE.
>>>>
>>>> egl-headless does not dynamically call register_displaychangelistener
>>>> and has console associated (console_select would not affect egl-headless
>>>> itself) so this should not be necessary.
>>>
>>> Could you help me understand, what should not be necessary?
>>
>> I read the description as it sets the backing surface for egl-headless
>> when register_displaychangelistener or console_select is called. The
>> change is not necessary.
> 
> Without it, gfx_switch is not called to set the new surface. Switching
> console with VNC would fail (via ctrl+alt+num).

Yes, but that is not because egl-headless requires its dpy_gfx_switch to 
be called. It is because vnc does not receive the surface. The patch 
adds a call of dpy_gfx_switch no matter if the receiver is an OpenGL 
display or not, but an OpenGL display would not need one.

> 
>>
>>>
>>>> The remaining problem with egl-headless is that egl-headless renders the
>>>> image to DisplaySurface, and a non-OpenGL display (namely vnc) has to
>>>> consume it instead of texture even when con->scanout.kind is
>>>> SCANOUT_TEXTURE or SCANOUT_DMABUF.
>>>
>>> This is already happening, because egl-headless calls dpy_gfx_update().
>>
>> It is not called when register_displaychangelistener or console_select
>> is called by non-OpenGL display consuming the DisplaySurface.
> 
> When displaychangelistener_display_console() is called with
> con->scanount.kind == SCANOUT_SURFACE, it calls gfx_update(update ==
> TRUE), and thus calls gfx_update on the whole surface.
> 

con->scanout.kind is SCANOUT_TEXTURE or SCANOUT_DMABUF when egl-headless 
is rendering to surface. It would not call gfx_update in the case.

Regards,
Akihiko Odaki

