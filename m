Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586A440842
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 11:37:37 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgknw-00015v-3j
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgkmW-0000Qe-1X
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:36:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgkmR-0004wI-Bu
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:36:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id k7so20448449wrd.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s0iJl0t0jaKfRbwn6MRV638onU2bxvb8ByIY2bdge3U=;
 b=Chsj0gqIZGSeyinSPonFc5w2yr74QZAOkLYsQYt+l2E48WdJtfd5kp8G0pOTxrUsVU
 Ikku0wVUm1JouK49MJHwNt8LnwrQnl9HLfuYYmuGE94NzM0nqsJd9vtyvxx3Kmn57Vz6
 iGvDnInLptbMUMB84/cx7cck8yqfyvDD3pRiJIXJspfLtcuxc8ph3PwE1Ed1aWn4+LGg
 CK4eh90GGhu0bQEXpsPjYzeeXyOdZkxfQudBeaxCDfFb6NV9Eh9kC14v7QtEsbMNefeZ
 NVGvJMFbJzeUgukzKBD0MR9h0NPJtGEA/ijA5Mo2tC7N7hSSjgoJycoq3n10gsMgjsCy
 QEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s0iJl0t0jaKfRbwn6MRV638onU2bxvb8ByIY2bdge3U=;
 b=SDZT7knnygnYm1s5u7Qdv/nFoQPLneft8aXiudoKIFgws/E8+W1t9JnPA7Onicgdwy
 T3PBPZ9TRAjSwmU7sNPshhXMPS26AYB3wgZGC+D2WR8HPKMqhM9tx3D/2793KwW+khur
 yrODCpEnDFdk6JwHQYovrd/25SEtPIPRlTl5En60MHHqjCV+rzMx9p3UN6EX4Y1rZRE7
 Db9qifR89+kG4Xas5jZreoU5AxHXrCjQwT3a4dZ7nRpVV5pNI+9iCAckyMefLLtjujI8
 lSUGsTjK0rQQ2Tg4phahNugZ8JZDRUZXawGrgWQffGqpTz3BNuIj68/HEwAM4eLkLTMV
 nwtw==
X-Gm-Message-State: AOAM5302K+wpc+2NAwlfk4R67ZZ2cmbaR/Vwrjq1bcIUJk2R64+8q8TZ
 3KGTT6vwnTHxyz6zakRoWp4=
X-Google-Smtp-Source: ABdhPJyeFPD4HcVOW40OB/tmwEZwaFLusIoFk81kmvxH1psnV08ybLmfwRdLMKyTdsbxrwMdcVblIQ==
X-Received: by 2002:adf:e310:: with SMTP id b16mr21413263wrj.309.1635586561895; 
 Sat, 30 Oct 2021 02:36:01 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l20sm12609336wmq.42.2021.10.30.02.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 02:36:01 -0700 (PDT)
Message-ID: <28eda4ca-c62e-960a-0175-ea0e06142d2f@amsat.org>
Date: Sat, 30 Oct 2021 11:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for SDL audio
Content-Language: en-US
To: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20211030062106.46024-1-huth@tuxfamily.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030062106.46024-1-huth@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 08:21, Thomas Huth wrote:
> I've got some experience with the SDL library, so I can help
> reviewing patches here.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Thanks :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

