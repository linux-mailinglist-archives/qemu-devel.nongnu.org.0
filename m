Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987BB6775DF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrhc-0004kb-JI; Mon, 23 Jan 2023 02:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrha-0004kC-0B
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:57:14 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrhY-00055n-Dv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:57:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so9970823wmb.0
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AfXD4vTovgSGpDyzIOIg4P0dJNGVqIx9/WnefyEzN3Y=;
 b=WhP9PTNuJPM2xLe+dUmx9EX/WFX1XfUC+ruBYb+a5YwyCgJBPWw8kn4sLBIBmuUsv/
 QSylx0UYrdJ06o5Pn1/oQ0TuzBU28t4Zf76ZHwYiHm02+AgOTMABRHq6PfFI65Ci4gwq
 gtWaa03FoesJmnozaXYkGJzwrfF5qSXT1j8lUZtlbWSpJh4dZgf+rXyyOzpAKZTjjbgZ
 LYYWifbksmsIZlf+WhU3MhHaUg2/4x3OWlJPcIbKpbfB5t19plsxRcznaxOHHvcDFMDW
 usaLp9YkMqxp4DBIEnk3eTajKDJJYxbVAKoJ3iUgj+Ss1Zekgx1gy3o9OReOzNXbPkPZ
 zszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AfXD4vTovgSGpDyzIOIg4P0dJNGVqIx9/WnefyEzN3Y=;
 b=smckMW3qSnCq0B+M+IBP4gYL6VvAGGqdysXNCuUIf/fsNVx1oOtay5BoewcyxgpS67
 Gw9C68vXmXSgRTH6pbM0yBdFSsovWR0VfirrTfsGxjiFqGas9BdYtOnbrYMzIa1N11uf
 OopfAJUTS0L9aYhq/Z5+c4rpiMU6Oy+YBtOSmFD4GvnCZPjL1wFa7iqHbFSfEJvVfFer
 aTCJqXygV4CTGTlz62Z/9RCRhMgvhul5GNxIZVey4ajbYnh9XFpkaO6GVZf+9A8G/5Br
 ObrW8dBYC6Rx8aec1RbfRNpmDQByhcvSfTRttuELu9ss7bR468992u9877XvDE5FgpKg
 m9oQ==
X-Gm-Message-State: AFqh2kpTJsh4E0kT4bugF+HdCEAOwSWtcCTUdXPJyrCmd3gexlJbQZWW
 NkiXjMWzdsc9+RsGwa25ItUULg==
X-Google-Smtp-Source: AMrXdXtupeo9mPoGrLyMpUhCgfuwKFsJ4AqGas23agZpu1PV9aekdf2bsAwEAmIPB58o1SFt6OPk9A==
X-Received: by 2002:a05:600c:2d0b:b0:3da:fcf0:a31d with SMTP id
 x11-20020a05600c2d0b00b003dafcf0a31dmr23060824wmf.22.1674460630780; 
 Sun, 22 Jan 2023 23:57:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fm17-20020a05600c0c1100b003db06224953sm11744754wmb.41.2023.01.22.23.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:57:10 -0800 (PST)
Message-ID: <c38c9c94-b629-0cdd-acd9-ac800ff9da8d@linaro.org>
Date: Mon, 23 Jan 2023 08:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/7] hw/acpi/{ich9,piix4}: Resolve redundant io_base
 address attributes
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230122170724.21868-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

Hi Bernhard,

On 22/1/23 18:07, Bernhard Beschow wrote:
> A MemoryRegion has an addr attribute which gets set to the same values
> as the redundant io_addr attributes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/acpi/ich9.h  |  1 -
>   include/hw/acpi/piix4.h |  2 --
>   hw/acpi/ich9.c          | 17 ++++++++---------
>   hw/acpi/piix4.c         | 11 ++++++-----
>   4 files changed, 14 insertions(+), 17 deletions(-)

> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 370b34eacf..2e9bc63fca 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -91,13 +91,14 @@ static void apm_ctrl_changed(uint32_t val, void *arg)
>   static void pm_io_space_update(PIIX4PMState *s)
>   {
>       PCIDevice *d = PCI_DEVICE(s);
> +    uint32_t io_base;
>   
> -    s->io_base = le32_to_cpu(*(uint32_t *)(d->config + 0x40));
> -    s->io_base &= 0xffc0;
> +    io_base = le32_to_cpu(*(uint32_t *)(d->config + 0x40));
> +    io_base &= 0xffc0;
>   
>       memory_region_transaction_begin();
>       memory_region_set_enabled(&s->io, d->config[0x80] & 1);
> -    memory_region_set_address(&s->io, s->io_base);
> +    memory_region_set_address(&s->io, io_base);

OK for this part.

>       memory_region_transaction_commit();
>   }
>   
> @@ -433,8 +434,8 @@ static void piix4_pm_add_properties(PIIX4PMState *s)
>                                     &s->ar.gpe.len, OBJ_PROP_FLAG_READ);
>       object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
>                                     &sci_int, OBJ_PROP_FLAG_READ);
> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> -                                  &s->io_base, OBJ_PROP_FLAG_READ);
> +    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> +                                   &s->io.addr, OBJ_PROP_FLAG_READ);

+Eduardo/Mark

We shouldn't do that IMO, because we access an internal field from
another QOM object.

We can however alias the MR property:

   object_property_add_alias(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
                             OBJECT(&s->io), "addr");

>   }

