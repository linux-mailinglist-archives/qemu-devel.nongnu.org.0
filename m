Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D694D3708E2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 22:13:44 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvzj-0002Sx-Eq
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 16:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcvyF-0001vQ-If; Sat, 01 May 2021 16:12:11 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcvyC-0006HK-M5; Sat, 01 May 2021 16:12:10 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so1583755otf.12; 
 Sat, 01 May 2021 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wUTupG1ciOFu3wWEybiL9ryNjvgtT6aHKOAzGYFRyMw=;
 b=IP31ftSyRABTKjhWgAp/tRSg6Ci5mXQT3AGkvQ5NOaaYkVQ+fE7QAZVcT+6hfCcK79
 WRERFOAAxSwt/2nzM7udbl3bTR0q4v/+XMeKHk9z/c6xg/4jkKPFtWZBLZdBzvrN2uQq
 2xrNjxafZpaF5z21rkaKUjuDmOccEw7Zz1Fjd2lb42z/892gM3yoqx4byvfrCYMVIB9M
 WIbK+HT+tUryDSzv80ly6ib1UClN3ONVfiY+XZCrgtfK+hez5cfBoHZRfXYPH7CRkUU7
 4xRNyPIwxNcfgog4Br7JlX2xgm64V2IFl1T8Vmbihj33N+VgqyI75usoMgycdgfYrikL
 PVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wUTupG1ciOFu3wWEybiL9ryNjvgtT6aHKOAzGYFRyMw=;
 b=NJlxfHPsMLxxtMGwOKaU3MwxoD3OcZ8FsFJjn5L1cCgGChIMDbNR1UKbHl8p81CkKF
 gK2uDES/8hglR0HGvQqyfPGXolIzC2szDD0+lsoy1t54GpO7Q8cHVxtjP+Im1izLLu/M
 F13hqD4y4PCc4iwlX5N8NHLc8vEBWoO8uE7u4b0jGFgjgLC1NvGAwT3dekgiuWfSTg4B
 4UFkpi52MO99dsYH0fXQyKNu07wxxKk6S2sFuEwe9s3OQV6XM7V2909qHDWWb5QXVSjR
 foQQsmn4dEtNpqmVfTI6SV6aEpd4zfh2C1EKF4ur0NW9767E8jesBNwFaUlkhzTRbQG/
 +RmQ==
X-Gm-Message-State: AOAM531I6TjDLySBxZxK6Ljv8tARS0NcZsn0N11WrXvuVPdSAcoVkgHb
 veGkowuaHl03eUXB2x2+k5U=
X-Google-Smtp-Source: ABdhPJwONXFZ+Mwlfc9TD3iI8bzpCB/LtIpd9+Eig7O77Vv4w6Sul9HdeurkekD2j9EibrJI+mJm2Q==
X-Received: by 2002:a9d:a4e:: with SMTP id 72mr8716338otg.229.1619899926174;
 Sat, 01 May 2021 13:12:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i9sm1594595oog.17.2021.05.01.13.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 13:12:05 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Message-ID: <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
Date: Sat, 1 May 2021 13:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 9:28 PM, Bin Meng wrote:
> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>
>>>   Net:   Board Net Initialization Failed
>>>   No ethernet found.
>>>
>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>
>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>
>>>   Net:   using phy at 6
>>>   FEC [PRIME]
>>>   Error: FEC address not set.
>>>
>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>> which QEMU does not have any valid content filled in. However this
>>> does not prevent the Ethernet from working in QEMU. We just need to
>>> set up the MAC address later in the U-Boot command shell, by:
>>>
>>>   => setenv ethaddr 00:11:22:33:44:55
>>>
>>
>> With this patch in place, the standard Ethernet interface no longer works when
>> booting sabrelite Linux images directly (without u-boot) using the following
>> qemu command.
>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>         ...
>>
>> The Ethernet interface still instantiates, but packet transfer to the host
>> no longer works. Reverting this patch fixes the problem for me.
>>
>> Is there a qemu command line parameter that is now necessary to instantiate
>> the Ethernet interface when booting Linux ?
> 
> Enabling "guest_errors" shows that Linux kernel fec driver is trying
> to read PHY at address 0, which is not what we want.
> 
> [imx.fec.phy]imx_phy_read: Bad phy num 0
> 
> The device tree blob of the sabrelite does not contain a node for the
> ethernet phy specifying phy address, so I suspect Linux kernel driver
> is using default phy address 0 instead.
> 
> Could you please test on a real hardware to see what happens?
> 

The problem is that qemu returns 0 when the OS tries to read from a
non-existing PHY. Linux expects it to return 0xffff, and believes that
a PHY is there if 0 is returned. This helps:

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index f03450c028..3c90c38e26 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -285,7 +285,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
     if (phy != s->phy_num) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
                       TYPE_IMX_FEC, __func__, phy);
-        return 0;
+        return 0xffff;
     }

Note that this is not really a guest error; any OS can and likely
will scan the MII bus for connected phy chips.

Guenter

