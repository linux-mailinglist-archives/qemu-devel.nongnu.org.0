Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203D5668D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:01:49 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gJO-0005pC-P8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gD1-0008O3-Uu
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:55:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gCt-0008LV-Og
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:55:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id 5so4803530plk.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ysA4G85m6u7pUfZTGXXnRRZszkk94FAgB9raBCCxHwQ=;
 b=tjlhCU/kO+wpLjdsAvqPjakmBQ0xuVjYabi2pv/HA2/b8iwqIGCw5RvVw5RfDuoLZE
 EVTaT72zMVBcFXzSGhAx5dRaOWEvWPIi77BoWZ0p9GB+YHN8plng9fAYhuaojlq028HN
 heQYQSA5H9TYH9o87yW3qOG2mEaEdR3wmyRC3BsR6CrhG7mAamMK+st7gzBsiXQ9LaNv
 iQMYpLarjDlINUsSvPoqirp5x3wIpbGV0mL3fbp1vIBLzOAzFCfLgBK7pUCMz1AXKCUI
 N9Y/dGFzmthwu+UErkCgQ6pr2WUQeY80n5Jr5plzhe8JAyKx8+AMNPDmHAMlDmkRWLR/
 iFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ysA4G85m6u7pUfZTGXXnRRZszkk94FAgB9raBCCxHwQ=;
 b=nNkjY/OeKgX0nmA1E+P/yNXSXuGChujP9BR1Z0blY7XAVMSz1/HiYEyB+Xbm00zIMA
 GC115dGeoOy/6UKx1VxpFDVC/yLbY66goPCdlLRFxDBMx4/aW+5fNoZ+KKB3YMwkoivQ
 m0mlJTL5jvhDqVP+/Y0O4Sid+vBYQaatGTrc5inz7n/2gaDSovyQcb1/geTFWWg55kao
 bzq8rIqTAMP70uN6WiJja88DQPNpduenZuUn3klx94TTCiy0Zhmy2mtsiLwBWezNdVIX
 SwRVQ3VVQ2LmyAuNI0jaowQ3ZZ90HquhkjtdjRngRpuokJzNC5qgKds0AN7Oz/l7tjar
 aTrg==
X-Gm-Message-State: AJIora8QXTEuqwNkXnbGNTGHImJHGBzVmiz/tXn05Oful8HUyhKe3DMW
 A3q9sa/UgmQSh9COOdCyF2F1Gw==
X-Google-Smtp-Source: AGRyM1u8rZrwEhPlThTi4fzA2tpg3Qp4hcE1iprccy4iQMZ8NteA2ork8s3uElSSxysE8cbfRlICrA==
X-Received: by 2002:a17:902:8345:b0:167:879c:abe8 with SMTP id
 z5-20020a170902834500b00167879cabe8mr39906821pln.7.1657018502290; 
 Tue, 05 Jul 2022 03:55:02 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 v3-20020aa799c3000000b005284d0fc634sm6477302pfi.97.2022.07.05.03.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 03:55:01 -0700 (PDT)
Message-ID: <c831467a-2114-66c8-0505-317a6190db3f@linaro.org>
Date: Tue, 5 Jul 2022 16:24:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/2] Fix IPI device emulation for LoongArch machine
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220705064901.2353349-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705064901.2353349-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 7/5/22 12:18, Xiaojuan Yang wrote:
> Fix LoongArch IPI device emulation follwing Richard's advice based on v2 version:
> 1. Change ipi64_ops' valid.min_access_size to 8, as it only support 8 bytes writing.
> 2. Remove 'UL' prefix in send_ipi_data().
> 3. Add a condition to skip the method of geting write mask in send_ipi_data(), as the mask is 0 at most time.
> 
> Xiaojuan Yang (2):
>    hw/intc/loongarch_ipi: Fix ipi device access of 64bits
>    hw/intc/loongarch_ipi: Fix mail send and any send function
> 
>   hw/intc/loongarch_ipi.c         | 92 ++++++++++++++++++++++-----------
>   hw/loongarch/loongson3.c        |  5 +-
>   include/hw/intc/loongarch_ipi.h |  7 +--
>   3 files changed, 70 insertions(+), 34 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied.


r~

