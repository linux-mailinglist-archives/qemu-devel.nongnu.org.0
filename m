Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B444A5221
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 23:11:01 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEet2-0002Ei-3Z
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 17:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEepg-00005t-Va
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:07:34 -0500
Received: from [2607:f8b0:4864:20::102c] (port=39521
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEepb-000598-UG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:07:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so538382pjj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UhLQVxPMjBe/pYPXxrVvPO7nJ1rU4vj8jExhVy6roow=;
 b=H2yYSSc9cZixcIj9uedse+M5rLEwZwTTB7//2Rtj2BxcGgeWVT2dR19X76VoLlBqH+
 AoDoYHjfC1LvXScyabbpJbDwp5he0bblekHCChPavhRvpNrP963gEkcFqX2YJ8/jiJtI
 xoulq26cGHsZPy30lo5YUC7+nTVX20Vrga/c2Fc/6JMEkSnFgXnJJLD2sKWRgonI5CYn
 dm4rsgWsM2he8AWumwzxTbIHFx/nmVD2Xh9FS4rRXzcMomgWgJTgMTaC6hq2GkXo0Vuv
 5AfiNrOLKk/IPAp1eZHohONAGBo8Q2bs98Wa9y2CUkV0FqBBKNiSYjQh2liyNCVLs7C1
 dSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UhLQVxPMjBe/pYPXxrVvPO7nJ1rU4vj8jExhVy6roow=;
 b=eYMYQkiWumIYgFcDEngYNuTsLdL6QUD/YHfD+dwy8c4DkAKHavoTreszVZM/ouXB/K
 Ga5ciV3dXWT2DpTWeIy8txiqLU+Gb2xxGKS+tfdVw8ZFPmGIR8E4v88Gg1WlWvn7g75n
 w9jLxvXdl4NoM/L+wgmf6ij8gZQD3Q+FWzaqCEfl30uxmMoszpnrlZjdCWqb9lqoQ2hc
 3fg37bGxfcrw6Xhj9gBQjWlB3tQMDc5OyX8MwMraljFjZgSmxrQ/Z5rU8KW5JabSHvW7
 Y0jT/T8vUI32KusaBEMtJ3Jxs8vhteXNmFeYy6uw3wclHNpc+8iMWDOQ/htUxENHo8pv
 kIUw==
X-Gm-Message-State: AOAM530/s/fkSMeuC7EF18eMzNVRhKXptY+faJFev6w0mem8JEp2QLCO
 74CfXA0bvaMK6IcCpDkdlZa0pA==
X-Google-Smtp-Source: ABdhPJy8PHu5cQA4XlP0UnmZEmGrseDLu5LrZzNP4+E2ablvq0cUzBT92yCdGaYn/1b+HbAGUkFrAg==
X-Received: by 2002:a17:90a:b018:: with SMTP id
 x24mr26478731pjq.91.1643666731509; 
 Mon, 31 Jan 2022 14:05:31 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id y8sm30392301pgs.31.2022.01.31.14.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 14:05:31 -0800 (PST)
Message-ID: <11f84353-dccb-60d8-77f0-2b0f7cb030a6@linaro.org>
Date: Tue, 1 Feb 2022 09:05:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/6] hw/hppa: Allow up to 16 emulated CPUs
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220131213529.17404-1-deller@gmx.de>
 <20220131213529.17404-3-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220131213529.17404-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 08:35, Helge Deller wrote:
> This brings the hppa_hardware.h file in sync with the copy in the
> SeaBIOS-hppa sources.
> 
> In order to support up to 16 CPUs, it's required to move the HPA for
> MEMORY_HPA out of the address space of the 16th CPU.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_hardware.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
> index bc258895c9..5edf577563 100644
> --- a/hw/hppa/hppa_hardware.h
> +++ b/hw/hppa/hppa_hardware.h
> @@ -25,7 +25,7 @@
>   #define LASI_GFX_HPA    0xf8000000
>   #define ARTIST_FB_ADDR  0xf9000000
>   #define CPU_HPA         0xfffb0000
> -#define MEMORY_HPA      0xfffbf000
> +#define MEMORY_HPA      0xfffff000

You could mention that you're moving it *well* out of the way, perhaps.  I was first 
confused about why the gap between the two numbers was so large.


> +#define PIM_STORAGE_SIZE 600	/* storage size of pdc_pim_toc_struct (64bit) */

Belongs to the next patch?  Completely unused?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

