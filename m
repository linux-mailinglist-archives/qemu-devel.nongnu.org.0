Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203B667AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:37:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0ZM-00027J-6h; Thu, 12 Jan 2023 11:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0ZF-00026a-0h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:36:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pG0Z9-000843-5X
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:36:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso15569471wmq.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UQMGV1Oconl9D0ufzWB1LMQaCXUL7hRi1Tou0NPDgi4=;
 b=h7VPJ3kUPQ323A0HeT3CkMb84/fZ2QklbHAxwKbv8A1P06KdG3JGxXpQ2Wgx2eEaxZ
 QmGBavrrLlcMogVHgodEMyLZQkm3f7yktLCefOAC3pldJniIL7mne87CaL7JOa7W1NvZ
 uFWLtFu2DyhHsYzXnBYVQwUwrsvNcjEkCTOYFMkJbjis2BOKrlVLN1ol+fW59QxbQodU
 iAP6wP2Wc/Xny5Nu9pgx3bVESKiQUDctVw1L/x1eztiymk5aA0mZbrNSVlyTlcyym7Ne
 IWZUEBXvXZ0/livZU5Dugj0JOe5Iw4tV9pqocB93e3HvKjcjqnCp+Qky5JTBp4eqiSDf
 eI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UQMGV1Oconl9D0ufzWB1LMQaCXUL7hRi1Tou0NPDgi4=;
 b=LZ88yevJ5/Htf3Ciz4zKTL8t8mjmZJTBE+2CGuQJEhRti1+o02O1o+UX0/lrQGdzQf
 6fKD6RMq3vLePjQ+bySFQoTHKYizzR7fcMO267vpUPrT3eqKab714XIqjK63zOoBOAZ0
 bdNlHqvH05FCJETXdCoIkb6LITgsTEM+IZjTWCGgU/b3WE/xY6xugP5iQ7vcG0LEDfFD
 Ct4aG9PaVkls3r18aeyFTyOxeC4FijRZWUydatx1KpERZVNNQ7uQCdK83TJM/uIguAHT
 I52TBEzvTzbaASY9QYYpd33UWuX1mC52yc7OTB3gBoeiMD3D+HgK1dAxcRv3ne6+TTjt
 Lufg==
X-Gm-Message-State: AFqh2kqZVJbV+zhnCU2LKsRMLb+8B8W+0NdzBUP4PVXoMRXndWLBE6Hx
 A4vU0+GavMSuNF2MZscs1MRRZQ==
X-Google-Smtp-Source: AMrXdXtkUnpJCNXKnTGNvt7QTnGQ6faZ65FojpoJ5/ZJQgochoNA7gJ6+DpXTH1NUxyCUPXfrKxNPA==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr56105213wms.36.1673541393512; 
 Thu, 12 Jan 2023 08:36:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b003d9fba3c7a4sm9131710wmg.16.2023.01.12.08.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 08:36:33 -0800 (PST)
Message-ID: <09d67427-a75b-525d-7744-781287ea4fb3@linaro.org>
Date: Thu, 12 Jan 2023 17:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-29-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
> their implementations can be merged into one file for further
> consolidation.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-37-shentey@gmail.com>
> ---
>   hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
>   hw/isa/piix4.c             | 285 -------------------------------------
>   MAINTAINERS                |   6 +-
>   hw/i386/Kconfig            |   2 +-
>   hw/isa/Kconfig             |  12 +-
>   hw/isa/meson.build         |   3 +-
>   hw/mips/Kconfig            |   2 +-
>   7 files changed, 165 insertions(+), 303 deletions(-)
>   rename hw/isa/{piix3.c => piix.c} (75%)
>   delete mode 100644 hw/isa/piix4.c


> @@ -489,11 +534,124 @@ static const TypeInfo piix3_xen_info = {
>       .class_init    = piix3_xen_class_init,
>   };
>   
> +static void piix4_realize(PCIDevice *dev, Error **errp)
> +{

> +    /* initialize pit */
> +    i8254_pit_init(isa_bus, 0x40, 0, NULL);
Pre-existing, why there is no equivalent PIT creation in the
PIIX3 variant? Due to in-kernel PIT in KVM?

