Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F4682FC5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:52:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrzZ-0004gl-7i; Tue, 31 Jan 2023 09:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMrzW-0004eL-LK
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:52:10 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMrzU-0007QB-Qx
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:52:10 -0500
Received: by mail-lj1-x234.google.com with SMTP id y9so16166909lji.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNXr/RmBEePpyh6VGpWeBA7j4YcHGyNpSGR0L9P1ZZA=;
 b=dicXE2I35i6adOrKWFI6vBkc8idXeQCZ6DEm5fJ2Qfw5ewrWGi/2id4nJd2cmPhu7W
 foYizVF7c4BHCfB1n0L7zvvSltn3N6DBQ+ABgXn+zpPGuIgHylGXglk30SWCikMcmTpt
 2FUeuTY/8p0suN0aLamIyKtDlk6ESZBPi7IpbfGsfGyjlvbWjGlRX0kOU2la7vLLhckJ
 kOUWsSAt4jMTw49k5/dVcg3iw94HKG1Z7VCVu9S7HQqlb9tfy+M6hybUDTZdhU+2qp9s
 H/Hvud4fNp1JuNA09aCDVG/8VsJL2sbrWMaVpaN/NcPcDsTaHi6aZiUXJHbimEN31dWo
 pfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNXr/RmBEePpyh6VGpWeBA7j4YcHGyNpSGR0L9P1ZZA=;
 b=Jnq7XIN675f21F1xNfzQIGgbJx53kWMQJhTrGXwcUnwLQyWoNAvyhecOlEDekP/nUd
 YGGiTG2L9SboK9JiUudNCb1NMRdVqKtaIsgC9ho/gFh2NEw55FNJX3/9SrMklC4Mt+HX
 HFdpt6C4AXdu8nYVyWoE87h5yCLOF4Fv0HmZD1ZMfoWWrvUDkGNpFuuhNXyQ2akA8ItK
 0ZuhpmhjM5gZJ4kPJMTuuvPuPnXMCOdynLpboxfAxg/TVsDQesZjBjombi9NK3hkqHcq
 hYppShFyxOYd0PWHTyTdBRBO5K/zjbjDcX8qsY+hmVrIAplrGyPpsbQyvJZgCC6Kd/be
 IhSA==
X-Gm-Message-State: AO0yUKWyqXqB+R95UxuD9kgYJrqPNclh1aNJwLdHnMrawZVvkSoi0JP6
 4fJyz6kRfmb36isAoku/Z3/M/Sl2RKUqQWL7CwU=
X-Google-Smtp-Source: AK7set/0lpkoSUt8dKrm9ZyY2UHR6ONkJCMBAOFQpBDSpb8Xa0pcrWiuhWJnhWErUZliqN1Zf8A9IkJM285o/Gn46do=
X-Received: by 2002:a05:651c:30c:b0:290:703f:6306 with SMTP id
 a12-20020a05651c030c00b00290703f6306mr498671ljp.38.1675176726570; Tue, 31 Jan
 2023 06:52:06 -0800 (PST)
MIME-Version: 1.0
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Jan 2023 18:51:54 +0400
Message-ID: <CAJ+F1CLjPtHhYG8=BOLP2wj=XdSzDBLNovtq05NrxKxEoUUW8g@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] audio: more improvements
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

Hi

On Sat, Jan 21, 2023 at 1:47 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> A few patches from my audio patch queue.
>
> Patches 1 - 2:
> If a guest selects an unsupported sample rate, an error message is
> currently shown. The first patch takes care to suppress the error
> message and reports with the qemu_log_mask(LOG_UNIMP, ...) function that
> this is not supported. The second patch is needed because there are two
> code paths to reach the qemu_log_mask() function in the
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
> These patches remove the audio_calloc() function. The GLib g_new0 macro
> is a better replacement for audio_calloc(). There's one exception where
> g_malloc0() fits better.
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
> samples due to overflows or unsigned to signed conversions. Patch 01/11
> takes care of samples =3D=3D 0.
>
> Volker R=C3=BCmelin (11):
>    audio: log unimplemented audio device sample rates
>    audio: don't show unnecessary error messages
>    audio: rename hardware store to backend
>    audio: remove unused #define AUDIO_STRINGIFY
>    audio/mixeng: use g_new0() instead of audio_calloc()
>    audio/alsaaudio: use g_new0() instead of audio_calloc()
>    audio/audio_template: use g_malloc0() to replace audio_calloc()
>    audio/audio_template: use g_new0() to replace audio_calloc()
>    audio: remove audio_calloc() function
>    alsaaudio: change default playback settings
>    alsaaudio: reintroduce default recording settings

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

