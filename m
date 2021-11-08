Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED40447CF8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:39:34 +0100 (CET)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk17l-0007so-GU
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mk15e-0006OK-ER
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:37:23 -0500
Received: from [2a00:1450:4864:20::32f] (port=53147
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mk15b-00008G-Sa
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:37:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o29so8617365wms.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=epiORYNkrLi2FtKjoYEFHqSNTI4298E0EH7YkxHvbNw=;
 b=ilxsPS6UarBfv2raHTp2Tj2hj+THxFrzGVycEa7HJgnkf8HdxkDpDbBFYCV+YbkTYk
 9kyZz6KB0dCr+3iWSMUIPyL3Z/TqEHR/yX/edlVKubbLwcyiFqU8OAgaawc23v13idwi
 TGaKgHzG299mK7vQgjzHRk4eFUTLxC4r+2ILsOxdhWi2kchaFo7I7VDBDhD7fUbaviLc
 5+dxtGlUNPJMdBO616ZbTZYvUq5slWohBbRR9356DUxXt+TK0WzF9yYA+XeY18XFEXla
 BfcUNOUgt1M6CJkAOaJF+X4V1i6Mdc5nlHGtPS8RWntc5ur+zBDIVpfiQRudcH0f82Wg
 CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=epiORYNkrLi2FtKjoYEFHqSNTI4298E0EH7YkxHvbNw=;
 b=v28IkJ2nIg+LZ7TI8MBNBEowYPcs9UUZqeTzKggUzwZN0R4AJ3cjtGk5UP7cHeXx5F
 +MYJOoxxtd3hx2xRqA0/+1QEW5gOpfrX7g3wueEWAADnINyeTDfz2zWvua7N07Jd5BZF
 GqVKun9zGVaZrFa4u0ely7iz//cCkatUAXMCN27ZV5lkb8u+jePlpIjeyQgskp2GB1YJ
 utM26dggj5gtlljVQ5HM6Uksc5mnSux3wD1nKJewUaxTCsUFAuU8h2bBqonvbJSR7sMM
 /xvEuAmff3WPZqQbvrsKRAvB5kbjpmKwTxwztxFQ1GqyRbWrsI9+YKcygeA3KITY8z1A
 a3FA==
X-Gm-Message-State: AOAM530ToBfDiZD64ppH+H1X7Je5IEV9l1PHhTgyD8cSLkFWVwbom9gF
 Iov8mOLmjV8X2tnoHtfzKiU=
X-Google-Smtp-Source: ABdhPJy+AbSecH3VdQhAyEnN/Et6jLeC8TpOLwR8VezUSme5lwSHoatvasdSBzOWJA6lQHtkZ+23Dg==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr3878179wms.123.1636364238414; 
 Mon, 08 Nov 2021 01:37:18 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r17sm16157504wmq.11.2021.11.08.01.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:37:17 -0800 (PST)
Message-ID: <d7cfb15a-acdd-09ed-1af6-6a8193f7debd@amsat.org>
Date: Mon, 8 Nov 2021 10:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/6] Egl 20211105 patches
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
 <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
 <cc48fcc7-4408-be45-7081-335b98c1ce6f@ilande.co.uk>
 <4733e0d7-a108-e444-e640-0d5dd7644943@amsat.org>
 <YYjsatU4ENpazt29@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YYjsatU4ENpazt29@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:22, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 09:17:19AM +0100, Philippe Mathieu-Daudé wrote:
