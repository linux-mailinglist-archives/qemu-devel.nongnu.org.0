Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17248CE01
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:48:54 +0100 (CET)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7lUD-000621-F7
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7lT1-0005BC-Tr; Wed, 12 Jan 2022 16:47:39 -0500
Received: from [2607:f8b0:4864:20::633] (port=43714
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7lT0-0006Oo-1A; Wed, 12 Jan 2022 16:47:39 -0500
Received: by mail-pl1-x633.google.com with SMTP id e19so6339577plc.10;
 Wed, 12 Jan 2022 13:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3NxgR9IZXWPcQWwdx7BXAlXiUfOu/DzseG4CxbaTKcw=;
 b=p6SreftTxlU+TPw7EHc+bdGFLaIxLBUZHob1ygewyhoCXMvMQCPSkm4Bmtq9Dx0bsk
 0y3NUO0bSU09KchaLXhCyTz7IZGALm1GmXCdbG/YeIe4AUjiqbOit/Kpt5pi7R08dhnR
 3xJVaT7+hqeuaxD9CYF+kXpbiTVpbBhU0PSfrwbf8e+7kfYceVa9tHw9sMiII56YNoLT
 YSk5q11fklr0YgKDsLZBraEDeFX2PC7vrpnB3zAEVcBTS+iQtmGcgoU8skdXjBLmEnCg
 wkHpOUDXrc88LjpP/kyvSyIgJiMwkRx/RzIT2n82eM0J4xR7udSOwCVkhjGnNdjx9LXm
 bpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3NxgR9IZXWPcQWwdx7BXAlXiUfOu/DzseG4CxbaTKcw=;
 b=dV43AW1HaRMR34yH4m1EWMtueBY2xaJtBVrksXIn7wUnIm40frwld3y21z/juTwyXH
 2OKFa363eCnKLUrQejGTMfcbdABZZGCRt8Pz8hMXfCpfHxrt5LNlU5VMa2BpYFAssmcp
 b6sZIlMQ1V1aIrINVNPAO2cO6uU3t/oS51DZZ5hMBLZEd3UzYcZP8UEyDzOW/aMYYtAs
 zNBGhJvYWWKy5nS0KESqMamMCHpSRGRJwREagvY0lTHkAS59UdxbduZ68pq/Sjlas8Xu
 8elm8WcWAOsfKSe8XaHYwjm9bpyLxjQP3sFibWOS4BtH+iMJJYzAyqTHmUeQgZDJeIjv
 7Raw==
X-Gm-Message-State: AOAM532LbVlvtnV/M5xl/VW4ieFAL8c50Yi7L64NK2m9AsPVLbYxESRl
 LWYPQcfbr8xWQv7R+94Q0mE=
X-Google-Smtp-Source: ABdhPJzxlC0pb0W3RSRUX8XrHK0OTcbRxobTkheiVgYrmYyna9FpZzbnvFuaEE8g6O+2K+KOujF3lg==
X-Received: by 2002:a05:6a00:1944:b0:438:d002:6e35 with SMTP id
 s4-20020a056a00194400b00438d0026e35mr1297570pfk.20.1642024056090; 
 Wed, 12 Jan 2022 13:47:36 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m14sm501803pff.151.2022.01.12.13.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 13:47:35 -0800 (PST)
Message-ID: <70f10b2e-8fda-fc87-c383-5360c6c78993@amsat.org>
Date: Wed, 12 Jan 2022 22:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] hw/display/artist: Fix framebuffer access for Linux
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220112210730.292775-1-deller@gmx.de>
 <20220112210730.292775-6-deller@gmx.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220112210730.292775-6-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Sven

On 12/1/22 22:07, Helge Deller wrote:
> This patch fixes two problems which prevented Linux to access the
> artist graphics framebuffer:
> 
> The check if the framebuffer or the color map should be accessed was
> incomplete. By using the vram_read/write_bufidx() functions we now check
> correctly if ARTIST_BUFFER_CMAP should be accessed.
> 
> The second fix is to correctly calculate the X- and Y-coordinates and
> check against the graphics resolution.
> 
> With this fix in place, the Linux stifb driver now works correctly,
> shows the penguins at bootup and uses the stifb as graphics console.

Cool, could you add a test similar to these?

$ git grep Tux tests/avocado/
tests/avocado/machine_arm_integratorcp.py:69:        Boot Linux and 
verify the Tux logo is displayed on the framebuffer.
tests/avocado/machine_mips_malta.py:44:        Boot Linux kernel and 
check Tux logo is displayed on the framebuffer.

> I haven't seen any negative side effects when running HP-UX.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: qemu-stable@nongnu.org
> ---
>   hw/display/artist.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index 6384076c60..fbf5525334 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -1186,7 +1186,7 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
>       unsigned int offset;
>       trace_artist_vram_write(size, addr, val);
> 
> -    if (s->cmap_bm_access) {
> +    if (vram_write_bufidx(s) == ARTIST_BUFFER_CMAP) {
>           buf = &s->vram_buffer[ARTIST_BUFFER_CMAP];
>           if (addr + 3 < buf->size) {
>               *(uint32_t *)(buf->data + addr) = val;
> @@ -1195,14 +1195,14 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
>       }
> 
>       buf = vram_write_buffer(s);
> -    posy = ADDR_TO_Y(addr >> 2);
> -    posx = ADDR_TO_X(addr >> 2);
> +    posy = ADDR_TO_Y(addr);
> +    posx = ADDR_TO_X(addr);
> 
>       if (!buf->size) {
>           return;
>       }
> 
> -    if (posy > buf->height || posx > buf->width) {
> +    if (posy >= buf->height || posx >= buf->width) {
>           return;
>       }
> 
> @@ -1242,7 +1242,7 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
>       uint64_t val;
>       unsigned int posy, posx;
> 
> -    if (s->cmap_bm_access) {
> +    if (vram_read_bufidx(s) == ARTIST_BUFFER_CMAP) {
>           buf = &s->vram_buffer[ARTIST_BUFFER_CMAP];
>           val = 0;
>           if (addr < buf->size && addr + 3 < buf->size) {
> @@ -1257,10 +1257,10 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
>           return 0;
>       }
> 
> -    posy = ADDR_TO_Y(addr >> 2);
> -    posx = ADDR_TO_X(addr >> 2);
> +    posy = ADDR_TO_Y(addr);
> +    posx = ADDR_TO_X(addr);
> 
> -    if (posy > buf->height || posx > buf->width) {
> +    if (posy >= buf->height || posx >= buf->width) {
>           return 0;
>       }
> 
> --
> 2.31.1
> 
> 


