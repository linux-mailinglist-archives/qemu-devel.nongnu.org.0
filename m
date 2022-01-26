Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C849C998
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:26:11 +0100 (CET)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChNK-0005kc-FC
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nChM5-00055c-Fi
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:24:53 -0500
Received: from [2a00:1450:4864:20::332] (port=36562
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nChM3-00031V-UJ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:24:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso3648376wma.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhBnmmcA7VEsc+izR+lL+XEkG6UMYTZLwOwIEBfgtS0=;
 b=bRBEd0QQq8EmpwQ0gacDtPUAu3WJWPTaw7czXHss0TwlkdAgDCi2/zbR7Qh7uuV/B7
 uQuVLSIh77uJ3fzSnUbwWSOJY+rd623PUa01C/sBLOdLyIJGe9r63/xyxgSIA1kFwUqg
 WwJTdT8yVJvV0wn1bYVkvR2c0XStKJABEhIqntRpDNb7n15hQJ7gFgEIJkjsxKuzCP01
 4tPyZVgxqu/ky83IAwRvXL/qOG33YS0efktiS0UUZt68LUeNpk5u/nQz5hUTyD4vBo9D
 fO94fpwuvJAYOmV5Ml/+WRIEDEtJmfujGSiQKzj4wHbj1tEsMfejQLXbkkU3JsVjb4Sp
 lWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhBnmmcA7VEsc+izR+lL+XEkG6UMYTZLwOwIEBfgtS0=;
 b=61lqVISoILxN8gPye2JYdYaC5J3roaOhx9sM0R7O8trJT/YlHpoYXcdJGdtCC1/D+n
 dpkE7UGC5PX9/H72a9VGZYG4n+lMfO41856fo5sppdQAxaA8WK9TQ1Ea9zAGoogkVIZk
 /KaaRw4f9Wj3H7hfU93526gsYgbJdSFpScC/w1prj/AqSjFYhfgaJQMMOOtlD7vHHMy1
 P1c/jIEAmzQsfiOW1CujW7LSt9tgNAwc7lBBCdZFRVDIj0HpbL9mCLiGXdiPYnedRBup
 zGmC3IPwgd5XR9uGVwqosUGF4wvafzFdRIiz5ewEKDj58TRAYjQQ0U8yn2uhWcsMQe6h
 J15g==
X-Gm-Message-State: AOAM531PZHQ/+fClNVlIaZPs5APeKakvNYCQ8H1bNVvwSSqGvno0PRFV
 D1CAiyO6pmxXLR3FhQBzjfc=
X-Google-Smtp-Source: ABdhPJyZa2DPYaRkxfZivJfdwc0lzlnHlbYn8gVaK+q9zYDjg1GM8G22HVMh6vK8gzaIsyDNtdeajw==
X-Received: by 2002:a1c:7412:: with SMTP id p18mr591434wmc.30.1643199889831;
 Wed, 26 Jan 2022 04:24:49 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 1sm11603314wry.52.2022.01.26.04.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:24:49 -0800 (PST)
Message-ID: <48519051-3868-de38-10ad-db01823328fe@amsat.org>
Date: Wed, 26 Jan 2022 13:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/display/tcx: Avoid clearing dirty bitmap in
 DeviceReset()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>
References: <20220122000707.82918-1-f4bug@amsat.org>
 <004e2b3d-46f3-f829-faea-f36b1e7c3054@ilande.co.uk>
In-Reply-To: <004e2b3d-46f3-f829-faea-f36b1e7c3054@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/26/22 08:23, Mark Cave-Ayland wrote:
> On 22/01/2022 00:07, Philippe Mathieu-Daudé via wrote:
> 
>> Commit 2dd285b5f3 ("tcx: make display updates thread safe")
>> converted this model to use the DirtyBitmapSnapshot API,
>> resetting the dirty bitmap in tcx_update_display(). There
>> is no need to do it again in the DeviceReset handler.
>>
>> See more details in commit fec5e8c92b ("vga: make display
>> updates thread safe.").
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/display/tcx.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/display/tcx.c b/hw/display/tcx.c
>> index d4d09d0df8..22b0ae4761 100644
>> --- a/hw/display/tcx.c
>> +++ b/hw/display/tcx.c
>> @@ -371,8 +371,6 @@ static void tcx_reset(DeviceState *d)
>>       s->r[258] = s->g[258] = s->b[258] = 255;
>>       update_palette_entries(s, 0, 260);
>>       memset(s->vram, 0, MAXX*MAXY);
>> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 +
>> 4),
>> -                              DIRTY_MEMORY_VGA);
>>       s->dac_index = 0;
>>       s->dac_state = 0;
>>       s->cursx = 0xf000; /* Put cursor off screen */
> 
> I think the issue here is that tcx_reset() should be marking the entire
> VRAM dirty due to the memset() i.e. we should be setting the dirty
> bitmap rather than resetting it. Perhaps memory_region_reset_dirty()
> should be replaced with tcx_invalidate_display() instead?

Yeah I was not sure, and your suggestion sounds right. I'll respin.

