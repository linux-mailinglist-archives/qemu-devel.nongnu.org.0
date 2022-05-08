Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1151EAEF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:37:04 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWn9-0000Pz-CA
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWm3-00089A-Kc
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:35:55 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWm2-000369-14
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:35:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so9990133pjb.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9bOLjQ6OQaSvYkDjs9wzpKpnaOGYLnYO7Tp9sf7Hedw=;
 b=o/ArijI+OWb69cUkmKdXmDriLmVoSmoK6fTqwjP+85M0AxBx+K+5M4rolYD20W07+x
 Hq+ROLGrXgADCmsOavEi9iSEaHdeYe9ftCOOiGyF4LNMza3+lowHloAlqFt9O6+sjyyT
 d0ywMvHD6HLqqUQ3oBhGuLop41Vbwkv4GE6bYb679ycaOimTErOh5ODCJdRlI7EFZjRA
 fJgvyJTxMh1uZ2zcNy8Guz6Lx+YkftmrEXtuqtGqSPg4c1eBlBPvNjK3R9caRdbKPvU+
 WEm/yyW+qIoVcMxQVFzuj5nXVCb88eakr3QQBYDo6b2UH895vSffZltUHlGyEBsvX0Yt
 3u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9bOLjQ6OQaSvYkDjs9wzpKpnaOGYLnYO7Tp9sf7Hedw=;
 b=iUbq1+tK14peQpck1bTYovqmATVWmqUwmltXJIP3oKQ18TAHo2VstdUKdvNgc70kaI
 D0Vn29EcDNzFFO3QNXCnxUtCHs4m0/XUp3yElUpcQFLfimQFmZh5SL8gauFQ2kM/DFx1
 hvaWAxwm30FZqJWsagUc/L77t/S02SCmFIPqbjX/zYMCOPfF/aES6AdIpG1Ju0O2x+G/
 KX3A4JrLMGnvRycIWAOjBn6+OkkE0PPEoaLfQiUL1EmxnoqPPg2NUFREY4X4wdIYjFBt
 S7KcaW5XS0A1WEsBS8H+3Z397LQGqrrU2xpUeTwBVVGg2zyki/vDii6KAFaMrAxxC9D4
 fkLA==
X-Gm-Message-State: AOAM530PzCfFsZve4vZN33gpXFolBku16Y0LY8RpVU7MMV30OgZ1Yuih
 zx8KlZGHX061T8NLMIC4dFQtlA==
X-Google-Smtp-Source: ABdhPJw3YPFNxlGXMaFAfBBsC9VfQW/KQ+qyc670nZWD8uomiUGfO61lN0VTabgk/nBKk+poOB9nkg==
X-Received: by 2002:a17:902:9a49:b0:15d:1da8:81fa with SMTP id
 x9-20020a1709029a4900b0015d1da881famr10199783plv.114.1651977352469; 
 Sat, 07 May 2022 19:35:52 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 w6-20020a627b06000000b0050dc7628185sm6003234pfc.95.2022.05.07.19.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:35:51 -0700 (PDT)
Message-ID: <1bb52b09-a165-0c14-693f-3b9320c7fbd1@linaro.org>
Date: Sat, 7 May 2022 21:35:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 32/50] lasi: update lasi_initfn() to return LASIState
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-33-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-33-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
>   hw/hppa/hppa_sys.h | 3 ++-
>   hw/hppa/lasi.c     | 4 ++--
>   hw/hppa/machine.c  | 3 ++-
>   3 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

