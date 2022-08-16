Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E296594964
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:13:36 +0200 (CEST)
Received: from localhost ([::1]:44608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkD8-00042F-U2
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkBr-0002fy-8p
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:12:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkBp-0001HA-PG
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:12:14 -0400
Received: by mail-pl1-x635.google.com with SMTP id jm11so5534290plb.13
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=NMokZM7xPXvaZ339Gl/Cqu66fu0FGDASl/zYO9ugpVA=;
 b=gDrLR3/y/O4+BELjY+1vzcKZpMsjgYP0zPQFsBZKsqOA9KhblR0+xt59POqiNBsoxy
 dtlZPr3CY44r1b90AxYMBfD+q/hcvVLi3BtYkz1CZntiuaUTfT4EzwkOAYc3ekXmCrrT
 2bn9s7s/xjTnABVnQ+Rj6y1uHCACkNzLOR9HNY70GB1n73SU9wzc/w3wNuX81K7HfgFj
 SfdVaIjCo/8Ph/ouako9bofqU+dTf0pF43zAQlEx1IBIZC++LCrgkTT2HGgtz91b+xXX
 h7Yp2R72I8NpIFi0YK95XMCjdK76htx4f6B9DHsdWj9bg+X905HZtAdYDMU6HOZrKj8S
 4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=NMokZM7xPXvaZ339Gl/Cqu66fu0FGDASl/zYO9ugpVA=;
 b=hv/fTXfozEO7F2N5ABgg47w0n2M6s+nuyyizPhF7Hb4+Un34LBfLvP36pgadSZ8EOI
 IdDuQwcw+vrK4hS/aT4zo6qOh9GmYHfXrBxl27KR5PQZmegjWF3DAEcClFVTLDMxtdov
 ALwI6DmHNMOFDInHA9tgKrmyUgMTXS8nPWsBSmstV30b6tmD/TYeytKA7Gq+3Z1WhVQU
 YdhFT12pTIwXmNycwV/atDhgRmfQfBIVf8W8SD+4SsVNkMS5kvbWQuT3tKeecBu3OYRU
 TrWFV38yBS1xQQk8tTA8bK1w33gKvppHU4W4kHrRgYzG96c54f0y6JuYne9IcBwVdf9m
 R/pQ==
X-Gm-Message-State: ACgBeo25bkPFf8AQzLNecOHmQS0mdan/lcum2hI5YskVCpfy8b6Zt4IH
 1vggsChj2IQf3x9OBbhB+no=
X-Google-Smtp-Source: AA6agR7yvQa9fZsW0tHAL5uw7CLtdN6AcdPgN0aubDENNmDeLCh6teUVXpq9JALPDC3RfbFDUyAQ7w==
X-Received: by 2002:a17:902:ea10:b0:16e:d88e:b14c with SMTP id
 s16-20020a170902ea1000b0016ed88eb14cmr19419108plg.25.1660608731712; 
 Mon, 15 Aug 2022 17:12:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ix9-20020a170902f80900b0016be14a776asm7524217plb.286.2022.08.15.17.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:12:11 -0700 (PDT)
Message-ID: <23322eae-2d72-33e2-07dd-df5bbe476564@amsat.org>
Date: Tue, 16 Aug 2022 02:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 07/20] disas/nanomips: Remove Pool tables from the class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-8-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-8-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/8/22 09:26, Milica Lazarevic wrote:
> Pool tables are no longer declared as static fields of the NMD
> class but as global static variables.
> 
> The NMD::Disassemble method is using the MAJOR Pool table variable, so
> its implementation is moved to the end of the nanomips.cpp file,
> right after the initialization of the MAJOR Pool table.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 363 ++++++++++++++++++++++-----------------------
>   disas/nanomips.h   | 201 ++-----------------------
>   2 files changed, 193 insertions(+), 371 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

