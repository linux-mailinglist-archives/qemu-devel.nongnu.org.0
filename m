Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C153E580
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:41:43 +0200 (CEST)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyErO-0005WJ-FK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyEHa-0007vq-7B; Mon, 06 Jun 2022 11:04:42 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nyEHY-0005Fn-Fc; Mon, 06 Jun 2022 11:04:41 -0400
Received: by mail-pg1-x533.google.com with SMTP id f65so2921809pgc.7;
 Mon, 06 Jun 2022 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Cb1sA/JkZlj0zcH8NeaNHv3Zd1DdDn+G8TauC+eGFc=;
 b=MHCbnpV0+4Shupap0jb3BMRvahQWiZpS2IRZ9vQcB/5Bu1+WmxKWEeSCKKpMFKGupz
 peOQ9gjNOQK/COZ7PzUlPxWJEV1C6Cv6VgbJeNBksEPGEi3rUGXSEIyENZGJwru6KMGj
 ilnAXvLyweMWEn3UnzKj6o3K+U2JPPyCfHJ/iNkL7/oeBPpPsuP8oMR82e6DhHsBl8g0
 vn5mnKvxFYYLba41RCkEVEe8iyxzDXY9ppdSEAN4N1Uj4puaQq5w8vnsrq4ZngE/6ebG
 4V4CgTLTel5gp/mlxjfR2JhZitkdEZ/yOFIdsyqP+nLjirrx/dyi8zJx0p6MazILlpio
 nhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Cb1sA/JkZlj0zcH8NeaNHv3Zd1DdDn+G8TauC+eGFc=;
 b=c4WE4bwpMdg0y121MofS+dexcE6kw6p8f8inDIFux3VpAsGbXF/CCvlQrThF0WVdYk
 YsYAoQj1WjpxiUhxbzIk5AOGF7X6QH50mFiDLCyT4aVMwQT7//vLwAAGXGLD401nW4UF
 R6+M0PRN6koYg+FwZxpexuwnCgfVRIJPQe8EsdEbzLQ93PJEla+wq6isFral9Rgw+Q7x
 fGeR2hD2O5kDXK/tIrBtEVuEi/x/xF12zEoMgne1JAjCtrk9sx+r1hbjhGht5TpXRDfU
 e2EvPkmVXa3tkJXCifhFvCM0SOao5WBeYPoz7KGlX5GUqflCFhM34c9M/EMbc61xozBu
 jeXg==
X-Gm-Message-State: AOAM531vsThj7DIbXvPL3egf6M59RehHqTX//TYpFZGBmQHkccQ3Bavk
 ZWErYpOriqKGqX6Hj8iKC3I=
X-Google-Smtp-Source: ABdhPJyCJpRQeQidSPkb1c5314aTveY8/mxsGxeKroqPw9xsFwzvAyhjsYMYBC3nA54Umvo59pHgFw==
X-Received: by 2002:a62:db81:0:b0:51b:ed38:c409 with SMTP id
 f123-20020a62db81000000b0051bed38c409mr15298191pfg.37.1654527878646; 
 Mon, 06 Jun 2022 08:04:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170902e80600b00163fbb1eec5sm10612669plg.229.2022.06.06.08.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 08:04:37 -0700 (PDT)
Message-ID: <b8e21692-0ee7-79b0-c2f7-04a1420795cd@amsat.org>
Date: Mon, 6 Jun 2022 17:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/mips/boston: Initialize g_autofree pointers
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paul Burton <paulburton@kernel.org>
References: <20220605151908.30566-1-shentey@gmail.com>
In-Reply-To: <20220605151908.30566-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
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

On 5/6/22 17:19, Bernhard Beschow wrote:
> Fixes compilation due to false positives with -Werror:
> 
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from qemu/src/include/glib-compat.h:32,
>                     from qemu/src/include/qemu/osdep.h:144,
>                     from ../src/hw/mips/boston.c:20:
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>        inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:52:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_load_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:52: note: ‘dtb_load_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                                    ^~~~~~~~~~~~~
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>      inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:36:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_file_data’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
>    ../src/hw/mips/boston.c:790:36: note: ‘dtb_file_data’ was declared here
>      790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
>          |                                    ^~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/boston.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index 59ca08b93a..1debca18ec 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -787,7 +787,8 @@ static void boston_mach_init(MachineState *machine)
>   
>           if (kernel_size > 0) {
>               int dt_size;
> -            g_autofree const void *dtb_file_data, *dtb_load_data;
> +            g_autofree const void *dtb_file_data = NULL;
> +            g_autofree const void *dtb_load_data = NULL;
>               hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
>               hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
>   

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued to mips-next.

