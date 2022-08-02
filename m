Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508C587711
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 08:22:17 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIlIG-0007lb-DC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 02:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlCm-00059G-CE; Tue, 02 Aug 2022 02:16:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oIlCk-0004k5-Ud; Tue, 02 Aug 2022 02:16:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t22so4803855pjy.1;
 Mon, 01 Aug 2022 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=6pMd3RUqR5cpGrFHD0jpcjJLPrtPMiqC1Jaz4Dif2uM=;
 b=gjU4xHlnPy5hgAo9IXAf6GFXsGTCLFJyMCgSjVJIO7JEEPkStoeW+2WEFOpQFntyWp
 iX1ZX+GzzhtNN9BCLJFazrHBBgDEliMO6lPjjSWzF1y1WE7+n5x56sHUf0o4W+GTns1w
 U5rkyDDHtSaD9GR9K2x7iOHicipGpo+T7UC0UpRtq55IlpbuOUZ/OhoprLSiATxFM6Ol
 ssN/ECNJQFrOsqC8tT/SE+9i/Id97PoYq0+iRVfK+EXzzXfDPEn7AvAkE0gCK3/eZQdu
 eRjGESe6IdJL8Gmb08Cme7wz9Xvoz7eLW7vGHqRskTS5uhPcg/chjq2v0PnRwrU27ACi
 D2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=6pMd3RUqR5cpGrFHD0jpcjJLPrtPMiqC1Jaz4Dif2uM=;
 b=K6XEKlXJFJGkk875ZQUVL+iYKDJrnnt72YJ+u1iuE76H5saUhqVBGBc3oe2GBzUcmy
 DSGxrnDTQS43zMGjTZbzi7FEeB4SzYEd0nLH6CkTcYoqdz8+hYOGRcHOLUFwPcnXPAPX
 /KTWJ7ym0KRj0g99Am1C2CQaVPFTObG3Uk0R3vXYBQat2lNH07NH6ZJ7Lrbymt4STeRb
 08TCP2LPrD7OBVX3FC9yfYTCEWHFfVwnv55Vm9/8fYRL47kun+XfUjaRoi2CSs+WMQGs
 Y3z6YeL+hI/z5l4LCjX5JgxVSGcgkcoZYyyPeVv68tANvIjJ4RNWBZSbFlrMp59AUwdr
 JqTQ==
X-Gm-Message-State: ACgBeo016SmPUQGEUlVobsZ4VTNHAfS+wsWnD+YgO4IMrhUdSmYrMUGJ
 aP4fYD08ZYHp3b/C8NlHoYg=
X-Google-Smtp-Source: AA6agR6Ka0BuWZF+kw8loysq4REglK81yIZ9wS03Wpxs9F0kPrRg3Nu475mzhmWlZ2O47HwqqVxVPw==
X-Received: by 2002:a17:90a:d711:b0:1f4:cac7:b353 with SMTP id
 y17-20020a17090ad71100b001f4cac7b353mr18549721pju.8.1659420993285; 
 Mon, 01 Aug 2022 23:16:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a621c06000000b0052d327f67b9sm5423888pfc.152.2022.08.01.23.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:16:32 -0700 (PDT)
Message-ID: <9442bc40-829d-75b9-6740-992c636d3f65@amsat.org>
Date: Tue, 2 Aug 2022 08:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] linux-user: AT_BASE_PLATFORM for MIPS
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, laurent@vivier.eu
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20220801200928.73741-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
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

On 1/8/22 22:09, Jiaxun Yang wrote:
> Hi all,
> 
> This series properly filled AT_BASE_PLATFORM of MIPS.
> There is a checkpatch error about braces after if statement,
> I intentionally left it for style consistency.
> 
> Thanks.
> - Jiaxun
> 
> Jiaxun Yang (2):
>    linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
>    linux-user: Set ELF_BASE_PLATFORM for MIPS
> 
>   linux-user/elfload.c | 60 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 58 insertions(+), 2 deletions(-)
> 

Cc'ing qemu-ppc for completeness using cpu_specs[].platform from
Linux kernel arch/powerpc/kernel/cputable.c.

