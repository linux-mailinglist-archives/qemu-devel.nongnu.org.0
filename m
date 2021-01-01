Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969332E8595
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:43:08 +0100 (CET)
Received: from localhost ([::1]:47536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvRGN-0001Et-Na
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRFR-0000qC-3p
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:42:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRFP-0007JU-En
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:42:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id g185so9747701wmf.3
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rhunFZpXQRkpbWnsy2gGzHdbr4OOh/71kLu6+YIMByw=;
 b=YxB26IU6VkZyVckrcU14nBYzBzFqs1Jeb+fEv7OmwaH3Kp6dD42v5gKZjih1GZ8Tnv
 kiUm7RXwr9JtD3eDue9S7F4hl4zcI0iHrN3GjR+j74Z7y3f4ezzJ2WwcbgSCVkapi1jW
 ePg4CImYqw1MHlsiy5L0ZLcsejeBMYMsyGiO+B+gXi7+QAFBH2mWHdgTzVyAOJmP8/Jf
 H93qJoGEnk5aYk5v3MoU5UbHE2kggrFElOoHHfUUTWRs0GpUigAix0fnJ6KSkuAb5Izv
 xvlc+BstcGlKFOBMhiE8R3GwmOyAZBMs1I8RHWXG+MUTJPI5XoeqikmBvPLySM370AiE
 5D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rhunFZpXQRkpbWnsy2gGzHdbr4OOh/71kLu6+YIMByw=;
 b=g9+NXcYzrbfs6JMtwPzITqPkxEduqpb6eMkMB8uGywC7tt9Yh5pKQNbzQSCJVOdtEY
 8cEss/KCHjaVRX4u6p4/p0hb7AqzsIxISENAli0C7Rlv50tlNNwSGriFIRXdvOL1n+t9
 eEnsYTvkiaVeV6lrQYVQUFNwlNkNzsUD1BxQoNlKwDG6uF7PRhtBb1VFJE/oTHMrvQlb
 fjSyKxAdhUAGIQpbMtwHoJOES3FA0EsvQnkdhRlyGzV6dxw4daDrDPOSUYeAK4VacRJM
 5EoqCzgOh/rcTT+JsJCGl+aWVepLauMQeOm4rWkAjtnnBSU67bw4/mhRXwLWpN50vtVo
 GABg==
X-Gm-Message-State: AOAM530jqdKFk2WAdOTxvavGLw/mJi/cGdtBeLxOP5MArWem+z+rGWnY
 7yJvB/Lefm2R4R1FWnvaAsc=
X-Google-Smtp-Source: ABdhPJwyMb5ChRNnQovlKH3zRQld/F7AFvSnNWz6BknGWBW+dMf8M8wAVKDCqsLZTC+JHshnErSPkQ==
X-Received: by 2002:a1c:7f83:: with SMTP id a125mr17093180wmd.86.1609533725714; 
 Fri, 01 Jan 2021 12:42:05 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id w17sm18542978wmk.12.2021.01.01.12.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:42:05 -0800 (PST)
Subject: Re: [PATCH v2 6/8] target/mips/addr: Add translation helpers for KSEG1
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6dda6b4b-5808-3e01-b5a8-8ab562a167a9@amsat.org>
Date: Fri, 1 Jan 2021 21:42:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064507.30148-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:45 AM, Jiaxun Yang wrote:
> It's useful for bootloader to do IO opreations.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  target/mips/addr.c | 10 ++++++++++
>  target/mips/cpu.h  |  2 ++
>  2 files changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


