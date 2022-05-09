Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011451FE05
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:22:16 +0200 (CEST)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3L5-0002bW-7I
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2wH-0001ag-Br
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:42 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2wF-0003c8-Om
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k14so11992507pga.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FjBr4jsIJ9E43l08DxDuGLfEW/Re8KROVLuX3jdAIFU=;
 b=BxvmmCT1wAl++lKUUTtSwAXcH04afmV42mCmbQGzz+PpLK4npvGjTPY6+H8MDC0wKj
 p3yVyE4eF0ZTT8gy+MOhE07CXt2+DU1dac7iqaheiF+LLLGIT8691aqMlgdRGfmRdaSh
 UhajdD4N5Dw/6tmkGkooCwZGZ17BAfhefJHlrnZWLB16MCssJBxuJpUJbd7uqPOpKdQ5
 xpLTbZU4QEuDf/J+3xPFpiEC4Qmu2R3R09CQtKcKmA4LbUMb93Jxud9G1d07HSiRZ9gO
 iNloJ90ZbLdHhBxaTtOgDo3uHB1FioVYk8w0K0SkgPSJLrP+cT9lWW5WUkimfNRHazMH
 H70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FjBr4jsIJ9E43l08DxDuGLfEW/Re8KROVLuX3jdAIFU=;
 b=7uUy+EwYkCFJnU5VilGkZkizDtsviXZODV32R9GZHoK8yQSdIrAhLqevzd7wvZLS2k
 PsbFMuYiMZdmsvK6JCvycy8zICyhqbNXQsXJ1xJh6crpf+k25K/0hLFpbw3rBxtlIOYL
 pV3gI6fpC+OhO4Hun3E1yvdBV1uEGNlB/iLwKcz+e2X9jMSDCTWJd6VkKEajeHzuhDej
 JovrF+uuDPFDGwpbZjHH0Nr9UKPxD8q3iuaIjo5YDHR5b89JlQtScxOCtEaFyF30mq6e
 iY8FI+rmNIdPhW5lVpbnDsT9x5ZLkiHg5QXG0NxpPC2fwyNNxTSOdZJuWc+19unCC9kG
 ZaJw==
X-Gm-Message-State: AOAM5305Hh60JEtE8I9BwxjYCyymoGAVYWYKG9Bxi4iVUfJDUQIl4t0i
 xeLFuFg2JcAdO7bslf4kMC4=
X-Google-Smtp-Source: ABdhPJwcabBTxSQpRk6Q+2lAy90khxGhIIGVHf98dNg9LMGYOe3DHiMY5g1o9CZyR/LJC9IeHEeM4A==
X-Received: by 2002:a65:6e8b:0:b0:3ab:a3fb:e95a with SMTP id
 bm11-20020a656e8b000000b003aba3fbe95amr13081163pgb.433.1652100992667; 
 Mon, 09 May 2022 05:56:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a17090aa61800b001cd4989fec6sm12609784pjq.18.2022.05.09.05.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:32 -0700 (PDT)
Message-ID: <536602ec-c4b1-55dc-3b8d-a4f4061d67bf@amsat.org>
Date: Mon, 9 May 2022 14:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 6/7] target/mips: Add missing default cases for some
 nanoMips pools
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-7-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-7-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
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

On 4/5/22 13:04, Stefan Pejic wrote:
> Switch statements for the code segments that handle nanoMips
> instruction pools P.LL, P.SC, P.SHIFT, P.LS.S1, P.LS.E0, PP.LSXS
> do not have proper default case, resulting in not generating
> reserved instruction exception for certain illegal opcodes.
> 
> Fix this by adding default cases for these switch statements that
> trigger reserved instruction exception.
> 
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/tcg/nanomips_translate.c.inc | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

