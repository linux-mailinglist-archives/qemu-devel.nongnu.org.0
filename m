Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F76B8232
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 21:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pboRU-0004iL-7g; Mon, 13 Mar 2023 16:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pboRP-0004XZ-S8
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:06:45 -0400
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pboRN-0005KD-Rn
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 16:06:43 -0400
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout09.t-online.de (Postfix) with SMTP id 2D8D09819;
 Mon, 13 Mar 2023 21:05:37 +0100 (CET)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pboQJ-1A8JQf0; Mon, 13 Mar 2023 21:05:35 +0100
Message-ID: <b7679119-44dc-0027-1819-2886bad79ce5@t-online.de>
Date: Mon, 13 Mar 2023 21:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] DO-NOT-MERGE: pipewire sample code
Content-Language: en-US
To: Dorinda Bassey <dbassey@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wtaymans@redhat.com,
 qemu-devel@nongnu.org
References: <a3717185-a930-e8e7-80cc-edb8d9e4d01d@t-online.de>
 <20230311120826.5584-1-vr_qemu@t-online.de>
 <5179fdbb-54f2-a24b-d9e0-fea89c5528fd@t-online.de>
 <CACzuRyzZu1iw_KS-bQO=ZM2oEhZC=6BG2w7XE=Fyndpwi+jkQw@mail.gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CACzuRyzZu1iw_KS-bQO=ZM2oEhZC=6BG2w7XE=Fyndpwi+jkQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678737935-E8D5737F-AFD9E03A/0/0 CLEAN NORMAL
X-TOI-MSGID: a7aff98c-7214-466b-b10e-d2ea2efbb01f
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 13.03.23 um 13:28 schrieb Dorinda Bassey:
> Hi Volker,
>
> Thanks for the patch, I've tested the patch and it works. I don't hear 
> the choppy audio with this option "qemu-system-x86_64 -device 
> ich9-intel-hda -device hda-duplex,audiodev=audio0 -audiodev 
> pipewire,id=audio0,out.frequency=96000,in.frequency=96000 ...."
>
>     I don't understand how the req == 0 case can work at all.
>
> how this works is that  b->requested could be zero when no suggestion 
> is provided. For playback streams, this field contains the suggested 
> amount of data to provide. hence the reason for this check.

Hi Dorinda,

there has to be a control mechanism that ensures that our write rate on 
average is exactly the frame rate that the down stream audio device 
writes to the DAC. My question was how can this work if we always write 
4096 frames.

The answer is, that after a 4096 frames write, the callback is delayed 
by 4096 frames / 44100 frames/s = 93ms. This ensures that our write rate 
is exactly 44100 frames/s.

This means a fixed 4096 frames write is wrong for the req == 0 case. We 
have to write 75% of timer-period frames.

If you want to test this yourself, just ignore req and assume it's 0.

With best regards,
Volker

>
>     I suggest to use the same option names as the pulseaudio backend.
>     out.latency is the effective Pipewire buffer size.
>
> Ack.
>
> Thanks,
> Dorinda.
>
>
> On Sat, Mar 11, 2023 at 5:19 PM Volker Rümelin <vr_qemu@t-online.de> 
> wrote:
>
>     > Based-on:<20230306171020.381116-1-dbassey@redhat.com>
>     > ([PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU)
>     >
>     > This is sample code for the review of the pipewire backed. The
>     > code actually works.
>     >
>     > An email with explanations for the changes will follow.
>     >
>     > Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>     > ---
>     >   audio/pwaudio.c | 67
>     +++++++++++++++++++++++++++++++++----------------
>     >   qapi/audio.json | 10 +++-----
>     >   2 files changed, 49 insertions(+), 28 deletions(-)
>     >
>     > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
>     > index d357761152..8e2a38938f 100644
>     > --- a/audio/pwaudio.c
>     > +++ b/audio/pwaudio.c
>     > @@ -23,7 +23,6 @@
>     >   #define AUDIO_CAP "pipewire"
>     >   #define RINGBUFFER_SIZE    (1u << 22)
>     >   #define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
>     > -#define BUFFER_SAMPLES    512
>     >
>     >   #include "audio_int.h"
>     >
>     > @@ -48,6 +47,7 @@ typedef struct PWVoice {
>     >       struct pw_stream *stream;
>     >       struct spa_hook stream_listener;
>     >       struct spa_audio_info_raw info;
>     > +    uint32_t highwater_mark;
>     >       uint32_t frame_size;
>     >       struct spa_ringbuffer ring;
>     >       uint8_t buffer[RINGBUFFER_SIZE];
>     > @@ -82,7 +82,7 @@ playback_on_process(void *data)
>     >       void *p;
>     >       struct pw_buffer *b;
>     >       struct spa_buffer *buf;
>     > -    uint32_t n_frames, req, index, n_bytes;
>     > +    uint32_t req, index, n_bytes;
>     >       int32_t avail;
>     >
>     >       if (!v->stream) {
>     > @@ -105,8 +105,7 @@ playback_on_process(void *data)
>     >       if (req == 0) {
>     >           req = 4096 * v->frame_size;
>     >       }
>
>     I don't understand how the req == 0 case can work at all. The
>     downstream
>     audio device is the thinnest point in the playback stream. We can't
>     write more audio frames than the audio device will consume.
>


