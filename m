Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74814CDD5A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:35:12 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDho-0000G4-1l
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:35:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQDd8-0006yE-Jd; Fri, 04 Mar 2022 14:30:24 -0500
Received: from [2a00:1450:4864:20::431] (port=37870
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQDd6-0003Hp-J0; Fri, 04 Mar 2022 14:30:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id bk29so14128527wrb.4;
 Fri, 04 Mar 2022 11:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W+oZhgUZL0cPxyele5cDnlaZpAI/c+DlXzVgiRyaigA=;
 b=fkKsU4sOb2LHgb/FRlsskW+8btKz90Q+Sc8QSRuFfyQSIUj0EzhZ2CA7wNEQz2EqNh
 ogQeduf/4iRxUhHjfGOnOAdlIHh+1xuluXrrrka9Oc17luPok+4X7AiUYtHhW5XzTKLS
 MWsOmeUIxp0uZqAYW4kB34jaeMWiS62Nsqy+Gc7jJgmhftPi00k+KN8Zkf1ufC9kGyNb
 9/N5OZ8/XlFLWpvcoRVq4My5YNISTPnenX2RoOMABsBjQEDKqa3Sp9wWCYO/tSOQRC86
 iKx3twboK7hXeBDole/AUfKkJaoMtqpFU7hewhrAOivCaBiUnUePPkVvwaoPWNfpG34R
 qwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W+oZhgUZL0cPxyele5cDnlaZpAI/c+DlXzVgiRyaigA=;
 b=O+Jh+mpVu2+AFUUXFmA7LYfoVngSz1RfgrKTXo6E3m4CpPhzrrix+0CCNYAxW+rwBc
 hRr/2d9XpdUcikaRgl/kRLsrM5/O5wqkQsSEi6SxIYTzi9osTqups2Vnjh1iVI3GPIcg
 VRzKufXyNtMM/fXVZawXATjqhh9luO3YYclablNDR47mDawpfMzT8fU+Uj+KekWdA/X4
 PbjlDT1otQF3OKuuKIFk0zDbtS2N2/K1BQJLTrktV1uTH6HwXaomzKb/3fkEaFSyEhmZ
 NSfxXQNxDevXojgQldCxP75LHA0MXneFP1ZVhGuw6U1D/fMKaDFmx9SMcu/vPjMiS3NT
 XkzA==
X-Gm-Message-State: AOAM532k4j+ErBlJXzw1N7iWNNaFCGuuj5ge4gUJTVKO5/ZSd15Mpw4g
 3hcWHfUpsNJ8cjho4dnJcyo=
X-Google-Smtp-Source: ABdhPJya4SDbLMBzD9N5eaZ6Mkk7i942dytUYYJg3jyiTU06UQO9rESFjxggMN2Le/LCBkb60bUg8A==
X-Received: by 2002:adf:ed0c:0:b0:1f0:4a32:4d0d with SMTP id
 a12-20020adfed0c000000b001f04a324d0dmr211046wro.136.1646422218836; 
 Fri, 04 Mar 2022 11:30:18 -0800 (PST)
Received: from [192.168.54.175] (108.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.108]) by smtp.gmail.com with ESMTPSA id
 m11-20020adff38b000000b001ef879a5930sm5105188wro.61.2022.03.04.11.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 11:30:18 -0800 (PST)
Message-ID: <9b9b0251-2698-61b9-b4b1-5e5e54fea5a1@gmail.com>
Date: Fri, 4 Mar 2022 20:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] hw/block: m25p80: Add support for w25q01jvq
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220304180920.1780992-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304180920.1780992-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Michael Walle <michael@walle.cc>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 19:09, Patrick Williams wrote:
> The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
> and the two have been tested together.
> 
> 1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Cc: Potin Lai <potin.lai@quantatw.com>
> ---
>   hw/block/m25p80.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index c6bf3c6bfa..7d3d8b12e0 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
>       { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
>       { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
>   };
>   
>   typedef enum {

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

