Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFF51EAE3
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:22:22 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWYv-0003xP-0p
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWY2-00036R-6P
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:21:26 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWY0-000176-GC
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:21:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q4so8035717plr.11
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=k4JeuQo/hi3Wi8k+CoT1Bj14kaZ5LSaPbz3ceKsxctE=;
 b=hm7f/scQU4Vp/Z4LUKn03N5UhWE5l1UPM3VwpX8HShByNphaD+PdlyPupsOaVAVhkB
 y6x9EAWCf0Ty/O6TTueRIaEmxBn0tKjbjiNRJxngMYbWY7946zv5PWOnC755tlHjteMW
 kWC9QZHxWisxHhVjymmDrMdJGnQeYgOVO47uy/Qd1fM1T2kxjeWZ6zb3R0y6RitaCVNm
 BdchBqDXBABBmweZL0RWBV8aPeQZZyq/j9er4XFOGdGvEj7V8JsP3f+4mCjyxGcrmjC/
 4BhaMo2TFb5vMvOf4GlSYmjsV33QTRj+IydeGDlUa+fbWHAKnBUNV2q3zZoOPQcwgaCa
 +tYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k4JeuQo/hi3Wi8k+CoT1Bj14kaZ5LSaPbz3ceKsxctE=;
 b=5BH6ZMfTrxhrkiOsvdDpt1iPoP4ooS/U4yVUzPCNDq81r4vfOTqFyDliJduMNmOxPo
 jG2sXx1f2fcMhBMKW2DbDzqeJTkCpOHj/rM/+cmmql8QeBLLPhqxJIKSGXPaCWl7WLi5
 QXBAquySWIspKlKige66WOxVkmHXICNMZkcD5hKrenDlb/32YfOd6ed8/TNhQS2XBRV4
 qb+YGPEvSzkjxFr3H6uQcG6zoJXaxurBOdnBbGYdQsuW6f6BJi9H+xzbn64Qd7DemlPp
 lq9JY0Ozn4wwSqjL5BOfA6C19JaDgoHHtlFot0xjkh3YpbLFApZTqxokCB4gatmuMKi2
 JxdQ==
X-Gm-Message-State: AOAM532hWkWMx6JELEyMoP97+HJI/EqBd/mD2ma3Vtr+Akz9fw7Z64q8
 IWD+ZAG4CfEXayuSDuwKFuQgO4b/TXiPBg==
X-Google-Smtp-Source: ABdhPJxnrmIxxZriw96dQM0gB0fT5ACKHliljLKibrT2DVDNm0NnssqzRose86Jo8wwVIfR3/nHO3g==
X-Received: by 2002:a17:902:7d89:b0:15e:e999:6b88 with SMTP id
 a9-20020a1709027d8900b0015ee9996b88mr10304428plm.98.1651976483121; 
 Sat, 07 May 2022 19:21:23 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902e9d100b0015ea8b4b8f3sm4260764plk.263.2022.05.07.19.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:21:22 -0700 (PDT)
Message-ID: <fb5feed9-89d6-2d34-043e-2afd52c8214b@linaro.org>
Date: Sat, 7 May 2022 21:21:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 30/50] lasi: use qdev GPIOs to wire up IRQs in
 lasi_initfn()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-31-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-31-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
>   hw/hppa/lasi.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

