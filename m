Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0C537B58
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:23:29 +0200 (CEST)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfMm-0004eo-QN
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfJ8-0001z7-1l; Mon, 30 May 2022 09:19:42 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfJ5-00029j-Vz; Mon, 30 May 2022 09:19:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y189so10550479pfy.10;
 Mon, 30 May 2022 06:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HmGTu5js5oePZmoFhakOY0vorwpADQ2l8SWbK4lK24c=;
 b=NT0gGz96HNPTi01FCiQsdc5SbolZLn8VcAj/CXWa1AJxI9Q6o/GkRQjOIogzWy12bj
 xXz+1LqVR5olFzoFBhVgvQ8HHTDqGQxtQClOaMN6bRiFAsAI9Vglqw5TH1t3MVgX1CaK
 1I4iYU8m9EVLHUyyhAFJCos411ZyAjuo1aET479FFBW1ZLFcM+B0S4Iq+Uwntz3JZYux
 USip9yT7y0DTm550P+EkGL/YrUApqlEeyzLPN/SDKcmt+zLhPfJAEEZ+m2J3Pst4YtjW
 TcdFA7ThU2TiA3ZsnZHFUUwXty5Zgb241dBiiK5+Mv3w7GRHyGjeTkn8AFAB4QBY7LsJ
 Bs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HmGTu5js5oePZmoFhakOY0vorwpADQ2l8SWbK4lK24c=;
 b=2I6jgaE/tZBEgKml+wKMuIA6a9ipEZPy55e/O4If7rRmIe+QwVTdGVhOaDmklZWpzi
 KyUVF4Y44647sqj+WwK1R9eQGhd0zYw0HLGoZED3OcggjqCQh3/vio40P/fFOqqedv/X
 fc+iL4OdPu+S8auuy9bVCWUn7XFCR7XiXTQQ9Bk5jS+cgsIzQJ39lvPCzr01gL8b5w65
 E/0bad4GcEnNJ1iEWPOS/te13qh5QnqoShJxLZeYZDP1eOJE1JMBMGrplCvukT9Xe8VX
 YDsLC9+f43D1FfxOBjVeGAzxlJUm0sJgc6IlsfOd5UJpvvWghvbf/GThlgm7GgC/XIZK
 7mMg==
X-Gm-Message-State: AOAM5313dV1/ctjs39NT5UM3Roq4bC0AkAlYUtyLjOeDDm0qZ1B/Wnlv
 TqbaQfo07rCjPzJlqiPv8yM=
X-Google-Smtp-Source: ABdhPJw/7C1fHbLd2id4rORYlQF3BRPRBr5TDmR+sFKKXmPjXWdIqjy9fhoBby+1Hygy7GRX8+frYw==
X-Received: by 2002:a05:6a00:1582:b0:518:7aa0:d6d8 with SMTP id
 u2-20020a056a00158200b005187aa0d6d8mr46709733pfk.27.1653916778249; 
 Mon, 30 May 2022 06:19:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090adf8d00b001e31803540fsm1482192pjv.6.2022.05.30.06.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:19:37 -0700 (PDT)
Message-ID: <f5cf718e-fc56-c271-5827-dc2d3c86a231@amsat.org>
Date: Mon, 30 May 2022 15:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/7] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-2-shentey@gmail.com>
 <c62dad6a-9bd9-a2ef-ab24-c65912baa8bd@ilande.co.uk>
 <CAG4p6K4v8qEUpZKqJ4R6aXXoKWSoBUORySsjt_eJFPzggsZVvg@mail.gmail.com>
In-Reply-To: <CAG4p6K4v8qEUpZKqJ4R6aXXoKWSoBUORySsjt_eJFPzggsZVvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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

On 29/5/22 20:09, Bernhard Beschow wrote:
> On Sun, May 29, 2022 at 11:05 AM Mark Cave-Ayland 
> <mark.cave-ayland@ilande.co.uk <mailto:mark.cave-ayland@ilande.co.uk>> 
> wrote:
> 
>     On 28/05/2022 20:20, Bernhard Beschow wrote:
> 
>      > TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
>      > ones, too.
>      >
>      > Signed-off-by: Bernhard Beschow <shentey@gmail.com
>     <mailto:shentey@gmail.com>>
>      > Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk
>     <mailto:mark.cave-ayland@ilande.co.uk>>
>      > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
>      > ---
>      >   hw/isa/piix3.c                | 3 ---
>      >   include/hw/isa/isa.h          | 2 --
>      >   include/hw/southbridge/piix.h | 4 ++++
>      >   3 files changed, 4 insertions(+), 5 deletions(-)

>     One tiny nit here: there's a typo in the subject line which I missed
>     when reviewing v2.
> 
>     s/soughbridge/southbridge/
> 
> 
> Ack. Will fix in v3.

Can do. Also, "include/" in subject is not helpful.

