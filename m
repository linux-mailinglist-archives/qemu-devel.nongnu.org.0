Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93D14FEF3
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 20:43:07 +0100 (CET)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyL98-0006em-PZ
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 14:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iyL7z-0006BW-K1
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:41:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iyL7y-0002zO-4Q
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:41:55 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iyL7x-0002z9-SV
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 14:41:54 -0500
Received: by mail-wr1-x441.google.com with SMTP id z9so3038884wrs.10
 for <qemu-devel@nongnu.org>; Sun, 02 Feb 2020 11:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LqmOf8ZmcxeuxKWsRQIuBDm932LIZVHZV0R/GeA4rUY=;
 b=KoO1L1NtYEDmuCeFsXpd4iPA+v8/HUyMJJp/wpHIDaSLFYakT2FADvyZa3mVLl7Kdv
 RGAiyqiLd+tSiMVWIhIsN6ZuHC7wG96bwfP7J0Urwn3SomidecmzGX10VO2Z2bJRZG+X
 Xp4Eci3jMkKh6VlF3GtWAiwk3Y7+FXVFvieIJLHNm45yNuJNTOTrfykUAQwet1L2aFiF
 ZhIygwdFlGzWYOwwggZd/4hSPLNNTA35NZsT3PyUswtV15JpjxIBbVDXWrclypPW3gM3
 QdpnXumDV6PuGK2XK7zoSaXVyqnNMuvZVgtdfwX7EF4DrPYmr3Hrs/s9QURX9+4dPO+F
 8Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LqmOf8ZmcxeuxKWsRQIuBDm932LIZVHZV0R/GeA4rUY=;
 b=V0xXbP4B9Jyivf6ZddB5aGIrSJJXv3ZwwHDlZnQTGpxAxpQn0IW3pPH9ghUclXSV0p
 okb7iZw8RvnmmrMserNwd1fg/6RDHYdJJVRGKMRkOTmZiSBcfs/cm4dDEQI86xkFnY07
 hhhgsDimiQP9HE7l6MFx0EAFqPULOSSHQqPfNaX19wdSM0aYQ+sZOEZyCt4wfiDIzfsm
 JMY0cQgC5C3OwC2BOaxziuE6T+PFN+7rsRtnkaCrPcf7eQnGAuQljumF+MPas0Lc1y1C
 eMnkyNCyiP2aDQUs38t6bM6aRBx8wudBRZKv7e6gewcmGEdvRJ9WPufB1xXgS6u6IBoj
 nn+Q==
X-Gm-Message-State: APjAAAW8wChGNqlMAhESNPSQJmxF0zD4SYJ9zvFAJkYuyQzH/nRiGsep
 fHN70uGCD6hloqPZs2A5DPgpgzc3
X-Google-Smtp-Source: APXvYqwPOeHo6tg2B62/c0iFX6YUilV/7v2/B57TVPhsMzzD/M6ZYEWZaYO7gO4Ok6YEKAjtJHXRIA==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr12294221wrw.158.1580672512721; 
 Sun, 02 Feb 2020 11:41:52 -0800 (PST)
Received: from ?IPv6:fd00:835b:d940:d4fc::5?
 (2a01-036c-0113-48e2-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:48e2::5])
 by smtp.gmail.com with ESMTPSA id p15sm19800253wma.40.2020.02.02.11.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2020 11:41:52 -0800 (PST)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
Subject: Re: [PATCH] coreaudio: fix coreaudio playback
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Programmingkid <programmingkidx@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <30c8b9e6-484c-5785-b178-bef01628db49@t-online.de>
 <20200202140641.4737-1-vr_qemu@t-online.de>
Message-ID: <07f0197b-f105-b8d3-f87c-0cce139f5284@gmail.com>
Date: Sun, 2 Feb 2020 20:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.9) Goanna/4.4
 Interlink/52.9.7282
MIME-Version: 1.0
In-Reply-To: <20200202140641.4737-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-02-02 15:06, Volker Rümelin wrote:
> There are reports that since commit 2ceb8240fa "coreaudio: port
> to the new audio backend api" audio playback with CoreAudio is
> broken. This patch reverts some parts the commit.
> 
> Because of changes in the audio subsystem the audio clip
> function in v4.1.0 of coreaudio.c had to be moved to mixeng.c
> and the generic buffer management code needed a hint about the
> size of the float type.
> 
> This patch is based on a patch from Zoltán Kővágó found at
> https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg02142.html.
> 
> Fixes: 2ceb8240fa "coreaudio: port to the new audio backend api"
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_template.h |  7 +++++++
>   audio/coreaudio.c      | 32 +++++++++-----------------------
>   audio/mixeng.c         | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   audio/mixeng.h         |  5 +++++
>   4 files changed, 69 insertions(+), 23 deletions(-)

Hi,

I started reviewing this patch, but then I realized that I don't really 
like that "if (s->dev->driver == AUDIODEV_DRIVER_COREAUDIO)" hack, so I 
went ahead and added (hopefully proper) float samples support to mixeng. 
  I've submitted that patch to the mailing list.  Unless it causes 
problems I think it would be the best to merge it into this patch.

Regards,
Zoltan

