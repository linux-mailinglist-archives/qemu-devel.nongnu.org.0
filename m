Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2E412720
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:03:37 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPVo-0005Zw-9n
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPUF-0004A4-0t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:02:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPUD-0002Ul-9X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:01:58 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7hw4-1mxXJR1d5e-014hrj; Mon, 20 Sep 2021 22:01:55 +0200
Subject: Re: [PATCH v4 09/20] macfb: don't register declaration ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
Date: Mon, 20 Sep 2021 22:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bV6UkrGv+LMlcZAWpnNWewZWGINnh8xc82eUaTCIlM86xIKd3N7
 gEUNHkw8ojWPwu1JQS6VbgxbApaKTR5gglQkRJE7G9n3fub4DaZrUBTjYOQnibc4t3JA5H0
 F0u3D67VDgQ6es7WROMa5SkTBCwMhhRs352JdvD8r028twUz4q0Y0Kxfl8yaOg5RqV1eJ6r
 Qkv3DcUI2naOG5UJAQ+pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uB5D7oV5wKU=:rPmjd7Cu93s7mLCpek1zVW
 VuJKozUTDY9PwvnXeCwoVZIeq7REWFJVAs+g1+6l6mkr3unTDCI6RlKpjKaKfV+awkcgyhmTH
 QW1hWXtTaLZZ4qcIjNQfADrWrp3V2pv8qsQcdpj8H5tTgNdIz6FjruDp5WsPCXFvqy6NzA1tF
 jgjPiqM5FNyUjMT9ZGpOPBur/vLql1Osyl7fLpvQr1rrFR6iQxlny7FlJ8e3O8mE9bPj6ZnBE
 h35kf4NgVQjbZsX986ymCRtGoSi/DT68Vbuc4pMn2Z9zi6rWkv4OTt7O64grg3yT1JoCGbhi/
 cuEQxEOVHFoa617McKMZCPTTNFIKHMeVKN2gDRZFkF37IV++22bwE6OvKmegE97MBr3btqRzI
 mSpzNw8PXqgKp03JoQx+UCFFccNlxo04RNZJ/fEQuBci6zijqizlN2RiCIwuMl+iQdm70zqV2
 JB2IPrHmRudyFvRZcSjJiVv0u9Mv2IY/BUURDnc14ncgL8zyBw87dMOa+OaH6dspvZpZF9vCS
 YQOo0fkGnd7mzmNB4JWC5IngYYI6r9OSK3wIdTz70khP+AzDjgrGHARi6Gw6SDI/AXgmLhFE0
 avR4ASNJ+ZSYbz5gTX9bGfUj7WJ0PhtvgeosylcQEwcrNpVjru+Or8f/RFToYIbF+WpixjN/j
 jK2DvBdpYIjMiT/RjMiJwaIbXsu875eNpQ8bV8/VZyfPXmiNLBnJVvjCowGqqswfTASBFbvHD
 rNHBeoCb35zbEYw0lylJmWDKVJ2m2yqw0qm3Gg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> The macfb device is an on-board framebuffer and so is initialised by the
> system declaration ROM included within the MacOS toolbox ROM.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index d8183b9bbd..76808b69cc 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>  }
>  
> -const uint8_t macfb_rom[] = {
> -    255, 0, 0, 0,
> -};
> -
>  static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>  {
>      NubusDevice *nd = NUBUS_DEVICE(dev);
> @@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>      macfb_common_realize(dev, ms, errp);
>      memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>      memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
> -
> -    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
>  }
>  
>  static void macfb_sysbus_reset(DeviceState *d)
> 

Will macfb continue to work with "-kernel" and without providing any MacOS ROM?

Thanks,
Laurent

