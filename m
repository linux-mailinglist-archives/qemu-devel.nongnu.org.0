Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66914B2FE2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 22:52:32 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIdqB-0006km-CE
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 16:52:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIdoo-0005sI-Ut
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:51:06 -0500
Received: from [2607:f8b0:4864:20::633] (port=39493
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIdol-0007c9-Ba
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:51:06 -0500
Received: by mail-pl1-x633.google.com with SMTP id w1so5709191plb.6
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 13:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0qP1D62ghj4OUR82+nyZD7hsZP1iVI+3118AKwbSseY=;
 b=XgEgLxphXtey58ICoQJPtTUiF8xpmRfga4TouIi1KrtR1Q4H9o9KlhyVvHZVXN77D+
 Wl/7snyAGwFG3wGCcrQqK1Xm57qMMy60pIwF8ofTFJ5TAZv8Wfcsq+PoGWbF/A9yD2My
 D2EX/HcB4KG2446NByHp2VF9wY7oyvo4sQzK/Il4lb7t3TO0aSiXT8gt1w7Sy3X1Eis5
 uOMhJXPhnLcAevwjPrj5avfUV31VJi5nsJEQ6yANgbTvzpU5BCDYGCpesDryjixds3ma
 5fiAZ9lyH1WQeGMmw3qY3EOkq4X8tr8+jKJJ1+UcKP9ZVT/nujZq9IUq843vG5V5M1Ni
 +U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0qP1D62ghj4OUR82+nyZD7hsZP1iVI+3118AKwbSseY=;
 b=xbbqav2wDT1l4HTVA5v8BC1GusOz3OfdN6e/nnUIQeRGjlIqk5HTQ7a3gYGrnJNijV
 Dnir1i0o4lHkfIhbl+a/rTCpb6j79qog5f/pAHYXtJ3i/r36+qmEL5CCyWZFZ0S6UNZr
 joLhZAkY/G+Xb04EaU+k0Tcy32ydTHkADXKkvTJf8SoRelcDnomXmL5b4TkvfCajRnmW
 reunHqWocUkuDVVG8Q6C7JG9MN/ORs+UE+6SwopCVthEFfDbE1Gfynz3zVLUCTfWC9LR
 egwaoo3Df5ImL6O6q/EVjGB4rr5sNCQtEvX064286rMBOTB7lddGQxKaggl+ep/MAb89
 zVdw==
X-Gm-Message-State: AOAM531MpXpSd5u0v9feDqcEbId2VfnXspw+0eRQ3mnBN0IUfKOmgfa3
 c0tJBeaFQcseX8+zTrJtSp7Z7w==
X-Google-Smtp-Source: ABdhPJwlrMfFR3REefT1wJS2HKt435J7T8gLj8Prj5pq1lu+V9Jq0EvIlFWwVNHvJ34rfOaklV/W7A==
X-Received: by 2002:a17:902:bb97:: with SMTP id
 m23mr3301103pls.151.1644616260613; 
 Fri, 11 Feb 2022 13:51:00 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id d8sm30417004pfv.64.2022.02.11.13.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 13:51:00 -0800 (PST)
Message-ID: <1f319e1b-a117-979a-eb5a-09e8aedfaf62@linaro.org>
Date: Sat, 12 Feb 2022 08:50:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 09/11] tests/tcg: build sha1-vector with O3 and compare
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/22 03:03, Alex Bennée wrote:
> The aim of this is to test code generation for vectorised operations.
> Unfortunately gcc struggles to do much with the messy sha1 code (try
> -fopt-info-vec-missed to see why). However it's better than nothing.
> 
> We assume the non-vectorised output is gold and baring compiler bugs
> the outputs should match.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220202191242.652607-3-alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 10 ++++++++++
>   tests/tcg/arm/Makefile.target     |  9 +++++++++
>   2 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

