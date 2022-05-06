Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AD51D04D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:27:50 +0200 (CEST)
Received: from localhost ([::1]:45094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpZE-0003gz-QO
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpXy-0002yw-Lf
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:26:30 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpXx-0000EQ-2r
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:26:30 -0400
Received: by mail-oi1-x235.google.com with SMTP id j12so1504134oie.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jR+b+Ex5ZdxT/aEEriEV7VJywAHj4FTf57ZnSH9UL08=;
 b=uHjJuQl8HP1wtKhZfW+cHNcZVfYDeTfcXKtqeq+o9u/KjELB9mcXr3rtRUYNl8vst7
 5gTa8wRa4MzFsreN5phZGLfppTVinM2R6ZP++6nPNXHPRI6tb6wbqsAedOz0namXjgho
 DW1qoXh/tEqHWZuOGfSO1XgWM6UDVUUOa8hIK4Ea/+i/JTKJmxmXfOBtM9/BPfHQq9gm
 TerYYVmhaeIHj6akdoYXYUEgqrwDkxurVc9nHeWGZ7yNx0hMvvwqYJFrQ6Bp7JLFEO/m
 i4Og4alMsVUSwoeQFRZvKNz/58xcLBZB6041PRVLzTIKWsRsUyeVTol151rMESCCxB63
 8JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jR+b+Ex5ZdxT/aEEriEV7VJywAHj4FTf57ZnSH9UL08=;
 b=rKj2lLKbRk6s3CGZuujlzjGXB2p9kp5sL3rQy/E9RYZv1ae4syUdmXuTlPq+SdpLAy
 dCFYAd874efZxs7hfziWVAqhEoEEQe/+G/fTQl1VqBoocOcUvtQ7OxlkQo4Fuq/A0VdG
 5QKYM0OQA1q2XlBHqVOy2AequJPXv301c4MhweJdHws0tIt3z8/ZUY4KA9OFKOFS/K1X
 D7S0/DOsoFLNspvcFaVj7uc+oCZRDWIWJailwRw+5yqIICGgQehAuuxy31uGMkm0mgTh
 lqyrhDuYPMoi9qZLQ/GCexunUvkm08/uU6gqhzalvuc+OpgKrJiPI1IfdQqHHVuxqmQJ
 2V1g==
X-Gm-Message-State: AOAM530Q4A6eA6Wqu5gRCdefCqwpbtd2vUXDnAMRIgEx3bT5xvf1Xnge
 oGjrYlslNZbpzfZUdJELx9vqbA==
X-Google-Smtp-Source: ABdhPJyl8rSV063NEi3IG8ocGXggmOfEdTti/naonvOIWUS2jt2tI4fRRkMupcfa772VKKSfk5/IpQ==
X-Received: by 2002:a05:6808:c2:b0:325:eb71:7266 with SMTP id
 t2-20020a05680800c200b00325eb717266mr4188284oic.269.1651811187875; 
 Thu, 05 May 2022 21:26:27 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 eh4-20020a056870f58400b000e686d1387csm1165237oab.22.2022.05.05.21.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 21:26:27 -0700 (PDT)
Message-ID: <eb8bad4e-b3bf-302f-0962-b4bca68a8f18@linaro.org>
Date: Thu, 5 May 2022 23:26:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 29/50] lasi: define IRQ inputs as qdev GPIOs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-30-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-30-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 2 ++
>   hw/hppa/lasi.h | 2 ++
>   2 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

