Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208BD4A687A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:24:34 +0100 (CET)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2Vk-0007dH-MJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0r5-0003UO-6v
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:38:27 -0500
Received: from [2607:f8b0:4864:20::636] (port=39579
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0r3-0004l8-CA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:38:26 -0500
Received: by mail-pl1-x636.google.com with SMTP id x11so16502266plg.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/kwnb02Z9gInoqUeDCnM317T2k0RbD9qIGjagI8cqmU=;
 b=jbcO3h+U1bQfxDBlHW/1gzwpeWofO8s/hb9isplVcVM4chEnFyas7aoS2YbvmoFJzN
 BOaa8YGNDKL39DSmzd2ZMh8lLNW8mzDTVfbu3ubYg4DJi56lnAiEls1/cnzKqG+jwubE
 Y6u8kV1+VoJLShSruyEqXFa9oCLMC39Hlue/nrki+WAz930PYYJTi/Lr/kh/cQ9cZtoh
 khbzPtkjJHbI5NKk0CdnmVgksqUC73U2g33Jd5F976cUUdxQcWecyffkWosVYZc/1oU0
 sTtBE43iRsyysO9RDIhzkoBmPkiAwotAiTtruwez9/2dWHoh7lfKrsiYsnHyfWmq5gKx
 4qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kwnb02Z9gInoqUeDCnM317T2k0RbD9qIGjagI8cqmU=;
 b=qKgK6j/jQGU8wqcHkykbfk4L1qs+Ht56mdi/33BgimSbwg7J6S0vBTbSJdI5wnVEDG
 XFMjFFe59cEPZnhfEK9v4sMPT+h2y5f1x6sQVPBqi0kxoKvxJ0bETSQI3NzMnmnLlWvA
 v8yN295I+55IJgk6KeiY0PO9ra5B72ZOV55o5RtUhdvPgMeMYhRr349a2iG9SX8fADUj
 wLqz0sDHK3lHUxZdH4ZIzxwtdpwgRdeHB9Tb0wj+AzljDQz7HZM8QOuvvoyp8mL23Xgk
 3PX8zoWQOLBNVN+LdFAHJTVGWBvoDv63u5zzIhMdcIK3sHdw6OOZYK31aMUbugRJZ+NT
 pZkw==
X-Gm-Message-State: AOAM532ZNqAmgsT4IslRsU2HR0V6Ys9LVUfBkXozrgt3GAUphMPqZkU0
 jF/2VmmeS7vp/p3Eo66JTEQ2IA==
X-Google-Smtp-Source: ABdhPJw4occaAx64ipDJ8tp89EPMuqcWfBwEISeWOwGpK7dIHPjUmZSF6Vdb1BKNQsSx9uA7NCRhiA==
X-Received: by 2002:a17:90b:1a91:: with SMTP id
 ng17mr4611780pjb.115.1643751502831; 
 Tue, 01 Feb 2022 13:38:22 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id 79sm22188478pfv.117.2022.02.01.13.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:38:22 -0800 (PST)
Message-ID: <7be593a6-9d48-00c7-d876-385b3cabba70@linaro.org>
Date: Wed, 2 Feb 2022 08:38:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 21/22] bsd-user/bsd-file.h: Meat of the write system calls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-22-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-22-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Implement write, writev, pwrite and pwritev and connect them to the
> system call dispatch routine.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 85 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 23 ++++++++++
>   2 files changed, 108 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

