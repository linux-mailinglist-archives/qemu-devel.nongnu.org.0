Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DC6EF4AD
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:50:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prebG-00088T-NR; Wed, 26 Apr 2023 08:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prebE-000882-Ra; Wed, 26 Apr 2023 08:50:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prebD-0003T4-DO; Wed, 26 Apr 2023 08:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Ab4Mhnd26kazHuwxFXKphw0Z7TjOvzmKh5IYqMuL6Y=; b=P4wh1W/uJrZ+WiHDoaSj8mVNaL
 35WKBfVGQRN/4bhBjjfsnCpk/9iewxvyCcM2B+C6BTe9aVYBVkE7fDo8nMLERez4bbtcg74VOKsaa
 CwXzB5x35ocLLMxx0KS/5zv5bUcpyFnqW5ik9udAHftO2QeBcAhKF8RKQ+U2Y7bjk5GAj8ZZzjzX5
 qT77sDm6l1nHURrS/V63sRde/uQ3IHVh0hNgeNVjqc0g/oghjsp1hj3FsmYnvII5yjPH8NgcyvgCh
 KG6V4kXyDQT7nQ1DsSV/DLTOE02/Svn45QJEygflG69vXIXo4Y9VSLHe2Hx1kG5irFDxWP+IpMlaa
 jtNlfudJCDC74pg8yGzDhIkyqC02lC+BgIlWBxWl5ALdr8Jg1w+1GitqqRE8Ib2BFMIbWPLbcBVHy
 1MWs5pBw4ZbGeeu/i5Q0EluzII9Jm9QYHacBm65k6Io//dkgVkcx+2YcPg8C41Uw7BtV0ndHFRrJO
 j1hpeL6hws5jUkcdfTTqZwYuzQFdXoug2ncJCLMM5q9Xx8l2soaWQLRChGzu1jbLfkgYRP71XlnjC
 d+myh7WEHxiubVep0Ws0wnEdbLuOZBYmsL4j0M+B9tfCJ1DaZG3A3BREQmNaDglCv84BBjxF/tWkM
 9cw1hDR/8F0ILn9yLFMdUdOXGiBx53SHFfBVCEIn8=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preaD-0002T7-02; Wed, 26 Apr 2023 13:49:20 +0100
Message-ID: <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
Date: Wed, 26 Apr 2023 13:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-4-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 03/18] hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to
 ISA bus IRQs 14/15
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

> Since pc_init1() has access to the ISABus*, retrieve the
> ISA IRQs with isa_bus_get_irq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/pc_piix.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 126b6c11df..1e90b9ff0d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
>       if (pcmc->pci_enabled) {
>           PCIDevice *dev;
>   
> -        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
> +        dev = pci_new_multifunction(piix3_devfn + 1, false, TYPE_PIIX3_IDE);
> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
> +                                    isa_bus_get_irq(isa_bus, 14));
> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
> +                                    isa_bus_get_irq(isa_bus, 15));
> +        pci_realize_and_unref(dev, pci_bus, &error_fatal);
> +
>           pci_ide_create_devs(dev);
>           idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>           idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");

Another reason this probably isn't a good idea: you're having to call 
qdev_connect_gpio_*() before realizing the device :(


ATB,

Mark.

