Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD873FBEE0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:14:29 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpXw-000849-MR
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpVf-0007Cr-Kb
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:12:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpVd-0006W2-Sw
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:12:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u16so24510021wrn.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QBvNfYMrFVV3sspNjf6e4pc/zJHwCFxkxpYcPBHoPCQ=;
 b=A/y66UuvUb/BXQpdMGijtJ8+1tfgwOO0Q56mETeiIqIrlECYlVTS78i85zRGh7y1gG
 Jv6aMOZzJrDeYSHEWteTMdWTqPgmNakZ9MtLViwSXHymaPkYF+L3uBBHCrD+zPezUpJ7
 +YSnaNqCTh4N21M7Flq80u4/YPBgWNneNCFnxjGfBTq0rWp/u/76TnkfafbupE0iFO0o
 YI7C4dTViA/l30xt8yM+KBqinwGTXJ7LiVT4MUmagYOFM4srRMN8YQpPz6l9aWa1OYkK
 scGfpCXU2BHDN52678sax2uQwZETjf+m+IinOJtj7c/rwtML3LF88fOt6GuoIRFykG6M
 Edzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBvNfYMrFVV3sspNjf6e4pc/zJHwCFxkxpYcPBHoPCQ=;
 b=ViIgj6nOc8sWWKL3qoo9+okGbt7lqq0dYt/bO+RVtJydIWVO3JFnrim76EvK5VP+Mz
 /jbedDlxMlyhifjDRFzl3Wmpk1hhYU4A7dfeF9YI11x5trokPfzDPRKSv6vp/XIhU62s
 pNy0GkTmISElUr5WHB0rKP0RZ5iOqYse2/o+1RMIsDyMCid28s/f21qJrq7S7fO0X0t6
 rUJ89cuXH4eL0iqsVU1uWYvpPC/vAEVzJX6mfDnmnYNwAteRUMOLk5RKvkLfPsdYTY/w
 ZkbIiFrh9hg3ZMPyUDK89Qbijp1Vy90ujc2MmE+s+j7K7AYiRpZz/r+TLUDaq4+yeOGZ
 hgjQ==
X-Gm-Message-State: AOAM530FNdq0LLVA0oqTfgAwE9SeHYGUSyORDK4YxhjK115VeBOoWarG
 vRjY0bk+xvp0pPyOZJGoGyw=
X-Google-Smtp-Source: ABdhPJyRCE3wqldmRqMJzKNhWa9NU1Ei/m13U/jqPxreNyebnX/qvJvZJ7+Jec4wzSwj39uRbrJtHw==
X-Received: by 2002:adf:d187:: with SMTP id v7mr16023442wrc.186.1630361523654; 
 Mon, 30 Aug 2021 15:12:03 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y1sm693859wmq.43.2021.08.30.15.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 15:12:02 -0700 (PDT)
Subject: Re: [PATCH 05/12] mac_via: move ADB variables to MOS6522Q800VIA1State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3c9d0e2-4c95-26b9-477b-972a17091cac@amsat.org>
Date: Tue, 31 Aug 2021 00:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 12:24 PM, Mark Cave-Ayland wrote:
> The ADB is accessed using clock and data pins on q800 VIA1 port B and so can be
> moved to MOS6522Q800VIA1State.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c            |   6 +-
>  hw/misc/mac_via.c         | 169 +++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  20 ++---
>  3 files changed, 96 insertions(+), 99 deletions(-)

> @@ -967,17 +962,10 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>      MacVIAState *m = MAC_VIA(dev);
>      MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
>      MOS6522State *ms;
> -    ADBBusState *adb_bus = &m->adb_bus;
> +    ADBBusState *adb_bus = &v1s->adb_bus;
>      struct tm tm;
>      int ret;
>  
> -    /* Init VIAs 1 and 2 */
> -    object_initialize_child(OBJECT(dev), "via1", &m->mos6522_via1,
> -                            TYPE_MOS6522_Q800_VIA1);
> -
> -    object_initialize_child(OBJECT(dev), "via2", &m->mos6522_via2,
> -                            TYPE_MOS6522_Q800_VIA2);
> -

Preferably moving object_initialize_child() from realize()
to init() in a previous patch (so this patch is only about ADB):

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


>      /* Pass through mos6522 output IRQs */
>      ms = MOS6522(&m->mos6522_via1);
>      object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
> @@ -1006,9 +994,9 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>      qemu_get_timedate(&tm, 0);
>      v1s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
>  
> -    adb_register_autopoll_callback(adb_bus, adb_via_poll, m);
> -    m->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
> -                                               VIA1_IRQ_ADB_READY_BIT);
> +    adb_register_autopoll_callback(adb_bus, adb_via_poll, v1s);
> +    v1s->adb_data_ready = qdev_get_gpio_in_named(dev, "via1-irq",
> +                                                 VIA1_IRQ_ADB_READY_BIT);
>  
>      if (v1s->blk) {
>          int64_t len = blk_getlength(v1s->blk);
> @@ -1049,9 +1037,12 @@ static void mac_via_init(Object *obj)
>                            &m->mos6522_via2, "via2", VIA_SIZE);
>      memory_region_add_subregion(&m->mmio, VIA_SIZE, &m->via2mem);
>  
> -    /* ADB */
> -    qbus_create_inplace((BusState *)&m->adb_bus, sizeof(m->adb_bus),
> -                        TYPE_ADB_BUS, DEVICE(obj), "adb.0");
> +    /* Init VIAs 1 and 2 */
> +    object_initialize_child(obj, "via1", &m->mos6522_via1,
> +                            TYPE_MOS6522_Q800_VIA1);
> +
> +    object_initialize_child(obj, "via2", &m->mos6522_via2,
> +                            TYPE_MOS6522_Q800_VIA2);
>  }

