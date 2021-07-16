Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317173CBA63
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:11:30 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QQz-0002ar-9h
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QP3-0001GZ-K9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:09:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QP2-0007dQ-An
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:09:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so7330496pju.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TG5yYdzS1HqSsh5SlflxhFnJ6qdMIdchvr5PmyvsX1M=;
 b=RFj99qtK8XvewaOnoGjlGgI1YwTjWw7SbKnfH4gyOk5Ii2J87marRpQe0MpwkUeuts
 hdVumhvAz+bKexg4mlUeD6KkFU/ge4sV4Ne/H1ncGl3z49etiNGz8HUrXOA5GOiOYTWg
 cbuNuQTYk0Dfuac258kf1+jBsKbAgTCb9cB6afw5Z2+sJul867UNN1ZXRYnZhqeU2teo
 Dd7vQxCz9Dg4Wdkpb7ZxXNvWzSKZzKYGQdrLs//AYqxf0Q7VbOMeyKFxUQ7qFLZFEOP2
 DBFFYvcrLw128u6+0w4tt5ZXoMwD0NhWQaHvlViNRFPz6zfuuPR6gvwxgKZIC2vcTbxA
 DCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TG5yYdzS1HqSsh5SlflxhFnJ6qdMIdchvr5PmyvsX1M=;
 b=P15g0oLKYvJNLrq+0e7tLdbRJl03i4GNTf15/0MOKUn81eBfIzo37RQ4tdimUj+GgP
 4pzgkVo7aPnFHs1Qc8WimwD4jC8e1I+vgVOmUw8xKsZNzzesQXOE4pEKVme8mV+OOd/3
 9OfyO7xVDIyoZZGpm2KgBaGflZ4Gji4vXDTGvvKa7bUCDgog2BKVV8SuHIzz5LlWY4O5
 T4Ydqi52fLHBmyIllGG15nRxWF/hQDWC+v297/fwIXSlppSm2a14xQ64o0lPUSK92m/z
 2OINAC3T647MIbh6iJ23TaNXF15/M+Zb3IP2/axxmDGeH30Ijcf05/QKBLyXe1JeyIQp
 dbUw==
X-Gm-Message-State: AOAM530NgcqyZU8gnUyNlIFLhRsBj1JLW9RyDhjfeitGrLVafMRCIpJK
 dbZYTuiIhDmnr5VGpQPjU80ryw==
X-Google-Smtp-Source: ABdhPJzxa7mJWatWRuknJvlPMcQ7dGsIrELOzZC0wKk+7mmL4DPP+K/oNS4NeB9w6vhNarv9E5yfOg==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr16009757pjs.23.1626451766801; 
 Fri, 16 Jul 2021 09:09:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h30sm10629847pfr.191.2021.07.16.09.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:09:26 -0700 (PDT)
Subject: Re: [PATCH v2 05/21] contrib/gitdm: add some new aliases to fix up
 commits
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <380816b8-4d58-0c38-3476-5c1affd42121@linaro.org>
Date: Fri, 16 Jul 2021 09:09:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714182056.25888-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 11:20 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Yuval Shaia<yuval.shaia.ml@gmail.com>
> Message-Id:<20210714093638.21077-6-alex.bennee@linaro.org>
> ---
>   contrib/gitdm/aliases | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

