Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F46F9913
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 16:58:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvfoh-0001ru-Tr; Sun, 07 May 2023 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfof-0001rT-FH
 for qemu-devel@nongnu.org; Sun, 07 May 2023 10:56:49 -0400
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfob-0005tm-2C
 for qemu-devel@nongnu.org; Sun, 07 May 2023 10:56:47 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id D828328DDB;
 Sun,  7 May 2023 16:56:39 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvfoR-1tno1p0; Sun, 7 May 2023 16:56:35 +0200
Message-ID: <d4b3318d-6e27-658b-770d-3be47803c68f@t-online.de>
Date: Sun, 7 May 2023 16:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 03/12] audio/pw: Pipewire->PipeWire case fix for
 user-visible text
Content-Language: de-DE
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230506163735.3481387-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683471395-DE542C15-18740CD6/0/0 CLEAN NORMAL
X-TOI-MSGID: 68e33ab7-ccf1-4c6a-be70-51875f3b5946
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> "PipeWire" is the correct case.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build                   |  2 +-
>   qapi/audio.json               | 12 ++++++------
>   audio/pwaudio.c               | 10 +++++-----
>   audio/trace-events            |  2 +-
>   meson_options.txt             |  2 +-
>   qemu-options.hx               |  4 ++--
>   scripts/meson-buildoptions.sh |  2 +-
>   7 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/meson.build b/meson.build
> index 229eb585f7..4c44736bd4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3988,7 +3988,7 @@ if targetos == 'linux'
>     summary_info += {'ALSA support':    alsa}
>     summary_info += {'PulseAudio support': pulse}
>   endif
> -summary_info += {'Pipewire support':   pipewire}
> +summary_info += {'PipeWire support':   pipewire}
>   summary_info += {'JACK support':      jack}
>   summary_info += {'brlapi support':    brlapi}
>   summary_info += {'vde support':       vde}
> diff --git a/qapi/audio.json b/qapi/audio.json
> index e03396a7bc..b5c1af2b91 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -327,17 +327,17 @@
>   ##
>   # @AudiodevPipewirePerDirectionOptions:
>   #
> -# Options of the Pipewire backend that are used for both playback and
> +# Options of the PipeWire backend that are used for both playback and
>   # recording.
>   #
>   # @name: name of the sink/source to use
>   #
> -# @stream-name: name of the Pipewire stream created by qemu.  Can be
> -#               used to identify the stream in Pipewire when you
> -#               create multiple Pipewire devices or run multiple qemu
> +# @stream-name: name of the PipeWire stream created by qemu.  Can be
> +#               used to identify the stream in PipeWire when you
> +#               create multiple PipeWire devices or run multiple qemu
>   #               instances (default: audiodev's id)
>   #
> -# @latency: latency you want Pipewire to achieve in microseconds
> +# @latency: latency you want PipeWire to achieve in microseconds
>   #           (default 46000)
>   #
>   # Since: 8.1
> @@ -352,7 +352,7 @@
>   ##
>   # @AudiodevPipewireOptions:
>   #
> -# Options of the Pipewire audio backend.
> +# Options of the PipeWire audio backend.
>   #
>   # @in: options of the capture stream
>   #
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 1d108bdebb..9eb69bfd18 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU Pipewire audio driver
> + * QEMU PipeWire audio driver
>    *
>    * Copyright (c) 2023 Red Hat Inc.
>    *
> @@ -800,21 +800,21 @@ qpw_audio_init(Audiodev *dev)
>       assert(dev->driver == AUDIODEV_DRIVER_PIPEWIRE);
>   
>       pw->dev = dev;
> -    pw->thread_loop = pw_thread_loop_new("Pipewire thread loop", NULL);
> +    pw->thread_loop = pw_thread_loop_new("PipeWire thread loop", NULL);
>       if (pw->thread_loop == NULL) {
> -        error_report("Could not create Pipewire loop");
> +        error_report("Could not create PipeWire loop");
>           goto fail;
>       }
>   
>       pw->context =
>           pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0);
>       if (pw->context == NULL) {
> -        error_report("Could not create Pipewire context");
> +        error_report("Could not create PipeWire context");
>           goto fail;
>       }
>   
>       if (pw_thread_loop_start(pw->thread_loop) < 0) {
> -        error_report("Could not start Pipewire loop");
> +        error_report("Could not start PipeWire loop");
>           goto fail;
>       }
>   
> diff --git a/audio/trace-events b/audio/trace-events
> index 85dbb506b2..ab04f020ce 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -24,7 +24,7 @@ pw_read(int32_t avail, uint32_t index, size_t len) "avail=%d index=%u len=%zu"
>   pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) "filled=%d avail=%d index=%u len=%zu"
>   pw_vol(const char *ret) "set volume: %s"
>   pw_period(uint64_t quantum, uint32_t rate) "period =%" PRIu64 "/%u"
> -pw_audio_init(void) "Initialize Pipewire context"
> +pw_audio_init(void) "Initialize PipeWire context"
>   
>   # audio.c
>   audio_timer_start(int interval) "interval %d ms"
> diff --git a/meson_options.txt b/meson_options.txt
> index ae2017702a..8dd786c1a4 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -256,7 +256,7 @@ option('oss', type: 'feature', value: 'auto',
>   option('pa', type: 'feature', value: 'auto',
>          description: 'PulseAudio sound support')
>   option('pipewire', type: 'feature', value: 'auto',
> -       description: 'Pipewire sound support')
> +       description: 'PipeWire sound support')
>   option('sndio', type: 'feature', value: 'auto',
>          description: 'sndio sound support')
>   
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 42b9094c10..be7317d455 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -963,10 +963,10 @@ SRST
>           to honor this value but actual latencies may be lower or higher.
>   
>   ``-audiodev pipewire,id=id[,prop[=value][,...]]``
> -    Creates a backend using Pipewire. This backend is available on
> +    Creates a backend using PipeWire. This backend is available on
>       most systems.
>   
> -    Pipewire specific options are:
> +    PipeWire specific options are:
>   
>       ``in|out.latency=usecs``
>           Desired latency in microseconds.
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 0e888e6ecd..ba697207f4 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -137,7 +137,7 @@ meson_options_help() {
>     printf "%s\n" '  oss             OSS sound support'
>     printf "%s\n" '  pa              PulseAudio sound support'
>     printf "%s\n" '  parallels       parallels image format support'
> -  printf "%s\n" '  pipewire        Pipewire sound support'
> +  printf "%s\n" '  pipewire        PipeWire sound support'
>     printf "%s\n" '  png             PNG support with libpng'
>     printf "%s\n" '  pvrdma          Enable PVRDMA support'
>     printf "%s\n" '  qcow1           qcow1 image format support'


