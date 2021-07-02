Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78343B9F66
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:59:16 +0200 (CEST)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGt9-0002YV-I9
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGrp-00013l-6T; Fri, 02 Jul 2021 06:57:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGrn-0003AH-Qx; Fri, 02 Jul 2021 06:57:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id a8so275509wrp.5;
 Fri, 02 Jul 2021 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=onb2XVrAjEjix2hjRw+1dfpXofYh8x588wOQOqhKH04=;
 b=LXF3PU+sC0y2S11swQBlMGDriL8cwV6uk05qau2zDiEfEOyXDkL1b4xr3g+2MEhLeZ
 JJAUKL907jkHSbwuxQ46l8qwk39UGsRfFLauMFQ8/DkqOnQwYYj8ZRXy3W+ZJa18XV9X
 HFBZ39Fh7GRTtflYqDbrbKWMSq5RA1rwOPmd8LMpxmgiEfhi16mNKyNalatHVKidupOl
 CbcTQo6iz2CpT0hmbvQnFH4shhrTCJjW+JNXmw7YdIKU/zuIxJcVFBXlZH6QeMpy2g70
 tQstavUYV741aNkXOt4UaHtN3kvUcI9Jre4lECYJcIBYsbVFLgtGf4K0UCbCWxWMbuSW
 ff3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=onb2XVrAjEjix2hjRw+1dfpXofYh8x588wOQOqhKH04=;
 b=nlGA3BqP0O0CROoCaYfPAFTSe/+keHhhuaKMdbZVzwOdd5PD6f+biIg7cw0Ev/gdaA
 Yh+dClv6mwR/6wZ32YjyZBoEnHQkdwJPL5rn/pNwfES8AKRMaHtw47vYnjhW2LdlFaMZ
 o+dqqp1lYxbLEGGQZQfeo9mcBo39BhrFNeXmlK4ihvrPlIpMYG9iTbdU77R1MMYiFAhw
 xy3SlogoiNtf85lJsXnxfPGJofV/mdV6p5LCUaKMDdu3U/fZWIphb6MrqscuLioL/AGe
 ThWa3p1eUJesTEXmz+wrGhmylBn3WiRN0pPzJXqX3X6+lq5dyzBNepPpEUet0nEW1ny1
 sjfg==
X-Gm-Message-State: AOAM531Gkry6fVwwojUYrvFax8EXIxqk4VGCpprpJr2tzXD8PZPYpD7i
 y2pLLE+0MucLTqDgb7/Mcb4=
X-Google-Smtp-Source: ABdhPJxyEwCsBuUtBaYuRNRZAAdrbR/uVmfBTe589MiUBPkC3wEkB/0GXt3PNFnpvFL7ubb4SKd6IA==
X-Received: by 2002:adf:f850:: with SMTP id d16mr5128934wrq.258.1625223470159; 
 Fri, 02 Jul 2021 03:57:50 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id z4sm1218225wrp.46.2021.07.02.03.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:57:49 -0700 (PDT)
Subject: Re: [PATCH 10/11] hw/gpio/pl061: Document a shortcoming in our
 implementation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa1500bd-23f0-29c8-5d21-11cb76a7a748@amsat.org>
Date: Fri, 2 Jul 2021 12:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
> The Luminary PL061s in the Stellaris LM3S9695 don't all have the same
> reset value for GPIOPUR.  We can get away with not letting the board
> configure the PUR reset value because we don't actually wire anything
> up to the lines which should reset to pull-up.  Add a comment noting
> this omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not worth actually fixing, but I wanted a note since I spotted this
> while I was reading the datasheet anyway.
> ---
>  hw/gpio/pl061.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

