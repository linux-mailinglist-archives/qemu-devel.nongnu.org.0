Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BEC4908AC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 13:26:29 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9R5g-0001Vb-46
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 07:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R2R-0007OJ-Mv; Mon, 17 Jan 2022 07:23:08 -0500
Received: from [2a00:1450:4864:20::32d] (port=55945
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9R2Q-0007Ff-3U; Mon, 17 Jan 2022 07:23:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c66so19903656wma.5;
 Mon, 17 Jan 2022 04:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JFdvW4otUdg0xUvm3ogcAdT0tMIF0RC8N4ygEvMZplA=;
 b=AyP5FY6uentnrVZO7HaUo/kZC9bCnQlVFtJa+RlxPeW6pnH1RvRgk6Cgtcru+thL2f
 f6DlTH6SFNpRPvVlHq+g+AQv/VVtSfkxa0XOpbuvTNOE5iZE7/a2sONFDUoPlS6V82V1
 y1Gm10CAoJjSSgJ3Y0Y1wYUACDPRlfEU6DCvLVsIE1vfFa6N/xLNCuINIzLelcUpSqAr
 HqbkNAyTzSanKC6K7c+gsh5hhBykTr2BuFJPIcuFNOGlsynOqiK6rleOI3z9yu8RUciB
 hZMH228ZkBy6/ZwmTuopH6793D5snzHl2Kbx/xS6qj2cwf86hP/7oNNh5iVpr6UUETfZ
 Yshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JFdvW4otUdg0xUvm3ogcAdT0tMIF0RC8N4ygEvMZplA=;
 b=Axr9xdX4cDAVlx6eKD5geshBVS+TLFWEjkGV9m/Ado8msziwMuQ9JPDw14p26KCI2k
 zCQpEFMcVy/OLf/9uMWP/f4Y2jVpky5QjZA78LLkxgRkcrMgp/O6Lgx9hYQUHFa3puVI
 1w/TTdPfROfPdQKsmdZCnEJiPEk7B1FplT+ylUBWGAFF5QuCw+B/8hIUS95a8YCcnp2p
 P4AiwyF85ooDQrJnnhoGtRCmy/XynZfIXhyeDWHDso4n+idYnuhMTyoTIRqxTECwqKTy
 eHe+n4Z2EzUZf1eovvY/hyW85+/+UuD30wEOjx4kx2xtvnstsjcqNmmfVJvRos+7lcid
 sESg==
X-Gm-Message-State: AOAM533/KMyIN0JJGo8LpF11MANZl8SKr7fwhNGII3aJJB08PId0PbhV
 t1uDuNkcmQmX1eFCG4eSnev2e/PYP+RWck9A
X-Google-Smtp-Source: ABdhPJzVS4UG5XQPUG8S2ygvYHsNy1eoqxQnDIKhjlU2JsxsBQ+WTFnopX5bX58GO0eAGs9kWT3cTQ==
X-Received: by 2002:a05:600c:4e09:: with SMTP id
 b9mr19076889wmq.194.1642422184346; 
 Mon, 17 Jan 2022 04:23:04 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b13sm15583886wrm.72.2022.01.17.04.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:23:03 -0800 (PST)
Message-ID: <34425525-2c74-5fee-bc5a-c789ef64d0b6@amsat.org>
Date: Mon, 17 Jan 2022 13:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/6] hw/arm: add boilerplate for machines based on the
 RP2040
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-3-alex.bennee@linaro.org>
In-Reply-To: <20220110175104.2908956-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 1/10/22 18:51, Alex Bennée wrote:
> Currently we are only targeting the official RaspberryPi Pico although
> I suspect most RP2040 based boards will look broadly the same.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configs/devices/arm-softmmu/default.mak |  1 +
>  hw/arm/raspi_pico.c                     | 77 +++++++++++++++++++++++++
>  hw/arm/Kconfig                          |  3 +
>  hw/arm/meson.build                      |  1 +
>  4 files changed, 82 insertions(+)
>  create mode 100644 hw/arm/raspi_pico.c

> +static void pipico_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = g_strdup_printf("Raspberry Pi Pico");
> +    mc->init = pipico_machine_init;
> +    mc->block_default_type = IF_PFLASH;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;

:)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    mc->no_sdcard = 1;
> +    mc->min_cpus = 2;
> +    mc->default_cpus = 2;
> +    mc->max_cpus = 2;
> +};