>> +Thomas & Daniel for Travis-CI
>>
>> On 11/8/21 09:12, Mark Cave-Ayland wrote:
>>> On 05/11/2021 18:49, Philippe Mathieu-Daudé wrote:
>>>> On 11/5/21 19:26, Philippe Mathieu-Daudé wrote:
>>>>> On 11/5/21 18:13, Richard Henderson wrote:
>>>>>> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
>>>>>>> The following changes since commit
>>>>>>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
>>>>>>>
>>>>>>>     Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
>>>>>>> into staging (2021-11-03 13:07:30 -0400)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>     git://git.kraxel.org/qemu tags/egl-20211105-pull-request
>>>>>>>
>>>>>>> for you to fetch changes up to
>>>>>>> 1350ff156b25be65c599ecca9957ce6726c6d383:
>>>>>>>
>>>>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout
>>>>>>> surface
>>>>>>> (2021-11-05 12:29:44 +0100)
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>> gtk: a collection of egl fixes.
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>>
>>>>>>> Dongwon Kim (6):
>>>>>>>     virtio-gpu: splitting one extended mode guest fb into n-scanouts
>>>>>>>     ui/gtk-egl: un-tab and re-tab should destroy egl surface and
>>>>>>> context
>>>>>>>     ui/gtk-egl: make sure the right context is set as the current
>>>>>>>     ui/gtk-egl: guest fb texture needs to be regenerated when
>>>>>>>       reinitializing egl
>>>>>>>     ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>>>>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout
>>>>>>> surface
>>>>>>>
>>>>>>>    include/hw/virtio/virtio-gpu.h        |  5 +++--
>>>>>>>    include/ui/console.h                  |  4 ++++
>>>>>>>    hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>>>>>>>    hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>>>>>>>    hw/display/virtio-gpu.c               |  4 ++--
>>>>>>>    ui/egl-helpers.c                      | 25
>>>>>>> +++++++++++++++++++++----
>>>>>>>    ui/gtk-egl.c                          | 10 ++++++++++
>>>>>>>    ui/gtk.c                              | 23 +++++++++++++++++++++++
>>>>>>>    8 files changed, 79 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> Applied, thanks.
>>>>>
>>>>> Ubuntu 18.04.4 LTS:
>>>>>
>>>>> ui/gtk-egl.c:159:13: error: implicit declaration of function
>>>>> 'egl_dmabuf_release_texture' is invalid in C99
>>>>> [-Werror,-Wimplicit-function-declaration]
>>>>>              egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>>>>>              ^
>>>>> ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
>>>>> [-Werror,-Wstrict-prototypes]
>>>>> 2 errors generated.
>>>>>
>>>>> https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737
>>>>>
>>>>
>>>> This seems to fix but I have no clue whether it is correct:
>>>>
>>>> -- >8 --
>>>> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
>>>> index f2026e4b5c9..45cb67712df 100644
>>>> --- a/ui/gtk-egl.c
>>>> +++ b/ui/gtk-egl.c
>>>> @@ -156,8 +156,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>>>>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>>>>           }
>>>> +#ifdef CONFIG_GBM
>>>>           if (vc->gfx.guest_fb.dmabuf) {
>>>>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>>>>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>>>>           }
>>>> +#endif
>>>>       }
>>>>
>>>> ---
>>>
>>> I see the same error here trying to build QEMU git master on Debian
>>> Buster (oldstable). The fix looks reasonable to me in that it matches
>>> the CONFIG_GBM guards around other similar functions and the resulting
>>> binary appears to work, so:
>>>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> Thank you, I'll post a formal patch then.
>>
>> I wonder why this got merged while this configuration is covered in
>> Travis-CI. Is it that we have a too high failure rate than we don't
>> use it anymore?
> 
> I've not looked at travis in ages what matters is GitLab CI, and there

I Cc'ed you because I thought it was you who suggested to add the
Travis-CI - GitLab bridge (external job). Maybe it was Thomas.

> the problem is that we're building ubuntu 20.04 not 18.04 so didn't
> catch the older problem.
> 
> I don't know what Mark sees a problem on Debian Buster though, as we
> successfully built there AFAICT
> 
>    https://gitlab.com/qemu-project/qemu/-/jobs/1756202449

But here libgbm is installed:

Run-time dependency gbm found: YES 18.3.6

The issue is on hosts without it.

