Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2F39CBB6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 01:28:07 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpfi2-0001NB-IH
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 19:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfhG-0000fl-Fr
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:27:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfhE-0002ij-QY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:27:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b12so609401plg.11
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JhePnmuHoN47AdoP2PFzIYHJDw+ZqmEAdEa+hOnnUec=;
 b=i1o4mLzvmIw5yw+d7WXAylaDs7zJDCG38xRaPlbknSwOM3yMHCdObiV2g14kyvmrj+
 EriUmd8yU070hwU8Rjp+fY69+I2u3VdtVsl0H2y5/XFgIqSrOljfloP3zE9v7hhospdG
 zIZgPKuSU03MLY+2/DlPUSaeD2+Kr9AoIsobVUWqXrwSRw/zS/PaUX9a6v8rvMERyfMA
 SMd5E71v/8E3zNefEPHohZw84xSo15YUWmHSkXbPECfjvPJtGgeZ6Bm1sB2/BjNTFjhj
 SuGc+yt+yPUAH1SeLPiH6LhqGsnMDh4hUIZYnFtC6qHaDWVDWHP6shBib6CQZC/iLMlh
 TD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JhePnmuHoN47AdoP2PFzIYHJDw+ZqmEAdEa+hOnnUec=;
 b=TDE/abxCBFAMrz5n2miZ9yuY8M8LkVaYzrDvondfPh9tYV1QQhM8V/OqsFbnZuHFPD
 3Znpmz1LNl1DGs+Ok9vcWxHQ6Cp+Vk43wKkd3gH7I9Qt5WuqX8jpU0iIfjwKUugu3934
 gHpOf3MSSY33Zw9X3TDPCgeH9UrkdbmkKU8Sad4jCfQijCLpab3eHLdDABVnq/s9q7rp
 APMt4ZTDqXkdy6DiuqO90MuTEgQPsPrIBJRkteIgtGka9LyBIFRIrB9qd15+tugoT/r6
 bNiPgAFiQvMuH3oQOJT5DXawpGFpmbminfoC0YXmgIsoFHEd7mkoy2gY0dn85rTIIjsH
 Tp+w==
X-Gm-Message-State: AOAM533krMx3yLbFTZZFVS57zX8+KOXfJuX28CH4moHGtbyOGzhUlxNK
 MHEy1Px3jTji5BaEg00C7LVWSzylwZ5FFg==
X-Google-Smtp-Source: ABdhPJyHm3Fjj1PA8wTit+HacPsVwMBLmBHSaguNl6UxacHEfurwVzbUeYCDp6ROnoX9U4lsUdFbUw==
X-Received: by 2002:a17:902:748c:b029:103:267f:a2b3 with SMTP id
 h12-20020a170902748cb0290103267fa2b3mr11035590pll.23.1622935635055; 
 Sat, 05 Jun 2021 16:27:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h13sm4496363pfv.213.2021.06.05.16.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 16:27:14 -0700 (PDT)
Subject: Re: [PATCH 1/8] Make qemu-palcode build environment standalone. NFC.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-2-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56321c00-ce2d-ed18-0c9b-bd40bb9dba05@linaro.org>
Date: Sat, 5 Jun 2021 16:27:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-2-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Don't include system headers.  Instead, provide standalone definitions
> and declarations of types needed and functions used by the PALcode that
> are compatible with the standard Alpha / GCC ABI.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   init.c   |  2 --
>   memcpy.c |  2 +-
>   memset.c |  2 +-
>   printf.c |  4 +---
>   protos.h | 30 +++++++++++++++++++++++++-----
>   5 files changed, 28 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

