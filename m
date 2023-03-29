Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C116CD462
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 10:20:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phR1g-0001en-DE; Wed, 29 Mar 2023 04:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1phR1d-0001eI-UM
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:19:21 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1phR1Y-0000FW-Jq
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:19:21 -0400
Received: by mail-lj1-x22c.google.com with SMTP id 20so15252906lju.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680077946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+BBHI//jWiu8JvcxIiaUA4kxlLM7bb0T2bJFRkIL4w=;
 b=KpCDAc9xa8P61oOZJMz1idd8+SDHtnZuQ1UeLEuPqH35TYso67YayD9ClrI4jsgh7Y
 CHcWmt1vLrIo7pRPcJ+1aeVdzUN+cCDFPvsFRa0ZcG0sfMBWXKekOLnTtBsPPXaKtneY
 wNyAOauRi7HsOKSTQrv3OSzI9trSGqnkaavbUiz7BSW7Tl03R0tnqzajhE775Fy/nwsy
 phg+T6+1qRpUxTbd1gTzanekHFsABg/nIzF+1GL0ffmoH1tGnOAmAOJom8u/BZPtFSIy
 WCJYbGSSregja24OWIaqQ4XnZG9QvJdMX5XG8RrPlNtik+CfBN+79y4Wc5AburmTzepR
 j+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680077946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+BBHI//jWiu8JvcxIiaUA4kxlLM7bb0T2bJFRkIL4w=;
 b=6M0rURLMpBzYs5NdAtnl19SRdA74sbiESk//frmLFghxTL9UGfxidG61MQ8jRldGP6
 kp2quawEs1F219PxZtImszgC1uDKvryFDaU0fs/wkKedDwGDN+rk513WJXJ6hNhxbVQ2
 d4tvCEg8FPBGpNXIx3Wz8lbV2HvfvdaBGmFyqXw5Da++iOtbXSnhhb0mgQJ4q+s9ck5J
 CiOsXqOXXw7IyaTgOuDS6j0/o1drSQGyfk9tFDx2f8X6E9sZ76ViuBrBSdrpX8KGWQ/v
 CdS5GRhOVLKtrIjg+paca42is9zCGD3CFXba7M/nLI8ObtocES10TQKuSVVFtg86OYwE
 pFdQ==
X-Gm-Message-State: AAQBX9fPr011wuGm3Y/kk07zj70W56CcmFz13lBdxwy9BY9rz6nATrEW
 8mSlNdIMJuLV0pUiI1ZLQ+OI0eCvCI6Z3GjlPFg=
X-Google-Smtp-Source: AKy350aKN9uAZrJor1UsgQ+eZv/qjPh77s2ZxTcPF/B/stNtK41T6sE+jxo6ve4UBuRzsGeYN4MtFlPV+AeKEDC3f5U=
X-Received: by 2002:a2e:8697:0:b0:295:acea:5875 with SMTP id
 l23-20020a2e8697000000b00295acea5875mr487657lji.2.1680077946173; Wed, 29 Mar
 2023 01:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230328130819.136186-1-dbassey@redhat.com>
In-Reply-To: <20230328130819.136186-1-dbassey@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 29 Mar 2023 12:18:54 +0400
Message-ID: <CAJ+F1CKSwbhVxgmYzoCzDqRy+pnO5ibL6YtkhesJw+Roo43nfA@mail.gmail.com>
Subject: Re: [PATCH v9] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, vr_qemu@t-online.de, kraxel@redhat.com, 
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com, 
 wtaymans@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Dorinda,

On Tue, Mar 28, 2023 at 5:08=E2=80=AFPM Dorinda Bassey <dbassey@redhat.com>=
 wrote:
