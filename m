Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414A39116C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 09:31:55 +0200 (CEST)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llo1C-0006Cr-Hw
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 03:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llnzl-0004zY-0z; Wed, 26 May 2021 03:30:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llnzj-0005mg-Ix; Wed, 26 May 2021 03:30:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id z17so34743255wrq.7;
 Wed, 26 May 2021 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YnWmifPpXpUdFEqqjysDcDvPKRdEVKx8rWXmaIktMHk=;
 b=NYtWL8u7IrRojPU+9RiLOhxJ2132GWBoS96cLxDmkep+IxOGynVFPwWrgkFJ1DjlUx
 SsZ03KHNcV0QBocf+0NuD/SvfuSEd33qrUGa4HGmTC33h/HSnmU9GtyPHMUiJ2LSv3xa
 WV26mtLJI7ePi7z5h55Uw0Lh6/EHAbLXTUMHBdIubMe4G+yUdQVgJdMnOsYpwoq0L1fu
 jeHwm4IBl4jeXYbiuiLxpinsgL0Li44NlzSCdzrt6+t5AgACnxP/CQz9jhMkflO3P1Fl
 SZZP9Q7mqQ11d1NjF0CL9zVkdp10oCsz2A7QJqh5AjKTu6UzNkKr8pHjb07Ux7gz/N8S
 NcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YnWmifPpXpUdFEqqjysDcDvPKRdEVKx8rWXmaIktMHk=;
 b=SxOnosWxz2b1E7MWnL6gVahzStDRpVQCPEmjqbv791jcTafuBHPXJO9RZaMr0nxXNI
 uRwux77UGCfWWKze7a2hWEKWPwZuSEe4q8OLNEQnez/zR8tNBHgld4KIih8U7KtFJ7+a
 PPuZFJEsl5mlVH97GB5RuZftlg/zFvkNTyNfphpKRa0qSEOAXhlCqkS4V//w+j7E2riu
 aED9e3wW816dnt6KPVQNARuS3keyqSozW3LXaUKoul9G1m3JakZT+Fktv1fp6KfsFrMj
 vLyluv9vM/WlGFusvAcHIAEtilvqYRFOyxssgpvmG/4I9j2tp/DkWzrRfBPhuwSj3SPO
 SY5Q==
X-Gm-Message-State: AOAM533T4SprLvmVJKJP0fa5hCErI61gj4b9mQoyvGpr0UG/Z4GuVRBj
 hH8XsGCc7W60TJdjeV+O9ws=
X-Google-Smtp-Source: ABdhPJw4sGn3vHFP+rXnRmai0UBhM0RQWHf5vJUSLxMf7NPmCF7MKdIy5Zlv7GSU+GJ5Qoah0MYXZw==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr30943454wrq.142.1622014221441; 
 Wed, 26 May 2021 00:30:21 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 11sm13687999wmo.24.2021.05.26.00.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 00:30:20 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
To: Helge Deller <deller@gmx.de>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <YK1aPb8keur9W7h2@ls3530>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e7f5c4ae-3284-a155-cb98-69ff6ce52649@amsat.org>
Date: Wed, 26 May 2021 09:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK1aPb8keur9W7h2@ls3530>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, qemu-stable@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 10:12 PM, Helge Deller wrote:
> The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the local screen
> menu is closed. This bug was introduced by commit c7050f3f167b
> ("hw/display/artist: Refactor x/y coordination extraction") which converted the
> coordinate extraction in artist_vram_read() and artist_vram_write() to use the
> ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address by 2 as
> it was done before.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extraction")
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Sven Schnelle <svens@stackframe.org>
> 
> ---
> v2: Fix artist_vram_write() too, noticed by Philippe Mathieu-Daudé
> 
> diff --git a/hw/display/artist.c b/hw/display/artist.c
> index ed0e637f25..8758c77bbf 100644
> --- a/hw/display/artist.c
> +++ b/hw/display/artist.c
> @@ -1171,8 +1171,8 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
>      }
> 
>      buf = vram_write_buffer(s);
> -    posy = ADDR_TO_Y(addr);
> -    posx = ADDR_TO_X(addr);
> +    posy = ADDR_TO_Y(addr >> 2);
> +    posx = ADDR_TO_X(addr >> 2);
> 
>      if (!buf->size) {
>          return;
> @@ -1233,8 +1233,8 @@ static uint64_t artist_vram_read(void *opaque, hwaddr addr, unsigned size)
>          return 0;
>      }
> 
> -    posy = ADDR_TO_Y(addr);
> -    posx = ADDR_TO_X(addr);
> +    posy = ADDR_TO_Y(addr >> 2);
> +    posx = ADDR_TO_X(addr >> 2);
> 
>      if (posy > buf->height || posx > buf->width) {
>          return 0;
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

