Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E45E60BA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:16:27 +0200 (CEST)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKBt-0005XE-Uz
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJs7-0005jd-U4; Thu, 22 Sep 2022 06:56:02 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJs6-0005Xp-7i; Thu, 22 Sep 2022 06:55:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fv3so9436764pjb.0;
 Thu, 22 Sep 2022 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=PSlcnN9r1/o3lK9vQ+hycDU95Fe2IuJZH3x0Krzt1JI=;
 b=QvUzh6am+j770vd5NeKurdUpVI5e8L7kcGxLVk3nBrtmiMw7WD0yLrywiXHk+j3VKz
 3tk0nn+DsWMtHl7G0I08ghAvFBi8/abI38f7seTY/K1UJsPqTVCJozIvrOXoWKcormGN
 kDeqkjAuiNNF3nl830/DgvAYE+MSBTt4Ty8iwCXfMwxl9RXtYaUS407mgAmWslb7+sDc
 UndZB7AN4VQWVSI9LNF7iTxYIqtDRoFJje2kCyMFvyCnVrkREOTMCK2cEl41gB/i6CKy
 iTFotxma/idOLTXWbMLFiaQP5eG9B3yuwpR75pPeYLzg6s0uzTcVoVdYuQtZ4kviUoxI
 Be8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=PSlcnN9r1/o3lK9vQ+hycDU95Fe2IuJZH3x0Krzt1JI=;
 b=A7G899OEcpJoxENTIi/Or0y8oUnZPNRO7xXw8/Tz96Kbd6M4ysoKR0f8XwSOptsFmc
 DprP0+gEcGx/ovu1Wdz0Q1DedCJ1KbAfNeGPEvUj3c0eyKZVIGk6MmnwuOeq+Oq2mKFH
 6l6CbtjrauBY/rlN06F6d/zsIa0xBGOnQ/wjU4v6mLN4BYpSVA9ZmfU98CK2RTtXrPCn
 a4zR+5Sz3Yv2xiIdZd1WV2Bbewvsy6pUU9e/raRLJe5f/i00EkES9GK2UCAYNLU7Vkhu
 kzg6LXgmliNjVEPmQwQOZtayywOJr16XZGFcsR4kgdF4vntB2AyJyz11SOF0k4c26X4q
 r2bQ==
X-Gm-Message-State: ACrzQf2fbwuZbYjGdJmg9MagGCUmBVeSHITIuwqvFGDJ+uuuVVsBsFlO
 p2/6+gO2BDWe6AycwFiUTmatWYKcZ84=
X-Google-Smtp-Source: AMsMyM4o0iHc/eaGH2Bx1BGTkpl4DqFi8IEDf/G9Zg0MON4NaU+8MxEgOo1SeR253MkwopiBCa3Shw==
X-Received: by 2002:a17:903:25d3:b0:176:e9d3:64bc with SMTP id
 jc19-20020a17090325d300b00176e9d364bcmr2644440plb.45.1663844156601; 
 Thu, 22 Sep 2022 03:55:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a7-20020aa794a7000000b005385e2e86eesm4167658pfl.18.2022.09.22.03.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:55:56 -0700 (PDT)
Message-ID: <666b5e8f-d7eb-c854-608c-29581c26f76d@amsat.org>
Date: Thu, 22 Sep 2022 12:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 12/14] hw/riscv: set machine->fdt in spike_board_init()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-13-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-13-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> This will enable support for the 'dumpdtb' QMP/HMP command for the spike
> machine.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/riscv/spike.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


