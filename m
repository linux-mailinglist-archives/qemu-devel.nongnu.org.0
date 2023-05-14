Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41CF701D47
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 14:28:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyAoP-0001K8-FF; Sun, 14 May 2023 08:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAoN-0001JL-JF; Sun, 14 May 2023 08:26:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAoL-0002kx-UO; Sun, 14 May 2023 08:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p03hJuGoM7wf368ES+rV1ZI45MHe9pjb6uSaHTVKOCI=; b=hv6uJZbdof+FTf6BLU0PD7FR75
 N9h5kjvgOdVdziJSZkyGFUvT9uZkjIDRg536YmovmVvoU9K78vzki1gJybe8j7W1Ji4cwdIvmnngS
 W6kJFRFxyqrQtk3KR7DxfXhwDtRTKVZIF1fjcxVhUz9gy1vuuekFIemjentTucMwCWVBDPrKC/+Sn
 DNAY2ZemyCQHYchKWeWqW6lRHQ2Fsaszdqwlo7IsYHblzNX7P3AXQKb74TocaXhIjuAgHNLzdjxNb
 gEE9Q4cAaRKb7pyyFgF3TLDuGDlp7WlOIpt5CwJu/HgQWnh8ON0gANm1Xjkt2cin/mIeKcCnmy6CD
 /7ab0gTPmOuT05ToV0qn+YJHWgLFdCFwCBe9QDKc0FwvcOfq65aHtpMuu38p+1pbp0SPaKutW96Mh
 HjcqRaYQM0jWsXfbn99O24enplCZlsdaa5uz7Ig4kiWUIWd9Ke07j8Ty/3orNnLKHjkkrYN8HJIst
 6U2BG9/ri14f8bujXo5n0y5QA6dhGbU0Jb/Ihj2oHrOFfhiQiw53RtCWx1v2TxyNAGR0tNPBYBPNH
 gzDSRvycGUBKgJLIjJil9266tCpY+XKEphNintvDXnuPNwCe73cMUVjTvgR3uMcZiPF6qE1OhaF7S
 ZxvDmaggqOZ+HEetgKp6NOsPia//ocsNXB7KYumgA=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAn7-00037v-IL; Sun, 14 May 2023 13:25:37 +0100
Message-ID: <a8719d71-0343-e2a2-3e7a-d48eef40c49f@ilande.co.uk>
Date: Sun, 14 May 2023 13:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-2-shentey@gmail.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230513100906.46672-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/4] hw/timer/i8254_common: Share "iobase" property via
 base class
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/05/2023 11:09, Bernhard Beschow wrote:

> Both TYPE_KVM_I8254 and TYPE_I8254 have their own but same implementation of
> the "iobase" property. The storage for the property already resides in
> PITCommonState, so also move the property definition there.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/kvm/i8254.c     | 1 -
>   hw/timer/i8254.c        | 6 ------
>   hw/timer/i8254_common.c | 6 ++++++
>   3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
> index 191a26fa57..6a7383d877 100644
> --- a/hw/i386/kvm/i8254.c
> +++ b/hw/i386/kvm/i8254.c
> @@ -301,7 +301,6 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
>   }
>   
>   static Property kvm_pit_properties[] = {
> -    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
>       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", KVMPITState,
>                                  lost_tick_policy, LOST_TICK_POLICY_DELAY),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> index c8388ea432..c235496fc9 100644
> --- a/hw/timer/i8254.c
> +++ b/hw/timer/i8254.c
> @@ -350,11 +350,6 @@ static void pit_realizefn(DeviceState *dev, Error **errp)
>       pc->parent_realize(dev, errp);
>   }
>   
> -static Property pit_properties[] = {
> -    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>   static void pit_class_initfn(ObjectClass *klass, void *data)
>   {
>       PITClass *pc = PIT_CLASS(klass);
> @@ -366,7 +361,6 @@ static void pit_class_initfn(ObjectClass *klass, void *data)
>       k->get_channel_info = pit_get_channel_info_common;
>       k->post_load = pit_post_load;
>       dc->reset = pit_reset;
> -    device_class_set_props(dc, pit_properties);
>   }
>   
>   static const TypeInfo pit_info = {
> diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
> index 050875b497..e4093e2904 100644
> --- a/hw/timer/i8254_common.c
> +++ b/hw/timer/i8254_common.c
> @@ -240,6 +240,11 @@ static const VMStateDescription vmstate_pit_common = {
>       }
>   };
>   
> +static Property pit_common_properties[] = {
> +    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void pit_common_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -252,6 +257,7 @@ static void pit_common_class_init(ObjectClass *klass, void *data)
>        * done by board code.
>        */
>       dc->user_creatable = false;
> +    device_class_set_props(dc, pit_common_properties);
>   }
>   
>   static const TypeInfo pit_common_type = {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