>
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source. This backend is available on most systems
>
> Add Pipewire entry points for QEMU Pipewire audio backend
> Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> qpw_write function returns the current state of the stream to pwaudio
> and Writes some data to the server for playback streams using pipewire
> spa_ringbuffer implementation.
> qpw_read function returns the current state of the stream to pwaudio and
> reads some data from the server for capture streams using pipewire
> spa_ringbuffer implementation. These functions qpw_write and qpw_read
> are called during playback and capture.
> Added some functions that convert pw audio formats to QEMU audio format
> and vice versa which would be needed in the pipewire audio sink and
> source functions qpw_init_in() & qpw_init_out().
> These methods that implement playback and recording will create streams
> for playback and capture that will start processing and will result in
> the on_process callbacks to be called.
> Built a connection to the Pipewire sound system server in the
> qpw_audio_init() method.
>
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> ---
> v9:
> add code to play silence on a buffer underrun
> remove redundant block in playback and capture process functions
> refactor code for enabling/disabling audio stream
> add volume_out and volume_in pcm_ops function
> add code for in|out.name options
> add in|out.stream-name options
> fix format specifiers
> change release version
> add missing latency option
>
>  audio/audio.c                 |   3 +
>  audio/audio_template.h        |   4 +
>  audio/meson.build             |   1 +
>  audio/pwaudio.c               | 879 ++++++++++++++++++++++++++++++++++
>  audio/trace-events            |   8 +
>  meson.build                   |   8 +
>  meson_options.txt             |   4 +-
>  qapi/audio.json               |  44 ++
>  qemu-options.hx               |  21 +
>  scripts/meson-buildoptions.sh |   8 +-
>  10 files changed, 977 insertions(+), 3 deletions(-)
>  create mode 100644 audio/pwaudio.c
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 70b096713c..90c7c49d11 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -2061,6 +2061,9 @@ void audio_create_pdos(Audiodev *dev)
>  #ifdef CONFIG_AUDIO_PA
>          CASE(PA, pa, Pa);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +        CASE(PIPEWIRE, pipewire, Pipewire);
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>          CASE(SDL, sdl, Sdl);
>  #endif
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index e42326c20d..dc0c74aa74 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -362,6 +362,10 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TY=
PE)(Audiodev *dev)
>      case AUDIODEV_DRIVER_PA:
>          return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    case AUDIODEV_DRIVER_PIPEWIRE:
> +        return qapi_AudiodevPipewirePerDirectionOptions_base(dev->u.pipe=
wire.TYPE);
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      case AUDIODEV_DRIVER_SDL:
>          return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE)=
;
> diff --git a/audio/meson.build b/audio/meson.build
> index 0722224ba9..65a49c1a10 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -19,6 +19,7 @@ foreach m : [
>    ['sdl', sdl, files('sdlaudio.c')],
>    ['jack', jack, files('jackaudio.c')],
>    ['sndio', sndio, files('sndioaudio.c')],
> +  ['pipewire', pipewire, files('pwaudio.c')],
>    ['spice', spice, files('spiceaudio.c')]
>  ]
>    if m[1].found()
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> new file mode 100644
> index 0000000000..ca83bc55f9
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,879 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023 Red Hat Inc.
> + *
> + * Author: Dorinda Bassey       <dbassey@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "audio.h"
> +#include <errno.h>
> +#include "qemu/error-report.h"
> +#include <spa/param/audio/format-utils.h>
> +#include <spa/utils/ringbuffer.h>
> +#include <spa/utils/result.h>
> +#include <spa/param/props.h>
> +
> +#include <pipewire/pipewire.h>
> +#include "trace.h"
> +
> +#define AUDIO_CAP "pipewire"
> +#define RINGBUFFER_SIZE    (1u << 22)
> +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> +
> +#include "audio_int.h"
> +
> +enum {
> +    MODE_SINK,
> +    MODE_SOURCE
> +};
> +
> +typedef struct pwvolume {
> +    uint32_t channels;
> +    float values[SPA_AUDIO_MAX_CHANNELS];
> +} pwvolume;
> +
> +typedef struct pwaudio {
> +    Audiodev *dev;
> +    struct pw_thread_loop *thread_loop;
> +    struct pw_context *context;
> +
> +    struct pw_core *core;
> +    struct spa_hook core_listener;
> +    int seq;
> +} pwaudio;
> +
> +typedef struct PWVoice {
> +    pwaudio *g;
> +    struct pw_stream *stream;
> +    struct spa_hook stream_listener;
> +    struct spa_audio_info_raw info;
> +    uint32_t highwater_mark;
> +    uint32_t frame_size;
> +    struct spa_ringbuffer ring;
> +    uint8_t buffer[RINGBUFFER_SIZE];
> +
> +    uint32_t mode;
> +    struct pw_properties *props;
> +    pwvolume volume;
> +    bool muted;
> +} PWVoice;
> +
> +typedef struct PWVoiceOut {
> +    HWVoiceOut hw;
> +    PWVoice v;
> +} PWVoiceOut;
> +
> +typedef struct PWVoiceIn {
> +    HWVoiceIn hw;
> +    PWVoice v;
> +} PWVoiceIn;
> +
> +static void
> +stream_destroy(void *data)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
> +    spa_hook_remove(&v->stream_listener);
> +    v->stream =3D NULL;
> +}
> +
> +/* output data processing function to read stuffs from the buffer */
> +static void
> +playback_on_process(void *data)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    uint32_t req, index, n_bytes;
> +    int32_t avail;
> +
> +    if (!v->stream) {
> +        return;
> +    }

Could you replace with an assert(v->stream) instead?


