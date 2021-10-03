Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321B4420327
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:48:37 +0200 (CEST)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5bI-00038G-1Q
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5YJ-0001au-Rj
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:45:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5YI-0006hM-2x
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:45:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id v17so26044679wrv.9
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ls8MYS5xpOfHlFjVaVSdAbDFukGfWCjUqqKAiiKn4Rk=;
 b=BYmwKzoeJWI7YY+dgkSz7UzJhWo5olRqwr5IaMUXzoesOPv/i+fcc2uzfiWUw1UrVb
 gxn/fRggR2HK0i9jpgw5589yyreZdXCgESHpH4VOKidpGQJGbWkcqSu85Bmkr57JfNSm
 98D1jCCewWlYym4nBdHMp/yurY9UJS/qg/Y79lm2NdHk8QhW0/b5uJXhg3EqvM4pUawp
 i94Xl0a1WWzd4jncR+DbGIUgsVkKiffHdRg2rBg2W1xIGtiE3ktn4nnzYi3gnbUBFbXE
 BjUNkedYgrdo9SG0dLbIcNfN4nNa1ueeVbsUh44+uBub9Pv8CIIM8WPNCg+ePhOXRaKt
 U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ls8MYS5xpOfHlFjVaVSdAbDFukGfWCjUqqKAiiKn4Rk=;
 b=2c7S11KtyiV1hF7WqBm7kFn8OD3EAoUVKvDQ49PDzmdFs+yyLFsLblSKhmhkxeexQF
 0NiHgmVL82i4z4XZjVxCX+zQaCIit5Y8KLwL2T1XqumrM4gE46BuMiPrhzpe6axXBff2
 LsqQCaBfCB5umNat8itQES9JzjAA79xsVh9UIxo4u58liDcfw87tPnluo9EQxBHlGGlN
 N1Vsg+34nIyfHfaNH74wO8n2xFiKtHU3b6Mk6bpWa35BVxX8h6PGWURwwe0lqq8s0GHh
 Jd6kOU+2Xk30Uhsf0333wP2WmfLgQJzij2Th4atHoqkNzTsSLhgh8MHh87SRqnTWsngy
 76SA==
X-Gm-Message-State: AOAM532L0vN2rbxGuwNxs2c44AxSPk6tp/tVqEOSotlZ+xWR78st8Cyn
 hC5mSgZzrx0G0GMnWRpkuD8=
X-Google-Smtp-Source: ABdhPJyPAr9rM/Wd2mdKtUSMCQbqkGLXWSVm+w+ZlO0V5tjKSm1bBsv5ANKKMha5YUNfLDRYi16oiQ==
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr9863535wrx.427.1633283127955; 
 Sun, 03 Oct 2021 10:45:27 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o26sm14197645wmc.17.2021.10.03.10.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 10:45:27 -0700 (PDT)
Message-ID: <7e001a0a-c7e4-ac60-d9b7-bfc018a9f9fe@amsat.org>
Date: Sun, 3 Oct 2021 19:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 3/3] hw/mips/boston: Add FDT generator
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
 <20211002184539.169-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211002184539.169-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 20:45, Jiaxun Yang wrote:
> Generate FDT on our own if no dtb argument supplied.
> Avoid introducing unused device in FDT with user supplied dtb.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v2: Address f4bug cmments (Thanks!)
> ---
>  hw/mips/boston.c | 234 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 226 insertions(+), 8 deletions(-)

>  static void boston_mach_init(MachineState *machine)
>  {
>      DeviceState *dev;
> @@ -555,21 +771,23 @@ static void boston_mach_init(MachineState *machine)
>                             NULL, 0, EM_MIPS, 1, 0);
>  
>          if (kernel_size) {
> +            int dt_size;
> +            g_autofree const void *dtb_file_data, *dtb_load_data;
>              hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
>              hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
>  
>              s->kernel_entry = kernel_entry;
>              if (machine->dtb) {
> -                int dt_size;
> -                g_autofree const void *dtb_file_data, *dtb_load_data;
> -
>                  dtb_file_data = load_device_tree(machine->dtb, &dt_size);
> -                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);

Isn't it better to let boston_fdt_filter() here, ...

> -
> -                /* Calculate real fdt size after filter */
> -                dt_size = fdt_totalsize(dtb_load_data);
> -                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
> +            } else {
> +                dtb_file_data = create_fdt(s, boston_memmap, &dt_size);

... and pass kernel_cmdline & machine->ram_size to create_fdt(),
filling the bootargs & memory nodes?

>              }
> +
> +            dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
> +
> +            /* Calculate real fdt size after filter */
> +            dt_size = fdt_totalsize(dtb_load_data);
> +            rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
>          } else {
>              /* Try to load file as FIT */
>              fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
> 

