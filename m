Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CA55AE8A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 05:48:24 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5JG2-0005Gm-Vr
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 23:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JF0-0004aX-Ju
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:47:18 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5JEz-0007yy-5v
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 23:47:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id m14so5402006plg.5
 for <qemu-devel@nongnu.org>; Sat, 25 Jun 2022 20:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=//nQCHGn6ThWBbHpmtzEpS4KytAb764mye3an85ghzM=;
 b=V/gJKPpKdpBlOksitUBLBuS8b3IofuC39WgdtbKTq+7NmhDMWSEqEJrqAz1d+67oyX
 XpJFDSJH029wytM2pBUB6G3XgPopZ/g/hGlGeSm2LpT98vQbmU35IJBT0PSrAzIxDIEH
 n5doFhIvYqiQ64Ng1BE6vMQ5XR8ejpQ2wzy5MhVZJSPLizxcV4aPYfGejipyQARR+rQk
 1YjPn8utq61Z6rat7ZIjrx2zWjm6dZHXck0/aWoBekbDduvWfeUmNh2fOfQeUUanmpsG
 cLtofqKoNcHW06uXm7CVkxQAMACNvedM/8lDBbAXd4pzpkESZ0+RBxX+3I7Ker+tT4V9
 cPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=//nQCHGn6ThWBbHpmtzEpS4KytAb764mye3an85ghzM=;
 b=nUyklBJcZBDC0Z+hRiVfrGkHNSXyTbNBM2k4eGnWnrSrPxa/4H5ocjhoXl7ValJbFM
 xVPP9Eg56/iAhA2orPKjApJek0FfoeyBIShpHOAGQQ0euBQnnNPmDdaNTvY1Sh+PalaV
 Ogaiv0Vsk3Dzd4ROZQ11eRlzt4eIFAJ2dDQMpL1I6mfJa165oVCTuLEO0YGY01BV/ym3
 OLfTgxe+Oug14hnlSRWDzfCMM1xLMY+kP9nfQiIXcrxoYYQsdVE3+npdjKvDZbJGehD/
 rf8NVBtZmysZmh9XsS10f9r1OuD66lNP2cCEdfaJAGFvPr8gF6vi9bgAgzA0U2v7wBGv
 wX/g==
X-Gm-Message-State: AJIora+4yuwK3rNk1EkWtgsJmzh1T/5XkB85PeIm4vdnqWxOd57IbdOb
 7ndJGYb9ULvexm6X6zZTZH+YlQ==
X-Google-Smtp-Source: AGRyM1uzlaBp7WnjRtx+9Ujt9+2aVU9nhzgu63ZKxWvdeBu5uWYtPc7zhtQTQd0q3nQGPX8TCmuvFw==
X-Received: by 2002:a17:902:d2c9:b0:16a:578f:c356 with SMTP id
 n9-20020a170902d2c900b0016a578fc356mr7275058plc.4.1656215235265; 
 Sat, 25 Jun 2022 20:47:15 -0700 (PDT)
Received: from [10.10.67.53] ([116.12.83.234])
 by smtp.gmail.com with ESMTPSA id
 q26-20020aa7983a000000b0051b95c76752sm4366210pfl.153.2022.06.25.20.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 20:47:14 -0700 (PDT)
Message-ID: <fae65dc0-b645-c847-8800-8f88c042c162@linaro.org>
Date: Sun, 26 Jun 2022 09:17:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/11] bsd-user: Implement symlink, symlinkat, readlink
 and readlinkat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220624214742.89229-1-imp@bsdimp.com>
 <20220624214742.89229-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624214742.89229-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 6/24/22 14:47, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Jung-uk Kim<jkim@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 74 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 ++++++++
>   2 files changed, 90 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

