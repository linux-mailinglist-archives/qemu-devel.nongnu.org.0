Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA4447BA3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:14:47 +0100 (CET)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzni-0006QL-Ad
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:14:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzlv-00054o-KQ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:12:56 -0500
Received: from [2001:41c9:1:41f::167] (port=59716
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzlt-0004F9-TK
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:12:55 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mjzlh-0008eS-BL; Mon, 08 Nov 2021 08:12:45 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
 <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cc48fcc7-4408-be45-7081-335b98c1ce6f@ilande.co.uk>
Date: Mon, 8 Nov 2021 08:12:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 0/6] Egl 20211105 patches
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/11/2021 18:49, Philippe Mathieu-Daudé wrote:

> On 11/5/21 19:26, Philippe Mathieu-Daudé wrote:
>> On 11/5/21 18:13, Richard Henderson wrote:
>>> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
>>>> The following changes since commit
>>>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
>>>>
>>>>     Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
>>>> into staging (2021-11-03 13:07:30 -0400)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     git://git.kraxel.org/qemu tags/egl-20211105-pull-request
>>>>
>>>> for you to fetch changes up to 1350ff156b25be65c599ecca9957ce6726c6d383:
>>>>
>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>>>> (2021-11-05 12:29:44 +0100)
>>>>
>>>> ----------------------------------------------------------------
>>>> gtk: a collection of egl fixes.
>>>>
>>>> ----------------------------------------------------------------
>>>>
>>>> Dongwon Kim (6):
>>>>     virtio-gpu: splitting one extended mode guest fb into n-scanouts
>>>>     ui/gtk-egl: un-tab and re-tab should destroy egl surface and context
>>>>     ui/gtk-egl: make sure the right context is set as the current
>>>>     ui/gtk-egl: guest fb texture needs to be regenerated when
>>>>       reinitializing egl
>>>>     ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>>>>
>>>>    include/hw/virtio/virtio-gpu.h        |  5 +++--
>>>>    include/ui/console.h                  |  4 ++++
>>>>    hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>>>>    hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>>>>    hw/display/virtio-gpu.c               |  4 ++--
>>>>    ui/egl-helpers.c                      | 25 +++++++++++++++++++++----
>>>>    ui/gtk-egl.c                          | 10 ++++++++++
>>>>    ui/gtk.c                              | 23 +++++++++++++++++++++++
>>>>    8 files changed, 79 insertions(+), 17 deletions(-)
>>>
>>> Applied, thanks.
>>
>> Ubuntu 18.04.4 LTS:
>>
>> ui/gtk-egl.c:159:13: error: implicit declaration of function
>> 'egl_dmabuf_release_texture' is invalid in C99
>> [-Werror,-Wimplicit-function-declaration]
>>              egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>>              ^
>> ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
>> [-Werror,-Wstrict-prototypes]
>> 2 errors generated.
>>
>> https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737
>>
> 
> This seems to fix but I have no clue whether it is correct:
> 
> -- >8 --
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index f2026e4b5c9..45cb67712df 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -156,8 +156,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>           }
> +#ifdef CONFIG_GBM
>           if (vc->gfx.guest_fb.dmabuf) {
>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>           }
> +#endif
>       }
> 
> ---

I see the same error here trying to build QEMU git master on Debian Buster 
(oldstable). The fix looks reasonable to me in that it matches the CONFIG_GBM guards 
around other similar functions and the resulting binary appears to work, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

