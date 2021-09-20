Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A8411EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:33:40 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNAg-00031A-FD
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSN8F-0001Np-ET
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:07 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSN8D-000115-Kn
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:07 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MV6G0-1mLBaL0mAw-00S4vs; Mon, 20 Sep 2021 19:31:03 +0200
Subject: Re: [PATCH v4 03/20] nubus-device: add device slot parameter
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <67be7ef6-ee01-bdb1-715f-48ff5a51133b@vivier.eu>
Date: Mon, 20 Sep 2021 19:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:koH8qEwW81OXL0K+l9XJShwGmQaU8r1ryHiRPqR7vDS8O+10ZTx
 zCOgjEB6FqvLECBzVn9oqwCq5LdpJRZuVIu1tFKO8kwYczK+bVVdeLaGp+weug+ptCuTw0R
 8OYX0SH0IVUe3PgZuVd24+0rhsoSZzQSqJBcnhHzkKhWjTn8w9Mk+HJkw+WVEmSYzRsBUsC
 roEdtVpdh8gEmcRBr+QCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k0PEP7dUvfc=:eqriI7tYNRBxIw44cMzwiZ
 qP7nGqrAaVe7Fv65K07UTV8xPlqKGyDfoaYU77/aWa6Gc2jXjjbWbBkHtpOHl91YX7YyjGWsP
 x24HjRf4kfMD9iVQJIbqrgVWYHzeUaSf4eZcPd1qNp018PXPE/a0Yg2wi3IEeo4kNavUqx+C0
 lvXd76QxR7JYslyelTCUj9OpTnsZxHHb9iobpBeD7FoIiofoSxOUkYaVG9jlUYaE79b3FUkMs
 UxTzFBXKuVLbcGpC78n60ipmqZyNs0a0Yx/dx9BVUzSPJCSv2I9UW0NVewZtNpt1axl3EZQCo
 9FjbI/Wx9f3pxUNTOFac7MGg55tirnOUlnmSkhEPhaIACcwlvYhTz47uSqXEyP9sGHAvQw9hs
 PMpF9NKgUeVLpIEIk9J8ZLwHcClQO3zpj6kDdA76XbApnVSrQUtSbygq/U9urr09jDawkGxHj
 izTty3HMeNjFdxsIWvbnO7doXl5OFedUo9UZDhEvJspKgPfpwAcYgdiWUYFAIRtMOMW5KTrzJ
 TbVuUGu4ot2scV7fsWk/NcKTYwRHPIPzbKskDc8YXrRKrq5fMqCggmtN02SoQ8uQllrUYcFGd
 HHnc5YGL7VlJOsaB0HexHSmlXpOeL8Ig8K24IaJEeYRn0FDf9jGKF6oqm+N5qKRUbNMhr3IkN
 jq5eZYr5W2dH21dBR5KJtE0/jEnjzXIJMWFKFheIpojaMc0Ao3HT3qngqqXZfDWLT3N1ft52F
 68s+1R+PcDtRjvF5hDuKoA/I0BVGnTHYssxR9w==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> This prepares for allowing Nubus devices to be placed in a specific slot instead
> of always being auto-allocated by the bus itself.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 6 ++++++
>  include/hw/nubus/nubus.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 36203848e5..c1832f73da 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -191,12 +191,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      nubus_register_format_block(nd);
>  }
>  
> +static Property nubus_device_properties[] = {
> +    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void nubus_device_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>  
>      dc->realize = nubus_device_realize;
>      dc->bus_type = TYPE_NUBUS_BUS;
> +    device_class_set_props(dc, nubus_device_properties);
>  }
>  
>  static const TypeInfo nubus_device_type_info = {
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 89b0976aaa..357f621d15 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -42,7 +42,7 @@ struct NubusBus {
>  struct NubusDevice {
>      DeviceState qdev;
>  
> -    int slot;
> +    int32_t slot;
>      MemoryRegion super_slot_mem;
>      MemoryRegion slot_mem;
>  
> 

I think this patch should be merged with the following one because slot is simply ignored for the
moment as it is overwritten in nubus_device_realize().

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

