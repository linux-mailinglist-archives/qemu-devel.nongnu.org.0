Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582E594BAD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:46:41 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkjA-0005If-78
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkhM-0003oJ-TF
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:44:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkhL-0005Mi-CN
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:44:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pm17so8362343pjb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=7VNJ9FNxvAF2P1djNQyh9QYSnZ+cIJShTLT1Rh2hK6g=;
 b=FEnp8hbL9aso2otwWvMvhmHeduq0MfnsT22Xke4HPo4MAsLtCYPLLkodD/vK39jfWh
 ZQaIDV2mwxzh4GUOtdiAI70OuFmtvuHdSfon/f4vDzCmTu0LndvQLF+CWmAi7y+nc2Vz
 8x7eO/YmRzIOaWYDbWV5AeWy/0pcNKed0r90t1VFTGxZl8OZF8PTqDjk9zY+Qn+AK3Vf
 QU7alc3YidnbSKFa0/4zMapasJUz5BZd3lgmWRN1aEdisDDvMQZWRwt4/S0OYXJiD12J
 NG3yJQfBC1ZB6wIdpi6owQZrpuu2UyjSmdDWlmEPYE9kurUoFVCUPLZzlSFgKmy7hzsI
 uT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=7VNJ9FNxvAF2P1djNQyh9QYSnZ+cIJShTLT1Rh2hK6g=;
 b=RG/DB+TC0LssqPd97T8OvSHSvYkiGKkknEnlWdubIkYDw4d7N0tHpD5XmlaRWOydCb
 +Fudx+zOxWC/hJi/iqY8JA5frlPJ6kovmX+PTkE/4bsUsy0N2F1pTdh+Z9aI1h0M3szL
 WFr8506DDJ3U6hHKTeRaKMnHxS4NkfaoYfZf6nMQs9ymr+bjXN0nPjfnOqtphYrrWYcl
 m4v1zcAnAi0PXoN6R3eKbhzJAmBaw2SytEjNdd+qtm3vGDaC4Mg9gqIAseEFuj9sxmMZ
 llBd3eIjJ2EfBakN9CzW+h5MpHHB0vz9wUkJ9WakKrjjzz7g/TfU3tISQRBMCwYn47/U
 HNDQ==
X-Gm-Message-State: ACgBeo3R8c+lnU0imkSQzypJ+dDZXgFtrnHQ+qFE3tHtNwszLwrd3GQg
 uukoyOKU714Ja+9pwvdhkLXO8XfyANg=
X-Google-Smtp-Source: AA6agR43hfRbOVA319Z3cqVjaovwCNRxZtsJ1ryPDbWBREPo4qWiXlPb6lg8fXENc5HvgOw/Pqx94g==
X-Received: by 2002:a17:902:7c11:b0:172:71ea:e99 with SMTP id
 x17-20020a1709027c1100b0017271ea0e99mr6057648pll.73.1660610685905; 
 Mon, 15 Aug 2022 17:44:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p185-20020a625bc2000000b0052de4886706sm7343645pfb.10.2022.08.15.17.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:44:45 -0700 (PDT)
Message-ID: <277f1180-02f4-9372-2493-1954a250e35f@amsat.org>
Date: Tue, 16 Aug 2022 02:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] hw/mips/boston: Pack fdt in fdt filter
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
 <20220813162720.60008-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20220813162720.60008-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/8/22 18:27, Jiaxun Yang wrote:
> FDT can be awfully fat after series of modifications in fdt
> filter. Just pack it up before add to ram.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/mips/boston.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index 5145179951..a40f193f78 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -400,6 +400,7 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
>                           1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz,
>                           1, ram_high_sz);
>   
> +    fdt_pack(fdt);
>       fdt = g_realloc(fdt, fdt_totalsize(fdt));
>       qemu_fdt_dumpdtb(fdt, fdt_sz);
>   

Why not pack by default in qemu_fdt_dumpdtb()?

