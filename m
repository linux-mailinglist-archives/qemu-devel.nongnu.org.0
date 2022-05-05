Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7751C6BF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:08:39 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfu2-0002VM-OH
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfcL-00061S-JT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:50:22 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfcK-0000rP-6K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:50:21 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e433d66dso4935484fac.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=F7vLNTRbHdf3aol22CDwLtsZPntUOHVtML43vGdl394=;
 b=YqaySX/T6Aq4asQcDSBVMUgeWOcsUoELM2MzgQWMluISbpR5GXSH5F3MAmgJmyVVLU
 SNaARAcPwURG/2ow1mM2DUZjqxtlpylDSz0EUweOJYXFVvWPkm86TyHh9hvj9ZZj7iHH
 j2aRTBCbfjPBEmAOgniO0z7sjYOG/qFDt+8IoiuFmGhjuuGt2wgDbZglixvjw3kshQGX
 GvZ7HV8wOaHVZmL4A+F+hsy86gj63LapC4AKSsPf0ODmSo6q27T2Q0i4Y3q6/xas9ARM
 ImUksnvulH1rfJtaYvWeZLgJUQzTkxo0ulSu812sN6SHxREmBXuBD0Yf0XO1RnQJP00/
 YKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F7vLNTRbHdf3aol22CDwLtsZPntUOHVtML43vGdl394=;
 b=x4DG0WfzQecB0P2VeOf8QKoXlAQvS/o1VAoAqlxHlyLU8CUGsUL44QhS3Ei2mXrnfJ
 n71fyS+BrNrnG4igX/AtiOY2N2ZQwGKexwtO2w6IOiEseXSjIihuM6ao11Vebf2aOtCo
 kAWZY5SFU2ZzxYt6DgXkS+Bj03+Dqq9RTrAdZaobnozPZtcKKelwnyA1OwMkEmVmMnT4
 3LQsuUE8yheDYPlDAW3vt0nsjor2izC/PPPacyvZeduBMdnloKXcxGRYQ8RPLx6Kh6Ck
 okKC2REDuHgWJd2y54TUnuD1Tzcw0gGJAyH5ed2WFOkdHfliMTBIAIeAXEqhuob1NDmy
 RouA==
X-Gm-Message-State: AOAM532xOXCbP0ey4imqbRY7a4a8fRXftZ2tEednAlEtYDIuhtT7p5EH
 i6SG7FjZ4KxeiUvbQPTfEYWFEw==
X-Google-Smtp-Source: ABdhPJz5kGwSQIhpAGNKZC9rRtiw6oUiS8y7xMtCYssDBNoKsXyfQDOdDH0/4VCKOWc+O9KRqgaokg==
X-Received: by 2002:a05:6870:7084:b0:ed:d709:34be with SMTP id
 v4-20020a056870708400b000edd70934bemr2781296oae.4.1651773018865; 
 Thu, 05 May 2022 10:50:18 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a9d75d5000000b0060603221279sm786263otl.73.2022.05.05.10.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:50:18 -0700 (PDT)
Message-ID: <768aa292-c6d1-79b6-376b-f5f2d6794f44@linaro.org>
Date: Thu, 5 May 2022 12:50:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 19/50] hppa: move dino_init() from dino.c to machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-20-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-20-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
> Now that dino_init() is completely decoupled from dino.c it can be moved to
> machine.c with the rest of the board configuration.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c     | 14 --------------
>   hw/hppa/hppa_sys.h |  2 --
>   hw/hppa/machine.c  | 12 ++++++++++++
>   3 files changed, 12 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

