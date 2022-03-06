Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FF4CE8BE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 05:32:52 +0100 (CET)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQiZf-0000vX-Dc
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 23:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQiYS-00008r-H0
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 23:31:36 -0500
Received: from [2607:f8b0:4864:20::535] (port=40794
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQiYQ-0005Vb-T1
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 23:31:36 -0500
Received: by mail-pg1-x535.google.com with SMTP id w37so10847997pga.7
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=c4EuYObtFDmVww4KYPrePH5dwgzlnxFAjtbDAm7hUKU=;
 b=OKEz8vlVOLadU/VzIHL5PipHjOy5sjEVzVyWbGakwi2ATDHsBLfdvik7ILbOG7hO/I
 2YAocIhd5CgOzpd6RJZg+TYlGdePqbR2bHoW680wyb0FD5wEjv+jS+IZX5Fw8nuqI4NB
 qqrIKDGK5/20bXzDXk/WEKobzdQZsWVqvfXypzLoHXSIhzclcplbzuDqi53rWTaemKVz
 yqft4XjOFvSm57UY6J0H2Y/1l8xVNf86TkHgWESChK5GmpRnZdfPFolaqdwkKkQ6UMbi
 Msy8cuAzkezF+UDltJgBRW0pfKiGYLXVTRP+C6iYOCgrcJCl4CBAv/lXEwmZXcjrZWMa
 x7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=c4EuYObtFDmVww4KYPrePH5dwgzlnxFAjtbDAm7hUKU=;
 b=fgyP/zFJaTXo7xfF99fQTNCsBfuSbJZGixVMXZYRFl5gxAf7HoO+fGdfcO0A4128Zd
 qRDl9TZoiUtao7P7+Xc1qlEdIPMUcthwWU+S9lqrUhQ5RXDYhrN0cZbv8swUktvk34Wt
 im4xNMdpO3OUU2b+TWbHqblqJDsRn4GG8MJ9cs3LTezCxIEL7nW7pcpfpV4nDDfKPwhL
 3it43B9kZs8Vc4bn3ITCjq3+yG3PhRouPkkgqC3B+HMsvqij4J3hLsucOP8thURunDPW
 mwuV/lXe2s0F+ZvVO9SqTnyfaKUWxP4VKd66O55E/eDUuSBSYRqfNqMadiZ2rzQpRNiR
 2hDg==
X-Gm-Message-State: AOAM533jFtPrgIq9rBsQA+a8fi0cDrL5eR1pQAYGbjMAQC28id62wPZc
 V2rwQkGfnr7gRg9rskuvuIs=
X-Google-Smtp-Source: ABdhPJwPXsnQqHjuCckQ45BSYuXJM2EZHEFinkCJwhCgJc+iSImXP5TojVI0xkGFPFzuVUXol+utTg==
X-Received: by 2002:a63:2bc1:0:b0:35e:c54b:3be0 with SMTP id
 r184-20020a632bc1000000b0035ec54b3be0mr5012521pgr.105.1646541092926; 
 Sat, 05 Mar 2022 20:31:32 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056a00114d00b004c122b90703sm10576108pfm.27.2022.03.05.20.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 20:31:32 -0800 (PST)
Message-ID: <a667b6a2-ec03-2fcd-9591-c6fe0d40cb9e@gmail.com>
Date: Sun, 6 Mar 2022 13:31:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
In-Reply-To: <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/18 1:11, Akihiko Odaki wrote:
>>> You missed only one thing:
>>>> - that console_select and register_displaychangelistener may not call
>>>> dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
>>>> incompatible with non-OpenGL displays
>>>
>>> displaychangelistener_display_console always has to call
>>> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
>>
>>
>> Ok, would that be what you have in mind?
>>
>>   --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -1122,6 +1122,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>>       } else if (con->scanout.kind == SCANOUT_SURFACE) {
>>           dpy_gfx_create_texture(con, con->surface);
>>           displaychangelistener_gfx_switch(dcl, con->surface);
>> +    } else {
>> +        /* use the fallback surface, egl-headless keeps it updated */
>> +        assert(con->surface);
>> +        displaychangelistener_gfx_switch(dcl, con->surface);
>>       }
> 
> It should call displaychangelistener_gfx_switch even when e.g.
> con->scanout.kind == SCANOUT_TEXTURE. egl-headless renders the content
> to the last DisplaySurface it received while con->scanout.kind ==
> SCANOUT_TEXTURE.

Hi,

Let me remind that the release date is approaching but the regression 
which breaks switching the console for vnc with egl-headless is still 
not fixed. (vnc has the feature to switch consoles with Ctrl+Alt+[1-9] 
if it is not bound to a particular console.)

Please fix this or, if not possible, revert the changes related to dbus.

My patch series is available for fixing the problem. The design it 
adopted is somewhat controversial and it cannot be applied to the 
current master branch. Please tell me if it is necessary to rebase this.
https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/

Regards,
Akihiko Odaki

