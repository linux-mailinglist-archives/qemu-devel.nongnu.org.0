Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA687677165
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 19:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJeql-00045S-90; Sun, 22 Jan 2023 13:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeqi-00045I-H9
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 13:13:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeqg-0004aE-CV
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 13:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RG2mKjn/j1FXYteOeujl0jBbDtugYt7t398S8vmnEyw=; b=y0HPDpzCcV+e2WxwTANZsEvRti
 ZdsagDOOKc7V7D/mpA1DK3lygHPA1ICAczQusMjgDIWScr8mrLZGQAsWm1ODT9e1KTpmLGs3avjZ+
 2n8Iry4qcC7e+wyCqPpfaSxfCVQrISjcjPvwvW+Xut0Yy/jj88PjaQFppI8+RuMsejEFQT+nb9hG6
 J+EdKptsj2oWT4sErkZv8q9RhxiJIOOznbPKkmqyK52Xh3rzQ5tSde1r/bi/D68CVfcQxbLhO1IEX
 F8UyrPEqEyJPEgWhLInh9G1NRIigDpv5/XLfNXHfyzX3paIzOTSSDA+M4Li/INc41YzEueimPTNaj
 la28XZLWqJ26PUR1hLPnbZM0pjxLNFo1bOlcLVMnQNX3ZxgeHNuza1Yd8+ju2HDgva6J2yjfqE2XQ
 RUQr/19qopwOInGXjCywnl6A1v5zHkyp3lC1GySxGYMR5ynm9b6tyrUiMLC/KIwBQ3sL5TqV8YZDn
 kflHJqBlZMUEEBSMq6R0XUsnMJuA8iirpd7AjM5L/6UjwZywpAS41sVbHh9q+e7b9OtkactXNC++7
 95WXdk2jFowz45+nW09AcxgI5a8WtVAP3DqTOq+HU85CbzxZlRSFAaqczDfkK6UH8M+DCsrFiTlw7
 zUMPQsH7BWVFBl0fBDDxdx8k6tRT0c25gNzaMNZpA=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeqA-0006DE-7C; Sun, 22 Jan 2023 18:13:18 +0000
Message-ID: <f7ce8516-fddd-543b-0f3c-b73a310b79a8@ilande.co.uk>
Date: Sun, 22 Jan 2023 18:13:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
 <a671751a-cbb7-22c2-8840-0476176d2533@t-online.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a671751a-cbb7-22c2-8840-0476176d2533@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/17] audio: improve callback interface for audio
 frontends
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/01/2023 13:45, Volker Rümelin wrote:

> Am 15.01.23 um 14:08 schrieb Volker Rümelin:
> 
> Ccing a few more people who might be interested in this patch series.
> 
> @Mark:
> After this patch series, the code in your out of tree ASC audio device (and a few in 
> tree audio devices) could be simplified. write_audio() and the loops calling 
> write_audio() could be removed.

Hi Volker,

I know we have discussed this in a separate thread off-list, but this is fantastic!

Just out of interest, if the available bytes wraps the circular buffer will the audio 
core call the audio callback twice to maximise the ability of the guest to generate 
samples before the next audio timer? Or does that not make much difference in practice?

I'm not too familiar with the audio subsystem, but a quick skim of the series looks 
good (and being able to remove the write_audio() loops is a big plus). So I would 
certainly give this a thumbs up:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

