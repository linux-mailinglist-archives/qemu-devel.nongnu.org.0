Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9164476CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:04:54 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmh3-0002pK-VD
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmfO-0001Ls-G3; Thu, 16 Dec 2021 04:03:10 -0500
Received: from [2a00:1450:4864:20::32c] (port=41633
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxmfK-0005f7-J0; Thu, 16 Dec 2021 04:03:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so352200wmb.0; 
 Thu, 16 Dec 2021 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+3v+zkwduL2NmJ+TcTU219ReVWr0YctHxqV7Y/mxXM=;
 b=jWlkMVq4so/KaaXi5uUz5NDXYuMdAUOXewqjmDIjzetdKJ4EV9Xl2FBM9Ek+5LSAd7
 ctXTkJmLOVK1jQ7KbDR0dVtDOH8iMy64MLRW9JykEBBD+Z/Ouo1Y7IlxOa6iBUPymiMZ
 zc/R0GmlXTuxeCv2bzN0lbDX3zfRWmPRfSmPnjvJ6OSIb7hGZPPxfkcsOB2H1+aCjZLA
 qDufInuvA/ZqWWitJXucXRPuLSf9Fiv8X85SPoUMpEh46VPCqZyC8uPiJu48dPmBXzun
 tV5PrX5uRG8/iYQgoh5oi535reHXBg1yvF4WIoDVRAg0CZHcsP2FOWc90oOwhLLgLUqD
 dVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+3v+zkwduL2NmJ+TcTU219ReVWr0YctHxqV7Y/mxXM=;
 b=fIHMkx1KVyLMXxeluOK1fV3uJEVdcedEuFWTRy7blbuZQD+xL4lfuPXxcVwaZOggtY
 QmB1JvmEA6kEo+NcEMJh1lm/JbpjC6NKYiN9UljnC3izyyQKKApZJvqhTv3gngfFF2ZE
 fYIof3mHAO2xa3IoUdRNz1wE2DU3xaLvn+KPmBvYdJTlBHHLB6Vw29PwftQQm4u24wCK
 IQBCDT+7aqLnBh1Y3wTcbrSk9UA6jxgFE8K94oltBXdOpKy0WjGiyJ2V+qxcPY4VcdYx
 zpg1ODaMArQ2DHX9EIKDNlksgqmBOhur8aqOJQ0arqc3vN/rGzg+swbYUpQlGdyU2awz
 7vtg==
X-Gm-Message-State: AOAM533ZlvIvoygmZZoY3Ua4eE7AIlDO2BZdpWEziDEiaAYe68Eqk3ZX
 e2ggsU5UOkX+4vlRDPM31MjyWr+1Kqk=
X-Google-Smtp-Source: ABdhPJzW/dx9D7cfQQFplogOrJAgxhV8MG1SRgVXqfgsWl6kAo9tzoj/lic9bKwSzbiL5kraHDJDQA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr4010142wmq.34.1639645382863; 
 Thu, 16 Dec 2021 01:03:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s22sm7348271wmc.1.2021.12.16.01.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:03:02 -0800 (PST)
Message-ID: <e165b04e-f1c9-41a4-bd58-a2cbe8f980ae@amsat.org>
Date: Thu, 16 Dec 2021 10:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211216084530.698125-1-f4bug@amsat.org>
 <20211216084530.698125-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211216084530.698125-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 09:45, Philippe Mathieu-Daudé wrote:
> The Marvell 88W8618 network device is hidden in the Musicpal
> machine. Move it into a new unit file under the hw/net/ directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/net/mv88w8618_eth.h |  16 ++
>  hw/arm/musicpal.c              | 380 +-----------------------------
>  hw/net/mv88w8618_eth.c         | 406 +++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |   2 +
>  hw/net/meson.build             |   1 +
>  5 files changed, 426 insertions(+), 379 deletions(-)
>  create mode 100644 include/hw/net/mv88w8618_eth.h
>  create mode 100644 hw/net/mv88w8618_eth.c
> 
> diff --git a/include/hw/net/mv88w8618_eth.h b/include/hw/net/mv88w8618_eth.h
> new file mode 100644
> index 00000000000..65e880e0eb7
> --- /dev/null
> +++ b/include/hw/net/mv88w8618_eth.h
> @@ -0,0 +1,16 @@
> +/*
> + * Marvell MV88W8618 / Freecom MusicPal emulation.
> + *
> + * Copyright (c) 2008 Jan Kiszka
> + *
> + * This code is licensed under the GNU GPL v2.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

These 2 lines are probably irrelevant here.

> + */
> +#ifndef HW_NET_MV88W8618_H
> +#define HW_NET_MV88W8618_H
> +
> +#define TYPE_MV88W8618_ETH "mv88w8618_eth"
> +
> +#endif

