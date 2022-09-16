Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2985BAF85
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:42:25 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCXw-0007FR-0p
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCQ3-0006r1-6B; Fri, 16 Sep 2022 10:34:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCQ0-0003Lq-Qe; Fri, 16 Sep 2022 10:34:14 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w2so11155201pfb.0;
 Fri, 16 Sep 2022 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=oGBpfJ//S3v080r4MUvIgQvBv9ugCmLNf50j8ZMU5ZU=;
 b=LpFWZgahJYKUI9VN0wci87jR4mZECSYgNcKqipESQpwAX4p3bgvJtw1Lt/SLllrtA2
 zowczMTNPDlr09PSC86PIsEP+mtQz9Xih0dr3XndwrpTz0Ez7hgM3ppVFlxE4K65Fgdh
 J5v5g9Dx6spUxRHzs+nURB9H3PWNqXSMFmHOmbrBQg5FzjzNQAqYIY9SjVvHbPsK68ui
 OZ416GDtiWL1ut+u2fS9NI8jJXCTXFnD2UufIE1t97S11GmXGpxVnhk4b2i2hvEGKpnF
 Z2sa4cYtEvEYsG6idI4HIhlfNHbbCZZJe16NNGe8UWcDFX7m3+Gsk2sH0uywsb0ubtf2
 NzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=oGBpfJ//S3v080r4MUvIgQvBv9ugCmLNf50j8ZMU5ZU=;
 b=hiXLsSdaATkzFaNGxxNT38VR0sR6duBkYWJ4/oMX29vwZLMsWLppZz1YMy6fg8/H24
 rWWuBoQna8uL88USdk7/vlOJzOcLWw74HLajGIs+7tC4WiQfYHRxuN8Bm/dIl24JQnXM
 u/YKpCYo85lDoZiGdtmVN4jl013usademDlj/+5aEqTVfV29GNaLzff0W4EgwPhVdpMx
 Czav39C0I69tjQFDYrkQaAKQhVqEcpe/iTsAhNTKPl+eQSnF6uyfetspKISFVu2VlfDG
 rJyBYLNXhLfZObXxLsluUqP4wFcOeadPBsmQ446OeOAFYnxtFJB7eQ8rI0sn+qRW3uXm
 WtEA==
X-Gm-Message-State: ACrzQf0MpWGwT5/TK+V+2ODDzk1T2tBn+lZrSY9pBunZbcgmuXuFhnux
 bLW7t5KcA8e40ZOIcu+anF0=
X-Google-Smtp-Source: AMsMyM5aeuQ6bceOrBzzYWKlpEbv4C4tKrz2R4YHXK4I7uld4nnnOwBCpmumhlmeSMGQX2WB3momhg==
X-Received: by 2002:a05:6a00:1a8f:b0:548:8ce8:db73 with SMTP id
 e15-20020a056a001a8f00b005488ce8db73mr5774879pfv.10.1663338850330; 
 Fri, 16 Sep 2022 07:34:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a63a51a000000b0041c49af8156sm13674511pgf.6.2022.09.16.07.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:34:09 -0700 (PDT)
Message-ID: <112288f3-78b3-32bf-3c7a-7ac310b7a11d@amsat.org>
Date: Fri, 16 Sep 2022 16:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 13/13] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <20220901114127.53914-14-shentey@gmail.com>
In-Reply-To: <20220901114127.53914-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 13:41, Bernhard Beschow wrote:
> According to good QOM practice, an object should only deal with objects
> of its own sub tree. Having devices create an alias on the machine
> object doesn't respect this good practice. To resolve this, create the
> alias in the machine's code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/vt82c686.c   | 2 --
>   hw/mips/fuloong2e.c | 4 ++++
>   hw/ppc/pegasos2.c   | 4 ++++
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 48cd4d0036..3f9bd0c04d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> -    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
> -                              "date");
>       isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>   
>       for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 3c46215616..b478483706 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -295,6 +295,10 @@ static void mips_fuloong2e_init(MachineState *machine)
>       pci_dev = pci_create_simple_multifunction(pci_bus,
>                                                 PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
>                                                 true, TYPE_VT82C686B_ISA);
> +    object_property_add_alias(OBJECT(machine), "rtc-time",
> +                              object_resolve_path_component(OBJECT(pci_dev),
> +                                                            "rtc"),
> +                              "date");

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



