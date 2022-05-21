Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB11752FA72
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 11:49:36 +0200 (CEST)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsLjr-00083J-Ep
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 05:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLgl-00071Z-9Q; Sat, 21 May 2022 05:46:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLgi-0005oB-9R; Sat, 21 May 2022 05:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bh0tkrkqsKYE1DcAzZBNrjFgsboxPrvi+4JUPNCHlck=; b=Yvx+Hvp/ARVUp7/XYI2AE6R5fz
 Q6fBHFvurjtG6DfzsVJoN17f/rJiixcJ1dEYClolGAjW7PwvlNwvC4FGXmUd59Xf99oKuV58orfRK
 T389jMWfj1KRoGDpGLWmDxpV821UXBRzJGDnKlRewIMK/tbiR0dzGKJQb/6CBPrucehEtkQrRfKLJ
 sXaogSyK3E1ltucBQMNevTNttZQctPU+bRhT0w1/jzC/0DRehd3pLoeKP+7cxh6ZdWjk32P7LCwqO
 ch4yJIeF3+NkAX2nWfZjkzBjY2H1hwTmiClIRwtq2e/vYWDlzSZjeLJmBBzl1SSG5BCc5PQRexAFN
 LbXboaN7jDnW2v90pGW9fmEgE+4SoAUQ0lnJ8DM0MW5sTvpIHBHzO2XekbnKd67pMIxbQhbeZ9P1X
 Oo3ETbwA0TXkwZK6fpXjW6c5NyDBjyppVGGWFPSUgY4n53u5J15V3lQvzW7aMtLGbsStG2CPwjw06
 bjSrFXOgaK19ZPlhO2fCPWBhLE8xV3SYQ8+oH2n80OMTQj6+wSwkFKgXyiEtwK47zs9IMtKrYwxRZ
 QuFa06Fv5A6DV39ORxnWYRhEKQbRdsPcqS7gtiRAXv2yhTut7sjECUfwr+zxzxVmOg66nJK//Iz3g
 9awY2bC25kv1QX+EAOJTPu6oM4luDOLEnl7g9GSqI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsLfd-000AiC-RW; Sat, 21 May 2022 10:45:17 +0100
Message-ID: <2343c1fd-e3ee-9360-5e47-11453d237022@ilande.co.uk>
Date: Sat, 21 May 2022 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220520180109.8224-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 01/10] hw: Reuse TYPE_I8042 define
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2022 19:01, Bernhard Beschow wrote:

> TYPE_I8042 is exported, so reuse it for consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/i386/pc.c       | 4 ++--
>   hw/sparc64/sun4u.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7c39c91335..c914ac0154 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1088,7 +1088,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>           return;
>       }
>   
> -    i8042 = isa_create_simple(isa_bus, "i8042");
> +    i8042 = isa_create_simple(isa_bus, TYPE_I8042);
>       if (!no_vmport) {
>           isa_create_simple(isa_bus, TYPE_VMPORT);
>           vmmouse = isa_try_new("vmmouse");
> @@ -1096,7 +1096,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>           vmmouse = NULL;
>       }
>       if (vmmouse) {
> -        object_property_set_link(OBJECT(vmmouse), "i8042", OBJECT(i8042),
> +        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i8042),
>                                    &error_abort);
>           isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
>       }
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index d1bc77d27e..0e27715ac4 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -334,7 +334,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
>       parallel_hds_isa_init(s->isa_bus, MAX_PARALLEL_PORTS);
>   
>       /* Keyboard */
> -    isa_create_simple(s->isa_bus, "i8042");
> +    isa_create_simple(s->isa_bus, TYPE_I8042);
>   
>       /* Floppy */
>       for (i = 0; i < MAX_FD; i++) {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