> +
> +    /* obtain a buffer to read from */
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    /* calculate the total no of bytes to read data from buffer */
> +    req =3D b->requested * v->frame_size;
> +    if (req =3D=3D 0) {
> +        req =3D (uint64_t)v->g->dev->timer_period * v->info.rate
> +                * 1 / 2 / 1000000 * v->frame_size;
> +    }
> +    n_bytes =3D SPA_MIN(req, buf->datas[0].maxsize);
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +
> +    if (avail =3D=3D 0) {
> +        memset(p, 0, n_bytes);

Clear the buffer...

> +    }
> +
> +    if (avail < (int32_t) n_bytes) {
> +        n_bytes =3D avail;

...but queue 0. Look like you don't need the memset() after all.

> +    }
> +
> +    spa_ringbuffer_read_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, p, n_bytes);
> +
> +    index +=3D n_bytes;
> +    spa_ringbuffer_read_update(&v->ring, index);
> +
> +    buf->datas[0].chunk->offset =3D 0;
> +    buf->datas[0].chunk->stride =3D v->frame_size;
> +    buf->datas[0].chunk->size =3D n_bytes;
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
> +/* output data processing function to generate stuffs in the buffer */
> +static void
> +capture_on_process(void *data)
> +{
> +    PWVoice *v =3D (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    int32_t filled;
> +    uint32_t index, offs, n_bytes;
> +
> +    if (!v->stream) {
> +        return;
> +    }

Could you replace with an assert(v->stream) instead?

> +
> +    /* obtain a buffer */
> +    b =3D pw_stream_dequeue_buffer(v->stream);
> +    if (b =3D=3D NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    /* Write data into buffer */
> +    buf =3D b->buffer;
> +    p =3D buf->datas[0].data;
> +    if (p =3D=3D NULL) {
> +        return;
> +    }
> +    offs =3D SPA_MIN(buf->datas[0].chunk->offset, buf->datas[0].maxsize)=
;
> +    n_bytes =3D SPA_MIN(buf->datas[0].chunk->size, buf->datas[0].maxsize=
 - offs);
> +
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +
> +
> +    if (filled < 0) {
> +        error_report("%p: underrun write:%u filled:%d", p, index, filled=
);
> +    } else {
> +        if ((uint32_t) filled + n_bytes > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%u > max=
:%u",
> +            p, index, filled, n_bytes, RINGBUFFER_SIZE);
> +        }
> +    }
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK,
> +                                SPA_PTROFF(p, offs, void), n_bytes);
> +    index +=3D n_bytes;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
> +static void
> +on_stream_state_changed(void *_data, enum pw_stream_state old,
> +                        enum pw_stream_state state, const char *error)
> +{
> +    PWVoice *v =3D (PWVoice *) _data;

why not simply name it "data"?

> +
> +    trace_pw_state_changed(pw_stream_state_as_string(state));
> +
> +    switch (state) {
> +    case PW_STREAM_STATE_ERROR:
> +    case PW_STREAM_STATE_UNCONNECTED:
> +        {
> +            break;
> +        }

hmm..

> +    case PW_STREAM_STATE_PAUSED:
> +        trace_pw_node(pw_stream_get_node_id(v->stream));
> +        break;
> +    case PW_STREAM_STATE_CONNECTING:
> +    case PW_STREAM_STATE_STREAMING:
> +        break;
> +    }

I understand it may be desirable to have a trace for stream state
change. But the implementation could be simpler, no switch involved,
and easier to read, simply change the code to:

 trace_pw_state_changed(pw_stream_get_node_id(v->stream),
pw_stream_state_as_string(state));


> +}
> +
> +static const struct pw_stream_events capture_stream_events =3D {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy =3D stream_destroy,
> +    .state_changed =3D on_stream_state_changed,
> +    .process =3D capture_on_process
> +};
> +
> +static const struct pw_stream_events playback_stream_events =3D {
> +    PW_VERSION_STREAM_EVENTS,
> +    .destroy =3D stream_destroy,
> +    .state_changed =3D on_stream_state_changed,
> +    .process =3D playback_on_process
> +};
> +
> +static size_t
> +qpw_read(HWVoiceIn *hw, void *data, size_t len)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    size_t l;
> +    int32_t avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D PW_STREAM_STATE_STRE=
AMING) {
> +        /* wait for stream to become ready */
> +        l =3D 0;
> +        goto done_unlock;
> +    }
> +    /* get no of available bytes to read data from buffer */
> +    avail =3D spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    trace_pw_read(avail, index, len);
> +
> +    if (avail < (int32_t) len) {
> +        len =3D avail;
> +    }
> +
> +    spa_ringbuffer_read_data(&v->ring,
> +                             v->buffer, RINGBUFFER_SIZE,
> +                             index & RINGBUFFER_MASK, data, len);
> +    index +=3D len;
> +    spa_ringbuffer_read_update(&v->ring, index);
> +    l =3D len;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return l;
> +}
> +
> +static size_t qpw_buffer_get_free(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *)hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D PW_STREAM_STATE_STRE=
AMING) {
> +        /* wait for stream to become ready */
> +        avail =3D 0;
> +        goto done_unlock;
> +    }
> +
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail =3D v->highwater_mark - filled;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return avail;
> +}
> +
> +static size_t
> +qpw_write(HWVoiceOut *hw, void *data, size_t len)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    const char *error =3D NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) !=3D PW_STREAM_STATE_STRE=
AMING) {
> +        /* wait for stream to become ready */
> +        len =3D 0;
> +        goto done_unlock;
> +    }
> +    filled =3D spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail =3D v->highwater_mark - filled;
> +
> +    trace_pw_write(filled, avail, index, len);
> +
> +    if (len > avail) {
> +        len =3D avail;
> +    }
> +
> +    if (filled < 0) {
> +        error_report("%p: underrun write:%u filled:%d", pw, index, fille=
d);
> +    } else {
> +        if ((uint32_t) filled + len > RINGBUFFER_SIZE) {
> +            error_report("%p: overrun write:%u filled:%d + size:%zu > ma=
x:%u",
> +            pw, index, filled, len, RINGBUFFER_SIZE);
> +        }
> +    }
> +
> +    spa_ringbuffer_write_data(&v->ring,
> +                                v->buffer, RINGBUFFER_SIZE,
> +                                index & RINGBUFFER_MASK, data, len);
> +    index +=3D len;
> +    spa_ringbuffer_write_update(&v->ring, index);
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return len;
> +}
> +
> +static int
> +audfmt_to_pw(AudioFormat fmt, int endianness)
> +{
> +    int format;
> +
> +    switch (fmt) {
> +    case AUDIO_FORMAT_S8:
> +        format =3D SPA_AUDIO_FORMAT_S8;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        format =3D SPA_AUDIO_FORMAT_U8;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S16_BE : SPA_AUDIO_FORM=
AT_S16_LE;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U16_BE : SPA_AUDIO_FORM=
AT_U16_LE;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_S32_BE : SPA_AUDIO_FORM=
AT_S32_LE;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_U32_BE : SPA_AUDIO_FORM=
AT_U32_LE;
> +        break;
> +    case AUDIO_FORMAT_F32:
> +        format =3D endianness ? SPA_AUDIO_FORMAT_F32_BE : SPA_AUDIO_FORM=
AT_F32_LE;
> +        break;
> +    default:
> +        dolog("Internal logic error: Bad audio format %d\n", fmt);
> +        format =3D SPA_AUDIO_FORMAT_U8;
> +        break;
> +    }
> +    return format;
> +}
> +
> +static AudioFormat
> +pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
> +             uint32_t *frame_size)
> +{
> +    switch (fmt) {
> +    case SPA_AUDIO_FORMAT_S8:
> +        *frame_size =3D 1;
> +        return AUDIO_FORMAT_S8;
> +    case SPA_AUDIO_FORMAT_U8:
> +        *frame_size =3D 1;
> +        return AUDIO_FORMAT_U8;
> +    case SPA_AUDIO_FORMAT_S16_BE:
> +        *frame_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_S16_LE:
> +        *frame_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S16;
> +    case SPA_AUDIO_FORMAT_U16_BE:
> +        *frame_size =3D 2;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_U16_LE:
> +        *frame_size =3D 2;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U16;
> +    case SPA_AUDIO_FORMAT_S32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_S32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_S32;
> +    case SPA_AUDIO_FORMAT_U32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_U32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_U32;
> +    case SPA_AUDIO_FORMAT_F32_BE:
> +        *frame_size =3D 4;
> +        *endianness =3D 1;
> +        return AUDIO_FORMAT_F32;
> +    case SPA_AUDIO_FORMAT_F32_LE:
> +        *frame_size =3D 4;
> +        *endianness =3D 0;
> +        return AUDIO_FORMAT_F32;
> +    default:
> +        *frame_size =3D 1;
> +        dolog("Internal logic error: Bad spa_audio_format %d\n", fmt);
> +        return AUDIO_FORMAT_U8;
> +    }
> +}
> +
> +static int
> +create_stream(pwaudio *c, PWVoice *v, const char *stream_name, const cha=
r *name)
> +{
> +    int res;
> +    uint32_t n_params;
> +    const struct spa_pod *params[2];
> +    uint8_t buffer[1024];
> +    struct spa_pod_builder b;
> +
> +    v->props =3D pw_properties_new(NULL, NULL);
> +    pw_properties_setf(v->props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> +                       (uint64_t)v->g->dev->timer_period * v->info.rate
> +                       * 3 / 4 / 1000000, v->info.rate);

What is 3/4 for? I might have missed previous discussions, it would be
worth explaining and adding a trace for the value.

> +    if (name) {
> +        pw_properties_set(v->props, PW_KEY_TARGET_OBJECT, name);
> +    }
> +    v->stream =3D pw_stream_new(c->core, stream_name, v->props);
> +
> +    if (v->stream =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    if (v->mode =3D=3D MODE_SOURCE) {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &capture_stream_events,=
 v);
> +    } else {
> +        pw_stream_add_listener(v->stream,
> +                            &v->stream_listener, &playback_stream_events=
, v);
> +    }
> +
> +    n_params =3D 0;
> +    spa_pod_builder_init(&b, buffer, sizeof(buffer));
> +    params[n_params++] =3D spa_format_audio_raw_build(&b,
> +                            SPA_PARAM_EnumFormat,
> +                            &v->info);
> +
> +    /* connect the stream to a sink or source */
> +    res =3D pw_stream_connect(v->stream,
> +                            v->mode =3D=3D
> +                            MODE_SOURCE ? PW_DIRECTION_INPUT :
> +                            PW_DIRECTION_OUTPUT, PW_ID_ANY,
> +                            PW_STREAM_FLAG_AUTOCONNECT |
> +                            PW_STREAM_FLAG_INACTIVE |
> +                            PW_STREAM_FLAG_MAP_BUFFERS |
> +                            PW_STREAM_FLAG_RT_PROCESS, params, n_params)=
;
> +    if (res < 0) {
> +        pw_stream_destroy(v->stream);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int
> +qpw_stream_new(pwaudio *c, PWVoice *v,
> +               const char *stream_name, const char *name)
> +{
> +    int r;
> +
> +    switch (v->info.channels) {
> +    case 8:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> +        v->info.position[6] =3D SPA_AUDIO_CHANNEL_SL;
> +        v->info.position[7] =3D SPA_AUDIO_CHANNEL_SR;
> +        break;
> +    case 6:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RL;
> +        v->info.position[5] =3D SPA_AUDIO_CHANNEL_RR;
> +        break;
> +    case 5:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_LFE;
> +        v->info.position[4] =3D SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 4:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_FC;
> +        v->info.position[3] =3D SPA_AUDIO_CHANNEL_RC;
> +        break;
> +    case 3:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        v->info.position[2] =3D SPA_AUDIO_CHANNEL_LFE;
> +        break;
> +    case 2:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_FL;
> +        v->info.position[1] =3D SPA_AUDIO_CHANNEL_FR;
> +        break;
> +    case 1:
> +        v->info.position[0] =3D SPA_AUDIO_CHANNEL_MONO;
> +        break;
> +    default:
> +        for (size_t i =3D 0; i < v->info.channels; i++) {
> +            v->info.position[i] =3D SPA_AUDIO_CHANNEL_UNKNOWN;
> +        }
> +        break;
> +    }
> +
> +    /* create a new unconnected pwstream */
> +    r =3D create_stream(c, v, stream_name, name);
> +    if (r < 0) {
> +        AUD_log(AUDIO_CAP, "Failed to create stream.");
> +        return -1;
> +    }
> +
> +    return r;
> +}
> +
> +static int
> +qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    struct audsettings obt_as =3D *as;
> +    pwaudio *c =3D v->g =3D drv_opaque;
> +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->out;
> +    int r;
> +
> +    v->mode =3D MODE_SINK;

This field and enum is not necessary if you simply pass a PW_DIRECTION
down to create_stream().

> +
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size)=
;
> +    v->frame_size *=3D as->nchannels;
> +
> +    /* call the function that creates a new stream for playback */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id, ppdo->n=
ame);
> +    if (r < 0) {
> +        error_report("qpw_stream_new for playback failed");
> +        pw_thread_loop_unlock(c->thread_loop);
> +        return -1;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples =3D audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46=
440);
> +    v->highwater_mark =3D MIN(RINGBUFFER_SIZE,
> +                            (ppdo->has_latency ? ppdo->latency : 46440)
> +                            * (uint64_t)v->info.rate / 1000000 * v->fram=
e_size);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +}
> +
> +static int
> +qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    struct audsettings obt_as =3D *as;
> +    pwaudio *c =3D v->g =3D drv_opaque;
> +    AudiodevPipewireOptions *popts =3D &c->dev->u.pipewire;
> +    AudiodevPipewirePerDirectionOptions *ppdo =3D popts->in;
> +    int r;
> +
> +    v->mode =3D MODE_SOURCE;
> +    pw_thread_loop_lock(c->thread_loop);
> +
> +    v->info.format =3D audfmt_to_pw(as->fmt, as->endianness);
> +    v->info.channels =3D as->nchannels;
> +    v->info.rate =3D as->freq;
> +
> +    obt_as.fmt =3D
> +        pw_to_audfmt(v->info.format, &obt_as.endianness, &v->frame_size)=
;
> +    v->frame_size *=3D as->nchannels;
> +
> +    /* call the function that creates a new stream for recording */
> +    r =3D qpw_stream_new(c, v, ppdo->stream_name ? : c->dev->id, ppdo->n=
ame);
> +    if (r < 0) {
> +        error_report("qpw_stream_new for recording failed");
> +        pw_thread_loop_unlock(c->thread_loop);
> +        return -1;
> +    }
> +
> +    /* report the audio format we support */
> +    audio_pcm_init_info(&hw->info, &obt_as);
> +
> +    /* report the buffer size to qemu */
> +    hw->samples =3D audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46=
440);
> +
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return 0;
> +}
> +
> +static void
> +qpw_fini_out(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c =3D v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream =3D NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}
> +
> +static void
> +qpw_fini_in(HWVoiceIn *hw)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +
> +    if (v->stream) {
> +        pwaudio *c =3D v->g;
> +        pw_thread_loop_lock(c->thread_loop);
> +        pw_stream_destroy(v->stream);
> +        v->stream =3D NULL;
> +        pw_thread_loop_unlock(c->thread_loop);
> +    }
> +}

