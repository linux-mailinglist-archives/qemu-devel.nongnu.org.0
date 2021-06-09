Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64E3A1C6D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:00:22 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2V0-0004Wf-Mx
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2Tp-0003fL-U8
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:59:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2Tn-0003vs-SI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:59:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so1910568pjb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7R43pihCNbO1Ja78DuYtPcsCdjbL2zqkvfu80mAU7OM=;
 b=IXEHw9S/iCy+u8I1i9dEK/K3YacFlTtK13VfuRBd2zSrSBqF+VqF7qnGE7dkzc/DHT
 SVN0Uki9BZNC3BswZYKmr53ub3eXk294ouB0GiTBTBW5K1h1ZZ9v65CDuIToaqPCAyps
 v+hNdlta5UW3a9Izqvfu+W2LqtyU0rFHM4zwh0W5WgqZ+DdKyfWwsoXG/xwy14O6kDw6
 HdKsCUvG2jNxBp7a99wbcO9BYBofN9XV4zpXpZRKuKvcJf39XWGdj/vxaoRF0hCK6WYH
 ++IADOOOCko/C0c3ML1yGc86bsPYtaZjEpmJ4HBHTMtoB2cp0RzMRKD1vkX01tYx1hfE
 WvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7R43pihCNbO1Ja78DuYtPcsCdjbL2zqkvfu80mAU7OM=;
 b=Yn5KcT/HH6r1eFSwE6NxGQ81HuVMNUgwrb4tT+B7oVClbBN7GkyWvuYFzrz9jXzRJT
 4d7vEAf+qPFH/xEgKrcblmGtOPZQyZj44Hfvb6O/PTKgqKy6k4vgc8TPF1jzD/dufayQ
 lMGKBRdp/GZaRoI3Xe8zKlrMs3mNCWY13o/vByi9A5dH5zx/s5qsg/6RyJweexzxCGx3
 98FkSQ6oLcsk+Gc7owXrgXg5diWyAFVi9o1UpiX2Wgw0/HvQ4QX4XEaJX3zH3CTBP0BL
 kSHSCCBgNzNdO6AyX7b9wT9dHoZsKDBgJ2St1wlpogYRkGuy0sDDe/dQxo1xywjb8ECv
 nihw==
X-Gm-Message-State: AOAM533pGKpwr/g+LEGfOj1D5KSw/SSbvDAYdO3wHX2ka6gPVyJraCtl
 LjZcX/S3or0DnKcf71DWH5krUuTJPXFPHg==
X-Google-Smtp-Source: ABdhPJxCHhUYdUuFgPoppk2TCHkJQ8AapmPQzR6D9D0nKrNPPVaj7E7hR/0IzSAhxqZFbFm3JB9v8A==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr720741plx.50.1623261542077; 
 Wed, 09 Jun 2021 10:59:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b20sm402557pgm.30.2021.06.09.10.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:59:01 -0700 (PDT)
Subject: Re: [PATCH 33/55] target/arm: Implement MVE VADD (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ba48400-fcb8-3501-7781-1021067ba06a@linaro.org>
Date: Wed, 9 Jun 2021 10:58:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the scalar form of the MVE VADD insn. This takes the
> scalar operand from a general purpose register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++++
>   target/arm/mve.decode      |  7 ++++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++
>   target/arm/translate-mve.c | 49 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 85 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        MVEGenTwoOpScalarFn *fns[] = {                          \

static const, which I will quit mentioning.


r~