> With best regards,
> Volker
> 
>> Based-on: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
>> ([PATCH 00/11] audio: more improvements)
>>
>> The callback interface for emulated audio devices is strange. The callback function 
>> has an 'avail' parameter that passes the number of bytes that can be written or 
>> read. Unfortunately, this value sometimes is only an imprecise estimate and the 
>> callback functions must check the actual bytes written or read. For playback 
>> devices, this means that they either need a ring buffer or have to write the 
>> unwritten bytes again the next time. For recording devices, things are a bit 
>> easier. They only need to continue with the actual number of bytes read.
>>
>> After this patch series, the 'avail' argument for the -audiodev 
>> out.mixing-engine=on and in.mixing-engine=on cases is exact. Audio frontends only 
>> need a linear frame buffer and there's a guarantee they can write or read 'avail' 
>> bytes.
>>
>> The -audiodev out.mixing-engine=off case is also mostly accurate. Only the D-Bus 
>> audio backend is still missing a required function. The -audiodev 
>> in.mixing-engine=off case always passes a much too large 'avail' value. I haven't 
>> worked on this yet, because there was no reason for it so far.
>>
>> The following logs show the improvements. Not only the audio frontends can write or 
>> read all needed or available bytes. The same is true for the audio backends. For 
>> playback, the first six lines in the logs are expected. Here you can see how 
>> quickly the guest fills the empty downstream buffers after playback starts.
>>
>> QEMU was started with -device ich9-intel-hda,addr=0x1b -device 
>> hda-duplex,audiodev=audio0 -audiodev 
>> pa,out.frequency=96000,in.frequency=96000,id=audio0
>>
>> playback guest 44100Hz => host 96000Hz
>>
>> unpatched version:
>> hda_audio_output_cb: to write 8188, written 1704
>> audio_run_out: free 4458, played 926
>> hda_audio_output_cb: to write 6488, written 2384
>> audio_run_out: free 3532, played 1297
>> hda_audio_output_cb: to write 4104, written 2648
>> audio_run_out: free 2235, played 1441
>> audio_run_out: free 794, played 793
>> audio_run_out: free 897, played 896
>> audio_run_out: free 831, played 829
>> ...
>> hda_audio_output_cb: could not write 4 bytes
>> hda_audio_output_cb: to write 1764, written 1760
>> audio_run_out: free 960, played 958
>> ...
>>
>> patched version:
>> hda_audio_output_cb: to write 8192, written 1620
>> audio_run_out: free 4458, played 880
>> hda_audio_output_cb: to write 6576, written 2508
>> audio_run_out: free 3578, played 1365
>> hda_audio_output_cb: to write 4068, written 2500
>> audio_run_out: free 2213, played 1360
>>
>> record host 96000Hz => guest 44100Hz
>>
>> unpatched version:
>> audio_run_in: avail 4458, acquired 4454
>> audio_run_in: avail 1574, acquired 1572
>> audio_run_in: avail 766, acquired 764
>> audio_run_in: avail 1052, acquired 1051
>> audio_run_in: avail 761, acquired 760
>> audio_run_in: avail 1123, acquired 1121
>> ...
>> hda_audio_input_cb: could not read 4 bytes
>> hda_audio_input_cb: to read 1988, read 1984
>> audio_run_in: avail 1082, acquired 1080
>> ...
>>
>> patched version:
>> (no output)
>>
>> QEMU was started with -device ich9-intel-hda,addr=0x1b -device 
>> hda-duplex,audiodev=audio0 -audiodev 
>> pa,out.frequency=32000,in.frequency=32000,id=audio0
>>
>> playback guest 44100Hz => host 32000Hz
>>
>> unpatched version:
>> hda_audio_output_cb: to write 8188, written 1620
>> audio_run_out: free 1486, played 294
>> hda_audio_output_cb: to write 6568, written 2512
>> audio_run_out: free 1192, played 455
>> hda_audio_output_cb: to write 4060, written 2504
>> audio_run_out: free 737, played 455
>> audio_run_out: free 282, played 281
>> audio_run_out: free 357, played 356
>> audio_run_out: free 314, played 313
>> ...
>> hda_audio_output_cb: could not write 4 bytes
>> hda_audio_output_cb: to write 1416, written 1412
>> audio_run_out: free 257, played 256
>> ...
>>
>> patched version:
>> hda_audio_output_cb: to write 8192, written 1656
>> audio_run_out: free 1486, played 300
>> hda_audio_output_cb: to write 6536, written 2516
>> audio_run_out: free 1186, played 457
>> hda_audio_output_cb: to write 4020, written 2540
>> audio_run_out: free 729, played 460
>>
>> record host 32000Hz => guest 44100Hz
>>
>> unpatched version:
>> audio_run_in: avail 1486, acquired 1485
>> audio_run_in: avail 272, acquired 271
>> audio_run_in: avail 366, acquired 365
>> hda_audio_input_cb: could not read 4 bytes
>> hda_audio_input_cb: to read 1420, read 1416
>> audio_run_in: avail 258, acquired 257
>> audio_run_in: avail 375, acquired 374
>> hda_audio_input_cb: could not read 4 bytes
>> hda_audio_input_cb: to read 2056, read 2052
>> audio_run_in: avail 260, acquired 259
>> ...
>>
>> patched version:
>> (no output)
>>
>> This is the debug code for the logs above.
>>
>> ---snip--
>> --- a/audio/audio.c    2022-12-13 19:14:31.793153558 +0100
>> +++ b/audio/audio.c    2022-12-11 16:24:48.842649711 +0100
>> @@ -1228,6 +1228,10 @@ static void audio_run_out (AudioState *s
>>  #ifdef DEBUG_OUT
>>          dolog("played=%zu\n", played);
>>  #endif
>> +        if (hw_free - played) {
>> +            fprintf(stderr, "%s: free %zu, played %zu\n",
>> +                    __func__, hw_free, played);
>> +        }
>>
>>          if (played) {
>>              hw->ts_helper += played;
>> @@ -1318,6 +1322,7 @@ static void audio_run_in (AudioState *s)
>>              if (sw->active) {
>>                  size_t sw_avail = audio_get_avail(sw);
>>                  size_t avail;
>> +                size_t prev_acquired = sw->total_hw_samples_acquired;
>>
>>                  avail = st_rate_frames_out(sw->rate, sw_avail);
>>                  if (avail > 0) {
>> @@ -1325,6 +1330,11 @@ static void audio_run_in (AudioState *s)
>>                      sw->callback.fn(sw->callback.opaque,
>>                                      avail * sw->info.bytes_per_frame);
>>                  }
>> +
>> +                if (sw_avail + prev_acquired - sw->total_hw_samples_acquired) {
>> +                    fprintf(stderr, "%s: avail %zu, acquired %zu\n", __func__,
>> +                            sw_avail, sw->total_hw_samples_acquired - prev_acquired);
>> +                }
>>              }
>>          }
>>      }
>> --- a/hw/audio/hda-codec.c    2023-01-04 14:07:31.954304889 +0100
>> +++ b/hw/audio/hda-codec.c    2023-01-04 13:57:47.687320406 +0100
>> @@ -265,20 +265,28 @@ static void hda_audio_input_cb(void *opa
>>      int64_t rpos = st->rpos;
>>
>>      int64_t to_transfer = MIN(B_SIZE - (wpos - rpos), avail);
>> +    unsigned int total_read = 0;
>>
>>      while (to_transfer) {
>>          uint32_t start = (uint32_t) (wpos & B_MASK);
>>          uint32_t chunk = (uint32_t) MIN(B_SIZE - start, to_transfer);
>>          uint32_t read = AUD_read(st->voice.in, st->buf + start, chunk);
>>          wpos += read;
>> +        total_read += read;
>>          to_transfer -= read;
>>          st->wpos += read;
>>          if (chunk != read) {
>> +            fprintf(stderr, "%s: could not read %u bytes\n", __func__,
>> +                    chunk - read);
>>              break;
>>          }
>>      }
>>
>>      hda_timer_sync_adjust(st, -((wpos - rpos) - (B_SIZE >> 1)));
>> +    if (avail != total_read) {
>> +        fprintf(stderr, "%s: to read %d, read %u\n", __func__,
>> +                avail, total_read);
>> +    }
>>  }
>>
>>  static void hda_audio_output_timer(void *opaque)
>> @@ -329,6 +337,7 @@ static void hda_audio_output_cb(void *op
>>      int64_t rpos = st->rpos;
>>
>>      int64_t to_transfer = MIN(wpos - rpos, avail);
>> +    unsigned int total_written = 0;
>>
>>      if (wpos - rpos == B_SIZE) {
>>          /* drop buffer, reset timer adjust */
>> @@ -343,15 +352,22 @@ static void hda_audio_output_cb(void *op
>>          uint32_t start = (uint32_t) (rpos & B_MASK);
>>          uint32_t chunk = (uint32_t) MIN(B_SIZE - start, to_transfer);
>>          uint32_t written = AUD_write(st->voice.out, st->buf + start, chunk);
>> +        total_written += written;
>>          rpos += written;
>>          to_transfer -= written;
>>          st->rpos += written;
>>          if (chunk != written) {
>> +            fprintf(stderr, "%s: could not write %u bytes\n", __func__,
>> +                    chunk - written);
>>              break;
>>          }
>>      }
>>
>>      hda_timer_sync_adjust(st, (wpos - rpos) - (B_SIZE >> 1));
>> +    if (avail != total_written) {
>> +        fprintf(stderr, "%s: to write %d, written %u\n", __func__,
>> +                avail, total_written);
>> +    }
>>  }
>>
>>  static void hda_audio_compat_input_cb(void *opaque, int avail)
>> ---snip--
>>
>> Volker Rümelin (17):
>>   audio: change type of mix_buf and conv_buf
>>   audio: change type and name of the resample buffer
>>   audio: make the resampling code greedy
>>   audio: replace the resampling loop in audio_pcm_sw_write()
>>   audio: remove sw == NULL check
>>   audio: rename variables in audio_pcm_sw_write()
>>   audio: don't misuse audio_pcm_sw_write()
>>   audio: remove unused noop_conv() function
>>   audio/mixeng: calculate number of input frames
>>   audio: wire up st_rate_frames_in()
>>   audio: replace the resampling loop in audio_pcm_sw_read()
>>   audio: rename variables in audio_pcm_sw_read()
>>   audio/mixeng: calculate number of output frames
>>   audio: wire up st_rate_frames_out()
>>   audio: handle leftover audio frame from upsampling
>>   audio/audio_template: substitute sw->hw with hw
>>   audio: remove sw->ratio
>>
>>  audio/audio.c          | 366 +++++++++++++++++++++--------------------
>>  audio/audio_int.h      |  12 +-
>>  audio/audio_template.h |  41 +++--
>>  audio/mixeng.c         |  73 ++++++++
>>  audio/mixeng.h         |   2 +
>>  audio/rate_template.h  |  21 ++-
>>  6 files changed, 304 insertions(+), 211 deletions(-)
>>
> 
> 


