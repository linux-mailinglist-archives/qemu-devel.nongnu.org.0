Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96243AE02A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:14:31 +0200 (CEST)
Received: from localhost ([::1]:37538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv3pu-0007sq-3B
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv3os-00072O-QU
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:13:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv3oq-0007sE-K4
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:13:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so6913798pjo.3
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4CvaUv8lFZmF1sxTUqvV33ndo+jDG5szRdpRqRM7UqM=;
 b=aXHc/6SkDfVP80k8/XN9luGP0dLEL42Ybual8wUdTVJNoanidiaunUxGltlSCD6ALJ
 +hJCkoGeUzqf0KcryRKldypWw8QLifADq/ZQMJ45g+vVRkmvOwbqXha2KR+v5QXvDnTc
 /Q5BXp6r9t2qnJyQtk7dp42RHu1+OzUsvIvrXFmGhLvmjAumZ5m0zek+Aub/2s5pqk94
 6+EILla1TJyEaap6LA6o/HqeqGNZWFtDOp1xYbiMXrqFfGZ3N091yJKD2aD87AodSWPB
 3Hj+6FLu6Mt0S644jWODG/mzP+10ODDqwQ7znI6/FTE+8X//KW2B6eylSCtOoEZuWy36
 VXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4CvaUv8lFZmF1sxTUqvV33ndo+jDG5szRdpRqRM7UqM=;
 b=abzVEzNlHoxvsidjrMzeGuHBeAieG5e4vmB3LL5p4lW2F/CO3ZI3poOYnxKM9jBbu5
 HJJMa+ORmefkUFO+MuwPzBWtk9q84qqbdEDQxEuX074WJakIAGMpFY6gnBKGw3+wmYkN
 B+bw4PUmugZva4iVP5/2BqNpTKdye7SRYDh0z57WXLVWmL0ngTtC5u7UwEETT5v3kJsP
 fhyERUgc0XJQuNCTKFJq+EdO+14opIwpjyC9TRjtEZdR+bitp6KSOsLOZIMWmicsgPfd
 rMDT0g/3JG0mKIlhrrhNbZXgxKXEUwT8IaxRk3MJkYtwjjHx0A0anDF9z1MvW99m5DAB
 UpcQ==
X-Gm-Message-State: AOAM531xwKO1rY2MCV92UBRpkEIQleEfYfqmKQ0tOa002dQu6JAeuKDZ
 4f4lI9uFgUg1LSDiYq9w6XTPXA==
X-Google-Smtp-Source: ABdhPJwTZBZk3BgE0bt4fyAXlHSygjis/L0J0c8Om0FugOHE3lG7N+zXSD26FX9zsEL4GGyvO/D30Q==
X-Received: by 2002:a17:90b:2405:: with SMTP id
 nr5mr22258886pjb.184.1624220002298; 
 Sun, 20 Jun 2021 13:13:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h24sm13577509pfn.180.2021.06.20.13.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jun 2021 13:13:22 -0700 (PDT)
Subject: Re: [PATCH] ppc: Replace TAB indentations with spaces
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210620180410.10837-1-email@aabouzied.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3db1705-06fb-91a9-58ae-df0472cfda21@linaro.org>
Date: Sun, 20 Jun 2021 13:13:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210620180410.10837-1-email@aabouzied.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/21 11:04 AM, Ahmed Abouzied wrote:
> +#define IH_CPU_INVALID        0    /* Invalid CPU    */
> +#define IH_CPU_ALPHA        1    /* Alpha    */
> +#define IH_CPU_ARM        2    /* ARM        */
> +#define IH_CPU_I386        3    /* Intel x86    */
> +#define IH_CPU_IA64        4    /* IA64        */
> +#define IH_CPU_MIPS        5    /* MIPS        */
> +#define IH_CPU_MIPS64        6    /* MIPS     64 Bit */

You're doing it wrong. These should still line up after tabs are replaced.

There are tools for this sort of thing, sometimes built into your editor, often called 
"untabify".


r~

