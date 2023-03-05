Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1366AB19A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:36:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYsGQ-00037u-9L; Sun, 05 Mar 2023 12:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pYsGL-00036p-3s
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:35:09 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pYsGJ-0000vi-2Y
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:35:08 -0500
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout12.t-online.de (Postfix) with SMTP id 60482FC70;
 Sun,  5 Mar 2023 18:35:01 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.75]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pYsGD-2DRygj0; Sun, 5 Mar 2023 18:35:01 +0100
Message-ID: <d34d7510-56c2-e681-25de-58a368c179ee@t-online.de>
Date: Sun, 5 Mar 2023 18:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/11] audio: more improvements
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
Content-Language: en-US
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678037701-B0828007-4774BFA6/0/0 CLEAN NORMAL
X-TOI-MSGID: d46fc75b-5994-4036-a464-f3c7aef4b709
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
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

Ping. Is there anything left to do to get this patch series merged for 
8.0? All patches are reviewed.

With best regards,
Volker

> A few patches from my audio patch queue.
>
> Patches 1 - 2:
> If a guest selects an unsupported sample rate, an error message is 
> currently shown. The first patch takes care to suppress the error 
> message and reports with the qemu_log_mask(LOG_UNIMP, ...) function 
> that this is not supported. The second patch is needed because there 
> are two code paths to reach the qemu_log_mask() function in the 
> audio_pcm_sw_alloc_resources_* functions. The second path prints an 
> additional error message up to now.
>
> For more background information:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg04940.html
>
> Patches 3 - 4:
> General improvements.
>
> Patches 5 - 9:
> These patches remove the audio_calloc() function. The GLib g_new0 
> macro is a better replacement for audio_calloc(). There's one 
> exception where g_malloc0() fits better.
>
> Patches 10 - 11:
> Audio playback and recording with the ALSA audio backend currently 
> doesn't work well with the default audio settings.
>
> v2: Address Daniel's comments
>
> [PATCH v2 07/11] audio/audio_template: use g_malloc0() to replace 
> audio_calloc()
> The n_bytes argument of g_malloc0() is now always > 0 at this call site.
>
> [PATCH v2 08/11] audio/audio_template: use g_new0() to replace 
> audio_calloc()
> Check samples for negative values. It's possible to have negative 
> samples due to overflows or unsigned to signed conversions. Patch 
> 01/11 takes care of samples == 0.
>
> Volker Rümelin (11):
>   audio: log unimplemented audio device sample rates
>   audio: don't show unnecessary error messages
>   audio: rename hardware store to backend
>   audio: remove unused #define AUDIO_STRINGIFY
>   audio/mixeng: use g_new0() instead of audio_calloc()
>   audio/alsaaudio: use g_new0() instead of audio_calloc()
>   audio/audio_template: use g_malloc0() to replace audio_calloc()
>   audio/audio_template: use g_new0() to replace audio_calloc()
>   audio: remove audio_calloc() function
>   alsaaudio: change default playback settings
>   alsaaudio: reintroduce default recording settings
>
>  audio/alsaaudio.c      | 27 ++++++-----------
>  audio/audio.c          | 26 +---------------
>  audio/audio_int.h      |  8 ++---
>  audio/audio_template.h | 68 ++++++++++++++++++++++--------------------
>  audio/mixeng.c         |  7 +----
>  5 files changed, 48 insertions(+), 88 deletions(-)
>


