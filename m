Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7506EF563
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prf3r-0006Nv-Ta; Wed, 26 Apr 2023 09:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf3V-0006JJ-QG; Wed, 26 Apr 2023 09:19:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf3S-0002So-TB; Wed, 26 Apr 2023 09:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NVKuL+5Kdhg+DvdFVdSD+witoXz7NjUJ6OWfzoxl82A=; b=KMUXKuEOf/AsoKP19y+nTsaOmW
 q+eA2iTY5JO9UuJais1ZBmHOQ3yQIHnPOCHa4SjBaKdHYbLPjEbLk1d02ASriRzPZNNcoEKJGDkXZ
 bxgfcPUhohDv7245Xa0iWWEt6GJNqJfSP/nilgOZzkhRRI6iQCh0WZ0gGXzjDe0k/Zkj65q2mHi8K
 6d6jvS94gUMPL9F9OJBh1ecK/WLs4hhNOIJVst3RjZcKOMsJS41pI2cRsOEURmKaAJwsHNehllgJo
 LS3+TyKwbI932cigV4KXCgDS6FsbLJ54SCLjll6gb1RRHDyD1X6YVxbOU+uhuyjcCRXCq/UxQUliK
 HjziOM0LtVZIB7CCvnAvtkmLnmSTNGODwq6oSEjcK7H6IddRmd1J+DUBraPmaFckARhSGfMNGAAz8
 SLc3OS1ntOPyDNd4LHUwNsJtSJtXxVz0JDNFDaiVRjCUgSRuG0cfh3P5XWhZQnNM4IuoHPrOBMhcC
 HZ5OFXW66h1b31EvHNsi6zpGEvrj9ENqfsvfTcYb7XX4BfWmUlZDSPq1d3v0l9IQHlaUXQ1SaTL2N
 42AKdkodkko660SgXEGmbaCvRj2OfAGOqFvKtVl6XVDPPncZZ4WMjYckCyYLvUdypaFY02Mp7oEzD
 4rwXKRhcUdbC/64kC/gGkJtRCF3LxZGVKB1lNSEMc=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prf2N-0002hZ-Tr; Wed, 26 Apr 2023 14:18:27 +0100
Message-ID: <afea1b17-203d-1e5f-ca11-4169b0561bd1@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-13-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 12/18] hw/isa: Reduce 'isabus' singleton scope to
 isa_bus_new()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> Previous commit ensured when entering isa_register_portio_list(),
> 'dev' is not NULL. Being a TYPE_ISA_DEVICE, the device must sit
> on a ISA bus. This means isa_bus_new() as already been called
> and 'isabus' can not be NULL.
> 
> Simplify by removing the 'isabus' NULL check in
> isa_register_portio_list(). 'isabus' is now only used in
> isa_bus_new(). Reduce its scope by only declaring it the
> function using it (this will allows us to create multiple
> ISA buses later).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 3036341d3b..8e3ca3785e 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -25,8 +25,6 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/isa/isa.h"
>   
> -static ISABus *isabus;
> -
>   static char *isabus_get_fw_dev_path(DeviceState *dev);
>   
>   static void isa_bus_class_init(ObjectClass *klass, void *data)
> @@ -52,6 +50,8 @@ static const TypeInfo isa_bus_info = {
>   ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
>                       MemoryRegion *address_space_io, Error **errp)
>   {
> +    static ISABus *isabus;
> +
>       if (isabus) {
>           error_setg(errp, "Can't create a second ISA bus");
>           return NULL;
> @@ -132,10 +132,6 @@ int isa_register_portio_list(ISADevice *dev,
>       assert(dev);
>       assert(piolist && !piolist->owner);
>   
> -    if (!isabus) {
> -        return -ENODEV;
> -    }
> -
>       /* START is how we should treat DEV, regardless of the actual
>          contents of the portio array.  This is how the old code
>          actually handled e.g. the FDC device.  */

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

