Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2267D0BE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4e3-00017U-Vv; Thu, 26 Jan 2023 10:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pL4dt-00016x-M1; Thu, 26 Jan 2023 10:58:26 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pL4dq-0005JP-P0; Thu, 26 Jan 2023 10:58:24 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 t14-20020a4ad0ae000000b004f51f61de9fso275400oor.13; 
 Thu, 26 Jan 2023 07:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7hCS+Ci7ofNY4mOh2zjmg8I55xxdF5g9xpkT+cgXF8=;
 b=CC1R4Rmlv1eg9ZDWkzrAsucyyIv/ZI8xPzQ/4tHWZ3NitElkwab9Gsb/ik2AeHiYQO
 SLsqXJabYd4v+YO1MI+YlgDHa/jbxohvxqXq11d4ngOb12xRJ42KHEts7cjrvDeFuhsc
 6BOW4GUEm7vLWK+63/NVbbnTuOwqvbFJne0jSmEgrH4OB7N+c7BWJtAt8t/WFf4DlFgE
 fHUfimcGmBB0ZaabeTAieOBFEzqAWRfL7RQOoqeonEAwPC50yJP/0lRLl+SXoHxpJxQZ
 Fl6QqFT+CtcBjdqO7NZg4HrZupMyLfAUXo58b0C87ffVFwPzYaNX01E29VYofT1eMuQd
 d8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7hCS+Ci7ofNY4mOh2zjmg8I55xxdF5g9xpkT+cgXF8=;
 b=6SOwtgT8D6NGtNQSsC7JVsIH807JKiakdg//Piaiqq3BqDzmmaEjTs0mP0Hvbmv2Iq
 2tgzOYmL1Qj/SLr979o3CmtIIlKAGGVD1ae3di+KSaGcZDzPf+TFM1i2ZZr3rXoTIQN+
 llSLDFsVHVMjgxIPCK5fyjvAiNkGnSha7DP6PSWRsWkdPyzbn9IfA+N8+zKLZtLLRlUW
 5cMnwttgeXfITPf09uDTFu2LpsLN9nMrDrYGSAHLOOxYctmRnv3v9czRZBT0brtMd/yL
 DwBeLFnV28ZLOHkh+BVe4r9ESMdjh6Ls/V4m1kwlqTCAkJgs2WHKQEIMOVbWyUli79nR
 8eDg==
X-Gm-Message-State: AFqh2krZYFcyMAlXmgxWNgwbN3dOyQgEbiTgIFF9yylgI+SZgEWtq5Ot
 4BTI9zmo+6CQsi/IHMENgdo=
X-Google-Smtp-Source: AMrXdXs47m/ybA2nu22d7kF+pT4zXWtAwwh/oA5PHuauOmvntv7qplCdSa5hsIXukxdLOND8UwYwyg==
X-Received: by 2002:a4a:e802:0:b0:4fb:cef6:5c9d with SMTP id
 b2-20020a4ae802000000b004fbcef65c9dmr13574447oob.9.1674748700949; 
 Thu, 26 Jan 2023 07:58:20 -0800 (PST)
Received: from [192.168.68.107] (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 d13-20020a4a520d000000b004f22e40ad6fsm693242oob.2.2023.01.26.07.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:58:20 -0800 (PST)
Message-ID: <4c36b71c-15c4-1a84-a14d-c675bb7bd313@gmail.com>
Date: Thu, 26 Jan 2023 12:58:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] hw/ppc: Set machine->fdt in e500 machines
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230125130024.158721-1-shentey@gmail.com>
 <20230125130024.158721-2-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230125130024.158721-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.15,
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



On 1/25/23 10:00, Bernhard Beschow wrote:
> This enables support for the 'dumpdtb' QMP/HMP command for all
> e500 machines.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 9fa1f8e6cf..7239993acc 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -659,9 +659,14 @@ done:
>       if (!dry_run) {
>           qemu_fdt_dumpdtb(fdt, fdt_size);
>           cpu_physical_memory_write(addr, fdt, fdt_size);
> +
> +        /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> +        g_free(machine->fdt);
> +        machine->fdt = fdt;
> +    } else {
> +        g_free(fdt);
>       }
>       ret = fdt_size;
> -    g_free(fdt);
>   

I tried to do this change last year when introducing 'dumpdtb' and Phil had some
comments in how the FDT was being handled by the e500 board:

https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg03256.html


================

+
+    /*
+     * Update the machine->fdt pointer to enable support for the
+     * 'dumpdtb' QMP/HMP command.
+     *
+     * The FDT is re-created during reset,

Why are we doing that? Is it really necessary? This seems to be only required at cold power-on.

+ so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
================

I ended up not going after Phil's concern. I don't think it's required to accept
this change, but it would simplify it a bit if the FDT isn't required to be
re-generated on boot.


I'm CCing Phil in case he wants to comment on it as well.




Daniel


>   out:
>       g_free(pci_map);

