Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD64487926
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:42:16 +0100 (CET)
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qRY-0007h9-9A
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMH-0005Ut-Po
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:45 -0500
Received: from [2a00:1450:4864:20::433] (port=34374
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMG-0008W7-9N
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id h10so1270956wrb.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D63v5HICFDmIRaSxkK0CnAGipN01CGqylkP2pZ0DYy8=;
 b=A8DLNk/B9htm4eeAVLSW6qn2Cf0BtAbY8igJJut//xCnszlk2bXS1lWlnCflmYEGIP
 wArvj8jF/7YRcsvAxIG+EyY7tm7CwWBmqN/piqKO6IwNju7LlMJ+oM6AMkrgoGxVz9z1
 ypPsk7HAWzyjUuCAN+PLGzam22KV8+Yn4ROuHdBc4H7k/IlJr1nEl9gYU2TWy9wLBbN2
 9yGJ3RPRWj8hHc/7Q2T8TA2bCt4WHZ+asX5fmc2yoN+g3hgZLec8Yyr2rTqEsVoomDmS
 90FpFyOgc6yW++hL16xShqO80p0jXuFFOmDiFH4pT53mEj6wyXFmiIeB89h9dSEASRfL
 Yd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D63v5HICFDmIRaSxkK0CnAGipN01CGqylkP2pZ0DYy8=;
 b=v5zXGVK0zjsQT40DZZs+0s2AA+rjHlGwjjjrTH0yFsTGPV011GqJarw02Xt+ICc3+D
 tppLZHtfwOaF35ptoIA2Y43WkLheLrrqoHVYmbD9Stj0TveaNrIyt9tOFUA3CSOa89xQ
 Z6WwNaOmooJUXi1AkUn+PUrEMhrOd+u17tieaIjJED7V1Nq8SpCL7J2bdI/7CmCYSD3v
 i3CCh3sWLqlhEn5eDX0AO/asGukXFSo3C3MxdMhRPveKGHIICK1q1MudqozLP33uPSjn
 okIjKGkJK2k+sUc9vQbzbPNPHPsWzjAP7vvXisnlPyR3ilvrO78ul6SxSa61jWaN+QMP
 WPfw==
X-Gm-Message-State: AOAM5336mBuZkNiDabz5fLGy2tO/wcdP6mcTFqdtKuttJl1s5DZUVz9t
 oUnSFzHePtsL/75eUKccOUU=
X-Google-Smtp-Source: ABdhPJzFCvhxhytjO6ZAqOtkf1XSXbJlP28lB6zxslulqtZdZbJlFGlJ13WR5295/ATEGD3l8bYzkQ==
X-Received: by 2002:adf:ef4a:: with SMTP id c10mr11412911wrp.435.1641566203158; 
 Fri, 07 Jan 2022 06:36:43 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m35sm16346055wms.1.2022.01.07.06.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:36:42 -0800 (PST)
Message-ID: <38249cb4-cda3-7c5f-26f8-f5cd7fe29a0b@amsat.org>
Date: Fri, 7 Jan 2022 14:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 13/15] ossaudio: reduce effective playback buffer size
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <volker.ruemelin@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <20220106092332.7223-13-volker.ruemelin@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106092332.7223-13-volker.ruemelin@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 10:23, Volker Rümelin wrote:
> From: Volker Rümelin <vr_qemu@t-online.de>
> 
> Add the buffer_get_free pcm_ops function for the mmapped case
> to reduce the effective playback buffer size. All intermediate
> audio playback buffers become temporary buffers.

Description doesn't seem to match.

> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/ossaudio.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/audio/ossaudio.c b/audio/ossaudio.c
> index 1bd6800840..da9c232222 100644
> --- a/audio/ossaudio.c
> +++ b/audio/ossaudio.c
> @@ -394,7 +394,7 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
>       OSSVoiceOut *oss = (OSSVoiceOut *)hw;
>   
>       if (oss->mmapped) {
> -        return INT_MAX;
> +        return oss_get_available_bytes(oss);
>       } else {
>           return audio_generic_buffer_get_free(hw);
>       }
> @@ -402,9 +402,10 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
>   
>   static void *oss_get_buffer_out(HWVoiceOut *hw, size_t *size)
>   {
> -    OSSVoiceOut *oss = (OSSVoiceOut *) hw;
> +    OSSVoiceOut *oss = (OSSVoiceOut *)hw;
> +
>       if (oss->mmapped) {
> -        *size = MIN(oss_get_available_bytes(oss), hw->size_emul - hw->pos_emul);
> +        *size = hw->size_emul - hw->pos_emul;
>           return hw->buf_emul + hw->pos_emul;
>       } else {
>           return audio_generic_get_buffer_out(hw, size);