It looks like you could easily factorize the 2 functions (an extra
function with PWVoice argument).

> +
> +static void
> +qpw_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    PWVoiceOut *po =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &po->v;
> +    pw_stream_set_active(v->stream, enable);
> +}
> +
> +static void
> +qpw_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    PWVoiceIn *pi =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pi->v;
> +    pw_stream_set_active(v->stream, enable);
> +}
> +
> +static void
> +qpw_volume_out(HWVoiceOut *hw, Volume *vol)
> +{
> +    PWVoiceOut *pw =3D (PWVoiceOut *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    int i, ret;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    v->volume.channels =3D vol->channels;
> +
> +    for (i =3D 0; i < vol->channels; ++i) {
> +        v->volume.values[i] =3D vol->vol[i] / 100;
> +    }
> +
> +    ret =3D pw_stream_set_control(v->stream,
> +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0=
);
> +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> +
> +    v->muted =3D vol->mute;
> +    float val =3D v->muted ? 1.f : 0.f;
> +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}
> +
> +static void
> +qpw_volume_in(HWVoiceIn *hw, Volume *vol)
> +{
> +    PWVoiceIn *pw =3D (PWVoiceIn *) hw;
> +    PWVoice *v =3D &pw->v;
> +    pwaudio *c =3D v->g;
> +    int i, ret;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    v->volume.channels =3D vol->channels;
> +
> +    for (i =3D 0; i < vol->channels; ++i) {
> +        v->volume.values[i] =3D vol->vol[i] / 100;
> +    }
> +
> +    ret =3D pw_stream_set_control(v->stream,
> +        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0=
);
> +    trace_pw_vol(ret =3D=3D 0 ? "success" : "failed");
> +
> +    v->muted =3D vol->mute;
> +    float val =3D v->muted ? 1.f : 0.f;
> +    ret =3D pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
> +    pw_thread_loop_unlock(c->thread_loop);
> +}

It looks like you could easily factorize the 2 functions.

> +
> +static void
> +on_core_error(void *data, uint32_t id, int seq, int res, const char *mes=
sage)
> +{
> +    pwaudio *pw =3D data;
> +
> +    error_report("error id:%u seq:%d res:%d (%s): %s",
> +                id, seq, res, spa_strerror(res), message);
> +
> +    /* stop and exit the thread loop */
> +    pw_thread_loop_signal(pw->thread_loop, FALSE);

I don't understand how this works. The API doc says:
"Signal the thread of loop. If wait_for_accept is true, this function
waits until pw_thread_loop_accept() is called."

And, the associated waiting function is pw_thread_loop_wait(). Can you
explain where it is called from? (since it's not in this file)

> +}
> +
> +static void
> +on_core_done(void *data, uint32_t id, int seq)
> +{
> +    pwaudio *pw =3D data;
> +    if (id =3D=3D PW_ID_CORE) {
> +        pw->seq =3D seq;
> +        /* stop and exit the thread loop */
> +        pw_thread_loop_signal(pw->thread_loop, FALSE);

(same remark about signal)



What do you need pw->seq for?

> +    }
> +}
> +
> +static const struct pw_core_events core_events =3D {
> +    PW_VERSION_CORE_EVENTS,
> +    .done =3D on_core_done,
> +    .error =3D on_core_error,
> +};
> +
> +static void *
> +qpw_audio_init(Audiodev *dev)
> +{
> +    g_autofree pwaudio *pw =3D g_new0(pwaudio, 1);
> +    pw_init(NULL, NULL);
> +
> +    trace_pw_audio_init();
> +    assert(dev->driver =3D=3D AUDIODEV_DRIVER_PIPEWIRE);
> +
> +    pw->dev =3D dev;
> +    pw->thread_loop =3D pw_thread_loop_new("Pipewire thread loop", NULL)=
;
> +    if (pw->thread_loop =3D=3D NULL) {
> +        error_report("Could not create Pipewire loop");
> +        goto fail;
> +    }
> +
> +    pw->context =3D
> +        pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0=
);
> +    if (pw->context =3D=3D NULL) {
> +        error_report("Could not create Pipewire context");
> +        goto fail;
> +    }
> +
> +    if (pw_thread_loop_start(pw->thread_loop) < 0) {
> +        error_report("Could not start Pipewire loop");
> +        goto fail;
> +    }
> +
> +    pw_thread_loop_lock(pw->thread_loop);
> +
> +    pw->core =3D pw_context_connect(pw->context, NULL, 0);
> +    if (pw->core =3D=3D NULL) {
> +        pw_thread_loop_unlock(pw->thread_loop);
> +        goto fail;
> +    }
> +
> +    pw_core_add_listener(pw->core, &pw->core_listener, &core_events, pw)=
;
> +
> +    pw_thread_loop_unlock(pw->thread_loop);
> +
> +    return g_steal_pointer(&pw);
> +
> +fail:
> +    AUD_log(AUDIO_CAP, "Failed to initialize PW context");
> +    if (pw->thread_loop) {
> +        pw_thread_loop_stop(pw->thread_loop);
> +        g_clear_pointer(&pw->thread_loop, pw_thread_loop_destroy);
> +    }
> +    if (pw->context) {
> +        g_clear_pointer(&pw->context, pw_context_destroy);
> +    }

You should clean up in reverse order of initialization, no?

> +    return NULL;
> +}
> +
> +static void
> +qpw_audio_fini(void *opaque)
> +{
> +    pwaudio *pw =3D opaque;
> +
> +    pw_thread_loop_stop(pw->thread_loop);

No lock needed?

Are you sure stopping the loop before ending the core and the context
associated with it here is fine?


> +
> +    if (pw->core) {
> +        spa_hook_remove(&pw->core_listener);
> +        spa_zero(pw->core_listener);
> +        pw_core_disconnect(pw->core);
> +    }
> +
> +    if (pw->context) {
> +        pw_context_destroy(pw->context);
> +    }
> +    pw_thread_loop_destroy(pw->thread_loop);
> +
> +    g_free(pw);
> +}
> +
> +static struct audio_pcm_ops qpw_pcm_ops =3D {
> +    .init_out =3D qpw_init_out,
> +    .fini_out =3D qpw_fini_out,
> +    .write =3D qpw_write,
> +    .buffer_get_free =3D qpw_buffer_get_free,
> +    .run_buffer_out =3D audio_generic_run_buffer_out,
> +    .enable_out =3D qpw_enable_out,
> +    .volume_out =3D qpw_volume_out,
> +    .volume_in =3D qpw_volume_in,
> +
> +    .init_in =3D qpw_init_in,
> +    .fini_in =3D qpw_fini_in,
> +    .read =3D qpw_read,
> +    .run_buffer_in =3D audio_generic_run_buffer_in,
> +    .enable_in =3D qpw_enable_in
> +};
> +
> +static struct audio_driver pw_audio_driver =3D {
> +    .name =3D "pipewire",
> +    .descr =3D "http://www.pipewire.org/",
> +    .init =3D qpw_audio_init,
> +    .fini =3D qpw_audio_fini,
> +    .pcm_ops =3D &qpw_pcm_ops,
> +    .can_be_default =3D 1,
> +    .max_voices_out =3D INT_MAX,
> +    .max_voices_in =3D INT_MAX,
> +    .voice_size_out =3D sizeof(PWVoiceOut),
> +    .voice_size_in =3D sizeof(PWVoiceIn),
> +};
> +
> +static void
> +register_audio_pw(void)
> +{
> +    audio_driver_register(&pw_audio_driver);
> +}
> +
> +type_init(register_audio_pw);
> diff --git a/audio/trace-events b/audio/trace-events
> index e1ab643add..59ec817c9d 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir) "s=
ender =3D %s, dir =3D %s"
>  dbus_audio_put_buffer_out(size_t len) "len =3D %zu"
>  dbus_audio_read(size_t len) "len =3D %zu"
>
> +# pwaudio.c
> +pw_state_changed(const char *s) "stream state: %s"
> +pw_node(int nodeid) "node id: %d"
> +pw_read(int32_t avail, uint32_t index, size_t len) "avail=3D%d index=3D%=
u len=3D%zu"
> +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) "fil=
led=3D%d avail=3D%d index=3D%u len=3D%zu"
> +pw_vol(const char *ret) "set volume: %s"
> +pw_audio_init(void) "Initialize Pipewire context"
> +
>  # audio.c
>  audio_timer_start(int interval) "interval %d ms"
>  audio_timer_stop(void) ""
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..31bf280c0d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -730,6 +730,12 @@ if not get_option('jack').auto() or have_system
>    jack =3D dependency('jack', required: get_option('jack'),
>                      method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +pipewire =3D not_found
> +if not get_option('pipewire').auto() or (targetos =3D=3D 'linux' and hav=
e_system)
> +  pipewire =3D dependency('libpipewire-0.3', version: '>=3D0.3.60',
> +                    required: get_option('pipewire'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
> +endif
>  sndio =3D not_found
>  if not get_option('sndio').auto() or have_system
>    sndio =3D dependency('sndio', required: get_option('sndio'),
> @@ -1667,6 +1673,7 @@ if have_system
>      'jack': jack.found(),
>      'oss': oss.found(),
>      'pa': pulse.found(),
> +    'pipewire': pipewire.found(),
>      'sdl': sdl.found(),
>      'sndio': sndio.found(),
>    }
> @@ -3980,6 +3987,7 @@ if targetos =3D=3D 'linux'
>    summary_info +=3D {'ALSA support':    alsa}
>    summary_info +=3D {'PulseAudio support': pulse}
>  endif
> +summary_info +=3D {'Pipewire support':   pipewire}
>  summary_info +=3D {'JACK support':      jack}
>  summary_info +=3D {'brlapi support':    brlapi}
>  summary_info +=3D {'vde support':       vde}
> diff --git a/meson_options.txt b/meson_options.txt
> index fc9447d267..9ae1ec7f47 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL=
',
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators=
')
>  option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
, 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
, 'pa', 'pipewire', 'sdl', 'sndio'],
>         description: 'Set audio driver list')
>  option('block_drv_rw_whitelist', type : 'string', value : '',
>         description: 'set block driver read-write whitelist (by default a=
ffects only QEMU, not tools like qemu-img)')
> @@ -255,6 +255,8 @@ option('oss', type: 'feature', value: 'auto',
>         description: 'OSS sound support')
>  option('pa', type: 'feature', value: 'auto',
>         description: 'PulseAudio sound support')
> +option('pipewire', type: 'feature', value: 'auto',
> +       description: 'Pipewire sound support')
>  option('sndio', type: 'feature', value: 'auto',
>         description: 'sndio sound support')
>
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 4e54c00f51..e03396a7bc 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,47 @@
>      '*out':    'AudiodevPaPerDirectionOptions',
>      '*server': 'str' } }
>
> +##
> +# @AudiodevPipewirePerDirectionOptions:
> +#
> +# Options of the Pipewire backend that are used for both playback and
> +# recording.
> +#
> +# @name: name of the sink/source to use
> +#
> +# @stream-name: name of the Pipewire stream created by qemu.  Can be
> +#               used to identify the stream in Pipewire when you
> +#               create multiple Pipewire devices or run multiple qemu
> +#               instances (default: audiodev's id)
> +#
> +# @latency: latency you want Pipewire to achieve in microseconds
> +#           (default 46000)
> +#
> +# Since: 8.1
> +##
> +{ 'struct': 'AudiodevPipewirePerDirectionOptions',
> +  'base': 'AudiodevPerDirectionOptions',
> +  'data': {
> +    '*name': 'str',
> +    '*stream-name': 'str',
> +    '*latency': 'uint32' } }
> +
> +##
> +# @AudiodevPipewireOptions:
> +#
> +# Options of the Pipewire audio backend.
> +#
> +# @in: options of the capture stream
> +#
> +# @out: options of the playback stream
> +#
> +# Since: 8.1
> +##
> +{ 'struct': 'AudiodevPipewireOptions',
> +  'data': {
> +    '*in':     'AudiodevPipewirePerDirectionOptions',
> +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
> +
>  ##
>  # @AudiodevSdlPerDirectionOptions:
>  #
> @@ -416,6 +457,7 @@
>              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
>              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
>              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> +            { 'name': 'pipewire', 'if': 'CONFIG_AUDIO_PIPEWIRE' },
>              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
>              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
>              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> @@ -456,6 +498,8 @@
>                     'if': 'CONFIG_AUDIO_OSS' },
>      'pa':        { 'type': 'AudiodevPaOptions',
>                     'if': 'CONFIG_AUDIO_PA' },
> +    'pipewire':  { 'type': 'AudiodevPipewireOptions',
> +                   'if': 'CONFIG_AUDIO_PIPEWIRE' },
>      'sdl':       { 'type': 'AudiodevSdlOptions',
>                     'if': 'CONFIG_AUDIO_SDL' },
>      'sndio':     { 'type': 'AudiodevSndioOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..2d908717bd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,12 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>      "                in|out.name=3D source/sink device name\n"
>      "                in|out.latency=3D desired latency in microseconds\n=
"
>  #endif
> +#ifdef CONFIG_AUDIO_PIPEWIRE
> +    "-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]\n"
> +    "                in|out.name=3D source/sink device name\n"
> +    "                in|out.stream-name=3D name of pipewire stream\n"
> +    "                in|out.latency=3D desired latency in microseconds\n=
"
> +#endif
>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
>      "                in|out.buffer-count=3D number of buffers\n"
> @@ -942,6 +948,21 @@ SRST
>          Desired latency in microseconds. The PulseAudio server will try
>          to honor this value but actual latencies may be lower or higher.
>
> +``-audiodev pipewire,id=3Did[,prop[=3Dvalue][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``in|out.latency=3Dusecs``
> +        Desired latency in microseconds.
> +
> +    ``in|out.name=3Dsink``
> +        Use the specified source/sink for recording/playback.
> +
> +    ``in|out.stream-name``
> +        Specify the name of pipewire stream.
> +
>  ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 009fab1515..ba1057b62c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,7 +1,8 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> -  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list [def=
ault] (choices: alsa/co'
> -  printf "%s\n" '                           reaudio/default/dsound/jack/=
oss/pa/sdl/sndio)'
> +  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list [def=
ault] (choices: al'
> +  printf "%s\n" '                           sa/coreaudio/default/dsound/=
jack/oss/pa/'
> +  printf "%s\n" '                           pipewire/sdl/sndio)'
>    printf "%s\n" '  --block-drv-ro-whitelist=3DVALUE'
>    printf "%s\n" '                           set block driver read-only w=
hitelist (by default'
>    printf "%s\n" '                           affects only QEMU, not tools=
 like qemu-img)'
> @@ -136,6 +137,7 @@ meson_options_help() {
>    printf "%s\n" '  oss             OSS sound support'
>    printf "%s\n" '  pa              PulseAudio sound support'
>    printf "%s\n" '  parallels       parallels image format support'
> +  printf "%s\n" '  pipewire        Pipewire sound support'
>    printf "%s\n" '  png             PNG support with libpng'
>    printf "%s\n" '  pvrdma          Enable PVRDMA support'
>    printf "%s\n" '  qcow1           qcow1 image format support'
> @@ -370,6 +372,8 @@ _meson_option_parse() {
>      --disable-pa) printf "%s" -Dpa=3Ddisabled ;;
>      --enable-parallels) printf "%s" -Dparallels=3Denabled ;;
>      --disable-parallels) printf "%s" -Dparallels=3Ddisabled ;;
> +    --enable-pipewire) printf "%s" -Dpipewire=3Denabled ;;
> +    --disable-pipewire) printf "%s" -Dpipewire=3Ddisabled ;;
>      --with-pkgversion=3D*) quote_sh "-Dpkgversion=3D$2" ;;
>      --enable-png) printf "%s" -Dpng=3Denabled ;;
>      --disable-png) printf "%s" -Dpng=3Ddisabled ;;
> --
> 2.39.1
>


--
Marc-Andr=C3=A9 Lureau

