Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794268F841
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqOt-0007Mu-Ke; Wed, 08 Feb 2023 14:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPqOq-0007Ma-Ua
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:46:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPqOp-0001O3-5x
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:46:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id ba1so13873380wrb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dh4AqtD+pyochqoEvD1uByYMMwdmwrKBD4sNIWKfRao=;
 b=aBxoD131HXoUQMjinorasMo07tQZELcOSWuPZ6jPTkDCpxi/1PUIrHgjWPd5dOjhAX
 MqrJP4RjDv6g5DrMkWZgKEUlXN7yWpgBV4G4/insD0IUJ018CKWs2hsXObgS8PcXzfay
 RfPzpKoOWKdx6WMJQ9uG9OtxL1V1tr1a+5bib6dPxXb0gXTLePn3lMaqas3B6+iyDGQ/
 wSMIvwH/D2jWZ4tdfJ9rWb1vWkdtRs2Ig/irmyeNQEPhaV4+z4LKCGKs/liyGybFOIKa
 nbfS0lqlAu4TX+NaEW4j7db2qJRN7psQlMKLy9kZSmZbsex93AcIGZ6EROT5Z1zeuZvX
 hBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dh4AqtD+pyochqoEvD1uByYMMwdmwrKBD4sNIWKfRao=;
 b=OGIhSVj1Me1bXHRDcm+2eIouf4szBc+6N80302SJ/JLKVCj5327ZJh3J4DzP8eZdgm
 DIxHHcKb0om8NHWNcoFSdih143dTtmvlaDNwwEykkD4UpESuMK7X2YA0+9ESqMs4bwYF
 wXF+xLCb13fthuhrncCIq9GC4bI3Jw3pTP0TeyIF9gyUxHwpo6XmWq1UzmIS9uZvmQ+M
 /IkQuP1NM+8ZFpT3O7noyzE4x4oNMTjDqIVfLyjn4QqVaSBDpSQRknAx8WddK04HFejq
 MBcEiLAMWVFOMKiyBmBCAWCYvvWuVC+fBrPWgpYu1R2+VryMJaG3mRSXO3uPDsaxkoR7
 w75w==
X-Gm-Message-State: AO0yUKWkEMUm6AYltHqztUdn49nyFaIAe2HE5EixSRvI/cJL7qDOaN1Q
 D4CsbbPVnfSIcIsk5DukL8EDwHOuRNxpHS+Y
X-Google-Smtp-Source: AK7set8petM8nw2Buy5DkjAs27cDTS8MI881qGZQD3WKOwEdQoCSzS0k1jHk89O0hJisOBpLzdQN+g==
X-Received: by 2002:a5d:65cf:0:b0:2c3:e5ee:dcfa with SMTP id
 e15-20020a5d65cf000000b002c3e5eedcfamr7994115wrw.28.1675885593553; 
 Wed, 08 Feb 2023 11:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adfef85000000b002c3e600d1a8sm8833714wro.95.2023.02.08.11.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:46:33 -0800 (PST)
Message-ID: <fab6b069-a04e-b6f8-2cd2-aca9ec81db0e@linaro.org>
Date: Wed, 8 Feb 2023 20:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-6-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208000743.79415-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 01:07, Philippe Mathieu-Daudé wrote:
> TYPE_PIIX3_IDE is a PCI function inheriting from QOM
> TYPE_PCI_DEVICE. To be able to call the ISA specific
> ide_init_ioport_isa(), we call this function passing
> a NULL ISADevice argument. Remove this hack by calling
> the recently added generic ide_init_ioport(), which
> doesn't expect any ISADevice.
> 
> Inspired-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ide/piix.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a587541bb2..1cd4389611 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
>           {0x1f0, 0x3f6, 14},
>           {0x170, 0x376, 15},
>       };
> -    int i, ret;
> +    int i;
>   
>       for (i = 0; i < 2; i++) {
>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> -        ret = ide_init_ioport_isa(&d->bus[i], NULL,
> -                                  port_info[i].iobase, port_info[i].iobase2);
> -        if (ret) {
> -            return ret;
> -        }
> +        ide_init_ioport(&d->bus[i], OBJECT(d),
> +                        pci_address_space_io(PCI_DEVICE(d)),
> +                        port_info[i].iobase, port_info[i].iobase2);
>           ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));

BTW this portio rework series is the first step. The second part will
take care of isa_get_irq(NULL).

