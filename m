Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9A436C48
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:40:06 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mder8-0001fs-1d
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeSQ-0006ru-Ue
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:14:36 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdeSL-0000iI-7s
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 16:14:34 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r2so1279946pgl.10
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ipYEaxqOvHWI3im410fWBG4HfLXfyfmKJty20qHVUN0=;
 b=vIzyxnyPgLMHSjdtL7UPBBHwv3zDY3UOMQTPJM/vp1kcDgrPCUdfLd34LRUjuEpM6P
 MLsoOXtyAH0Ct0oElz2UNGYcRJ1qGrHuUe1bqFQmsknPlDRMV2yW3taeCV6SdRVXR2CM
 eHAkjel58rk+b5LwTGL9m8owUGCeRkVslU3nNwUvXsw9V4T5BaOdPokhN26N+FK+0LC8
 nAZbhyopOGeT1BEbn6Fm8qo1OlSh+0eSbfmTBU0Y4Bm+MfaxzUOSzLbWPqC8Dtgs7fHP
 /VZMBCeZH6gmonHaqJEo8vznMbWDS7hNSBgKqpvu4536l54kebwuJcSD1+K+HNaZ7VvK
 zH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ipYEaxqOvHWI3im410fWBG4HfLXfyfmKJty20qHVUN0=;
 b=Jw40gr2QuHvOvfHRPCwJTUiV9ASijszJZSzJZaQIiYtJZId2AkwptyGHTN4VJgn4LE
 wVvEYAmX966aEXYKVeExhsxYRafMDYRlklSa2C+3U2hqr2R4Sj4F5bDlkTbxxLVZl//k
 iT4NePjTkUbgK6ku+LIKUspbZf79a4BYNBrudXFSZd5zIqvZiAJhE4qz1rVCSqyivL3h
 Y56MGBAQX+sYOuqqoSeMpCrLvOD1fAJKd28xLJ+wz2yE6dVSeK+M1qhfG9DGo7HmokeX
 sbWr4nbtkJDsOxXtOVBpvoNon4R3RSosx2l1u9eI7JBqTxHPcyVC78RPlToSO/6OkbtS
 2VtA==
X-Gm-Message-State: AOAM530+n2PGhmJcVfKoVxtMGbtFQEr1hk+YVkWlFmbcXCP7Or0ymXnZ
 /OLq3DF8e5WQjmTGUd14pNZNNQ==
X-Google-Smtp-Source: ABdhPJwftVj+AAOqUKPrdoJOEDJe/o4rSdVYvawZM/f1WdQhcxMuZLu1fSHL5LwDbY5sTR1BIksnew==
X-Received: by 2002:a63:5544:: with SMTP id f4mr6082395pgm.431.1634847267735; 
 Thu, 21 Oct 2021 13:14:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id il17sm7316085pjb.52.2021.10.21.13.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:14:27 -0700 (PDT)
Subject: Re: [PATCH v3 06/22] host-utils: move udiv_qrnnd() to host-utils
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-7-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8aff4832-2c40-09f5-4f20-e2121067a4f8@linaro.org>
Date: Thu, 21 Oct 2021 13:14:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-7-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> Move udiv_qrnnd() from include/fpu/softfloat-macros.h to host-utils,
> so it can be reused by divu128().
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   include/fpu/softfloat-macros.h | 82 ----------------------------------
>   include/qemu/host-utils.h      | 81 +++++++++++++++++++++++++++++++++
>   2 files changed, 81 insertions(+), 82 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

