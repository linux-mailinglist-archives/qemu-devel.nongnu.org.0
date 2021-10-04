Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF32A4207BA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:02:03 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJrG-0007Ga-OF
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJcx-0000we-LA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:47:15 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJcv-0002JB-PI
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:47:15 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7RHv-1msM3m19rB-017lHu; Mon, 04 Oct 2021 10:47:11 +0200
Subject: Re: [PATCH 01/12] macfb: handle errors that occur during realize
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6e268cde-a851-296c-75ee-36671209e9d2@vivier.eu>
Date: Mon, 4 Oct 2021 10:47:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UJzkqNA+v6ePPEUAOCSAbA5QBgmMCqPW6YX6ohYg4nwNElD9z6T
 6RSBaR8C9OOsgm6WlUdPvie86xRIblHLfzHJ4SfgtyJ3WXQMav6UsriD0IsFpLBmMXLnf5e
 +oJsCrUUsr6SdbeXMFTq8hBxJj8ijUiDjrxH181Xv8vmQuy2m5Ln+kePd6ZocdepOBHfaHE
 FBTCOWD6QgiuT6IMnnH8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:idmIxWYyc4c=:nvl+IKyjt4kDsinJNq508g
 o2g4R4FgTAiVoj8cTYLmHxOdMHuPJrf99nU9HD7ojCQ3PxqXVbxdmjiPBvaM476rfua6+IhQP
 1AYHklVjIfCv/3uPeGaCjVpnfMQRl3XUVgGKFiNPlE0Fbg0kDzvcbaQRXgd+yeWH4QWLX+8EX
 XpDLA+K4AGjw7wjTwG3cUdwtBSpomZ+w3+rDpJOJHvfKO+aiv4jLA4PTXsANB+B7WKzP9EECl
 jGCnrzg3qDfppFwoH2N2MWaT+Hz3sIf8EisG0eGfYKXUkM5pqwWAn+gUMxPyVGIpGmSYp4SXx
 +2Kcf3Itj/VJYHE9K4Otof9IHVgm5vh0JHvh4hfaBrHNYGTk2soRBpQESQtx//F9nj9pPhIx7
 cuYBy2B0awPPvX4q2Q73q6Yf2U+hja5Kg0+iKEiaRhPDA4d3/azyQZt8RoCICl5gwH7E4bxDG
 D5DZWuMyhAq+j1F7+w2mDhUKtJk1spx6GtXdYsR+Fyy+qiqdTES05tsTVUZqXK5FhkT4zbpl0
 uz5LR+cnPFGpSbRrq43KHQ+RV+R2NkxnxUx8hk303ujfbQdUznMU09ZJfnTsDwBk95MVMVXpV
 Lvco/9WAma8hq00S+1pYIohuQA159jvbAnqUL+5Ji7cdaVkF/YDFCaBhKNZgUyLOcBW5wkuvz
 mTdovo5T96KwXhXIFJuh7JE9YGCSdrvQ3jeHvDAtaxEKE2HGGL8gHWt6tTSM7qX5CpeQecOrM
 i/EYuigh74u5kctJmjM12U+rnHOGNFBm6572HQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 02/10/2021 à 12:59, Mark Cave-Ayland a écrit :
> Make sure any errors that occur within the macfb realize chain are detected
> and handled correctly to prevent crashes and to ensure that error messages are
> reported back to the user.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 76808b69cc..2b747a8de8 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -379,6 +379,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>      MacfbState *ms = &s->macfb;
>  
>      macfb_common_realize(dev, ms, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_ctrl);
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>  }
> @@ -391,8 +395,15 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>      MacfbState *ms = &s->macfb;
>  
>      ndc->parent_realize(dev, errp);
> +    if (*errp) {
> +        return;
> +    }
>  
>      macfb_common_realize(dev, ms, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>      memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
>  }
> 

Perhaps as suggested by Philippe you change macfb_common_realize() to return a value and an error?

Otherwise:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

