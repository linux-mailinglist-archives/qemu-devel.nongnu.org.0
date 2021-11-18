Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8A455EF6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:08:39 +0100 (CET)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnj1i-0001dy-10
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mniys-00081j-PA; Thu, 18 Nov 2021 10:05:43 -0500
Received: from [2a00:1450:4864:20::32c] (port=41742
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mniyr-00010V-2e; Thu, 18 Nov 2021 10:05:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso5102214wmf.0; 
 Thu, 18 Nov 2021 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kgd34yjxXC7vC/w6tZaHhhpeT0Y60hmGe6KaXuEwySU=;
 b=WxDeHa+rhcqDgAcHcQSCtOvg8tWCbYdP4ulChLEXvAOlK3GQWatvSymk+T1skyK7qI
 bv+Y8xJTtUsPYG4kAVJ3SNoJntogWVLNINPQYWOv1Ey156R7Zpc9jbW2sXVQN/3edNbd
 pGD/CaBzL1xs9WsElgjNNbixoiWF35Xot4WqgU+20czf+d7l2EIDiPTwzzkPXwOvCFJN
 /IOzAOeQL3vSZloWnQuSJrsoT9l4mFdiR0Dl4yT6SXYzQmW2kcuWgV22YKrdzuuepnGU
 swU6+o5igMFdCJa0yYrjIaX98wfHE7Do5iLeYPuGIShqXAnZp2F5giwiL6bRyXOIVMWO
 FosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kgd34yjxXC7vC/w6tZaHhhpeT0Y60hmGe6KaXuEwySU=;
 b=H6XTuDdQFku4nSB9IocTDP/4Yxhmy5x2QikJERkoFSwc7TYEISE7eXXMOIMqICXHVh
 l9QeT31k6thd/hYRLl7x8d2+PZCTA3tEDeqofoYl+tPgaE3aLeanq4Kemp2w0jAO68sy
 PLclfE0uycqRxeoHQrnsEhIW5aENBO8qsyKdNKLy4BTVZZ8k69xWS+nf3wi+oR+KjNOA
 7g9RNYnEOgk+LjLBBxTFd9MV8ZArkI+cuf2r0V1q7RC7RcUyUcS/TH7q/LXOvr+WiCLQ
 ZgwM85WYe1Kr+Eyw12qu5Q5fH4MsKeaIXOLGNoCJhrekkaojT2Q5Rd5gaA0Q4WtqLXpL
 hs3Q==
X-Gm-Message-State: AOAM531bzP3pQftoa/QO9Mjx7lkPkFya7YqZEIKI9RjV5Iz2mFGDA3b1
 vWr1OUxfVAn+AC4bmkTqM2oHeBiYkAo=
X-Google-Smtp-Source: ABdhPJynb123xDwsh5Xp7VBoB0q4FLFy0JAa7IPi3pjPgO2nCPAEO6v3KMsjPNxl7p/FWe4F7Lh3uA==
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr11105665wmm.142.1637247938754; 
 Thu, 18 Nov 2021 07:05:38 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n13sm104412wrt.44.2021.11.18.07.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:05:37 -0800 (PST)
Message-ID: <1f74243a-dab2-10c8-b50a-5cafcc182686@amsat.org>
Date: Thu, 18 Nov 2021 16:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 1/2] hw/misc/bcm2835_property: Fix framebuffer
 with recent RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.084,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> The framebuffer driver fails to initialize with recent Raspberry Pi
> kernels, such as the ones shipped in the current RaspiOS images
> (with the out of tree bcm2708_fb.c driver)
> 
> The reason is that this driver uses a new firmware call to query the
> number of displays, and the fallback when this call fails is broken.
> 
> So implement the call and claim we have exactly one display
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  hw/misc/bcm2835_property.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

