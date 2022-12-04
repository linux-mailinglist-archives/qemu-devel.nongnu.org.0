Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CC641FEE
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 22:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1wnx-0008Bo-Ru; Sun, 04 Dec 2022 16:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wno-00086G-CU
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:45:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wnl-0001lM-47
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:45:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u12so15047737wrr.11
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 13:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I0Rj4pziDaXTi0uNywtt0BHRmKh4MWFYIMTD5pV2UEw=;
 b=r6vsir1VAs7j3WVAKRgputGrZ9cEgpUzjQPEAn9B3SPupmD3hEcwUqGV4GuuRfRaeC
 XXJLKJvlXUGN88SJMdcZ59y4tbeDJ4OORIQW43DLauNWu09v78205lS2WLwOc2fPuI/C
 oo4XSAvXlUwODOyN1pJr9+PFo/mrqdKgPSaD56IGWzu/9QbdpanzaVOjFC030GffOKpC
 Iy1hqH06GtWXnzrXpmR+NOW1Adi8onybcgwU/wt+UBR7U4Vkc/LVQ6mrkB2F1y851k8T
 rmPRoobpmR94IGfoAnGQqasHVS6hnnhUYcUtBYg5NsyIw4ioByKSHKrC/XueBYELw6dr
 oxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I0Rj4pziDaXTi0uNywtt0BHRmKh4MWFYIMTD5pV2UEw=;
 b=m28mwUpzqecWfKbYeyA8KJrv423alhfLfDEQsf1swCZmsjFtkddOo1AvD7WeJOCKE4
 OzRyMmd0Bl/1usbcA3lTBumiG2WPY3zud1WarWcgjNzUndt8ZAX3Q0H2HwQTBB0OfzMi
 /tjZSiW/ohRuMSfxS0l0IQdyxkWLHy8mqf9/7vP+W5j2x6mWJRu6WANZryfSiC7KfDWl
 LwxpoRBHaJ25zRhsf+iivJjaGHzfTpNFHBjEs1GMgEvSGHL2ax8tl9HZdWhpkLOhj3cD
 VSe9s2j/G+CLaa0xEdXBst3Tj1HzsMcoFjFacZ56NUTnodSfxEcInc27XciQSYQ8Yti/
 vTxA==
X-Gm-Message-State: ANoB5plz7PBWKS9Xwk7MD367dAxWGCEayZdKbM2zZl8AGMnpOp831GM1
 iUcSsG+WTwfuhml5nQg7+Eifkw==
X-Google-Smtp-Source: AA0mqf5M3Ah7leRgmIgiD+O8SIAkypDM9a5VlsMEUGf4VkptZf4IWgEOtlNRMa9jSPaYMKVNlXEj6w==
X-Received: by 2002:a5d:4d4e:0:b0:242:c59:b979 with SMTP id
 a14-20020a5d4d4e000000b002420c59b979mr24280013wru.707.1670190328524; 
 Sun, 04 Dec 2022 13:45:28 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm25075984wmo.0.2022.12.04.13.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 13:45:28 -0800 (PST)
Message-ID: <184a1a85-0dee-7b7d-6b06-5e2b56d5f0d5@linaro.org>
Date: Sun, 4 Dec 2022 22:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 06/32] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221204190553.3274-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221204190553.3274-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 4/12/22 20:05, Bernhard Beschow wrote:
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Message-Id: <20221022150508.26830-10-shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c |  3 ++-
>   hw/i386/pc_q35.c  | 13 +++++++------
>   hw/isa/piix4.c    |  2 +-
>   hw/usb/hcd-uhci.c | 16 ++++++++--------
>   hw/usb/hcd-uhci.h |  4 ++++
>   5 files changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


