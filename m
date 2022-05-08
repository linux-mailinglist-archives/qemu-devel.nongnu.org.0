Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7D51EB2A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:00:49 +0200 (CEST)
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXA8-0006FU-HC
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX93-0004vR-Qg
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:59:41 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX92-00064p-Cu
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:59:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i24so9473507pfa.7
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=jP6BsD3Yty34wG659Mr//NFfWdhS5A7bsz4rzCxx804=;
 b=U1fFN+kjI5bafAWHAUNq89fFKNRHopzXlivdFl9IQXxW+wjoQisO3ff7OUor9Ni3YL
 mr8H4wUcNm3/YjOEFQT+UNJRFA3SRYItQZ7472LN6+KH8cQVH1dwLPO7ZKRHLYuwYVFY
 XGoiEI7Zo0txJDjNKXdSrBXNKKWrAlyEZI6i/MyEtGwUqyAfn8OLjRKpjXmMufdyLFL/
 Bqd5n3btUwtbl3ZeMjHFWIr6j3+MckXTvi+FfejJIEuEO5IWG0AIm0l75gRMXnBYl9pz
 OittF3cjp3MOXHWknzHBjXIRBvEJMooCRk85uoOR0T253gsaGdo88M3ipRy45CObHfk1
 S3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jP6BsD3Yty34wG659Mr//NFfWdhS5A7bsz4rzCxx804=;
 b=hJMXqDdr1IaMph3RzSoF1kY4l/lFb+bAEgzK0aRmas+uG4vew+tRghB+aX2vuINsJI
 3Jkgw4l80cm2C4jm9kQs+5iHLCBOD/uRfHipdyuZhAbza39PEvver3dkCVRmnVr21x1+
 bjbSU5K/VNUmeSIKLAqFV8igGEtWTrUOUKCYh6TGA8GMenSLD4SEVzxXTrkKRgDvaX3Y
 tSB6QcN9zmAcSzrdKjHeSQRA51AkbhqH77vU5iRlrYXgK/2SbwGXC5/5XOdHeF4iATRx
 gCNDXdUdq1lqUPhE6CglMU+Ligzjpr7272kPSIMWSF5KmpKQk9lEtN3lbPiOVwBJXA8X
 bNew==
X-Gm-Message-State: AOAM5302qakBkUtqDBeKhGwX9itCoe1yhM9QJU2da+ZhTMkPxwaguUhb
 GZSDg+72cktggs5JdjFbiM/tMw==
X-Google-Smtp-Source: ABdhPJy1/dcyO/JfhvrqlsGkrI+ebRlSp2vweEFjvh06Fp6StR1O252VoHnrrVS06skyNo9cFRzZVw==
X-Received: by 2002:a65:6045:0:b0:399:3a5e:e25a with SMTP id
 a5-20020a656045000000b003993a5ee25amr8049860pgp.139.1651978778898; 
 Sat, 07 May 2022 19:59:38 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b0015e8d4eb1bdsm4306787ply.7.2022.05.07.19.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:59:38 -0700 (PDT)
Message-ID: <b5d4ed2e-2918-feb1-5d21-f614ece7a3e1@linaro.org>
Date: Sat, 7 May 2022 21:59:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 41/50] hppa: move device headers from hppa_sys.h into
 individual .c files
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-42-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-42-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
>   hw/hppa/hppa_sys.h | 3 ---
>   hw/hppa/lasi.h     | 4 ++++
>   hw/hppa/machine.c  | 2 ++
>   hw/hppa/pci.c      | 3 +++
>   4 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

