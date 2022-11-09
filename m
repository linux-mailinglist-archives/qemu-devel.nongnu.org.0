Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC6D622C8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oslFr-0000KL-Os; Wed, 09 Nov 2022 08:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oslF4-00007L-Ci; Wed, 09 Nov 2022 08:35:49 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oslF2-0007SO-88; Wed, 09 Nov 2022 08:35:46 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-13be3ef361dso19587673fac.12; 
 Wed, 09 Nov 2022 05:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CDUkBjm5qLUfh/1nDfKAZt2YxSckXdkJy0Ni8Pf9A8w=;
 b=Rvsv79m8DKEFh3pCpR8m53+QhVkebHgQ64kYJgxcubYzb+k/1l8/HHBpWAM4hhL29s
 zMuYaIaW0Jha51YVoaeOFeB3aIFFkQNbZ77dYMUc3A2WdLCw1rKUmL9zKpsVGXr3K4iH
 69tKterqc0t/JtT8/gI33ktjNf5el1AWBtQkjICLbMXf+EuLN5EnyOo5bHrA67j5QDBf
 yop1nQAknQqVFVr5zKSg9puV8p0Bnhee/YKGx49vkmBEiWQwyCUa/UDba9IeFp7I2wjI
 pSbCTT7yYZS+jwUFpgGJeE+8B64uxofU51o6gc6CoGk63simxUNio8tMklY+EL9X03Ej
 maDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CDUkBjm5qLUfh/1nDfKAZt2YxSckXdkJy0Ni8Pf9A8w=;
 b=enR6c8oQGVB+alJ/xhMqkSb0q6D6SKkwx0Y/WLElXqFUOGZ2WobDyBMf78Zbiqrj/m
 TdY1HGN+/lbxIFp2bZRU/Deyt0TEvLfRSrCMTpa0XjJ1d524pSSjM2ETkUdiBKJaNio/
 naoceVAzfrWNfAXQz8f5UwAyZ4VWkj4At3MWTk4V6UtiNysYX6iZtEdfp08psmfrL80c
 8J5O9V6PrNonihik4H/rRrAIP9UqIXvEb2oUTImx0NSh3GTlUHya7qraQCtBri4XE1aF
 tQc+xri5HIZrSHVMgrCKdaHTQvZFQRfkP8mseNQT/IvdLfiP6My7y96PfZsiIggQKHHa
 yD9w==
X-Gm-Message-State: ACrzQf138BoHmM4eVrh/0twoOkzKD8IKMGKf5BTnLyHzBeHl1/I/mtYP
 1OaS4b2JvgOZrcxMKlfehG8=
X-Google-Smtp-Source: AMsMyM5DlE0eitOnSlX/V2mKf7NWKQHV77ehD0lj7d3rBpy52EOUJ3OFC4gFwfbhltN9SRPH0iDuqQ==
X-Received: by 2002:a05:6870:fb86:b0:13a:dffa:e4ae with SMTP id
 kv6-20020a056870fb8600b0013adffae4aemr46668669oab.245.1668000942329; 
 Wed, 09 Nov 2022 05:35:42 -0800 (PST)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 m19-20020aca1e13000000b0035aa55cd217sm1467272oic.52.2022.11.09.05.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 05:35:41 -0800 (PST)
Message-ID: <235a7fb2-dab1-a230-212d-398bffa94b1a@gmail.com>
Date: Wed, 9 Nov 2022 10:35:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of
 pnv-phb-root-port fails
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20221109122210.115667-1-thuth@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221109122210.115667-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 11/9/22 09:22, Thomas Huth wrote:
> Currently QEMU terminates if you try to hotplug pnv-phb-root-port in
> an environment where it is not supported, e.g. if doing this:
> 
>   echo "device_add pnv-phb-root-port" | \
>   ./qemu-system-ppc64 -monitor stdio -M powernv9
> 
> To avoid this problem, the pnv_phb_root_port_realize() function should
> not use error_fatal when trying to set the properties which might not
> be available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Ops, my bad. Thanks for fixing it up.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued in gitlab.com/danielhb/qemu/tree/ppc-next after adding the
"Fixes" tag Cedric mentioned. Thanks,


Daniel

>   hw/pci-host/pnv_phb.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 7b11f1e8dd..0b26b43736 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -241,8 +241,16 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>        * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>        * root port.
>        */
> -    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
> -    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
> +    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    index = object_property_get_int(OBJECT(bus), "phb-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>   
>       /* Set unique chassis/slot values for the root port */
>       qdev_prop_set_uint8(dev, "chassis", chip_id);

