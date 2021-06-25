Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3983B3F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:33:02 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhGn-0004Uv-M2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwhEQ-0002s2-Li
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwhEN-0002Fq-7A
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609830;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mp2vHiK79PYqvr5D1a31irog5C0570FgUruWptkVPn0=;
 b=FI5OfTGU/hy/On/4rhoUvt1oNJFz73JyrPWmHSds/KNIwsIBbfM2/oYiRc+S/PVkeGSwtj
 7PjLdeIQffMvRrOT4LS/dGwQTmW4ebbne5wjhoI4M0QcwcQDOmv5uZGUlwcUJ069bG3C64
 iCkx0aK0++cWZvS/K/qPNAQqWm8GhTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-pVn5S0YiNKSWCPP1rFes4Q-1; Fri, 25 Jun 2021 04:30:28 -0400
X-MC-Unique: pVn5S0YiNKSWCPP1rFes4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97458804B88
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 08:30:27 +0000 (UTC)
Received: from redhat.com (ovpn-114-183.ams2.redhat.com [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF759189C4;
 Fri, 25 Jun 2021 08:30:21 +0000 (UTC)
Date: Fri, 25 Jun 2021 09:30:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] audio: Make the AudiodevDriver enum conditional
Message-ID: <YNWUGh2XmQ7eXtmQ@redhat.com>
References: <20210624183716.515721-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210624183716.515721-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 08:37:16PM +0200, Thomas Huth wrote:
> This way, the upper layers like libvirt could have the possibility
> to use QAPI to find out which audio drivers have been enabled during
> compile-time of QEMU.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: Marked as RFC since it's quite a lot of ifdef'ing here...
>        not sure whether I really like it...

Same as my patch here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00654.html

> 
>  audio/audio.c          | 16 +++++++++++++++
>  audio/audio_legacy.c   | 45 +++++++++++++++++++++++++++++-------------
>  audio/audio_template.h | 16 +++++++++++++++
>  qapi/audio.json        | 37 ++++++++++++++++++++++++----------
>  4 files changed, 90 insertions(+), 24 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 59453ef856..34a0f39c29 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1988,14 +1988,30 @@ void audio_create_pdos(Audiodev *dev)
>          break
>  
>          CASE(NONE, none, );
> +#if defined(CONFIG_AUDIO_ALSA)
>          CASE(ALSA, alsa, Alsa);
> +#endif
> +#if defined(CONFIG_AUDIO_COREAUDIO)
>          CASE(COREAUDIO, coreaudio, Coreaudio);
> +#endif
> +#if defined(CONFIG_AUDIO_DSOUND)
>          CASE(DSOUND, dsound, );
> +#endif
> +#if defined(CONFIG_AUDIO_JACK)
>          CASE(JACK, jack, Jack);
> +#endif
> +#if defined(CONFIG_AUDIO_OSS)
>          CASE(OSS, oss, Oss);
> +#endif
> +#if defined(CONFIG_AUDIO_PA)
>          CASE(PA, pa, Pa);
> +#endif
> +#if defined(CONFIG_AUDIO_SDL)
>          CASE(SDL, sdl, Sdl);
> +#endif
> +#if defined(CONFIG_SPICE)
>          CASE(SPICE, spice, );
> +#endif
>          CASE(WAV, wav, );
>  
>      case AUDIODEV_DRIVER__MAX:
> diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
> index 0fe827b057..d940f77a27 100644
> --- a/audio/audio_legacy.c
> +++ b/audio/audio_legacy.c
> @@ -92,7 +92,7 @@ static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
>      }
>  }
>  
> -
> +#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_DSOUND)
>  static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
>  {
>      const char *val = getenv(env);
> @@ -101,6 +101,7 @@ static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
>          *has_dst = true;
>      }
>  }
> +#endif
>  
>  static uint32_t frames_to_usecs(uint32_t frames,
>                                  AudiodevPerDirectionOptions *pdo)
> @@ -109,7 +110,7 @@ static uint32_t frames_to_usecs(uint32_t frames,
>      return (frames * 1000000 + freq / 2) / freq;
>  }
>  
> -
> +#if defined(CONFIG_AUDIO_COREAUDIO)
>  static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>                                  AudiodevPerDirectionOptions *pdo)
>  {
> @@ -119,6 +120,7 @@ static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>          *has_dst = true;
>      }
>  }
> +#endif
>  
>  static uint32_t samples_to_usecs(uint32_t samples,
>                                   AudiodevPerDirectionOptions *pdo)
> @@ -127,6 +129,7 @@ static uint32_t samples_to_usecs(uint32_t samples,
>      return frames_to_usecs(samples / channels, pdo);
>  }
>  
> +#if defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL)
>  static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>                                   AudiodevPerDirectionOptions *pdo)
>  {
> @@ -136,6 +139,7 @@ static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>          *has_dst = true;
>      }
>  }
> +#endif
>  
>  static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
>  {
> @@ -144,6 +148,7 @@ static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
>      return samples_to_usecs(bytes / bytes_per_sample, pdo);
>  }
>  
> +__attribute__((unused))
>  static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>                                 AudiodevPerDirectionOptions *pdo)
>  {
> @@ -155,7 +160,7 @@ static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>  }
>  
>  /* backend specific functions */
> -/* ALSA */
> +#if defined(CONFIG_AUDIO_ALSA)
>  static void handle_alsa_per_direction(
>      AudiodevAlsaPerDirectionOptions *apdo, const char *prefix)
>  {
> @@ -200,8 +205,9 @@ static void handle_alsa(Audiodev *dev)
>      get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
>                          &aopt->threshold, &aopt->has_threshold);
>  }
> +#endif
>  
> -/* coreaudio */
> +#if defined(CONFIG_AUDIO_COREAUDIO)
>  static void handle_coreaudio(Audiodev *dev)
>  {
>      get_frames_to_usecs(
> @@ -213,8 +219,9 @@ static void handle_coreaudio(Audiodev *dev)
>              &dev->u.coreaudio.out->buffer_count,
>              &dev->u.coreaudio.out->has_buffer_count);
>  }
> +#endif
>  
> -/* dsound */
> +#if defined(CONFIG_AUDIO_DSOUND)
>  static void handle_dsound(Audiodev *dev)
>  {
>      get_millis_to_usecs("QEMU_DSOUND_LATENCY_MILLIS",
> @@ -228,8 +235,9 @@ static void handle_dsound(Audiodev *dev)
>                         &dev->u.dsound.in->has_buffer_length,
>                         dev->u.dsound.in);
>  }
> +#endif
>  
> -/* OSS */
> +#if defined(CONFIG_AUDIO_OSS)
>  static void handle_oss_per_direction(
>      AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
>      const char *dev_env)
> @@ -256,8 +264,9 @@ static void handle_oss(Audiodev *dev)
>      get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusive);
>      get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy);
>  }
> +#endif
>  
> -/* pulseaudio */
> +#if defined(CONFIG_AUDIO_PA)
>  static void handle_pa_per_direction(
>      AudiodevPaPerDirectionOptions *ppdo, const char *env)
>  {
> @@ -280,8 +289,9 @@ static void handle_pa(Audiodev *dev)
>  
>      get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
>  }
> +#endif
>  
> -/* SDL */
> +#if defined(CONFIG_AUDIO_SDL)
>  static void handle_sdl(Audiodev *dev)
>  {
>      /* SDL is output only */
> @@ -289,6 +299,7 @@ static void handle_sdl(Audiodev *dev)
>          &dev->u.sdl.out->has_buffer_length,
>          qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
>  }
> +#endif
>  
>  /* wav */
>  static void handle_wav(Audiodev *dev)
> @@ -348,30 +359,36 @@ static AudiodevListEntry *legacy_opt(const char *drvname)
>      }
>  
>      switch (e->dev->driver) {
> +#if defined(CONFIG_AUDIO_ALSA)
>      case AUDIODEV_DRIVER_ALSA:
>          handle_alsa(e->dev);
>          break;
> -
> +#endif
> +#if defined(CONFIG_AUDIO_COREAUDIO)
>      case AUDIODEV_DRIVER_COREAUDIO:
>          handle_coreaudio(e->dev);
>          break;
> -
> +#endif
> +#if defined(CONFIG_AUDIO_DSOUND)
>      case AUDIODEV_DRIVER_DSOUND:
>          handle_dsound(e->dev);
>          break;
> -
> +#endif
> +#if defined(CONFIG_AUDIO_OSS)
>      case AUDIODEV_DRIVER_OSS:
>          handle_oss(e->dev);
>          break;
> -
> +#endif
> +#if defined(CONFIG_AUDIO_PA)
>      case AUDIODEV_DRIVER_PA:
>          handle_pa(e->dev);
>          break;
> -
> +#endif
> +#if defined(CONFIG_AUDIO_SDL)
>      case AUDIODEV_DRIVER_SDL:
>          handle_sdl(e->dev);
>          break;
> -
> +#endif
>      case AUDIODEV_DRIVER_WAV:
>          handle_wav(e->dev);
>          break;
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index c6714946aa..b808088c7b 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -322,23 +322,39 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>      switch (dev->driver) {
>      case AUDIODEV_DRIVER_NONE:
>          return dev->u.none.TYPE;
> +#if defined(CONFIG_AUDIO_ALSA)
>      case AUDIODEV_DRIVER_ALSA:
>          return qapi_AudiodevAlsaPerDirectionOptions_base(dev->u.alsa.TYPE);
> +#endif
> +#if defined(CONFIG_AUDIO_COREAUDIO)
>      case AUDIODEV_DRIVER_COREAUDIO:
>          return qapi_AudiodevCoreaudioPerDirectionOptions_base(
>              dev->u.coreaudio.TYPE);
> +#endif
> +#if defined(CONFIG_AUDIO_DSOUND)
>      case AUDIODEV_DRIVER_DSOUND:
>          return dev->u.dsound.TYPE;
> +#endif
> +#if defined(CONFIG_AUDIO_JACK)
>      case AUDIODEV_DRIVER_JACK:
>          return qapi_AudiodevJackPerDirectionOptions_base(dev->u.jack.TYPE);
> +#endif
> +#if defined(CONFIG_AUDIO_OSS)
>      case AUDIODEV_DRIVER_OSS:
>          return qapi_AudiodevOssPerDirectionOptions_base(dev->u.oss.TYPE);
> +#endif
> +#if defined(CONFIG_AUDIO_PA)
>      case AUDIODEV_DRIVER_PA:
>          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
> +#endif
> +#if defined(CONFIG_AUDIO_SDL)
>      case AUDIODEV_DRIVER_SDL:
>          return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> +#endif
> +#if defined(CONFIG_SPICE)
>      case AUDIODEV_DRIVER_SPICE:
>          return dev->u.spice.TYPE;
> +#endif
>      case AUDIODEV_DRIVER_WAV:
>          return dev->u.wav.TYPE;
>  
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 9cba0df8a4..128850eba4 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -386,8 +386,17 @@
>  # Since: 4.0
>  ##
>  { 'enum': 'AudiodevDriver',
> -  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
> -            'sdl', 'spice', 'wav' ] }
> +  'data': [
> +    { 'name': 'none' },
> +    { 'name': 'alsa', 'if': 'defined(CONFIG_AUDIO_ALSA)' },
> +    { 'name': 'coreaudio', 'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> +    { 'name': 'dsound', 'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> +    { 'name': 'jack', 'if': 'defined(CONFIG_AUDIO_JACK)' },
> +    { 'name': 'oss', 'if': 'defined(CONFIG_AUDIO_OSS)' },
> +    { 'name': 'pa', 'if': 'defined(CONFIG_AUDIO_PA)' },
> +    { 'name': 'sdl', 'if': 'defined(CONFIG_AUDIO_SDL)' },
> +    { 'name': 'spice', 'if': 'defined(CONFIG_SPICE)' },
> +    { 'name': 'wav' } ] }
>  
>  ##
>  # @Audiodev:
> @@ -410,12 +419,20 @@
>    'discriminator': 'driver',
>    'data': {
>      'none':      'AudiodevGenericOptions',
> -    'alsa':      'AudiodevAlsaOptions',
> -    'coreaudio': 'AudiodevCoreaudioOptions',
> -    'dsound':    'AudiodevDsoundOptions',
> -    'jack':      'AudiodevJackOptions',
> -    'oss':       'AudiodevOssOptions',
> -    'pa':        'AudiodevPaOptions',
> -    'sdl':       'AudiodevSdlOptions',
> -    'spice':     'AudiodevGenericOptions',
> +    'alsa':      { 'type': 'AudiodevAlsaOptions',
> +                   'if': 'defined(CONFIG_AUDIO_ALSA)' },
> +    'coreaudio': { 'type': 'AudiodevCoreaudioOptions',
> +                   'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> +    'dsound':    { 'type': 'AudiodevDsoundOptions',
> +                   'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> +    'jack':      { 'type': 'AudiodevJackOptions',
> +                   'if': 'defined(CONFIG_AUDIO_JACK)' },
> +    'oss':       { 'type': 'AudiodevOssOptions',
> +                   'if': 'defined(CONFIG_AUDIO_OSS)' },
> +    'pa':        { 'type': 'AudiodevPaOptions',
> +                   'if': 'defined(CONFIG_AUDIO_PA)' },
> +    'sdl':       { 'type': 'AudiodevSdlOptions',
> +                   'if': 'defined(CONFIG_AUDIO_SDL)' },
> +    'spice':     { 'type': 'AudiodevGenericOptions',
> +                   'if': 'defined(CONFIG_SPICE)' },
>      'wav':       'AudiodevWavOptions' } }
> -- 
> 2.27.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


