Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03157651F2F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7a7b-0003G2-3R; Tue, 20 Dec 2022 05:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7a7P-0003Eh-Uw; Tue, 20 Dec 2022 05:45:09 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7a7O-0007lY-7u; Tue, 20 Dec 2022 05:45:07 -0500
Received: by mail-oi1-x22c.google.com with SMTP id s186so10214118oia.5;
 Tue, 20 Dec 2022 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XlLK/9t77OaCz0UGM/J8urYM3bBBnlqtd9YmBawRQfs=;
 b=VZQVqUyfm+SzD4hUok+TQ3m/aULWBHMuCvEbySofZ7AlqnMdTsBLZaI07suorsSjtv
 fe/mnNdO+x5Nyh4McN2S1iP8uLWiehdanPgWngG0vsp7HAFmT+liWyQAyUAGnOfb/saC
 91ynBTrXxHn0zpiO5IoFBLtQGf9Xj7Eq+aVdBBlcPSEApaBll4n1O4cHv/D/CjgO3b69
 EyPb+x4jFkJynEhVkvQVyl1Ne75ux7sCCj6gflUlEIHDXp20EiV4vosXzP32utRaBg+u
 GlumX4I9cssgCKSVY0F31fNZbRNniYm44IhQ/bojX60FD7i3IRMxVhPxOyac884xBk1h
 4cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XlLK/9t77OaCz0UGM/J8urYM3bBBnlqtd9YmBawRQfs=;
 b=SgtBDs38oQpez9wrpp6gH17niH372P7+i5XpZH+8NNG8piafzk+2+kxH8WsybAc86n
 T4fZG98z+FWwx/VHF0mFe43z0Fff3HhgWzyA3MMjEzXh9qdB50zQATsdiKtrO2hbWd5a
 Y26ZmN8L+oQ/2cwu+I2bgHedOg0JywwEQYyIehVX+N1t/d//FWfoiKZyARBg/wTDw1BK
 +sQSfhQrgiDrYhrFMvJ0aHMxd4Xs60ldtouuALnRH2tjw2+FY/l1SlZ9SFRDK6Uc5C6K
 xaFD7b18br1aLGA5901EOChW7kQ179BmwxRWgKJWF1/Eu1BXFgqGDloLhgF3HTrZc6dH
 DF/g==
X-Gm-Message-State: ANoB5pkzHF8UsGIvxhb68vvQuUTwUCKqhLTEB6mz8nxSY2JeWymHo+Vd
 OyqizXdovH6KuVn9Rj/S8bg=
X-Google-Smtp-Source: AA0mqf5IhyhoFAFTIOpBSp8ETqrVHUgTAA+/7jM945BelQAHiivdjpQPQFharevJcEcrmsphwDZy5A==
X-Received: by 2002:a05:6808:30b:b0:35e:57ef:51f8 with SMTP id
 i11-20020a056808030b00b0035e57ef51f8mr17517142oie.52.1671533103732; 
 Tue, 20 Dec 2022 02:45:03 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056808034200b0035e461d9b1bsm5291043oie.50.2022.12.20.02.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:45:03 -0800 (PST)
Message-ID: <5d727e59-fa21-ea08-112c-3b74db7e4577@gmail.com>
Date: Tue, 20 Dec 2022 07:44:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221216215519.5522-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.149,
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



On 12/16/22 18:55, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   dump/dump.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 279b07f09b..c62dc94213 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -29,6 +29,7 @@
>   #include "qemu/main-loop.h"
>   #include "hw/misc/vmcoreinfo.h"
>   #include "migration/blocker.h"
> +#include "cpu.h"
>   
>   #ifdef TARGET_X86_64
>   #include "win_dump.h"

