Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F793F5C28
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:31:06 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIThr-0004Kl-W7
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITfw-00023p-Q0; Tue, 24 Aug 2021 06:29:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITfv-0005mW-9U; Tue, 24 Aug 2021 06:29:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so30528566wrn.3;
 Tue, 24 Aug 2021 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5TACBpdbRGnePlZm5/uOWtAEN+gDGRF88Hnzx6xi4tQ=;
 b=m5U2tv93JMVg/Ks8kDqmjSO4VWhBnU46m4GzhzFv16jVru9XXRXJ0us+Lrbcb9EfA9
 lHXTtby62kdDzbSjRbVl1DumXm0KwHGxP0245mjf1LwFAqJ6Qlkahh0osIDv6dlBhJ0i
 DkZdommjGtjghm4IGFtW4ysFtxrHKv9v2qv+TaCTfv6DTt6jyBZohUY6mDz34LSl34kx
 Y9a0t3Vqd6dRBv4KFuhOs3OlLPyyaaZeL4D20ibhMW1ts8ycVI/OY+6w8n1VvXl8aCkM
 7KGwCKIbphcWrTTjNFe+bczpAcLPT3AI5Kxi7gbkX3RldlDc49qKm/mWxX8xZjAePYrY
 ep9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5TACBpdbRGnePlZm5/uOWtAEN+gDGRF88Hnzx6xi4tQ=;
 b=Luddeh6bbM9d4X9e+46ocGZ4ZizrRC9dV8Dq/Dw72dp6q5eRdaNar5/plbDU/MMA5i
 3C4kup3tE3wOKwyAbWCCiI+6NXilNaTUR6bkJ0vn7zwW93M+doRrTB9NUW3q3X0qO92A
 caNKXENXtZQpAIUIG+eH2PuXTeL6InYz/o5lPOgDNkB+nss4WMkEfM9ZqyiONQ/kEUfF
 gkGXAOi7LQZ5fPJrM5Pk32yejQ/Y4CZ/AevkV94WDFIa+Sbnr5bvyi/PPlCw0I1WKaAj
 bI8Qw+KiOvMC7PWjGYyOSaVnUaK3bgx+gIX4Yw0kHm4qLZXbvWA0zYCryFjfKXF4WsRL
 8wcw==
X-Gm-Message-State: AOAM532GhM1v8QhV5nUnWfOcCY9YLRsIwsPKNUAriwJHCQ2DX7fzrd7Q
 +1ysWM/n9EhQ0Di5YR8dOORCuFzEmdY=
X-Google-Smtp-Source: ABdhPJzQuYSDhsrVocGmbVb/lFdJhiFRiq4d1h9jFNHC3liq0JmnckruYiVQNxzIoIDujp9MyBaGjg==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr12222507wrq.330.1629800936831; 
 Tue, 24 Aug 2021 03:28:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a10sm1819439wmj.44.2021.08.24.03.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:28:56 -0700 (PDT)
Subject: Re: [RFC 04/10] hw/mos6522: Rename timer callback functions
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94e09577-b7a9-e76b-6701-f7407e6477af@amsat.org>
Date: Tue, 24 Aug 2021 12:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:
> This improves readability.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  hw/misc/mos6522.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