> 
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 3287d7075e..0336d2670c 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -276,6 +276,13 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
>           goto err1;
>       }
>   
> +    if (s->dev->driver == AUDIODEV_DRIVER_COREAUDIO) {
> +#ifdef DAC
> +        hw->clip = clip_natural_float_from_stereo;
> +#else
> +        hw->conv = conv_natural_float_to_stereo;
> +#endif
> +    } else
>   #ifdef DAC
>       hw->clip = mixeng_clip
>   #else
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index 66f0f459cf..0049db97fa 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -471,20 +471,6 @@ static OSStatus audioDeviceIOProc(
>       return 0;
>   }
>   
> -static UInt32 coreaudio_get_flags(struct audio_pcm_info *info,
> -                                  struct audsettings *as)
> -{
> -    UInt32 flags = info->sign ? kAudioFormatFlagIsSignedInteger : 0;
> -    if (as->endianness) { /* 0 = little, 1 = big */
> -        flags |= kAudioFormatFlagIsBigEndian;
> -    }
> -
> -    if (flags == 0) { /* must not be 0 */
> -        flags = kAudioFormatFlagsAreAllClear;
> -    }
> -    return flags;
> -}
> -
>   static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>                                 void *drv_opaque)
>   {
> @@ -496,6 +482,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>       Audiodev *dev = drv_opaque;
>       AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
>       int frames;
> +    struct audsettings fake_as;
>   
>       /* create mutex */
>       err = pthread_mutex_init(&core->mutex, NULL);
> @@ -504,6 +491,14 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>           return -1;
>       }
>   
> +    /*
> +     * The canonical audio format for CoreAudio on macOS is float. Currently
> +     * there is no generic code for AUDIO_FORMAT_F32 in qemu. Here we select
> +     * AUDIO_FORMAT_S32 instead because only the sample size has to match.
> +     */
> +    fake_as = *as;
> +    as = &fake_as;
> +    as->fmt = AUDIO_FORMAT_S32;
>       audio_pcm_init_info (&hw->info, as);
>   
>       status = coreaudio_get_voice(&core->outputDeviceID);
> @@ -572,15 +567,6 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>   
>       /* set Samplerate */
>       core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
> -    core->outputStreamBasicDescription.mFormatID = kAudioFormatLinearPCM;
> -    core->outputStreamBasicDescription.mFormatFlags =
> -        coreaudio_get_flags(&hw->info, as);
> -    core->outputStreamBasicDescription.mBytesPerPacket =
> -        core->outputStreamBasicDescription.mBytesPerFrame =
> -        hw->info.nchannels * hw->info.bits / 8;
> -    core->outputStreamBasicDescription.mFramesPerPacket = 1;
> -    core->outputStreamBasicDescription.mChannelsPerFrame = hw->info.nchannels;
> -    core->outputStreamBasicDescription.mBitsPerChannel = hw->info.bits;
>   
>       status = coreaudio_set_streamformat(core->outputDeviceID,
>                                           &core->outputStreamBasicDescription);
> diff --git a/audio/mixeng.c b/audio/mixeng.c
> index 2f5ba71381..16b646d48c 100644
> --- a/audio/mixeng.c
> +++ b/audio/mixeng.c
> @@ -267,6 +267,54 @@ f_sample *mixeng_clip[2][2][2][3] = {
>       }
>   };
>   
> +void conv_natural_float_to_stereo(struct st_sample *dst, const void *src,
> +                                  int samples)
> +{
> +    float *in = (float *)src;
> +#ifndef FLOAT_MIXENG
> +    const float scale = UINT_MAX;
> +#endif
> +
> +    while (samples--) {
> +#ifdef FLOAT_MIXENG
> +        dst->l = *in++;
> +        dst->r = *in++;
> +#else
> +        dst->l = *in++ * scale;
> +        dst->r = *in++ * scale;
> +#endif
> +        dst++;
> +    }
> +}
> +
> +void clip_natural_float_from_stereo(void *dst, const struct st_sample *src,
> +                                    int samples)
> +{
> +    float *out = (float *)dst;
> +#ifndef FLOAT_MIXENG
> +#ifdef RECIPROCAL
> +    const float scale = 1.f / UINT_MAX;
> +#else
> +    const float scale = UINT_MAX;
> +#endif
> +#endif
> +
> +    while (samples--) {
> +#ifdef FLOAT_MIXENG
> +        *out++ = src->l;
> +        *out++ = src->r;
> +#else
> +#ifdef RECIPROCAL
> +        *out++ = src->l * scale;
> +        *out++ = src->r * scale;
> +#else
> +        *out++ = src->l / scale;
> +        *out++ = src->r / scale;
> +#endif
> +#endif
> +        src++;
> +    }
> +}
>   
>   void audio_sample_to_uint64(void *samples, int pos,
>                               uint64_t *left, uint64_t *right)
> diff --git a/audio/mixeng.h b/audio/mixeng.h
> index 18e62c7c49..7ef61763e8 100644
> --- a/audio/mixeng.h
> +++ b/audio/mixeng.h
> @@ -41,6 +41,11 @@ typedef void (f_sample) (void *dst, const struct st_sample *src, int samples);
>   extern t_sample *mixeng_conv[2][2][2][3];
>   extern f_sample *mixeng_clip[2][2][2][3];
>   
> +void conv_natural_float_to_stereo(struct st_sample *dst, const void *src,
> +                                  int samples);
> +void clip_natural_float_from_stereo(void *dst, const struct st_sample *src,
> +                                    int samples);
> +
>   void *st_rate_start (int inrate, int outrate);
>   void st_rate_flow(void *opaque, st_sample *ibuf, st_sample *obuf,
>                     size_t *isamp, size_t *osamp);
> 


