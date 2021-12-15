Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEB475670
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:33:03 +0100 (CET)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRao-0001Ll-5h
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRXC-0007SI-6v; Wed, 15 Dec 2021 05:29:18 -0500
Received: from [2a00:1450:4864:20::435] (port=46723
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRXA-0006fU-OS; Wed, 15 Dec 2021 05:29:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id i22so7509203wrb.13;
 Wed, 15 Dec 2021 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pM1Uem9tzwudfYAnplI4hmjxJCfT6aC2a3RRoXBbF14=;
 b=Wi5ol8nQPVO6REB7eNMY2HCa+i19VmmgjPKTccvXMnyqCEekleq8TZTZxQmoyXjOe3
 ry8iIrXx1xcWbNbL2oeifK6t2enausS8sttvti4bnMQXEtFGliMEkSvfTFAzQXcGLd0N
 0NLSECVp76PclJ6PuXHpcOnjn9Wsy36sQ0b9HdX2qDOgj5YfoJ0nAhKkwcFlH2l6xpBl
 VFn5HE59tyT8kjStv3zpX82J0LuJXMGf43NCVu8BS+FQdKJ7g7LcpNTR8EQyyZyBddz5
 aNQbybtJg1UUh0/u6AFxMqGogdgIOYklGVfI38NnQFPi+pK/J8G+BSuh7AaJPBm/F5oH
 1pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pM1Uem9tzwudfYAnplI4hmjxJCfT6aC2a3RRoXBbF14=;
 b=p7IPYuJpzzSDcnKjfs8f57LLR9rCHpaIP3rIQ4hCZSZvlxV6TnU3l0OQNI1JAyIirE
 nrZXfg82Pi5qh7GSeGir3/j/j2rN1Blge8RUeDjDf2Kvb+FR6XDBm9HTOY+sxjw0dgyM
 /ire54zH/S3fyO31MoBxLJD9RByNEo8bzq6Rk+5sRhj7CihZ/F9Dkh+Y2Ui5CQ3mhId4
 5awZonhNuAYw/a98ccpJQEg+6aYkW+xCwvRwdtfEB/maGyOu5pgOJHkvcE5Gb/vyWImi
 27UddEzqmkW9ep40HqNOmilT7PlZYqiZfooBy+s+2/sroxuKG5nYJv4h9v3VX/0n0WdV
 S6Ug==
X-Gm-Message-State: AOAM533KIjej2VD86PCZE5qO5JJ/AhHKN+OA0dMbkPC72jJvWCB/EPom
 INKqFeu3Ge2oYWh9ryl22nTo5hAfrNw=
X-Google-Smtp-Source: ABdhPJwHJ4ETXoGbpKjEY4THceFaIRZzP9gMozZlvz58JEsnsyt4xUT3yK09w9gZMZLmE/vdEGSdmg==
X-Received: by 2002:adf:f10f:: with SMTP id r15mr3678929wro.553.1639564154771; 
 Wed, 15 Dec 2021 02:29:14 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m6sm2059037wrp.34.2021.12.15.02.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:29:14 -0800 (PST)
Message-ID: <c411d129-cbb8-42e1-08fc-c10b081aae03@amsat.org>
Date: Wed, 15 Dec 2021 11:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/scsi: Fix scsi_bus_init_named() docstring
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211122104744.1051554-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211122104744.1051554-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
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
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

This patch is reviewed, can it go via your trivial tree?

On 11/22/21 11:47, Philippe Mathieu-Daudé wrote:
> Commit 739e95f5741 ("scsi: Replace scsi_bus_new() with
> scsi_bus_init(), scsi_bus_init_named()") forgot to rename
> scsi_bus_init() in the function documentation string.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/scsi/scsi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index a567a5ed86b..2ef80af6dca 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -158,7 +158,7 @@ struct SCSIBus {
>   * provided by the caller. It is the caller's responsibility to make
>   * sure that name does not clash with the name of any other bus in the
>   * system. Unless you need the new bus to have a specific name, you
> - * should use scsi_bus_new() instead.
> + * should use scsi_bus_init() instead.
>   */
>  void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
>                           const SCSIBusInfo *info, const char *bus_name);
> 

