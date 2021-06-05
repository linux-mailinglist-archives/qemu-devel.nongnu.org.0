Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F939C9DB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:29:48 +0200 (CEST)
Received: from localhost ([::1]:33796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpZBD-0001ey-N9
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZAA-0000ma-2o
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:28:42 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZA8-000725-I4
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:28:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id z26so9733209pfj.5
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I9Mbi5EUubQJh3BJF092oRkJNwG4K73+a5WCRWW54tI=;
 b=Iceevmrzqmw/Q/SAt7p2maU/2jUVZCtmpv8FeIMgLn0TfDhxrPjGXwkpolrVze8fer
 JNgFlf56pLV5eSIiPVyauEDe6vhzbJjdgnM2H1iA8PupbU06uFLXLuq8uc6w7wQ5rfCI
 Svye++uADAO35ka/wiXnBcvltcCDrBvCyFp/c8mfZFu3FdJrW1gMngqMXE0XWay2Hh0+
 zoPIeMGaS/BZXT+C8q7us5RR1K/qbLQmVqkHG9vGMH/sIjcG9i6CpHj47fJzRyFuvNp/
 groNF8nHS9t4pGkZm5fabGhvgWO50zZRQF5+eoiboWM85ftQb2sceRu3vNZUHkYNiDWj
 LFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I9Mbi5EUubQJh3BJF092oRkJNwG4K73+a5WCRWW54tI=;
 b=YQcImav6Wyp0Dj18q4Rl5qa5FYafSlOxpB1waNARO37vJCSDUnPliWq3PR3QXCNgS8
 ilgnElnr6la0gNAOoz735XJsgFJReLTgYXoPN+px/WIKJsyt4AVrPv7I8L3MgSsqOv+H
 gj+vtzAFqjXc4732+PT45daOJ68RJ82diO2fn+2gDeUQQ52SxHXkmBFnI6hD2FA2xIuG
 qrTwW2H5eU1kBGbXhhkAG1b2eKHyU8UiPPXbmrAiDLFFuxtGqDk9nyGAUyEG9SvP+dpk
 gqi5LVdyCp1zem3FSuIY2+cuv7OeaHqW8IJN1cBMGSuzaigv9Tr9soDTSWsM9pyRe3/k
 eFZA==
X-Gm-Message-State: AOAM531QFkT8dNxUz800ymmMV5vMsv4m3bEliVNLCIO3CmTCMxcu4pQX
 DqN5UFMa+YVJF/Ypuk75udQhAg==
X-Google-Smtp-Source: ABdhPJxzVEujJPOfXcm07850j/45tCNN7YzqNaLx3htu7KfA/F9L6mdBdQxqhemr5XrFgFrdsN9XlQ==
X-Received: by 2002:a62:1890:0:b029:2e8:f5e5:a05b with SMTP id
 138-20020a6218900000b02902e8f5e5a05bmr9994385pfy.81.1622910518793; 
 Sat, 05 Jun 2021 09:28:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 21sm4184597pfh.103.2021.06.05.09.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:28:38 -0700 (PDT)
Subject: Re: [PATCH v16 64/99] tests: do not run test-hmp on all machines for
 ARM KVM-only
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-65-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <038b9b82-7410-8461-e5a5-54c3eb76a790@linaro.org>
Date: Sat, 5 Jun 2021 09:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-65-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/test-hmp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

qtest_has_accel, I assume.

