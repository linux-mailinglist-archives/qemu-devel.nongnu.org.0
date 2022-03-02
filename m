Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462664C99BD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:13:45 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPCch-0004t5-Q6
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:13:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPCbX-0003sy-B0
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:12:33 -0500
Received: from [2607:f8b0:4864:20::62b] (port=43809
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPCbV-0007r7-GC
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 19:12:31 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e2so110792pls.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 16:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gnDP3uwv4ZsCJhBaL3vULnGr4qafn2rcK/dDmLilAZM=;
 b=Bd1Yx2FqxV4UOGv8nqMdfxQ1fp8xav1uuNAef0Pp1BHNQTwLLONJnzcGV7NTu1WXyh
 f2jN55b+9itdeux1pMTodtx6pd7r06YwljoL4acEoptg77oxvize0n/tqQx2Tm2X34Nh
 yHV0EqGJHbPAzHNteCzNmjqjAiHv78wQgrPnLuPhM5LfM5okqFFKetYlVWs07N/K8t8p
 ICaC4Bd8rqRNtzn65/cn5MCFs4aLhrLPXQTMDRUmdKzjLxSWfPNYpoB1M/tS/8xGzBdE
 wVQR6WNOXVYObl2CNY+mYDyfB5O5yaPd2pSDVIqFSw/ADjWUdPXUbabyPWW4+1O5ipwA
 EmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gnDP3uwv4ZsCJhBaL3vULnGr4qafn2rcK/dDmLilAZM=;
 b=bNkIHHVb+7uTNKpYuG9jlGnMRzRm7csOjgN1pSdUl2jb1BZf4ohucPjS8ut7awseRd
 xSiOvJQB3XcWZppjllkNnDUBZfzsap6NuNjSQEjte9mj8FcOjDvNQe8dVFVljbpjUUdo
 z9ef+HHQaGdvLzaH6aCq8vaf24K9AfUVwqGZcl1zsLdy66vynhG0hS+7ARNVqlBsecIv
 ad8wPFK0XzOa/toO37ilE0SGVPGIwba5oTUSy/E+wL2/cYUFVfa7jBopCSjwGGRUFdRu
 sXlpkpsdaJ9Z+adrg4E0lfPrxt4DC3f8vEw4fevrNpDz0F1lPEMeYcBCpARvwwMo4DSY
 IbJA==
X-Gm-Message-State: AOAM5307o/XsAijqRLKBh6UbRRTjeEdpWVvB2KZHCmMxNO2t7Cgylsae
 zPshynfs1c2vO66gR6zfa+k=
X-Google-Smtp-Source: ABdhPJyjSEXw116Ml4crfHEP7+KlNIC9oPF5tTYoMqsVz9mzIAHK6VCsbu/ywwika6rsTZxmv+UhkA==
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id
 c6-20020a170902d48600b001518e66621cmr2951423plg.141.1646179948059; 
 Tue, 01 Mar 2022 16:12:28 -0800 (PST)
Received: from [10.0.2.15] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a63fa45000000b0037407b6ffdasm13805155pgk.5.2022.03.01.16.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 16:12:27 -0800 (PST)
Message-ID: <d45a3995-591f-5376-7cb3-26b27261d5fb@gmail.com>
Date: Wed, 2 Mar 2022 09:12:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/15] audio: replace open-coded buffer arithmetic
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
 <20220301191311.26695-1-vr_qemu@t-online.de>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220301191311.26695-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/03/02 4:12, Volker Rümelin wrote:
> Replace open-coded buffer arithmetic with the new function
> audio_ring_posb(). That's the position in backward direction
> of a given point at a given distance.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio.c     | 25 +++++++------------------
>   audio/audio_int.h | 13 +++++++++++++
>   audio/coreaudio.c | 10 ++++------
>   audio/sdlaudio.c  | 11 +++++------
>   4 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index dc28685d22..e7a139e289 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -574,19 +574,13 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
>   {
>       HWVoiceIn *hw = sw->hw;
>       ssize_t live = hw->total_samples_captured - sw->total_hw_samples_acquired;
> -    ssize_t rpos;
>   
>       if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
>           dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
>           return 0;
>       }
>   
> -    rpos = hw->conv_buf->pos - live;
> -    if (rpos >= 0) {
> -        return rpos;
> -    } else {
> -        return hw->conv_buf->size + rpos;
> -    }
> +    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
>   }
>   
>   static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
> @@ -1394,12 +1388,10 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw)
>   
>   void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
>   {
> -    ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
> +    size_t start;
>   
> -    if (start < 0) {
> -        start += hw->size_emul;
> -    }
> -    assert(start >= 0 && start < hw->size_emul);
> +    start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
> +    assert(start < hw->size_emul);
>   
>       *size = MIN(*size, hw->pending_emul);
>       *size = MIN(*size, hw->size_emul - start);
> @@ -1415,13 +1407,10 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
>   void audio_generic_run_buffer_out(HWVoiceOut *hw)
>   {
>       while (hw->pending_emul) {
> -        size_t write_len, written;
> -        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
> +        size_t write_len, written, start;
>   
> -        if (start < 0) {
> -            start += hw->size_emul;
> -        }
> -        assert(start >= 0 && start < hw->size_emul);
> +        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
> +        assert(start < hw->size_emul);
>   
>           write_len = MIN(hw->pending_emul, hw->size_emul - start);
>   
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 428a091d05..71be162271 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -266,6 +266,19 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
>       return (dst >= src) ? (dst - src) : (len - src + dst);
>   }
>   
> +/**
> + * audio_ring_posb() - returns new position in ringbuffer in backward
> + * direction at given distance
> + *
> + * @pos: current position in ringbuffer
> + * @dist: distance in ringbuffer to walk in reverse direction
> + * @len: size of ringbuffer
> + */
> +static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
> +{
> +    return pos >= dist ? pos - dist : len - dist + pos;
> +}
> +
>   #define dolog(fmt, ...) AUD_log(AUDIO_CAP, fmt, ## __VA_ARGS__)
>   
>   #ifdef DEBUG
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..1fdd1d4b14 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -333,12 +333,10 @@ static OSStatus audioDeviceIOProc(
>   
>       len = frameCount * hw->info.bytes_per_frame;
>       while (len) {
> -        size_t write_len;
> -        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
> -        if (start < 0) {
> -            start += hw->size_emul;
> -        }
> -        assert(start >= 0 && start < hw->size_emul);
> +        size_t write_len, start;
> +
> +        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
> +        assert(start < hw->size_emul);
>   
>           write_len = MIN(MIN(hw->pending_emul, len),
>                           hw->size_emul - start);
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index c68c62a3e4..d6f3aa1a9a 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -224,12 +224,11 @@ static void sdl_callback_out(void *opaque, Uint8 *buf, int len)
>           /* dolog("callback_out: len=%d avail=%zu\n", len, hw->pending_emul); */
>   
>           while (hw->pending_emul && len) {
> -            size_t write_len;
> -            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
> -            if (start < 0) {
> -                start += hw->size_emul;
> -            }
> -            assert(start >= 0 && start < hw->size_emul);
> +            size_t write_len, start;
> +
> +            start = audio_ring_posb(hw->pos_emul, hw->pending_emul,
> +                                    hw->size_emul);
> +            assert(start < hw->size_emul);
>   
>               write_len = MIN(MIN(hw->pending_emul, len),
>                               hw->size_emul - start)

