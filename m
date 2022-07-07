Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E3956A085
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 12:55:27 +0200 (CEST)
Received: from localhost ([::1]:42856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9PAL-0000bR-MQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 06:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9P6h-0005O1-4l
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:51:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9P6f-0000ZD-Di
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 06:51:38 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so11836108pgb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zXv21xMl2ve6JqAeGIzFK5vntPPf8XdQ74TibMJ/v9o=;
 b=XEm8E6k31yzFQBrkHySGwlqLnYVspR8eTqokgPGY1Te/6ripcv7+bR0vYfTqhQLPWT
 p3Qxca0T/hcu8tALnMk00eu78Ut3nuENhGy059snR+g/yhAHiqMCWW6ftjTCHRK6GdyV
 VDdrIlJlkLiwtq0cc+RK0Th9vNBIRcVu2DEhWENtPyOoKYxEREtgu92bGO93nqwN7z5L
 sWFhG0/fEr4RfEavIpvBzzX5D/PHE0eXW2Mzp2s1Z+ATmr7ASduq+Ldrou1XoiBXBRTo
 UjdV6kASl0ZtYJpUb5D+Bk1UfvW3mkam1DVBHDbJinqyes/j73ooj6BsRLPfDzBJN4Xc
 XZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zXv21xMl2ve6JqAeGIzFK5vntPPf8XdQ74TibMJ/v9o=;
 b=bszKnhaDQPe3yTL2zadxJyFO0sp8HuiXZF/rpv/aKq38//zbWaY/6OhCxSrW2Vochm
 Rb+dyo9vVk7WAFxVnggiO/UPzWg374JWAEu2rsJuASUSGUVl5MrxhY+p7inLfYRIeETd
 3hFCb47br1vVdmyHt/+jxtzHK7Iv8ugAgQr0hRkFyATdnhOp5UantRKlgpckeW2yduxk
 Yv+VyIgj3eVbd98ABrW+zE//gHEB2dpxP4/2QKbMSy+fDdLxFwXedDukgkL/5fin2CPM
 NOX2jJWEP8hh2w7JdLjoGhiKS3FyOuNrqg+Y8Jqs6c2or6mS8pBSysoVGExvt+kpRwJS
 EicQ==
X-Gm-Message-State: AJIora90WycM+s3VvPMCEbxO6QtHaH3URmnBxrFOrGXnXsiCEHGZl6kq
 emHpqC+4gGop0JsSKPwCMHU6DQ==
X-Google-Smtp-Source: AGRyM1tfwvqM/lPuqWHmh7OkKY2Df5pBbLnKsRpXt0dg2f1u3yy8MQgtjlPuAsllF+zkzKTBtGmCiA==
X-Received: by 2002:a17:903:240b:b0:16b:8e84:f22d with SMTP id
 e11-20020a170903240b00b0016b8e84f22dmr53011245plo.128.1657191088874; 
 Thu, 07 Jul 2022 03:51:28 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b0051b8e7765edsm26723092pfk.67.2022.07.07.03.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 03:51:28 -0700 (PDT)
Message-ID: <5e412493-5892-59c8-b4f1-a5ea7d2ec3f8@linaro.org>
Date: Thu, 7 Jul 2022 16:21:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
References: <20220707081247.1416955-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707081247.1416955-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 7/7/22 13:42, Stefan Hajnoczi wrote:
> The following changes since commit 8e9398e3b1a860b8c29c670c1b6c36afe8d87849:
> 
>    Merge tag 'pull-ppc-20220706' of https://gitlab.com/danielhb/qemu into staging (2022-07-07 06:21:05 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to be6a166fde652589761cf70471bcde623e9bd72a:
> 
>    block/io_uring: clarify that short reads can happen (2022-07-07 09:04:15 +0100)
> 
> ----------------------------------------------------------------
> Pull request

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Dominique Martinet (1):
>    io_uring: fix short read slow path
> 
> Stefan Hajnoczi (1):
>    block/io_uring: clarify that short reads can happen
> 
>   block/io_uring.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 


