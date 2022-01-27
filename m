Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCD49DA8A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:21:08 +0100 (CET)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCy9a-0003SI-TD
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy54-0001qn-Cw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:16:26 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37840
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy52-00035J-N2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:16:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so6556245pju.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JqcU+2hrSBNRok5K9vUkkV2LS5kOy/Q29bBHCHzcWg4=;
 b=m9fk4nZ/V4ZhGy3+40qtvXM8QaQ6J3dO6IUxBM3r7FKvu9c6AqL0JyP+jCfYi/sHd7
 SVREiCuxBW241Mg0/OJwAHEUZYRD1B3MeusJdJRtNgU6EgNM6zDlSLKWgRtnVWhOf4N5
 rB5BcOXKeuw6rkQJd827zFpvFR17Q9ZvanNe30kxYeFs1C+vaDebwIjMilRNBl8wSule
 Tkkb/wGkHefkIR4y1zgaHgqsQlim/r0Mx6ZQ8dfVExwgsOrXtpJ7foZHQJjRjslMy+KQ
 c2wrWUWIGZ6OCODXGPHi8ymgnWyA70ZhgJMnT5vtMBdt85NfJQiSWo5rWlvb6kkvuCIW
 ZfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JqcU+2hrSBNRok5K9vUkkV2LS5kOy/Q29bBHCHzcWg4=;
 b=iGqVzu+Pd56h9ArQupjLTRJqIH5AWyMjM5nKNbLj0DwISiqKwl8lrfwff/VxN+q1po
 6TwgABxH0v235kTyp5oLj10cYXbi48MmwQXJU641dIxzX64Gjw0koaqcOQS1aLk9uXrY
 2FG9VmgEACD4GbRuLCGcvkphfplYDkZ+KtMUXZH41U+f1dnAeaFWrE2muXwceciw66ta
 /6YFZpdprjdT7Xl+iUISUPmxiIi0fV+iIh7VC3lI1sbDiWZcj6SuvdIRUjrn1eehosCx
 MbZBd2rylKipT/54ObGVC03qPdR3mC58w3wQ5uMlpT7oidLUX0oWv6ahUcFdYjueNABA
 N8YA==
X-Gm-Message-State: AOAM532nocfQCe+AFaKGkYzd22YWwbMSFfZu80Cr/bqH7XycJw5o3JTp
 ZySRtfOiQIggrl2Yy3Sc7GGI8g==
X-Google-Smtp-Source: ABdhPJxRVfshfyPRmu2lkmE+kAShuyOITRJjc+t2krA2V92y0lbL88HyhMzEDzCSjeAdOeYsMy8o/A==
X-Received: by 2002:a17:902:8483:: with SMTP id
 c3mr1594454plo.19.1643264183128; 
 Wed, 26 Jan 2022 22:16:23 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id m11sm17965167pgb.15.2022.01.26.22.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:16:22 -0800 (PST)
Message-ID: <42f4d47e-ae55-0d8f-c8c7-0fca56f57684@linaro.org>
Date: Thu, 27 Jan 2022 17:16:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/40] bsd-user: Remove vestiges of signal queueing code
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> bsd-user was copied from linux-user at a time when it queued
> signals. Remove those vestiges of thse code. Retain the init function,
> even though it's now empty since other stuff will likely be added
> there. Make it static since it's not called from outside of main.c
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c |  9 +--------
>   bsd-user/qemu.h | 13 +------------
>   2 files changed, 2 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

