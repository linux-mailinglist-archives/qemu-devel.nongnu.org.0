Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D403B9F62
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:56:58 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGqv-0007Rd-Bv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGpC-0005QU-KC; Fri, 02 Jul 2021 06:55:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGpB-0000pN-2U; Fri, 02 Jul 2021 06:55:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l8so11894134wry.13;
 Fri, 02 Jul 2021 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/c+jRma3FgFmmJgityu7teZCDoVgJXDdPugvthcVjyY=;
 b=fCOqJN+SodxMQdfIQZD4QFnbssgkCHCaZFypa0M37ccK3zQV3DoChZWaQYyEah/o2F
 oZOuVF+fPjT33hIKfXSTGd88YE/aPNuK1waAC97t+ux0B1WUP2TvuSvp6CNrsneEgtZ5
 kn+C4bDTASOqpf5A16TbL3Hp34a7HSBbNGcMndJ70YYsOKlxiF17wQWIsdX3gW6b9JUt
 jem+qs23JEiP9GGKxifv4/2P+dGyBcXEm5iMYArhkCt5F363Q0Tm1KBCUBz3jhjA+e64
 5u/VoYmD8QFA1wRIj7yn/Cb9bGQGhxagtBTNJX0hOYMqQ9m967/y3UkoGEwTuptrK1T2
 qPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/c+jRma3FgFmmJgityu7teZCDoVgJXDdPugvthcVjyY=;
 b=XFZ2mY1IZiXagqZKQC1miArWe2nvi2dJ7j/s5+nVLXUbMzuyNBSiRu+Vc+aNiX1fp/
 gLvy7vpFSPCJ2TjDmM4Jth6T5mF8NsiBmFWlNYpuwSOPrG6wqsZkVdbRq/GhxwIWQbfi
 i0k+B17Kke55DuU6eHYVKblrR/uZ2ncuUlrdLa04RW/FgBT2yhJhz+hxsvC0WBBCCJjN
 0bfy63ISBfwutsvCfDQvBgMa0fAsh21tn7Bh3KAPMRcObqpuFa3wu8Mbv9aNQvKQlE7h
 TjKivh/YuAWgqvem/EnCqqODFUgENq1OgXW7v1RfBcW8TaWAU7GFde1JuVZccWxiLV14
 xlyg==
X-Gm-Message-State: AOAM533c/z4dN0u3r6CHLiQuA00uTEHXaDgMaBZ2LJVh7XevhTSyIss/
 eGiClvtaEReMoc258R7avwM=
X-Google-Smtp-Source: ABdhPJy9uZ8HLLwnSzDDDWMYL5HCEuhASUEJyp5kBAP6C0aKn90kg1xshnqGpacQyEzJ7C5teNo/nA==
X-Received: by 2002:a05:6000:1251:: with SMTP id
 j17mr5164072wrx.122.1625223307192; 
 Fri, 02 Jul 2021 03:55:07 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id n7sm11436599wmq.37.2021.07.02.03.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:55:06 -0700 (PDT)
Subject: Re: [PATCH 04/11] hw/gpio/pl061: Add tracepoints for register read
 and write
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <29ab6a12-df76-f76e-a7d2-e0abdaa6186b@amsat.org>
Date: Fri, 2 Jul 2021 12:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Add tracepoints for reads and writes to the PL061 registers. This requires
> restructuring pl061_read() to only return after the tracepoint, rather
> than having lots of early-returns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
>  hw/gpio/trace-events |  2 ++
>  2 files changed, 50 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

