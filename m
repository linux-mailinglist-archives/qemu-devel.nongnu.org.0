Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6214797AE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:55:45 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myN4i-0005ft-Sm
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myN3c-0004rJ-FC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:54:36 -0500
Received: from [2607:f8b0:4864:20::532] (port=45052
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myN3a-0002AU-PF
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:54:35 -0500
Received: by mail-pg1-x532.google.com with SMTP id m15so3555201pgu.11
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 15:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=StZJtqDZK1CqKUr/UqXk0i1arKJrNohC5+wOoK+gS/A=;
 b=WzfEfBFEHhprOVadqLMnXez+Weta1fwbNJSs6Fw39g1vi0ZUm0BsP99A69Avdcjf7l
 ZmmKTDAuv2wbsT4wpxn5RlNMANuQMbpSnWH1XQBpguuLYXqRj+Q2URmY9WdCl0poul/y
 0rWiPTesphy98s7xyz2nUxF5xpP5dNOBS3V6RqqeBv4cuhIHY3tcUiKE0PsVnR7knhR1
 R2OYc7Z/G3fP8vBVxzpKYHTD6K36Z8GvJN8tCLRO9FYB+x7i3+3P1mOecrh1bd+YAbQh
 nR58aZ++4Vcgo0IiQM+5AVz6IrLuWImjCsThZlP4oV03aZYwY8MI9YAcSwO7VD6dktmm
 aYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=StZJtqDZK1CqKUr/UqXk0i1arKJrNohC5+wOoK+gS/A=;
 b=VA7IW/+nPghGGbuIK0AMI+YmZnNwCsyyN38CL0Tah+bXv0OybNeHUokZ20eM8rknJc
 V0wg4o+EQvg1lq1X1C6MlC6f78vYrhpgcLyq5i7WpCjdW1rMnsoqavWaRAm9hD1QkDWt
 LVhhiVOjc1NurFVn9eKwsHgHuz9hwQbnn7Zs959HgiT/N+s1NKY7+nU/xXAl7Kvq9VVF
 vo7G6XBZB8cDjZmTDAzSa+zwqdfNWQeoDJO6ouoNbdTluqsbyPqQpcVC+hLmKrwXetXZ
 TmRFM6Acwl1aOp7pDKq2LoTdGkXjpMfBXidEldQ7PR1WFzb9xCMtR0OYVGN0qvrlcqtt
 PlFQ==
X-Gm-Message-State: AOAM533gjyTb8xU8x3H1ekT7AQ/yVgM+CPKjpELFw0Wc67z9CzYne2Qv
 jtw2301pgHDUS64IwpmoYrayTg==
X-Google-Smtp-Source: ABdhPJzj/bvPg1f7JqTwMIKG5C43ewMI2GOe20fqVL2PpMwRsxsn3ML5raaK0bqHrTiBwgrxlYns6g==
X-Received: by 2002:a63:1006:: with SMTP id f6mr4875531pgl.609.1639785273282; 
 Fri, 17 Dec 2021 15:54:33 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p12sm11686308pfo.125.2021.12.17.15.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 15:54:32 -0800 (PST)
Subject: Re: [PATCH] tests/tcg/ppc64le: remove INT128 requirement to run
 non_signalling_xscv
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211216140951.1183987-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e386a1a-17cd-1c04-4eab-480ecbae059f@linaro.org>
Date: Fri, 17 Dec 2021 15:54:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216140951.1183987-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 f4bug@amsat.org, clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 6:09 AM, matheus.ferst@eldorado.org.br wrote:
> +        asm("mtvsrd 0, %3\n\t"                                          \
> +            "xxswapd 0, 0\n\t"                                          \
> +            "mtvsrd 0, %2\n\t"                                          \

This doesn't work.  The lower half of vs0 is undefined after mtvsrd.
You actually want mtvsrdd 0, %2, %3, with "b" as the constraint for bh.

> +            "mfvsrd %0, 0\n\t"                                          \
> +            "xxswapd 0, 0\n\t"                                          \
> +            "mfvsrd %1, 0\n\t"                                          \

Drop the xxswapd and use mfvsrld.

Otherwise it looks ok.


r~

