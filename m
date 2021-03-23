Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A521D3459F5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 09:40:57 +0100 (CET)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOcau-0003gq-AQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 04:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOcZV-0003FG-1T
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:39:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOcZS-0007wl-Vn
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:39:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so10328654wmj.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 01:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7EyCUWJhuqa/ESG31F9QDIVH3zVvwdpO6eX7fCncDCM=;
 b=SbeFIxMr2CPTUgs0XIUCOiigEMyk1F97jwR/5MRj476x0WcJPR2LJTx9MJik7K15oD
 9vG8hlwaJwK+Es2wjcYBUv34Px6cdpYwapg2XmkaxUQ4y8I6bp+PqmG7qJJo7/UMxLx5
 IksdQijDSlmxaW3ExrmAYuWftPrjLJ8boRU3LwMV7x+aSsEO5uD4Kbq/1GyEUZefjQ8M
 QhIXGYRNKL/r8tu4qs0QxkMrlSr8sIhExy3hkaduwO9DtdJY65vuR0efFnZQ4L2eYnaR
 FkPB33si077QrcVh4Q+A4Gd5+pnSVqnwpUG83Z68k2azJzTptGVP8rrZtvVahp8HDCU6
 83eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7EyCUWJhuqa/ESG31F9QDIVH3zVvwdpO6eX7fCncDCM=;
 b=Y1ePrmj3l2BJOrWKaTsbvKiW41wfYqyALB88Bt+CwWuRZgd9KT7n3kIIgD0D0h15jj
 RidhakJAsI6fZJsTDOvpgVC1yLU4/MaiWISXxyenl/Iql28VEb7kQ+PtLRJn8OjULd2Z
 KSzm4TNrAsDq33g8iav+hlSbYv6o29lWVjoJkibrOCfrsRMzaPQpQ7LawgTnyHcXUmxd
 pEHXCqjSdqiVIx3XCaHINX497SSesmixdR1jSCtOqJboUm2/muVsMyRnSssd2siZBq3d
 wdHS544Mh3PS4ue7i9PmqhlJ0o+0jKU4nG5L1bG0VJR8sSmqRhrQy+G6J8cd5KNOjjd2
 PP6g==
X-Gm-Message-State: AOAM530C81QnVUM5UpJL+l6Avm9GWZhoyouK9mPunj2F1+KlB+uj9pLu
 J+PzFvZNT0ECSOlEDvKkorg=
X-Google-Smtp-Source: ABdhPJzIOMcrg+vZXYP2fP0RgQBDy5mdanwcCnNfKm29i3dmzNtkkyXR6zTw/3GmEn5VhtDzLCHgCQ==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr2286193wmj.48.1616488764991; 
 Tue, 23 Mar 2021 01:39:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i10sm22633388wrs.11.2021.03.23.01.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 01:39:24 -0700 (PDT)
Subject: Re: [PATCH 07/11] hw/gpio/avr_gpio: Add tracing for reads and writes
To: "Niteesh G. S." <niteesh.gs@gmail.com>
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-8-f4bug@amsat.org>
 <CAN6ztm_kaTkbBK7=ALMmMSmShzuOx=S2vUBy2N1D-P__T9um2A@mail.gmail.com>
 <CAN6ztm9STVjzKRpUY+kaTiz6W06mbwcG7KBVbwdiZ3HnR8mu6Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b5974014-f451-1ed9-68b2-b8d1cde0c267@amsat.org>
Date: Tue, 23 Mar 2021 09:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAN6ztm9STVjzKRpUY+kaTiz6W06mbwcG7KBVbwdiZ3HnR8mu6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, Heecheol Yang <heecheol.yang@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Niteesh,

On 3/23/21 3:42 AM, Niteesh G. S. wrote:
> Hii Phil,
> 
> A gentle reminder to push these patches.

Unfortunately the series is blocked by a legal issue in a previous
patch:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg791443.html

We are pending an update from Heecheol Yang.

Regards,

Phil.

