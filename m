Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2A65368D7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 00:37:28 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuiaF-0004YC-7S
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 18:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuiVe-0000YQ-0F
 for qemu-devel@nongnu.org; Fri, 27 May 2022 18:32:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuiVa-00027Z-R3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 18:32:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso5529339pjb.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 15:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f2mWjCXjvVFI6Pc9fAwJiFTlukmW0/9eXXyxdFlx9E8=;
 b=GhPj7E1oInGKDX+XDvlzo3l/uxk7e6NKGwRNN9//R9JjCGUGr2c98nSjgRr4BfKxhu
 0w+5Lpz1E+Xx6xaCk1BmqrIbn2jtAHBX9sutLeSZnJQjAGYcs9JQHXGDEFEVZMNrqwja
 fW4+QGsLqTKLfTSsf5wlf/DXt+uwP0nDtlREx2OwalqCnnsLIFt8GBQqsINVYRl6MymM
 dFqcfTOwTkm9Nhyig/YudM/RujK0OAR1m4yAzt2TiNSy4DYRMcpX7Lfoa/i9nK/Azevn
 36uWj2+1TLZBqraC1dIEqeWx88Kf4HAnbD8Zrojdx0rno24lfBRwg9GjEVUtPPDUhYB+
 pJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f2mWjCXjvVFI6Pc9fAwJiFTlukmW0/9eXXyxdFlx9E8=;
 b=eoGVnfPlC+c+JfB7Du8ObBK/OtcDBYJ4BlGIjgBY5GAr3y64GKU8w+EKo7FmA037y4
 ousj+zlxgmrCPESwQWVL4biCiLMuRbf+O4jaN+z8uFug+bTv01tN5lZA9EaYNdY2c4Ak
 yZpmM4UWwtmMSAA5aSIFMiLFR2oTabzZCnQNdZ0pgeaR0YW9atYyQeVIqAPcZKS/at3g
 bSMMqa1X2TaN426vhhZi3EQTlNxN9RUuRTj05wB0mthdZW8f+99Q/HKF6s3CpNoRStn3
 jEN6ApAuaCcDFrLmGnTeC86DqSWTxZE1nT5PjbXDwKYIjVyjtjvKw64pGU6cjZWOkpUT
 IetA==
X-Gm-Message-State: AOAM5302ZkoCSqvlGFYBKtfFBR6cog8JSEITDgGHXodIDaYbxLaJvqon
 KTmRfVAF3U2toSDtt8s4yK04sg==
X-Google-Smtp-Source: ABdhPJxNwaKytMDLtZuBshdqy9ejEhCYjgXUXSxvSgjq9QG+H5bBfP+TxukJS4zkkdadFwrDNbyBig==
X-Received: by 2002:a17:902:714b:b0:162:ed0:25e5 with SMTP id
 u11-20020a170902714b00b001620ed025e5mr32240759plm.168.1653690757217; 
 Fri, 27 May 2022 15:32:37 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 q27-20020aa7843b000000b0051878e8cc13sm3928652pfn.116.2022.05.27.15.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 15:32:36 -0700 (PDT)
Message-ID: <e6c7e8a3-38c0-dbd6-2c98-a7117b52f929@linaro.org>
Date: Fri, 27 May 2022 15:32:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] linux-user: Adjust child_tidptr on set_tid_address()
 syscall
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Cc: dave.anglin@bell.net
References: <YpDyWAr/MYl3mizU@p100> <YpE4KnMXyg/2hgy4@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YpE4KnMXyg/2hgy4@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 5/27/22 13:44, Helge Deller wrote:
> I think the previous patch was wrong, since we just emulate writing to
> child_tidptr. Below is updated RFC patch.
> 
> ---
> [PATCH] linux-user: Adjust child_tidptr on set_tid_address()
> 
> Keep track of the new child tidptr given by a set_tid_address() syscall.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

