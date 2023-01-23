Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7A6775C2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:44:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrUd-0001hM-MD; Mon, 23 Jan 2023 02:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrUR-0001h0-Em
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:43:39 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrUP-0001DH-Tv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:43:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y1so5398258wru.2
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U/HoV0FzQsXK00cyrBG3Z4fPSfw9cNDee3prXGYnnUc=;
 b=Q1dgHkrPJ3/AtDKLJceOUMwrdAbDynein5RXTvHWccyltNxeEKFNIShj8ti+C8+d8R
 czKxsTdxlYKS5qWnxGrQRIXKkvY31MO5l8MtmbLECewxMh3E/F2GmIBRm0Z2qzMbfGmv
 UDYNKWYGNXpB8bhTbrs8E7+f9/UAlkHbcE0TgMJ9Ct7FTVLVQNnvioJOE+1Jf6IzoSxV
 fQCXxaEhl07QGw2l0o8CwLCbdDsjt5HF0VTUKrbluAzAy47I8mJTEKdc4S3ONHnu7d+N
 ujLzOufIUsLYLX6z9kEM2zSSxtZwEVzAn9hBJHJmLAqELbjdYU/B1iPBR/47yjnys2nd
 DI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U/HoV0FzQsXK00cyrBG3Z4fPSfw9cNDee3prXGYnnUc=;
 b=bddW/58quVwCAiQRSpjGR9MgGywsmxTYhnknrTdJD4st3bb3P5B8q4lSao4aPtgRLU
 UUS5FY6zrWXNy1SMEyLqD3aRX0ZO4kL+YZgMQtPILnIaxEMcY3VjrtaZfb6X3yhLA1WB
 V24R8/PiAeafq1F6lFfXITrU9nwmwnEtbZEG05aNl7HzJuCmlpHnA95SHrCR+nUev5XX
 eE2AGE+NoD5wetd72FWJV2dxS1qZIrOrzPlgzmUeCtfzKOh3A0u/QbPTavYZrfgxHXlS
 byHlKodGl90M9A0RYYaPwOaaFxooQ3JSnpZQ4oP9IOExnBqgQ4NkmI3cpAyern4ft8ee
 QZSA==
X-Gm-Message-State: AFqh2kq1nV0GDvXhCFqp11KO+gjaQOHKuWkCOfQfsfhKp4a/aKYkyvvZ
 MRs7noF9qlgGXIXE6FsOeqAqtw==
X-Google-Smtp-Source: AMrXdXsH9xisZp62AGV+fL2x4rhFDDwY7piEmhoQYGJVbP1IBWfk+eocbFnoKgZjVBerAB2bNaNY4g==
X-Received: by 2002:adf:dcc7:0:b0:2bd:c097:848b with SMTP id
 x7-20020adfdcc7000000b002bdc097848bmr21830067wrm.16.1674459816118; 
 Sun, 22 Jan 2023 23:43:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ba9-20020a0560001c0900b002b57bae7174sm3848964wrb.5.2023.01.22.23.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:43:35 -0800 (PST)
Message-ID: <63031751-f30a-d562-4e6e-6a6d936b1f74@linaro.org>
Date: Mon, 23 Jan 2023 08:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/11] alsaaudio: change default playback settings
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
 <20230121094735.11644-10-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230121094735.11644-10-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 21/1/23 10:47, Volker Rümelin wrote:
> The currently used default playback settings in the ALSA audio
> backend are a bit unfortunate. With a few emulated audio devices,
> audio playback does not work properly. Here is a short part of
> the debug log while audio is playing (elapsed time in seconds).
> 
> audio: Elapsed since last alsa run (running): 0.046244
> audio: Elapsed since last alsa run (running): 0.023137
> audio: Elapsed since last alsa run (running): 0.023170
> audio: Elapsed since last alsa run (running): 0.023650
> audio: Elapsed since last alsa run (running): 0.060802
> audio: Elapsed since last alsa run (running): 0.031931
> 
> For some audio devices the time of more than 23ms between updates
> is too long.
> 
> Set the period time to 5.8ms so that the maximum time between
> two updates typically does not exceed 11ms. This roughly matches
> the 10ms period time when doing playback with the audio timer.
> After this patch the debug log looks like this.
> 
> audio: Elapsed since last alsa run (running): 0.011919
> audio: Elapsed since last alsa run (running): 0.005788
> audio: Elapsed since last alsa run (running): 0.005995
> audio: Elapsed since last alsa run (running): 0.011069
> audio: Elapsed since last alsa run (running): 0.005901
> audio: Elapsed since last alsa run (running): 0.006084
> 
> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/alsaaudio.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> index 5f50dfa0bf..0cc982e61f 100644
> --- a/audio/alsaaudio.c
> +++ b/audio/alsaaudio.c
> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
>       alsa_init_per_direction(aopts->in);
>       alsa_init_per_direction(aopts->out);
>   
> -    /*
> -     * need to define them, as otherwise alsa produces no sound
> -     * doesn't set has_* so alsa_open can identify it wasn't set by the user
> -     */
> +    /* don't set has_* so alsa_open can identify it wasn't set by the user */
>       if (!dev->u.alsa.out->has_period_length) {
> -        /* 1024 frames assuming 44100Hz */
> -        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
> +        /* 256 frames assuming 44100Hz */
> +        dev->u.alsa.out->period_length = 5805;

Please use DIV_ROUND_UP():

     DIV_ROUND_UP(1000000ul << 8, 44100);

Or

     DIV_ROUND_UP(512 * 1000000ul, 44100);

>       }
>       if (!dev->u.alsa.out->has_buffer_length) {
>           /* 4096 frames assuming 44100Hz */
> -        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
> +        dev->u.alsa.out->buffer_length = 92880;

Ditto:

     DIV_ROUND_UP(1000000ul << 12, 44100);

>       }
>   
>       /*


